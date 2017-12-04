
package net.eoutech.webmin.goip.dao;

import com.frame.dao.FrameBaseDao;

import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbGoIPDev;
import net.eoutech.webmin.commons.entity.TbGoIPGrp;
import net.eoutech.webmin.commons.entity.TbGoIPPort;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.goip.vo.GoIPDevAndPortInfoVO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class GoIPDevDao extends FrameBaseDao {

    /**
     * 查询设备的端口的状态
     *
     * @return [{id:String,portCount:String,status:String}]
     */
    public List<Map<String, Object>> queryDevPortStatus(List<String> devIdList) {
        String whereSql = "";
        if (devIdList != null) {
            whereSql = String.format("WHERE d.keyGoIPDevID in (%s)\n", listToWhereIN(devIdList));
        }
        String sql = "select t.keyGoIPDevID as id,t.ports portCount,\n" +
                " concat('[',GROUP_CONCAT(CAST(concat('[',t. STATUS,',',t.count,']') AS char) order by t. STATUS ),']') status from\n" +
                " (\n" +
                "\t SELECT d.keyGoIPDevID,d.ports,p. STATUS,count(p. STATUS) count\n" +
                "\t\tFROM tbGoIPDev d LEFT JOIN tbGoIPPort p ON d.keyGoIPDevID = p.idxGoIPDevID " + whereSql +
                "\t\tGROUP BY d.keyGoIPDevID,p. STATUS\n" +
                " ) t GROUP BY t.keyGoIPDevID";
        return jdbcTemplate.queryForList(sql);
    }

    public List<StatusCountVO> queryGoIPDevState() {
        String sql = "select status,count(1) count from tbGoIPDev group by status";
        return queryList(sql, StatusCountVO.class);
    }


    /**
     * 查询所有设备,端口信息
     */
    public List<GoIPDevAndPortInfoVO> queryAllGoIPDevOfPortInfo() {
        String sql = "select d.*,\n" +
                "\tconcat('{',GROUP_CONCAT(CAST(concat('\"',p.idxportNum ,'\":{\"keyID\":',p.keyID,',\"status\":',ifnull(p.STATUS,0),'}') AS char) order by p. idxportNum ),'}') portInfo\n" +
                " from\n" +
                "\ttbGoIPDev d left join tbGoIPPort p on d.keyGoIPDevID=p.idxGoIPDevID\n" +
                " group by d.keyGoIPDevID";
        return queryList(sql, GoIPDevAndPortInfoVO.class);
    }
    
    /**
     * 查询群组信息
     * @notice 由于goip设备群组表没有页面和service，这里用类型相同的字段存储了需要的值
     * @return
     */
    public List<TbGoIPGrp> queryGoipDevGroupList(){
    	String sql = "select keyGoIPDevGrpID as keyGoIPDevGrpID, groupName as groupName from tbGoIPGrp";
    	return queryList(sql, TbGoIPGrp.class);
    }
    
    public List<TbGoIPDev> getRecentOnlineDev(){
    	String sql = "select * from `tbGoIPDev` where sipOnline = 1 order by mdfTm limit 5";
    	return queryList(sql, TbGoIPDev.class);
    }
    
    public CommonOutlineInfoVO getOutlineInfo(){
    	String sql = "SELECT (SELECT count(1) from `tbGoIPDev`) as outlineInfo1, "+
    			"(SELECT count(1) from `tbGoIPDev` where sipOnline = 1) as outlineInfo2,"+
    			"(SELECT count(1) from `tbGoIPDev` where sipOnline = 0) as outlineInfo3,"+
    			"(SELECT count(1) from `tbGoIPPort`) as outlineInfo5,"+
    			"(SELECT count(1) from `tbGoIPPort` where status = 3) as outlineInfo6";
    	List<CommonOutlineInfoVO> list = queryList(sql, CommonOutlineInfoVO.class);
    	return list!=null &&list.size()>0?list.get(0):new CommonOutlineInfoVO();
    }
    
    public int getActivityPortsNum(){
    	String sql = "SELECT * from `tbGoIPPort` where status = 3";
    	List<TbGoIPPort> list = queryList(sql, TbGoIPPort.class);
    	return list!=null && list.size()>0? list.size() : 0;
    }
}

       