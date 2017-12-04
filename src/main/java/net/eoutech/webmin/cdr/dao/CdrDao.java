package net.eoutech.webmin.cdr.dao;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbCDR;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/8/6.
 */
@Component
public class CdrDao extends FrameBaseDao {
    //private Calendar calendar = Calendar.getInstance();

    /**
     * 查询今日流量
     *
     * @return [{time:"时段",dataTraffic:"流量"}]
     */
    public List<Map<String, Object>> queryTodayFlow() {
        String sql = "select DATE_FORMAT(crtTm,'%H') time,ifnull(SUM(dataTraffic),0)  dataTraffic\n" +
                "from tbCDR  where crtTm like '2015-12-23%' group by DATE_FORMAT(crtTm,'%H')";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * cdr 小统计
     *
     * @param criteria 条件
     * @return {
     * callCount:Long,//话单数量
     * callDuration:Long,//通话时长
     * billingDuration:Long,//计费时长
     * comboDuration:Long,//套餐时长
     * }
     */
    public Map<String, Object> queryCdrStatisInfo(Criteria criteria) {
        String sql = "select \n" +
                "count(*) callCount, -- 话单数量\n" +
                "sum(callDuration) callDuration, -- 通话时长\n" +
                "sum(callDuration) billingDuration, -- 计费时长\n" +
                "'-'  comboDuration  -- 套餐时长\n" +
                "from \n" +
                "tbCDR";
        if (!CollectionUtils.isEmpty(criteria.getAutoFields())) {
            sql += " WHERE ";
        }
        return jdbcDao.querySingleResult(sql, criteria);
    }


    /**
     * 最近五天通话时长/通话数量/通话费用(厘)
     *
     * @return [{date:Long,// 时间
     * callDuration:Long,// 通话时长
     * callCount:Long,//通话数量
     * costCash:Long // 金额
     * }]
     */
    public List<Map<String, Object>> queryTopFiveDayCallInfo() {
        String sql = "select\n" +
                "date_format(crtTm, '%Y-%m-%d') date,\n" +
                "sum(callDuration) callDuration,\n" +
                "count(AnswerTime) callCount,\n" +
                "sum(costCash) costCash\n" +
                "from tbCDR where cdrType='N'\n" +
                "\n" +
                " group by date_format(crtTm, '%Y-%m-%d')\n" +
                " order by crtTm desc\n" +
                " limit 0,5";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * 年度话单数量,通话时长,流量
     *
     * @return [{month:Long, // 月份
     * callCount:Long,   //通话数量
     * callDuration:Long,//通话时长
     * dataTraffic:Long     //流量
     * }]
     */
    public List<Map<String, Object>> queryYearCdrInfo() {

        String sql = "select m.m month,ifnull(c.callCount,0) callCount,ifnull(c.callDuration,0) callDuration,ifnull(c.dataTraffic,0) dataTraffic\n" +
                "\n" +
                "from\n" +
                "(select '01' m UNION select '02' UNION select '03' UNION select '04' UNION select '05' UNION select '06' UNION select '07' UNION select '08' UNION select '09' UNION select '10' UNION select '11' UNION select '12') m\n" +
                "LEFT JOIN\n" +
                "(\n" +
                "\tselect\n" +
                "\t\tdate_format(crtTm,'%m') month,\n" +
                "\t\tcount(AnswerTime) callCount,\n" +
                "\t\tsum(callDuration) callDuration,\n" +
                "\t\tsum(dataTraffic) dataTraffic\n" +
                "\tfrom tbCDR\n" +
                "\t\twhere date_format(crtTm,'%Y')=date_format(now(),'%Y')\n" +
                "\t\tgroup by date_format(crtTm,'%m')\n" +
                ") c\n" +
                "on m.m=c.`month`";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * 查询今天通话数量,通话时长,数据流量
     *
     * @return [{
     * hour:Long, // 小时
     * callCount:Long,   //通话数量
     * callDuration:Long,   //通话时长
     * dataTraffic:Long//流量
     * }]
     */
    public List<Map<String, Object>> queryTodayDuraAndTraf() {
        String sql = "SELECT\n" +
                "  h.hour,\n" +
                "  IFNULL(cdr.callCount, 0) callCount,\n" +
                "  IFNULL(cdr.callDuration, 0) callDuration,\n" +
                "  IFNULL(cdr.dataTraffic, 0) dataTraffic\n" +
                "FROM\n" +
                "  (SELECT 0 as hour UNION SELECT 1 UNION SELECT 2  UNION SELECT 3  UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20 UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 ) h\n" +
                "  LEFT JOIN\n" +
                "  (SELECT hour(crtTm) hour,count(AnswerTime) callCount,sum(callDuration) callDuration,sum(dataTraffic) dataTraffic FROM tbCDR WHERE to_days(now())=to_days(crtTm) GROUP BY hour(crtTm))\n" +
                "  cdr ON h.hour = cdr.hour";
        return jdbcTemplate.queryForList(sql);
    }

    public List<TbCDR> queryCountByNow(){
		String sql = "select COALESCE(SUM(dataTraffic),0) as dataTraffic from tbCDR where date_sub(NOW(), INTERVAL 5 second) <= crtTm and cdrType ='V' ";
		if(!"admin".equals(UserUtils.getUserName())){
			sql += " and idxUserId in( select u.idxPhoneNumber from tbUser u,tbAgent a where a.idxAgentName = '"+UserUtils.getUserName()+"' and u.idxAgentId LIKE concat('',a.idxAgentId,'%')) ";
		}
		return  queryList(sql, TbCDR.class);
	}
    public List<TbCDR> queryCountByTime(){
    	String sql = "select COALESCE(sum(dataTraffic),0) as dataTraffic,DATE_FORMAT(crtTm,'%Y-%m-%d %H:%i:00') as crtTm from tbCDR where date_sub(NOW(), INTERVAL 1 hour) <= crtTm and cdrType ='V' ";
    	if(!"admin".equals(UserUtils.getUserName())){
    		sql += " and idxUserId in( select u.idxPhoneNumber from tbUser u,tbAgent a where a.idxAgentName = '"+UserUtils.getUserName()+"' and u.idxAgentId LIKE concat('',a.idxAgentId,'%')) ";
    	}
    	sql +=" GROUP BY crtTm ORDER BY crtTm";
    	return  queryList(sql, TbCDR.class);
    }
    public List<TbViFiDevice> getDevices(String id){
    	String sql = "SELECT * from tbCDR where idxUserId='"+id+"'";
    	return queryList(sql, TbViFiDevice.class);
    }
    
    
    /**
     * 查询前20天的流量
     * 流量和通话的分类标准cdrType
     * @return
     */
    public List< Map< String, Object > > cdrTrafficStatistic() {
        String sql = "select DATE_FORMAT( crtTm,\'%Y-%m-%d\' ) as myDate, sum(dataTraffic) as trafficSum from tbCDR" +
        		" where (cdrType = 'V' or cdrType = 'M' or cdrType = 'D') group by DATE_FORMAT( crtTm,\'%Y-%m-%d\' ) order by crtTm desc limit 20";
        return jdbcTemplate.queryForList( sql );
    }
    /**
     * 查询前20天的通话时长
     * @return
     */
    public List< Map< String, Object > > recentCalltime() {
        String sql = "select DATE_FORMAT( crtTm,\'%Y-%m-%d\' ) as myDate, sum(callDuration) as callDurationSum from tbCDR " +
        		" where (cdrType = 'N' or cdrType = 'C' or cdrType = 'B' or cdrType = 'G' or cdrType = 'K' or cdrType = 'S') " +
        		"group by DATE_FORMAT( crtTm,\'%Y-%m-%d\' ) order by crtTm desc limit 20";
        return jdbcTemplate.queryForList( sql );
    }
    /**
     * 供应商名下 : 今日流量/今日通话时长
     * !供应商的ID就是userName
     * @return
     */
    public int supplierTodayTrafficData(String userName){
    	String sql = "select sum(dataTraffic) from tbCDR cdr " +
    			" where date_format(cdr.crtTm, \'%Y-%m-%d\') = date_format(now(), \'%Y-%m-%d\') " +
    			" and cdr.idxSupplierID = \'"+ userName + "\'";
    	return queryForInteger(sql);
    }
    public int supplierTodayCallTime(String userName){
//    	String sql = "select ";
    	return 0;
    }
    
    /**
     * 国内外通话百分比
     * @return
     */
    public List< Map< String, Object > > querycdrByDistance () {
        String sql = "select distance as name, count(1) as sum from tbCDR where " +
        		"(cdrType = 'N' or cdrType = 'C' or cdrType = 'B' or cdrType = 'G' or cdrType = 'K' or cdrType = 'S') group by distance ";
        return jdbcTemplate.queryForList( sql );
    }
    /**
     * 代理商： 今日资费总数
     * @param userName
     * @return
     */
    public int getAgentCostCashSum(String userName) {
    	String sql = "select sum(costCash) from tbCDR cdr left join tbAgent agent on agent.idxAgentId = cdr.idxAgentId where " +
    			" agent.name = \'"+ userName +"\' and date_format(cdr.crtTm, \'%Y-%m-%d\') = date_format(now(), \'%Y-%m-%d\')";
    	return queryForInteger(sql);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
