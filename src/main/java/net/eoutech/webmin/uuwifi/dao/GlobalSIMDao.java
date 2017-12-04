
package net.eoutech.webmin.uuwifi.dao;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;

import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbCountDailyInfo;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.simp.vo.SimPDevOfPortInfoVO;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GlobalSIMDao extends FrameBaseDao {


    /**
     * @return [{status:Integer,count:Integer}]
     */
    public List<StatusCountVO> queryGlobDevState() {
        String sql = "select status,count(1) count from tbGlobalSIM group by status";
        return queryList(sql, StatusCountVO.class);
    }
    
    /**
     * 查询所有设备,端口信息
     *
     * @return { idxViFiID }
     * }]
     */
    public List<IdxViFiIDVO> queryIdxViFiID() {
        String sql = "SELECT tb1.idxViFiID FROM tbViFiDevice tb1 LEFT JOIN tbGlobalSIM  tb2 ON tb1.idxViFiID=tb2.idxViFiID WHERE tb2.idxViFiID IS NULL ";
        return queryList(sql,IdxViFiIDVO.class);
    }
    
    /**
     * 统计启动卡和启动卡组表
     *
     * @return { count }
     * }]
     */
    public List<SIMAndSIMgrpVO> selectCount() {
        String sql = "SELECT COUNT(t1.`keyGlobalSIMID`) AS countOverTimeCard , (SELECT COUNT(*) FROM `tbGlobalSIM`) AS countGlobalSIM,(SELECT COUNT(*)  FROM  `tbGlobalSIMGrp`) AS countGlobalSIMGrp,(SELECT COUNT(*)  FROM  `tbGlobalSIM` WHERE STATUS=0) AS countStatus0,(SELECT COUNT(*)  FROM  `tbGlobalSIM` WHERE STATUS=1) AS countStatus1   FROM  `tbGlobalSIM` t1 LEFT JOIN `tbGlobalSIMGrp` t2 ON  t1.`idxGlobalSIMGrpID` = t2.`keyGlobalSIMGrpID` WHERE t1.`balance` < t2.`monthlyRental` and DAY(NOW()) > t1.`billingDate`";
        return queryList(sql,SIMAndSIMgrpVO.class);
    }

	public List<SIMAndSIMgrpVO> selectSimInfo() {
		String sql = "SELECT " +
//				"COUNT(t1.`keyGlobalSIMID`) AS countOverTimeCard , " +
				"(SELECT COUNT(*) FROM `tbGlobalSIM`) AS countGlobalSIM," +
				"(SELECT COUNT(*)  FROM  `tbGlobalSIMGrp`) AS countGlobalSIMGrp," +
				"(SELECT COUNT(*)  FROM  `tbGlobalSIM` WHERE BALANCE < 0) AS arrearageCard," +
				"(SELECT COUNT(*)  FROM  `tbGlobalSIM` WHERE STATUS=0) AS countStatus0," +
				"(SELECT COUNT(*)  FROM  `tbGlobalSIM` WHERE STATUS=1) AS countStatus1 ,  " +
//				"FROM  `tbGlobalSIM` t1 " +
//				"LEFT JOIN `tbGlobalSIMGrp` t2 ON  t1.`idxGlobalSIMGrpID` = t2.`keyGlobalSIMGrpID` " +
//				"WHERE t1.`balance` < t2.`monthlyRental` and DAY(NOW()) > t1.`billingDate`,"+
				"(SELECT COUNT(*) FROM `tbGlobalSIM` t3 LEFT JOIN `tbGlobalSIMGrp` t4 on t3.`idxGlobalSIMGrpID` = t4.`keyGlobalSIMGrpID` "+
				"WHERE t4.areaCode = '86') AS chinaAreaCard,"+
				"(SELECT COUNT(*) FROM `tbGlobalSIM` t3 LEFT JOIN `tbGlobalSIMGrp` t4 on t3.`idxGlobalSIMGrpID` = t4.`keyGlobalSIMGrpID` "+
				"WHERE t4.areaCode != '86') AS internationalCard";
		return queryList(sql,SIMAndSIMgrpVO.class);
	}

	/**
	 * 本月流量使用top10
	 * @return
	 */
	public List<SIMAndSIMgrpVO> queryFlowTop() {
		String sql = "select idxUserId,COALESCE(sum(cntDataSum),0) as cntDataSum from tbCountDaily where cntDataSum > 0 and DATE_FORMAT(crtTm,'%Y-%m') = DATE_FORMAT(NOW(),'%Y-%m') ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
		sql+=" GROUP BY idxUserId ORDER BY cntDataSum DESC LIMIT 10";
		return  queryList(sql, SIMAndSIMgrpVO.class);
	}

	/**
	 * 最近充值记录
	 * @return
	 */
	public List<SIMAndSIMgrpVO> queryRecentCharge() {
		String sql = "SELECT IDXICCID AS idxICCID, ACTION AS action, CRTTM AS createDate FROM `tbSIMOprRecord` "
				+"WHERE ACTION = 'TOP' ORDER BY CRTTM LIMIT 3";
		return queryList(sql, SIMAndSIMgrpVO.class);
	}
}

       