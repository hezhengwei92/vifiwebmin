package com.frame.dao;

import com.frame.commons.vo.FrameAuthorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class FrameAuthorizationDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;


    public List< FrameAuthorization > getAll() {
        String sql = "SELECT keyRoleId role,res.name resourceName,res.keyResourceId url FROM tbCfrmAuthorization auth join tbCfrmRole role\n" +
                "on auth.idxRoleId_tbRole=role.keyRoleId join tbCfrmResource res on auth.resourceName=res.name";

        List< Map< String, Object > > results = jdbcTemplate.queryForList( sql );
        List< FrameAuthorization > auths = new ArrayList< FrameAuthorization >();
        for ( Map< String, Object > map : results ) {
            String role = String.valueOf( map.get( "role" ) );
            String resourceName = String.valueOf( map.get( "resourceName" ) );
            String url = String.valueOf( map.get( "url" ) );
            auths.add( new FrameAuthorization( role, resourceName, url ) );
        }

        return auths;
    }

}
