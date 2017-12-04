
package net.eoutech.webmin.vsw.dao;

import java.util.List;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbUUWiFiSession;
import net.eoutech.webmin.commons.entity.VswStatisticInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class VSWDao extends FrameBaseDao {
	
	@Autowired
    protected JdbcDao jdbcDao;

	public VswStatisticInfo getVswStatisticInfo(){
		String sql = "SELECT (SELECT COUNT(*) from tbvifidevice vi LEFT JOIN tbuuwifisession se ON vi.idxVNSID = se.keySessID) AS exchangeQueueCount," +
				/*"(SELECT COUNT(*)  FROM  `tbVSW`) AS serviceCount," +
				"(SELECT COUNT(*)  FROM  `tbSUStaticBind`) AS exchangeMethodCount," +*/
				/*"(select count(distinct idxVifiID) from `tbUUWiFiSession` where to_days(`mdfTm`) = to_days(now())) AS todayDeviceCount," +
				
				"(select count(distinct idxSimCIccId) from `tbUUWiFiSession` where to_days(`mdfTm`) = to_days(now())) AS todayUsedCard," +
				"(select count(distinct idxVifiID) from `tbUUWiFiSession` where date_format(`mdfTm`, '%Y%m') = date_format(curdate() , '%Y%m')) AS monthDeviceCount,"+
				"(select count(distinct idxSimCIccId) from `tbUUWiFiSession` where date_format(`mdfTm`, '%Y%m') = date_format(curdate() , '%Y%m')) AS monthUsedCard,"+
				"(SELECT COUNT(*) FROM tbUUWiFiSession WHERE DATE_SUB(now(), INTERVAL 1 MINUTE)<=date(mdfTm)) AS recentMinExchangeCount,"+
				
				"(SELECT COUNT(*) FROM tbUUWiFiSession WHERE DATE_SUB(now(), INTERVAL 1 HOUR)<=date(mdfTm)) AS recentHourExchangeCount,"+
				"(select count(*) from `tbUUWiFiSession` where to_days(`mdfTm`) = to_days(now())) AS todayExchangeCount," +*/
				"(select count(*) from `tbUUWiFiSession` where date_format(`mdfTm`, '%Y%m') = date_format(curdate() , '%Y%m')) AS monthExchangeCount";
		List<VswStatisticInfo> list = queryList(sql,VswStatisticInfo.class);
		return (list!=null && list.size()>0)?list.get(0):new VswStatisticInfo();
	}
	
	
	public int getRealTimeExchangeCount(){
		//String sql = "SELECT (SELECT COUNT(*) FROM `tbUUWiFiSession`) AS exchangeQueueCount" ;
		String sql = "SELECT * FROM `tbUUWiFiSession`";
		List<VswStatisticInfo> list = queryList(sql,VswStatisticInfo.class);
		int count = 0;
		if(list !=null && list.size()>0)
			count = list.size();
		return count;
	}
	
	public List<TbUUWiFiSession> get10Record(){
		String uerName= UserUtils.getUserName();
		String sql="";
		if (null != uerName && !EUConst.ADMIN.equals(uerName)){
			sql = "SELECT ses.idxVifiID as idxVifiID, ses.idxSimPPortId as idxSimPPortId, simpdev.devName as idxSimPDevID  " +
					"from tbUUWiFiSession ses LEFT JOIN tbSimPDev simpdev on ses.idxSimPDevID = simpdev.keySimPDevID  WHERE ses.idxAgentID='" +uerName+
					"' ORDER BY ses.mdfTm DESC limit 10";
		}else{
			sql = "SELECT ses.idxVifiID as idxVifiID, ses.idxSimPPortId as idxSimPPortId, simpdev.devName as idxSimPDevID  " +
					"from tbUUWiFiSession ses LEFT JOIN tbSimPDev simpdev on ses.idxSimPDevID = simpdev.keySimPDevID  " +
					"ORDER BY ses.mdfTm DESC limit 10";
		}
		return queryList(sql,TbUUWiFiSession.class);
	}
}

       