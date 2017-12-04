
package net.eoutech.webmin.goip.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.goip.vo.GoIPDevOfPortInfoVO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class GoIPPortDao extends FrameBaseDao {

    public List<StatusCountVO> queryStatusCountByDevID(List<String> devIdList) {
        String whereSql = "";
        if (devIdList != null) {
            whereSql = String.format("WHERE idxGoIPDevID in (%s)\n", listToWhereIN(devIdList));
        }
        String sql = "select status,count(status) count from tbGoIPPort " + whereSql + " group by status ";
        return queryList(sql,StatusCountVO.class);
    }

    public List<Map<String, Object>> queryStatusCountByPortID(List<String> portIdList) {
        String whereSql = "";
        if (portIdList != null) {
            whereSql = String.format("WHERE keyID in (%s)\n", listToWhereIN(portIdList));
        }
        String sql = "select status,count(status) count from tbGoIPPort " + whereSql + " group by status ";
        return jdbcTemplate.queryForList(sql);
    }


    public List<GoIPDevOfPortInfoVO> queryGoIPPortInfoByDevID(String devID) {
        String sql = "SELECT\n" +
                "\tidxportNum,\n" +
                "\tstatus,\n" +
                "\ttbViFiDevice.devState vStatus,\n" +
                "\ttbViFiDevice.cos vCos\n" +
                "FROM\n" +
                "\ttbGoIPPort\n" +
                "LEFT JOIN tbViFiDevice ON tbGoIPPort.idxViFiId = tbViFiDevice.idxViFiID\n" +
                "WHERE idxGoIPDevID = ?";
        return queryList(sql, new Object[]{devID}, GoIPDevOfPortInfoVO.class);
    }

    public List<Map<String, Object>> queryStaDtlByPortID(List<String> portIdList) {
        String whereSql = "";
        if (portIdList != null) {
            whereSql = String.format("WHERE keyID in (%s)\n", listToWhereIN(portIdList));
        }

        String sql = "SELECT\n" +
                "\tidxportNum,\n" +
                "\tstatus,\n" +
                "\ttbViFiDevice.devState vStatus,\n" +
                "\ttbViFiDevice.cos vCos\n" +
                "FROM\n" +
                "\ttbGoIPPort\n" +
                "LEFT JOIN tbViFiDevice ON tbGoIPPort.idxViFiId = tbViFiDevice.idxViFiID\n" + whereSql;
        return jdbcTemplate.queryForList(sql);
    }

}

       