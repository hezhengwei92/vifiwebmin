
package net.eoutech.webmin.agent.dao;

import com.frame.dao.FrameBaseDao;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class AreaDao extends FrameBaseDao {
    /**
     * 查询语言
     *
     * @return [{language:String}]
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, String>> queryLanguage() {
        String sql = "SELECT language FROM tbArea  GROUP BY language";
        return (List) jdbcTemplate.queryForList(sql);
    }


    /** 查询货币
     * @return [{currency:String}]
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, String>> queryCurrency() {
        String sql = "SELECT currency FROM tbArea  GROUP BY currency";
        return (List) jdbcTemplate.queryForList(sql);
    }

    /**
     * 时区
     *
     * @return [{timeZone:Integer}]
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Integer>> queryTimeZone() {
        String sql = "SELECT timeZone FROM tbArea  GROUP BY timeZone";
        return (List) jdbcTemplate.queryForList(sql);
    }
}

       