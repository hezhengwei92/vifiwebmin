package net.eoutech.webmin.simcart.dao;

import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbSimCard;
import net.eoutech.webmin.simcart.vo.AreaSimCardStatusCountVO;
import net.eoutech.webmin.simcart.vo.StatusVO;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Map;

@Component
public class SimCardDao extends FrameBaseDao {
    @Autowired
    JdbcDao jdbcDao;

    public void deleteSimCard(String keySimCardID){
        jdbcDao.delete(TbSimCard.class,keySimCardID);
    }


    /**
     * @return [{
     * status:Long,//状态
     * count:Long,//状态数量
     * ratio:Long// 状态数量比例
     * }]
     */
    public List<Map<String, Object>> querySimCardState() {
        String sql = "select status,count(1) count,(count(1)/sum.count)*100 ratio from tbSimCard,(select count(1) count from tbSimCard) sum group by status order by `status`";
        return jdbcTemplate.queryForList(sql);
    }


    /**
     * 查询余额统计
     *
     * @return [{
     * range:String,// 余额范围
     * count:Long // 数量
     * }]
     */
    public List<Map<String, Object>> queryBalanceStati() {
        String sql = "select\n" +
                "case\n" +
                "when balance<=0 then 0\n" +
                "when balance>0 and balance<=20 then  CAST(\"1-20\" AS char )\n" +
                "when balance>20 and balance<=100 then \"20-100\"\n" +
                "when balance>100 and balance<=500 then \"100-500\"\n" +
                "else \"500+\" end 'range',\n" +
                "count(1) count,\n" +
                "count(1)/sum.sum * 100 ratio\n" +
                " from tbSimCard,(select count(balance) sum from tbSimCard) sum\n" +
                "group by\n" +
                "case\n" +
                "when balance<0 then 0\n" +
                "when balance>0 and balance<=20 then \"1-20\"\n" +
                "when balance>20 and balance<=100 then \"20-100\"\n" +
                "when balance>100 and balance<=500 then \"100-500\"\n" +
                "else \"500+\" end\n" +
                "order by balance";
        return jdbcTemplate.queryForList(sql);
    }

    public List<AreaSimCardStatusCountVO> queryAreaSimCardStatusCount() {
        String sql = "select\n" +
                "\tcontinent,areaCode,`name` areaName,\n" +
                "\tconcat('{',GROUP_CONCAT(CAST(concat('\"',STATUS,'\":',statusCount) AS char) order by STATUS ),'}') statusCountJSON ,\n" +
                "\tsum(statusCount) simcardCount\n" +
                " from\n" +
                " (\n" +
                "\tSELECT\n" +
                "\t\ttbArea.continent continent,\n" +
                "\t\ttbArea.`name`,\n" +
                "\t\ttbSCGroup.areaCode AS areaCode,\n" +
                "\t\ttbSimCard.`status` AS `status`,\n" +
                "\t\tcount(tbSimCard.`status`) AS statusCount\n" +
                "\tFROM\n" +
                "\t\ttbSimCard\n" +
                "\t\tINNER JOIN tbSCGroup ON tbSimCard.idxSCGroupID = tbSCGroup.keySCGroupID\n" +
                "\t\tINNER JOIN tbArea ON tbSCGroup.areaCode = tbArea.keyAreaCode\n" +
                "\t\tGROUP BY tbSCGroup.areaCode,tbSimCard.status\n" +
                " ) areaStatusCount group by areaCode";
        return queryList(sql, AreaSimCardStatusCountVO.class);
    }
    
    
    /**
     * 统计流量卡和流量卡组表
     *
     * @return { count }
     * }]
     */
    public List<SIMAndSIMgrpVO> selectCount() {
        String sql = "SELECT COUNT(t1.`keySimCardID`) AS countOverTimeCard , " +
        		"(SELECT COUNT(*) FROM `tbSimCard`) AS countGlobalSIM, " +
        		"(SELECT COUNT(*)  FROM  `tbSCGroup`) AS countGlobalSIMGrp, " +
        		"(SELECT COUNT(*)  FROM  `tbSimCard` WHERE STATUS=0) AS countStatus0," +
        		"(SELECT COUNT(*)  FROM  `tbSimCard` WHERE STATUS=1) AS countStatus1  FROM  `tbSimCard` t1 " +
        		"LEFT JOIN `tbSCGroup` t2 ON  t1.`idxSCGroupID` = t2.`keySCGroupID` WHERE t1.`balance` < t2.`monthlyRental`";
        return queryList(sql,SIMAndSIMgrpVO.class);
    }
    
