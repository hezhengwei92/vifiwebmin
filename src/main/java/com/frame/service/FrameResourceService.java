package com.frame.service;

import com.frame.commons.entity.TbCfrmResource;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.vo.FrameResourceViewVO;
import com.spring.jdbc.assistants.persistence.Criteria;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;


@Service
public class FrameResourceService {

    @Autowired
    private JdbcDao jdbcDao;


    public List< FrameResourceViewVO > queryAllResource() {
        Criteria criteria = new Criteria( TbCfrmResource.class ).asc( "menu" );
        List< TbCfrmResource > resources = jdbcDao.queryList( criteria );
        List< FrameResourceViewVO > resourceViews = new ArrayList<FrameResourceViewVO>();
        // 整理一下数据,需要从国际化配置文件里 拿要显示的名字.....
        for ( TbCfrmResource resource : resources ) {
            FrameResourceViewVO resViewVO = new FrameResourceViewVO( resource );
            String mykey = "menu." + resViewVO.getTopMenu();
            String topMenuRs = CommonUtils.langContainsKey( mykey ) ? CommonUtils.lang( mykey ) : "-";
            resViewVO.setTopMenuRs( topMenuRs );
            mykey = "menu." + resource.getName();
            String nameRs = CommonUtils.langContainsKey( mykey ) ? CommonUtils.lang( mykey ) : "-";
            resViewVO.setNameRs( nameRs );

            resourceViews.add( resViewVO );
        }

        // 收集同组菜单
        LinkedHashMap< String, List< FrameResourceViewVO > > colleResToArr = new LinkedHashMap<String, List< FrameResourceViewVO >>();
        for ( FrameResourceViewVO resView : resourceViews ) {
            String key = resView.getMenu();
            try {
                key = key.split( "-" )[0];
            } catch ( Exception e ) {
                throw new FrameException( "资源,menu,字段数据不合法,正确格式:1-20" );
            }
            if ( colleResToArr.get( key ) == null ) {
                colleResToArr.put( key, new ArrayList< FrameResourceViewVO >() );
            }
            colleResToArr.get( key ).add( resView );
        }

        // 加入一级菜单
        List< FrameResourceViewVO > result = new ArrayList<FrameResourceViewVO>();
        for ( List< FrameResourceViewVO > resourceList : colleResToArr.values() ) {
            // 创建目录
            if ( !CollectionUtils.isEmpty( resourceList ) ) {
                FrameResourceViewVO resCld = resourceList.get( 0 );

                FrameResourceViewVO resViewVO = new FrameResourceViewVO();
                resViewVO.setParent( true );
                resViewVO.setTopMenu( resCld.getTopMenu() );
                resViewVO.setTopMenuRs( resCld.getTopMenuRs() );

                result.add( resViewVO );
            }
            result.addAll( resourceList );
        }

        return result;
    }


    public Page< FrameResourceViewVO > queryResourcePage() {
        PageRequest pageRequest = new PageRequest( 0, 10000 );
        List< FrameResourceViewVO > resList = queryAllResource();
        return new PageImpl<FrameResourceViewVO>( resList, pageRequest, resList.size() );
    }

    public void swapSortPosiResource( TbCfrmResource[] datas ) {
        if ( datas.length < 2 ) {
            throw new FrameException( "data error" );
        }
        String menuTmp = datas[0].getMenu();
        datas[0].setMenu( datas[1].getMenu() );
        datas[1].setMenu( menuTmp );

        jdbcDao.update( datas[0] );
        jdbcDao.update( datas[1] );
    }


}
