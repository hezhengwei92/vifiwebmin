package com.frame.dao;

import com.frame.commons.entity.TbCfrmRole;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;


@Repository
public class FrameHomeDao extends FrameBaseDao {

	public TbCfrmRole getRoleByUserName(String userName){
		String sql = "select * from tbCfrmRole role " +
				"Left join tbCfrmUser user on user.idxRoleId_tbRole = role.keyRoleId " +
				"where user.keyUserId = \'" + userName +"\'";
//		List<TbCfrmRole> roleVO = queryEntity(sql, TbCfrmRole.class);
//		return roleVO!=null&&roleVO.size()>0? roleVO.get(0) :null;
		return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(TbCfrmRole.class));
	}

//    @SuppressWarnings({ "rawtypes", "unchecked" })
//	private <T> List<T> queryEntity(String sql, Class<T> entityClass) {
//        BeanPropertyRowMapper rowMapper = BeanPropertyRowMapper.newInstance(entityClass);
//        return (List<T>) (jdbcTemplate.query(sql, rowMapper));
//    }
}

