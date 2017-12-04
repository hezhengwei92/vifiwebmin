package com.frame.dao;

import com.frame.commons.vo.FrameUserAuthVO;
import com.frame.commons.vo.FrameUserMenuVO;
import com.mysql.jdbc.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FrameUserDao extends FrameBaseDao {

    public FrameUserAuthVO getUser( String username ) {
        String sql = "SELECT keyUserId,idxGroupId_tbGroup,password,state,locked,keyRoleId,indexPageResourceId " +
                " FROM tbCfrmUser,tbCfrmRole " +
                " WHERE keyUserId='" + username + "' AND tbCfrmUser.idxRoleId_tbRole=tbCfrmRole.keyRoleId";
        Map< String, Object > results = jdbcTemplate.queryForMap( sql );

        if ( results != null ) {
            return ( new FrameUserAuthVO( results ) );
        }
        return null;
    }


    public List<FrameUserMenuVO> getUserMenu(String username ) {
        String sql = StringUtils.isNullOrEmpty( username ) ?
                "SELECT menu,name,keyResourceId uri,iconClass iconClass FROM tbCfrmResource WHERE tbCfrmResource.menu > 0 order by menu"
                : "SELECT resource.menu,resource.name,resource.keyResourceId uri,resource.iconClass iconClass FROM tbCfrmUser u join  tbCfrmAuthorization auth on u.idxRoleId_tbRole=auth.idxRoleId_tbRole  \n" +
                        "                       join tbCfrmResource resource on auth.resourceName=resource.name \n" +
                        "                       WHERE u.keyUserId='"+username+"'  order by menu";

        return queryList( sql, FrameUserMenuVO.class );
    }


    public Map< String, String > getUserIndexPage() {
        Map< String, String > roleIndex = new HashMap< String, String >();
        String sql = "SELECT keyRoleId,indexPageResourceId FROM tbCfrmRole";
        List< Map< String, Object > > results = jdbcTemplate.queryForList( sql );
        for ( Map< String, Object > map : results ) {
            String role = String.valueOf( map.get( "keyRoleId" ) );
            String idxpage = String.valueOf( map.get( "indexPageResourceId" ) );
            roleIndex.put( role, idxpage );
        }
        return roleIndex;
    }


    public int updateLoginTime( String userName, String ip, boolean isUpdate ) {
        String sql = "update tbCfrmUser set lastLoginTime=now(),loginTimes=loginTimes+1,lastLoginIP='" + ip + "' where keyUserId='" + userName + "'";

        String sql2 = "insert into tbCfrmAccessRcd(idxType,idxDateTime,idxUserId,idxResourceId,ReqRemoteIP,ReqOS,ReqBrowser,ReqAction,ReqUrl,	ReqOperation,Result,Remarks) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] args = new Object[12];
        args[0] = 0;
        args[1] = new Date();
        args[2] = userName;
        args[3] = userName;
        args[4] = ip;
        args[5] = "";
        args[6] = "";
        args[7] = "Login";
        args[8] = "/iFaxInAdmin/login.jsp";
        args[9] = "";
        args[10] = 1;
        args[11] = "";
        jdbcTemplate.update( sql2, args );
        if ( isUpdate ) {
            return jdbcTemplate.update( sql );
        }
        return 0;
    }

}


