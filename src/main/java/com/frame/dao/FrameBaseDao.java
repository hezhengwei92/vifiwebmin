package com.frame.dao;

import com.spring.jdbc.assistants.persistence.JdbcDao;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/8/17.
 */
@Component
public class FrameBaseDao {
    @Autowired
    protected JdbcDao jdbcDao;
    @Autowired
    protected JdbcTemplate jdbcTemplate;


    public Object getLastInsertId() {
        return jdbcTemplate.queryForObject("select LAST_INSERT_ID();", Object.class);
    }

    public String getPermissions(String userName, String resources) {
        String sql = "SELECT remarks FROM tbCfrmAuthorization WHERE resourceName='" + resources + "' AND idxRoleId_tbRole=" +
                "(SELECT idxRoleId_tbRole FROM tbCfrmUser WHERE keyUserId='" + userName + "')";
        try {
            String permissions = jdbcTemplate.queryForObject(sql, String.class);
            if (permissions == null || permissions.equals("")) {
                permissions = "0|1|1|2";
            }
            return permissions;
        } catch (Exception e) {
            return "0|1|1|2";
        }

    }


    public static String listToWhereIN(List idList) {
        StringBuilder ids = new StringBuilder();
        for (Object id : idList) {
            ids.append("'").append(id).append("',");
        }
        ids.deleteCharAt(ids.length() - 1);
        return ids.toString();
    }


    /**
     * 返回泛型实体
     */
    public <T> List<T> queryList(String sql, Object[] args, Class<T> entityClass) {
        BeanPropertyRowMapper rowMapper = BeanPropertyRowMapper.newInstance(entityClass);
        return (List<T>) (args == null ? jdbcTemplate.query(sql, rowMapper) : jdbcTemplate.query(sql, args, rowMapper));
    }

    /**
     * 支持返回泛型实体!
     */
    public <T> List<T> queryList(String sql, Class<T> entityClass) {
        return queryList(sql, null, entityClass);
    }
    
    /**
     * * queryForObject: 返回Integer.class时，查询无数据时返回空指针异常
     * 所有做异常包裹
     * @author gya
     * @param sql
     * @return
     */
    public int queryForInteger(String sql){
    	int result = 0;
    	try {
			result = jdbcTemplate.queryForObject(sql, Integer.class);
		} catch (Exception e) {
			return 0;
		}
    	return result;
    }

    public List<Map<String,Object>> queryAllRecord(String tbHead) {

        return null;
    }

}

