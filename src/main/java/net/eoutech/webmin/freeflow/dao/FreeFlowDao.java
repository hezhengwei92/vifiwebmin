package net.eoutech.webmin.freeflow.dao;

import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.entity.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wei on 2017/10/25.
 */
@Component
public class FreeFlowDao extends FrameBaseDao {
    @Autowired
    protected JdbcDao jdbcDao;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public List<TbFreeFlow> queryFree(int pageNumber, int pageSize , String orderBy, List<String> likeList) {//and flow.idxAgentID='ifunk'
        String sql="select `user`.idxAppId,`user`.nickname,`user`.idxPhoneNumber,`user`.idxAgentID,flow.pkgType,flow.flow,flow.effectiveTm,flow.idxOrderID,flow.mdfTm,flow.mdfBy,flow.crtTm,flow.crtBy from tbuser user left join tbusertopuprcd flow on flow.idxUserID=`user`.idxAppId and flow.pkgType='INIT' ";
        if (likeList!=null && likeList.size()>0){
            sql=sql+"where "+likeList.get(0);
            for (int i=1;i<likeList.size();i++){
                sql=sql+" and "+likeList.get(i);
            }
        }

        sql="select c.* from ("+sql+") as c"+orderBy+" limit "+(pageNumber-1)*pageSize+","+pageSize;
        return queryList(sql, TbFreeFlow.class);
    }
    public List<TbFreeFlow> countFree(List<String> likeList) {
        String sql="select `user`.idxAppId,`user`.nickname,`user`.idxPhoneNumber,`user`.idxAgentID,flow.pkgType,flow.flow,flow.effectiveTm,flow.mdfTm,flow.mdfBy,flow.crtTm,flow.crtBy from tbusertopuprcd flow right join tbuser user on flow.idxUserID=`user`.idxAppId and flow.pkgType='INIT' ";
        if (likeList!=null && likeList.size()>0){
            sql=sql+"where "+likeList.get(0);
            for (int i=1;i<likeList.size();i++){
                sql=sql+" and "+likeList.get(i);
            }
        }
        return queryList(sql, TbFreeFlow.class);
    }
    public TbUser getUser(String idxAppId,String idxAgentID){
        BeanPropertyRowMapper rowMapper = BeanPropertyRowMapper.newInstance(TbUser.class);
        String sql="";
        if("admin".equals(idxAgentID)){
            sql ="select * from tbuser where idxAppId='"+idxAppId+"'";
        }else{
            sql ="select * from tbuser where idxAppId='"+idxAppId+"' and idxAgentID ='"+idxAgentID+"'";
        }
        return (TbUser)(jdbcTemplate.queryForObject(sql, rowMapper));
    }

    public void delete(List<String> isList){
        TbUserTopupRcd usertop=null;
        TbResidualflow residualflow=null;
        for (String idxOrderID:isList) {
            String sql="select * from tbusertopuprcd where idxOrderID='"+idxOrderID+"'";
            usertop=(TbUserTopupRcd)(jdbcTemplate.queryForObject(sql,BeanPropertyRowMapper.newInstance(TbUserTopupRcd.class)));
            sql="select * from tbresidualflow where idxOrderID='"+idxOrderID+"'";
            residualflow=(TbResidualflow)(jdbcTemplate.queryForObject(sql,BeanPropertyRowMapper.newInstance(TbResidualflow.class)));
            deleteTopAndResidual(usertop,residualflow);
        }
    }
    public  void deleteTopAndResidual(TbUserTopupRcd usertop,TbResidualflow residualflow){
        jdbcDao.delete(TbUserTopupRcd.class,usertop.getKeyID());
        jdbcDao.delete(TbResidualflow.class,residualflow.getKeyId());
    }
}