    /**
     * 统计流量卡组中卡的状态
     *
     * @return { count }
     * }]
     */
    public List<StatusVO> selectCount8(int keySCGroupID) {
        String sql = "SELECT COUNT(*) AS countStatus0 ,(SELECT COUNT(*) FROM  `tbSimCard` WHERE STATUS=1 AND idxSCGroupID ='"+keySCGroupID+
        		"') AS countStatus1 FROM  `tbSimCard` WHERE STATUS=0 AND idxSCGroupID ='"+keySCGroupID+"'";
        return queryList(sql,StatusVO.class);
    }
    
    public CommonOutlineInfoVO getSimCardOutlineInfo(){

    	String sql = "SELECT (SELECT COUNT(*)  FROM  `tbsimpdev`) AS outlineInfo1," +  //卡组数
				"(SELECT COUNT(*)  FROM  `tbSimCard`) AS outlineInfo2, " + //卡数量
				"(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `status`=1) AS outlineInfo3, " +  //已用卡
				"(SELECT COUNT(*)  FROM  `tbSCGroup`) AS outlineInfo4, " +
				"(SELECT COUNT(*)  FROM  `tbSCGroup`) AS outlineInfo5, " +
				"(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `status`=0) AS outlineInfo6, " + //待分配卡
				"(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `status`=3) AS outlineInfo7";   //故障卡
    	List<CommonOutlineInfoVO> list = queryList(sql,CommonOutlineInfoVO.class);
		return (list!=null && list.size()>0)?list.get(0):new CommonOutlineInfoVO();
    }
    
    
    public List<TbSimCard> getSimcardAndTraffic(){
//    	String sql = "SELECT (SELECT COUNT(*) FROM `tbSimCard` WHERE to_days('mdfTm')  = to_days(now())) AS day1count,"+
//    			"SELECT (SELECT COUNT(*) FROM `tbSimCard` WHERE to_days('mdfTm') + 2 = to_days(now())) AS day2count,"+
//    			"SELECT (SELECT COUNT(*) FROM `tbSimCard` WHERE to_days('mdfTm') + 3 = to_days(now())) AS day3count,"+
//    			"SELECT (SELECT COUNT(*) FROM `tbSimCard` WHERE to_days('mdfTm') + 4 = to_days(now())) AS day4count";
    	String sql = "SELECT keySimCardID AS keySimCardID, mdfTm AS mdfTm,(40960-restNetData) AS restNetData FROM `tbSimCard` "+
    				"WHERE date_sub(now(), INTERVAL 31 DAY)<date(mdfTm)";
		return queryList(sql,TbSimCard.class);
    }
    
    /**
     * 供应商名下:　卡数量
     * @param userName
     * @return
     */
    public int getMyCardNum(String userName){
    	String sql = "select count(1) from tbSimCard sc left join  tbSCGroup scg on sc.idxSCGroupID = scg.keySCGroupID " +
    			" where scg.idxSalerId = \""+ userName +"\"";
    	return queryForInteger(sql);
    }
    /**
     * 供应商：　正常状态卡数量
     */
    public int getMyNormalCardNum(String userName){
    	String sql = "select count(1) from tbSimCard sc left join  tbSCGroup scg on sc.idxSCGroupID = scg.keySCGroupID " +
    			" where scg.idxSalerId = \""+ userName +"\" and status = 0";
    	return queryForInteger(sql);
    }
    /**
     * sim卡状态百分比
     * @return
     */
    public List< Map< String, Object > > querySimCardByStatus () {
        String sql = "select status as name, count(keySimCardID) as sum from tbSimCard group by status";
        return jdbcTemplate.queryForList( sql );
    }
}

       