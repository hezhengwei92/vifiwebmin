package com.frame.dao;

import com.frame.security.FrameResource;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class FrameRecourceDao extends FrameBaseDao {


    public Map< String, FrameResource > getAll() {
        Map< String, FrameResource > resmap = new HashMap< String, FrameResource >();

        try {
            List< Map< String, Object > > resources = jdbcTemplate.queryForList( "SELECT keyResourceId,name FROM tbCfrmResource" );
            for ( Map< String, Object > map : resources ) {
                String resId = String.valueOf( map.get( "keyResourceId" ) );
                String name = String.valueOf( map.get( "keyResourceId" ) );
                FrameResource res = new FrameResource( resId, name );
                resmap.put( resId, res );
            }
        } catch ( Exception e ) {
            //log
        }

        return resmap;
    }



}
