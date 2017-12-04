
package net.eoutech.webmin.vpx.dao;

import com.frame.dao.FrameBaseDao;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class VPXDao extends FrameBaseDao {


    public List<Map<String, Object>> queryStateStatisByID(List<String> idList) {
        String where = "";
        if (idList != null) {
            where = " WHERE keyVPXID in (" + listToWhereIN(idList) + ") ";
        }
        String sql = "SELECT state state,count(state) count FROM `tbVPX` " + where + " GROUP BY state \n";
        return jdbcTemplate.queryForList(sql);
    }
}

       