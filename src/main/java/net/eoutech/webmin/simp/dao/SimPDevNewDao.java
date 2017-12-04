
package net.eoutech.webmin.simp.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.simp.vo.SimPDevOfPortInfoVO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class SimPDevNewDao extends FrameBaseDao {
    public List<Map<String, Object>> queryDevPortStatus(List<String> devIdList) {
        String whereSql = "";
        if (devIdList != null) {
            whereSql = String.format("WHERE d.keySimPDevID in (%s)\n", listToWhereIN(devIdList));
        }
        String sql = "select t.keySimPDevID,t.ports portCount,\n" +
                "               concat('[',GROUP_CONCAT(CAST(concat('[',t. STATUS,',',t.count,']') AS char) order by t. STATUS ),']') status from\n" +
                "               (\n" +
                "                 SELECT d.keySimPDevID,d.ports,p. STATUS,count(p. STATUS) count\n" +
                "               \t\tFROM tbSimPDev d LEFT JOIN tbSimPPort p ON d.keySimPDevID = p.idxSimPDevID " + whereSql +
                "               \t\tGROUP BY d.keySimPDevID,p.STATUS\n" +
                "               ) t GROUP BY t.keySimPDevID";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * 查询所有设备,端口信息
     *
     * @return [{
     * tbSimPDev.*:,//tbSimPDev 所有属性,太多 不一一列出来了
     * portInfo:JSON,Object字符串{idxSlotNum:{
     * keyID:Integer, //设备主键
     * status:Integer //设备状态
     * }}
     * }]
     */
    public List<SimPDevOfPortInfoVO> queryAllSimPDevOfPortInfo() {
        String sql = "select d.*,\n" +
                "\tconcat('{',GROUP_CONCAT(CAST(concat('\"',p.idxSlotNum ,'\":{\"keyID\":',p.keyID,',\"status\":',ifnull(p.STATUS,0),'}') AS char) order by p. idxSlotNum ),'}') portInfo\n" +
                "from \n" +
                "\ttbSimPDev d left join tbSimPPort p on d.keySimPDevID=p.idxSimPDevID \n" +
                "group by d.keySimPDevID";
        return queryList(sql,SimPDevOfPortInfoVO.class);
    }


    /**
     * @return [{status:Integer,count:Integer}]
     */
    public List<StatusCountVO> querySimPDevStatusCount() {
        String sql = "select status,count(1) count from tbSimPDev group by status";
        return queryList(sql,StatusCountVO.class);
    }
}

       