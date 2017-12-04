package net.eoutech.webmin.uuwifi.dao;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.uuwifi.vo.DeviceAndGroupVO;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Map;

@Component
public class ViFiDeviceDao extends FrameBaseDao {
	
	/**
	 * 概要信息
	 * @return
	 */
	public List<CommonOutlineInfoVO> getOutlineInfo() {
		String userName=UserUtils.getUserName();
		String sql="";
		if (null !=userName && !EUConst.ADMIN.equals(userName)){
			sql = "SELECT (SELECT COUNT(*) FROM `tbViFiDevice` WHERE idxAgentID='"+userName+"') AS outlineInfo1," +//所有设备
					"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE online != 0 and idxAgentID='"+userName+"') AS outlineInfo2, " +//在线设备
					"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M%D')=date_format(lastConnectTime,'%Y%M%D') and idxAgentID='"+userName+"') AS outlineInfo3, " +//今日活跃
					"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M%D')=date_format(crtTm,'%Y%M%D') and idxAgentID='"+userName+"') AS outlineInfo4, " +//今日新增
					"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M')=date_format(lastConnectTime,'%Y%M') and idxAgentID='"+userName+"') AS outlineInfo5, " +//本月活跃
					"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M')=date_format(crtTm,'%Y%M') and idxAgentID='"+userName+"') AS outlineInfo6, " +//本月新增
					"(SELECT COUNT(keyDevGrpID)  FROM  `tbViFiDevGroup` WHERE idxAgentID='"+userName+"') AS outlineInfo7";//设备组
		}else{
			sql = "SELECT (SELECT COUNT(*) FROM `tbViFiDevice`) AS outlineInfo1," +//所有设备
			"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE online != 0) AS outlineInfo2, " +//在线设备
			"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M%D')=date_format(lastConnectTime,'%Y%M%D')) AS outlineInfo3, " +//今日活跃
			"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M%D')=date_format(crtTm,'%Y%M%D')) AS outlineInfo4, " +//今日新增
			"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M')=date_format(lastConnectTime,'%Y%M')) AS outlineInfo5, " +//本月活跃
			"(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE date_format(now(),'%Y%M')=date_format(crtTm,'%Y%M')) AS outlineInfo6, " +//本月新增
			"(SELECT COUNT(keyDevGrpID)  FROM  `tbViFiDevGroup`) AS outlineInfo7";//设备组
		}

		return queryList(sql, CommonOutlineInfoVO.class);
	}

    /**
     * 用组ID 查询设备状态
     *
     * @param grpID 设备组ID
     * @return [{state:"",count:0}]
     */
    public List<StatusCountVO> queryStateByGrpID(String grpID) {
        String sql = "SELECT devState status,count(devState) count FROM tbViFiDevice WHERE idxDevGrpID = ?  group by devState ";
        return queryList(sql, new Object[]{grpID},StatusCountVO.class);
    }
    /**
     *  查询单个设备状态
     *
     */
    public List<Map<String, Object>> querySgDevState(String devID) {
        String sql = "SELECT\n" +
                "tbSimPDev.devName AS simpDevName,\n" +
                "tbSimPPort.idxSlotNum AS simpPortSlotNum,\n" +
                "tbSimPPort.`status` AS simpPortState,\n" +
                "tbSimPPort.`usage` AS simpPortUsage,\n" +
                "tbSimPPort.duration AS simpPortDuration,\n" +
                "tbSimCard.`status` AS simCardState,\n" +
                "tbSimCard.number AS simCardNumber,\n" +
                "tbSimCard.balance AS simCardBalance,\n" +
                "tbGoIPDev.devName AS goIPDevName,\n" +
                "tbGoIPPort.idxportNum AS goIPPortNum,\n" +
                "tbGoIPPort.`status` AS goIPState\n" +
                "FROM\n" +
                "tbViFiDevice\n" +
                "INNER JOIN tbSimPPort ON tbViFiDevice.idxViFiID = tbSimPPort.idxViFiId\n" +
                "INNER JOIN tbSimPDev ON tbSimPPort.idxSimPDevID = tbSimPDev.keySimPDevID\n" +
                "INNER JOIN tbSimCard ON tbSimPPort.idxIccid = tbSimCard.idxIccid\n" +
                "INNER JOIN tbGoIPPort ON tbGoIPPort.idxViFiID = tbViFiDevice.idxViFiID\n" +
                "INNER JOIN tbGoIPDev ON tbGoIPPort.idxGoIPDevID = tbGoIPDev.keyGoIPDevID\n" +
                "WHERE tbViFiDevice.keyDevID = ?";
        return jdbcTemplate.queryForList(sql, devID);
    }
    /**
     * 
     *  
     * @return { count }
     * }]
     */
    public List<DeviceAndGroupVO> selectCount() {
        String sql = "SELECT COUNT(keyDevID) AS countViFiDev,(SELECT COUNT(keyDevGrpID)  FROM  `tbViFiDevGroup`) AS countViFiDevGrp,(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE devState='N') AS countStatus0,(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE devState='E') AS countStatus1,(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE devState='W') AS countStatus2,(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE devState='D') AS countStatus3,(SELECT COUNT(keyDevID)  FROM  `tbViFiDevice` WHERE devState='R') AS countStatus4  FROM  `tbViFiDevice`";
        return queryList(sql, DeviceAndGroupVO.class);
    }
    
    public List<CommonOutlineInfoVO> devCount4china(){
    	String sql = "SELECT COUNT(*) as value, lastUUWiFiAreaId as code "+
    			"FROM `tbViFiDevice` tbvifi WHERE online = 1 GROUP BY lastUUWiFiAreaId";
    	return queryList(sql, CommonOutlineInfoVO.class);
    }
    
    public List<TbViFiDevice> getRecentOnlineDev(){
    	String sql="SELECT idxViFiID as idxViFiID, alaisName as idxUserID FROM `tbViFiDevice` WHERE online !=0   ORDER BY mdfTm limit 20";
    	return queryList(sql, TbViFiDevice.class);
    }
    
    /**
     * 获取uuwifi设备数 / (名下)uuwifi设备在线百分比
     * @param userName
     * @param boolean online :true在线1
     * @return
     */
    public int getAgentUUWiFiCount(String userName, boolean online){
    	String sql = "select count(1) from tbViFiDevice vifi left join tbAgent agent on agent.idxAgentId = vifi.idxAgentId " +
    			"where agent.name = \"" + userName + "\"";
    	if(online)
    		sql += " and online = 1 ";
    	return queryForInteger(sql);
    }
    
    public int getUUWiFiCount(boolean online){
    	String sql = "select count(1) from tbViFiDevice ";
    	if(online)
    		sql += " where online = 1 ";
    	return queryForInteger(sql);
    }

    
}

       