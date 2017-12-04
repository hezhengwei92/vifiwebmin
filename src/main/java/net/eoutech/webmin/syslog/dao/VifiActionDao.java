package net.eoutech.webmin.syslog.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.eoutech.webmin.commons.entity.TbViFiAction;

import org.springframework.stereotype.Component;

import com.frame.dao.FrameBaseDao;

@Component
public class VifiActionDao extends FrameBaseDao{

	
	public List<TbViFiAction> queryPageWithParams(Map<String, Object> queryParam){
		
		String sql = "select 'keyActionID','actionType','idxViFiID','idxAppId','idxUserId','reqAct','reqIP'," +
				"'respCode','respReason','sessionId','' from tbViFiAction ";

		int actionType = queryParam.get("actionType")!=null?(Integer)queryParam.get("actionType") :0;
		String idxAppId = queryParam.get("idxAppId")!=null?(String) queryParam.get("idxAppId"):null;
		String idxUserId = queryParam.get("idxUserId")!=null?(String) queryParam.get("idxUserId"):null;
		Date startDate = queryParam.get("startDate")!=null?(Date) queryParam.get("startDate"):null;
		Date endDate =  queryParam.get("endDate")!=null?(Date) queryParam.get("endDate"):null;
		String condition = "";
		if(actionType!=0 || idxAppId!=null ||idxUserId!=null || startDate!=null || endDate!=null){
			condition = "where ";
			if(actionType != 0){
				condition += " actionType = "+actionType+" and";
			}
			if(idxAppId != null){
				condition += " idxAppId = \""+idxAppId+"\" and";
			}
			if(idxUserId != null){
				condition += " idxUserId = \""+idxUserId+"\" and";
			}
			if(startDate != null){
				condition += " startDate > \""+startDate+"\" and";
			}
			if(endDate != null){
				condition += " endDate < \""+endDate+"\" and";
			}
			condition.substring(0, condition.length()-3);
		}
		sql += condition;
//		jdbcDao.
		return jdbcTemplate.queryForList(sql, TbViFiAction.class);
	}
}
