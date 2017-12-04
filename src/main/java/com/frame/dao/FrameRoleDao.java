package com.frame.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.frame.commons.entity.TbCfrmRole;

import java.util.List;

@Repository
public class FrameRoleDao extends FrameBaseDao {


    public List< String > queryRoleIds() {
        return jdbcTemplate.queryForList( "select keyRoleId role from tbCfrmRole", String.class );
    }
    
    public List< TbCfrmRole> queryRoles(){
    	String sql = "select keyRoleId as keyRoleId, homePage as homePage from tbCfrmRole";
		return queryEntity(sql, TbCfrmRole.class);
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
	private <T> List<T> queryEntity(String sql, Class<T> entityClass) {
        BeanPropertyRowMapper rowMapper = BeanPropertyRowMapper.newInstance(entityClass);
        return (List<T>) (jdbcTemplate.query(sql, rowMapper));
    }

    public List<String> queryUserCountWithRole(List<String> idxList){
    	String condition = " where ";
    	int length = idxList.size();
    	for(int i=0;i<length;i++){
    		if(i==length-1){
    			condition += " idxRoleId_tbRole = \'"+ idxList.get(i)+ "\'";
    		}else{
    			condition += " idxRoleId_tbRole = \'"+ idxList.get(i) +"\' or ";
    		}
    		
    	}
    	String sql = "select keyUserId from tbCfrmUser "+ condition;
    	return jdbcTemplate.queryForList(sql,String.class);
    }
    
}
