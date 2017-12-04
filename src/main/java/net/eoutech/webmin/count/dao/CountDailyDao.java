
package net.eoutech.webmin.count.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.*;
import net.eoutech.webmin.count.service.CountDailyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;
import com.mysql.jdbc.StringUtils;
import com.spring.jdbc.assistants.persistence.Criteria;
import com.spring.jdbc.assistants.persistence.JdbcDao;

@Component
public class CountDailyDao extends FrameBaseDao {

	@Autowired
    protected JdbcDao jdbcDao;
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 话单、流量统计列表详情
	 * @param idxUserId
	 * @param beginTime
	 * @param endTime
	 * @param isTariffe
	 * @return
	 */
	public List<TbCountDaily> queryListDataByUser(String idxUserId,String beginTime,String endTime,boolean isTariffe) {
        String sql = "SELECT c.* from tbCountDaily c where ";
        		sql += " c.idxUserId = '"+idxUserId+"' ";
        		if(isTariffe){
        			sql +=" and (c.numTotalMMOut+c.numTotalMO+c.numTotalMOCb+c.numTotalMTGoip+c.numTotalMOGoip+c.numTotalMOGoipCb) > 0 ";
        		}else{
        			sql +=" and c.cntDataSum > 0 ";
        		}
        		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
        			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
        		}
        		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
        			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
        		}
        		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
        			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
        		}
        		sql +="  GROUP BY c.crtTm  order by c.crtTm limit 20";
        return queryList(sql, TbCountDaily.class);
    }
	/**
	 * 话单、流量统计列表详情新
	 * @param id
	 * @param beginTime
	 * @param endTime
	 * @param isTariffe
	 * @return
	 */
	//详情 的流量 bit -> K -> M
	public List<TbUseFlowRcd> queryListDataByUserNew(String id, String beginTime, String endTime, boolean isTariffe) {
		String sql = "select crtTm,COALESCE(SUM(c.upFlow+c.downFlow),0) as upFlow from tbuseflowrcd c ";
		if(isTariffe){
			sql +="where c.idxViFiID='"+id+"'  ";
		}else{
			sql +="where c.idxUserId='"+id+"'  ";
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		sql +="   GROUP BY DATE_FORMAT(c.crtTm,'%Y-%m-%d %H') ORDER BY DATE_FORMAT(c.crtTm,'%Y-%m-%d %H:00')";
		return queryList(sql, TbUseFlowRcd.class);
	}
	/**
	 * 设备流量统计列表详情
	 * @param idxViFiID
	 * @param beginTime
	 * @param endTime
	 * @param
	 * @return
	 */
	public List<TbUUWiFiCountDaily> queryListDataByUUWIFI(String idxViFiID,String beginTime,String endTime) {
		String sql = "SELECT c.* from tbUUWiFiCountDaily c where ";
			   sql += " c.idxViFiID = '"+idxViFiID+"' ";
			   sql +=" and c.cntDataSum > 0 ";
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		sql +="  GROUP BY c.crtTm  order by c.crtTm desc limit 20";
		return queryList(sql, TbUUWiFiCountDaily.class);
	}
	/**
	 * 用户流量统计列表
	 * @param idxUserId
	 * @param beginTime
	 * @param endTime
	 * @param orderBy
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	//用户流量表  bit - M
	public List<TbUseFlowRcd> queryCountDataByUser(String idxUserId,String beginTime,String endTime,String  orderBy,int pageNumber, int pageSize ) {
		String sql = "SELECT c.idxUserId as idxUserId, convert(SUM(c.upFlow)/1024/1024,decimal) as lastUpFlow,convert(SUM(c.DownFlow)/1024/1024,decimal) as lastDownFlow,convert(SUM(c.DownFlow+c.UpFlow)/1024/1024,decimal) as upFlow,DATE_FORMAT(NOW(),'%Y-%m-%d') as crtTm,c.crtBy as crtBy from tbuseflowrcd c where c.idxUserId !='' ";
		if(!StringUtils.isNullOrEmpty(idxUserId) && !"null".equals(idxUserId)){
			idxUserId = idxUserId.trim();
			idxUserId = idxUserId.replaceAll("，", ",");
			if(idxUserId.endsWith(",")){
				idxUserId = idxUserId.substring(0,idxUserId.length()-1);
			}
			if(idxUserId.startsWith(",")){
				idxUserId = idxUserId.substring(1);
			}
			String[] ids = idxUserId.split(",");
			if(ids.length>0){
				String sqlTemp = " and (";
				for (int i = 0; i < ids.length; i++) {
					if(!StringUtils.isNullOrEmpty(ids[i])){
						sqlTemp += " c.idxUserId like '"+ids[i]+"%' ";
						if(i < ids.length-1){
							sqlTemp += " or ";
						}
					}
				}
				sqlTemp +=" ) ";
				sql += sqlTemp;
			}
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		String userName=UserUtils.getUserName();
		if (null != userName && !EUConst.ADMIN.equals(userName)){
			sql+=" and c.idxAgentID='"+userName+"'";
		}
//		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
//		if (agent != null) {
//			sql += " and c.idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
//		}
		sql +="  GROUP BY c.idxUserId,c.crtBy ";
		sql = " select c.* from (" + sql +") as c";
		if(!StringUtils.isNullOrEmpty(orderBy)){
			sql += orderBy;
		}//limit 0,10  从第一条开始查询10条
		sql+=" limit "+(pageNumber-1)*pageSize+","+pageSize;
		//return jdbcDao.queryList(sql, criteria);
		return queryList(sql,TbUseFlowRcd.class);
	}
	/**
	 * 用户流量统计总数
	 * @param idxUserId
	 * @param beginTime
	 * @param endTime
	 * @param orderBy
	 * @return
	 */
	public List<TbUseFlowRcd> queryCountDataByUser(String idxUserId,String beginTime,String endTime,String  orderBy) {
		String sql = "SELECT c.keyID,c.idxUserId,COUNT(distinct c.idxUserId) as numTotalMMIn,c.crtTm,c.crtBy from tbuseflowrcd c where c.idxUserId !='' ";
		if(!StringUtils.isNullOrEmpty(idxUserId) && !"null".equals(idxUserId)){
			idxUserId = idxUserId.trim();
			idxUserId = idxUserId.replaceAll("，", ",");
			if(idxUserId.endsWith(",")){
				idxUserId = idxUserId.substring(0,idxUserId.length()-1);
			}
			if(idxUserId.startsWith(",")){
				idxUserId = idxUserId.substring(1);
			}
			String[] ids = idxUserId.split(",");
			if(ids.length>0){
				String sqlTemp = " and (";
				for (int i = 0; i < ids.length; i++) {
					if(!StringUtils.isNullOrEmpty(ids[i])){
						sqlTemp += " c.idxUserId like '"+ids[i]+"%' ";
						if(i < ids.length-1){
							sqlTemp += " or ";
						}
					}
				}
				sqlTemp +=" ) ";
				sql += sqlTemp;
			}
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
//		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
//		if (agent != null) {
//			sql += " and c.idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
//		}
		String userName=UserUtils.getUserName();
		if (null != userName && !EUConst.ADMIN.equals(userName)){
			sql +=" and c.idxAgentID = '"+userName+"'";
		}
		sql +="  GROUP BY c.idxUserId";
		sql = "SELECT * from ( "+sql +") cc" ;
		//return jdbcDao.queryList(sql, criteria);
		return queryList(sql, TbUseFlowRcd.class);
	}
	/**
	 * 话单统计列表
	 * @param idxUserId
	 * @param beginTime
	 * @param endTime
	 * @param orderBy
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<TbCountDaily> queryCountTariffeDataByUser(String idxUserId,String beginTime,String endTime,String  orderBy,int pageNumber, int pageSize ) {
		String sql = "select c.idxUserId,SUM(c.numTotalMMOut) as numTotalMMOut,SUM(c.numTotalMO) as numTotalMO,SUM(c.numTotalMOCb) as numTotalMOCb,SUM(c.numTotalMOGoip) as numTotalMOGoip,SUM(c.numTotalMTGoip) as numTotalMTGoip,SUM(c.numTotalMOGoipCb) as numTotalMOGoipCb," +
				"SUM(c.numFailedMMIn) as numFailedMMIn,SUM(c.numFailedMMOut) as numFailedMMOut,SUM(c.numFailedMO) as numFailedMO,SUM(c.numFailedMOCb) as numFailedMOCb,SUM(c.numFailedMOGoip) as numFailedMOGoip,SUM(c.numFailedMOGoipCb) as numFailedMOGoipCb,SUM(c.numFailedMTGoip) as numFailedMTGoip," +
				"SUM(c.numShortMMIn) as numShortMMIn,SUM(c.numShortMMOut) as numShortMMOut,SUM(c.numShortMO) as numShortMO,SUM(c.numShortMOCb) as numShortMOCb,SUM(c.numShortMOGoip) as numShortMOGoip,SUM(c.numShortMOGoipCb) as numShortMOGoipCb,SUM(c.numShortMTGoip) as numShortMTGoip," +
				"SUM(c.durMMOut) as durMMOut,SUM(c.durMO) as durMO,SUM(c.durMOCb) as durMOCb,SUM(c.durMOGoip) as durMOGoip,SUM(c.durMOGoipCb) as durMOGoipCb,SUM(c.durMTGoip) as durMTGoip,SUM(c.callCost) as cost,DATE_FORMAT(NOW(),'%Y-%m-%d') as crtTm,c.crtBy as crtBy " +
				" from tbCountDaily c where (c.numTotalMMOut+c.numTotalMO+c.numTotalMOCb+c.numTotalMTGoip+c.numTotalMOGoip+c.numTotalMOGoipCb) > 0 ";
		if(!StringUtils.isNullOrEmpty(idxUserId) && !"null".equals(idxUserId)){
			idxUserId = idxUserId.trim();
			idxUserId = idxUserId.replaceAll("，", ",");
			if(idxUserId.endsWith(",")){
				idxUserId = idxUserId.substring(0,idxUserId.length()-1);
			}
			if(idxUserId.startsWith(",")){
				idxUserId = idxUserId.substring(1);
			}
			String[] ids = idxUserId.split(",");
			if(ids.length>0){
				String sqlTemp = " and (";
				for (int i = 0; i < ids.length; i++) {
					if(!StringUtils.isNullOrEmpty(ids[i])){
						sqlTemp += " c.idxUserId like '"+ids[i]+"%' ";
						if(i < ids.length-1){
							sqlTemp += " or ";
						}
					}
				}
				sqlTemp +=" ) ";
				sql += sqlTemp;
			}
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and c.idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		sql +="  GROUP BY c.idxUserId ";
		sql = " select c.* from (" + sql +") as c";
		if(!StringUtils.isNullOrEmpty(orderBy)){
			sql += orderBy;
		}
		sql+=" limit "+(pageNumber-1)*pageSize+","+pageSize;
		//return jdbcDao.queryList(sql, criteria);
		return queryList(sql, TbCountDaily.class);
	}
	
	/**
	 * 设备流量统计列表
	 * @param idxViFiID
	 * @param beginTime
	 * @param endTime
	 * @param orderBy
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public List<TbUUWiFiCountDaily> queryCountUUWIFIDataByUser(String idxViFiID,String beginTime,String endTime,String  orderBy,int pageNumber, int pageSize ) {
		String sql = "SELECT c.idxViFiID as idxViFiID,v.alaisName as aliasName,SUM(c.cntDataSum) as cntDataSum,COUNT(distinct c.idxViFiID) as numTotalMTGoip,SUM(c.cost) as cost,SUM(c.deviceDur) as deviceDur,DATE_FORMAT(NOW(),'%Y-%m-%d') as crtTm,c.crtBy as crtBy from tbUUWiFiCountDaily c,tbViFiDevice v where c.cntDataSum > 0 and c.idxViFiID = v.idxViFiID ";
		if(!StringUtils.isNullOrEmpty(idxViFiID) && !"null".equals(idxViFiID)){
			idxViFiID = idxViFiID.trim();
			idxViFiID = idxViFiID.replaceAll("，", ",");
			if(idxViFiID.endsWith(",")){
				idxViFiID = idxViFiID.substring(0,idxViFiID.length()-1);
			}
			if(idxViFiID.startsWith(",")){
				idxViFiID = idxViFiID.substring(1);
			}
			String[] ids = idxViFiID.split(",");
			if(ids.length>0){
				String sqlTemp = " and (";
				for (int i = 0; i < ids.length; i++) {
					if(!StringUtils.isNullOrEmpty(ids[i])){
						sqlTemp += " c.idxViFiID like '"+ids[i]+"%' ";
						if(i < ids.length-1){
							sqlTemp += " or ";
						}
					}
				}
				sqlTemp +=" ) ";
				sql += sqlTemp;
			}
		
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and c.idxViFiID in ( select idxViFiID from tbViFiDevice where idxAgentID LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		sql +="  GROUP BY c.idxViFiID,c.crtBy ";
		sql = " select c.* from (" + sql +") as c";
		if(!StringUtils.isNullOrEmpty(orderBy)){
			sql += orderBy;
		}
		sql+=" limit "+(pageNumber-1)*pageSize+","+pageSize;
		return queryList(sql, TbUUWiFiCountDaily.class);
	}
	/**
	 * 设备流量统计总数
	 * @param
	 * @param beginTime
	 * @param endTime
	 * @param orderBy
	 * @return
	 */
	public List<TbUUWiFiCountDaily> queryCountUUWIFIDataByUser(String idxViFiID,String beginTime,String endTime,String  orderBy) {
		String sql = "SELECT c.keyUUWiFiCDID,c.idxViFiID as idxViFiID,SUM(c.cntDataSum) as cntDataSum,COUNT(distinct c.idxViFiID) as numTotalMTGoip,SUM(c.cost) as cost,SUM(c.deviceDur) as deviceDur,DATE_FORMAT(NOW(),'%Y-%m-%d') as crtTm,c.crtBy as crtBy from tbUUWiFiCountDaily c,tbViFiDevice v where c.cntDataSum > 0 and c.idxViFiID = v.idxViFiID ";
		if(!StringUtils.isNullOrEmpty(idxViFiID) && !"null".equals(idxViFiID)){
			idxViFiID = idxViFiID.trim();
			idxViFiID = idxViFiID.replaceAll("，", ",");
			if(idxViFiID.endsWith(",")){
				idxViFiID = idxViFiID.substring(0,idxViFiID.length()-1);
			}
			if(idxViFiID.startsWith(",")){
				idxViFiID = idxViFiID.substring(1);
			}
			String[] ids = idxViFiID.split(",");
			if(ids.length>0){
				String sqlTemp = " and (";
				for (int i = 0; i < ids.length; i++) {
					if(!StringUtils.isNullOrEmpty(ids[i])){
						sqlTemp += " c.idxViFiID like '"+ids[i]+"%' ";
						if(i < ids.length-1){
							sqlTemp += " or ";
						}
					}
				}
				sqlTemp +=" ) ";
				sql += sqlTemp;
			}
		
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and c.idxViFiID in ( select idxViFiID from tbViFiDevice where idxAgentID LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		sql +="  GROUP BY c.idxViFiID,c.keyUUWiFiCDID,c.crtBy ";
		sql = "SELECT COALESCE(COUNT(cc.keyUUWiFiCDID),0) as durMTGoip from ( "+sql +") cc" ;
		return queryList(sql, TbUUWiFiCountDaily.class);
	}
	/**
	 * 话单统计总数
	 * @param idxUserId
	 * @param beginTime
	 * @param endTime
	 * @param
	 * @return
	 */
	public List<TbCountDaily> queryCountTariffeDataByUser(String idxUserId,String beginTime,String endTime) {
		String sql = "select c.keyCDID,c.idxUserId,SUM(c.numTotalMMOut) as numTotalMMOut from tbCountDaily c where (c.numTotalMMOut+c.numTotalMO+c.numTotalMOCb+c.numTotalMTGoip+c.numTotalMOGoip+c.numTotalMOGoipCb) > 0 ";
		if(!StringUtils.isNullOrEmpty(idxUserId) && !"null".equals(idxUserId)){
			idxUserId = idxUserId.trim();
			idxUserId = idxUserId.replaceAll("，", ",");
			if(idxUserId.endsWith(",")){
				idxUserId = idxUserId.substring(0,idxUserId.length()-1);
			}
			if(idxUserId.startsWith(",")){
				idxUserId = idxUserId.substring(1);
			}
			String[] ids = idxUserId.split(",");
			if(ids.length>0){
				String sqlTemp = " and (";
				for (int i = 0; i < ids.length; i++) {
					if(!StringUtils.isNullOrEmpty(ids[i])){
						sqlTemp += " c.idxUserId like '"+ids[i]+"%' ";
						if(i < ids.length-1){
							sqlTemp += " or ";
						}
					}
				}
				sqlTemp +=" ) ";
				sql += sqlTemp;
			}
		}
		if(!StringUtils.isNullOrEmpty(beginTime) && !"null".equals(beginTime)){
			sql += " and c.crtTm >='"+beginTime+" 00:00:00' ";
		}
		if(StringUtils.isNullOrEmpty(beginTime) && StringUtils.isNullOrEmpty(endTime)){
			sql += " and c.crtTm >='"+sdf.format(new Date())+" 00:00:00' ";
		}
		if(!StringUtils.isNullOrEmpty(endTime) && !"null".equals(endTime)){
			sql += " and c.crtTm <='"+endTime+" 23:59:59' ";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and c.idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		sql +="  GROUP BY c.idxUserId,c.keyCDID";
		sql = "SELECT COUNT(cc.keyCDID) as numTotalMO from ( "+sql +") cc";
		return queryList(sql, TbCountDaily.class);
	}
	public Map<String, Object> queryCount(Criteria criteria) {
		String sql = "SELECT idxUserId,COALESCE(sum(cntDataSum),0) as cntDataSum,COUNT(distinct idxUserId) as numTotalMMIn from tbCountDaily ";
		return jdbcDao.querySingleResult(sql, criteria);
		//return queryList(sql, TbCountDaily.class);
	}
	/**
	 * 流量 每日 每月 概要
	 * @param isMonth
	 * @return
	 */
	public  List<TbCountDailyInfo> getQueryCountInfo(boolean isMonth){
		 String sql = "select COALESCE(sum(t.cntDataSum),0) as cntDataSum, count(distinct t.idxUserId) as countUser,COALESCE(sum(t.dataCost),0) as cost from tbCountDaily t where t.cntDataSum > 0 and ";
		 if(isMonth){
			 sql +=" date_format(t.crtTm, '%Y-%m') =  date_format(now(),'%Y-%m')";
		 }else{
			 sql +=" date_format(t.crtTm, '%Y-%m-%d') =  date_format(now(),'%Y-%m-%d')";
		 }
		 TbAgent agent = UserUtils.getUserProfile().getTbAgent();
         if (agent != null) {
    		sql += " and t.idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
         }
		 List<TbCountDailyInfo> list = queryList(sql, TbCountDailyInfo.class);
		return list;
	}
	/**
	 * 话单 每日 每月 概要
	 * @param isMonth
	 * @return
	 */
	public  List<TbCountDailyInfo> getQueryCountTariffeInfo(boolean isMonth){
		String sql ="select COALESCE(sum(c.numTotalMMOut+c.numTotalMO+c.numTotalMOCb+c.numTotalMTGoip+c.numTotalMOGoip+c.numTotalMOGoipCb),0) as numTotal, count(distinct c.idxUserId) as countUser," +
					"COALESCE(sum(c.durMMOut+c.durMO+c.durMOCb+c.durMTGoip+c.durMOGoip+c.durMOGoipCb),0) as durM," +
					"COALESCE(sum(c.callCost),0) as cost from tbCountDaily c " +
					"where (c.numTotalMMOut+c.numTotalMO+c.numTotalMOCb+c.numTotalMTGoip+c.numTotalMOGoip+c.numTotalMOGoipCb) > 0 and ";
		if(isMonth){
			sql +=" date_format(c.crtTm, '%Y-%m') =  date_format(now(),'%Y-%m')";
		}else{
			sql +=" date_format(c.crtTm, '%Y-%m-%d') =  date_format(now(),'%Y-%m-%d')";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and c.idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		List<TbCountDailyInfo> list = queryList(sql, TbCountDailyInfo.class);
		return list;
	}
	/**
	 * 话单 今日、本月、今年 通话数量和总费用 状态图
	 * @return
	 */
	public List<TbCountDailyInfo> queryCountByTime(String type){
		String sql = " COALESCE(SUM(numTotalMMOut+numTotalMO+numTotalMOCb),0) as numTotal,COALESCE(sum(callCost),0) as cost from tbCountDaily where (numTotalMMOut+numTotalMO+numTotalMOCb+numTotalMTGoip+numTotalMOGoip+numTotalMOGoipCb) > 0  ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		if(CountDailyService.IS_YEAR.equals(type)){
			sql = "select DATE_FORMAT(crtTm,'%m') as years," + sql +" and DATE_FORMAT(NOW(),'%Y') = DATE_FORMAT(crtTm,'%Y')";
			sql +="group by DATE_FORMAT(crtTm,'%m') ORDER BY years desc";
		}else if(CountDailyService.IS_MONTH.equals(type)){
			sql = "select DATE_FORMAT(crtTm,'%d') as months," + sql +" and DATE_FORMAT(NOW(),'%Y-%m') = DATE_FORMAT(crtTm,'%Y-%m')";
			sql +="group by DATE_FORMAT(crtTm,'%d') ORDER BY months desc";
		}else{
			sql = "select DATE_FORMAT(crtTm,'%H') as hours, COALESCE(COUNT(idxUserId),0) as numTotal,COALESCE(sum(costCash),0) as cost from tbCDR where cdrType !='V' and DATE_FORMAT(NOW(),'%Y-%m-%d') = DATE_FORMAT(crtTm,'%Y-%m-%d') ";
			if (agent != null) {
				sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
			}
			sql +="group by DATE_FORMAT(crtTm,'%H') ORDER BY hours desc";
		}
		return  queryList(sql,TbCountDailyInfo.class);
	}
	/**
	 * 流量前12小时统计信息
	 * @return
	 */
	public List<TbCountDailyInfo> queryCountByHour(){
		String sql = "select DATE_FORMAT(crtTm,'%Y-%m-%d %H') as hours,count(distinct idxUserId) as countUser,COALESCE(sum(dataTraffic),0) as cntDataSum from tbCDR where cdrType='V' and date_sub(NOW(), INTERVAL 12 HOUR) < crtTm ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
		sql +="group by DATE_FORMAT(crtTm,'%Y-%m-%d %H') ORDER BY hours desc";
		return  queryList(sql,TbCountDailyInfo.class);
	}
	/**
	 * 流量
	 * @return
	 */
	public List<TbCountDailyInfo> queryCountByNow(){
		String sql = "select COALESCE(sum(cntDataSum),0) as cntDataSum from tbCountDaily where cntDataSum > 0 and DATE_FORMAT(crtTm,'%Y-%m-%d') = date_format(now(),'%Y-%m-%d') ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
		return  queryList(sql, TbCountDailyInfo.class);
	}
	 /**
     * 话单统计实时图
     */
    public List<TbCountDailyInfo> queryCountTariffeTime(){
    	String sql = "select COALESCE(COUNT(idxUserId),0) as numTotal,DATE_FORMAT(crtTm,'%Y-%m-%d %H:%i:00') as hours from tbCDR where date_sub(NOW(), INTERVAL 100 MINUTE) <= crtTm and cdrType !='V'  ";
    	TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
        sql +=" GROUP BY hours ORDER BY hours";
    	return  queryList(sql, TbCountDailyInfo.class);
    }
    /**
     * 话单统计实时图
     */
    public List<TbCountDailyInfo> queryCountTariffeNow(){
    	String sql = "select COALESCE(COUNT(idxUserId),0) as numTotal from tbCDR where date_sub(NOW(), INTERVAL 5 second) <= crtTm and cdrType !='V'  ";
    	TbAgent agent = UserUtils.getUserProfile().getTbAgent();
    	if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
    	}
    	return  queryList(sql, TbCountDailyInfo.class);
    }
	/**
	 * 流量前30天统计信息
	 * @return
	 */
	public List<TbCountDailyInfo> queryCountByMonth(){
		String sql = "select DATE_FORMAT(crtTm,'%Y-%m-%d') as months,count(idxUserId) as countUser,COALESCE(sum(cntDataSum),0) as cntDataSum from tbCountDaily where cntDataSum > 0 and date_sub(NOW(), INTERVAL 30 DAY) <= crtTm ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
		sql +=" group by DATE_FORMAT(crtTm,'%Y-%m-%d') ORDER BY months desc";
		return  queryList(sql, TbCountDailyInfo.class);
	}
	/**
	 * 流量前12个月统计信息
	 * @return
	 */
	public List<TbCountDailyInfo> queryCountByYear(){
		String sql = "select DATE_FORMAT(crtTm,'%Y-%m') as years,count(distinct idxUserId) as countUser,COALESCE(sum(cntDataSum),0) as cntDataSum from tbCountDaily where cntDataSum > 0 and date_sub(NOW(), INTERVAL 12 MONTH) <= crtTm ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
		sql+="group by  DATE_FORMAT(crtTm,'%Y-%m') ORDER BY years desc limit 12";
		return  queryList(sql, TbCountDailyInfo.class);
	}
	/**
	 * 流量本月前10名
	 * @return
	 */
	public List<TbCountDailyInfo> queryTop(){
		String sql = "select idxUserId,COALESCE(sum(cntDataSum),0) as cntDataSum from tbCountDaily where cntDataSum > 0 and DATE_FORMAT(crtTm,'%Y-%m') = DATE_FORMAT(NOW(),'%Y-%m') ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
        }
		sql+=" GROUP BY idxUserId ORDER BY cntDataSum DESC LIMIT 10";
		return  queryList(sql, TbCountDailyInfo.class);
	}
	/**
	 * 话费本月费用前10名
	 * @return
	 */
	public List<TbCountDailyInfo> queryTariffeTop(){
		String sql = "select idxUserId,COALESCE(sum(callCost),0) as cost from tbCountDaily where (numTotalMMOut+numTotalMO+numTotalMOCb+numTotalMTGoip+numTotalMOGoip+numTotalMOGoipCb) > 0 and callCost > 0 and DATE_FORMAT(crtTm,'%Y-%m') = DATE_FORMAT(NOW(),'%Y-%m') ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		sql+=" GROUP BY idxUserId ORDER BY cost DESC LIMIT 10";
		return  queryList(sql, TbCountDailyInfo.class);
	}
	/**
	 * 今日通话时长前10名
	 * @return
	 */
	public List<TbCountDailyInfo> queryTariffeTimeTop(){
		String sql = "select idxUserId,(durMMOut+durMO+durMOCb+durMTGoip+durMOGoip+durMOGoipCb) as durM from tbCountDaily where (numTotalMMOut+numTotalMO+numTotalMOCb+numTotalMTGoip+numTotalMOGoip+numTotalMOGoipCb) > 0 and (durMMOut+durMO+durMOCb+durMTGoip+durMOGoip+durMOGoipCb) > 0 and DATE_FORMAT(crtTm,'%Y-%m-%d') = DATE_FORMAT(NOW(),'%Y-%m-%d') ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql += " and idxUserId in ( select idxPhoneNumber from tbUser where idxAgentId LIKE '"+agent.getIdxAgentId()+"%' )";
		}
		sql+=" ORDER BY durM DESC LIMIT 10";
		return  queryList(sql, TbCountDailyInfo.class);
	}
	/**
	 * 用户统计
	 * @return
	 */
	public TbCountDailyInfo queryCountUser(String appState){
		String sql = "select COALESCE(COUNT(keyUserID),0) as countUser from tbUser where 1=1 and idxPhoneNumber NOT LIKE '89%' ";
		if(appState!=null){
			sql+=" and appState !='"+appState+"'";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql +=" and idxAgentId LIKE '"+agent.getIdxAgentId()+"%'";
        }
		return  queryList(sql, TbCountDailyInfo.class).get(0);
	}
	/**
	 * 设备统计
	 * @return
	 */
	public TbCountDailyInfo queryCountVifiDevice(boolean isonLine){
		String sql = "SELECT COALESCE(COUNT(keyDevID),0) as countDevice from tbViFiDevice where 1=1 ";
		if(isonLine){
			sql +=" and date_sub(NOW(), INTERVAL expire second) <= lastConnectTime";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if (agent != null) {
    		sql +=" and idxAgentId LIKE '"+agent.getIdxAgentId()+"%'";
        }
		return  queryList(sql, TbCountDailyInfo.class).get(0);
	}
	/**
	 * 在线通话数量统计
	 * @return
	 */
	public TbCountDailyInfo queryCountOnlineCalls(){
		String sql = "select COALESCE(COUNT(idxUserId),0) as calls  from tbCDR where cdrType !='V' and !ISNULL(AnswerTime) and ISNULL(StopTime) and date_sub(NOW(), INTERVAL 2 HOUR) < crtTm";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql +=" and idxAgentId LIKE '"+agent.getIdxAgentId()+"%'";
		}
		return  queryList(sql, TbCountDailyInfo.class).get(0);
	}
	/**
	 * 在线GOIP数量统计
	 * @return
	 */
	public TbCountDailyInfo queryCountOnlineGoIPs(){
		String sql = "select COALESCE(COUNT(keySessID),0) as goIPNum from tbUUWiFiSession where sessType = 'G' and `status` = '11' and date_sub(NOW(), INTERVAL expire second) <= lastUpdate ";
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql +=" and idxVifiID in (select idxVifiID from tbViFiDevice where idxAgentID like '"+agent.getIdxAgentId()+"%')";
		}
		return  queryList(sql, TbCountDailyInfo.class).get(0);
	}
	/**
	 * 在线设备数量统计
	 * @return
	 */
	public TbCountDailyInfo querCountOnlineDevice(boolean isOnline,String time){
		String sql = "select COALESCE(COUNT(distinct idxViFiID),0) as countDevice from tbUUWiFiSession where sessType = 'S'";
		if(isOnline){
			sql+=" and `status` = '11' and date_sub(NOW(), INTERVAL expire second) <= lastUpdate ";
		}
		if("month".equals(time)){
			sql+=" and DATE_FORMAT(NOW(),'%Y-%m') = DATE_FORMAT(lastUpdate,'%Y-%m')  ";
		}else if("today".equals(time)){
			sql+=" and DATE_FORMAT(NOW(),'%Y-%m-%d') = DATE_FORMAT(lastUpdate,'%Y-%m-%d') ";
		}
		TbAgent agent = UserUtils.getUserProfile().getTbAgent();
		if (agent != null) {
			sql +=" and idxVifiID in (select idxVifiID from tbViFiDevice where idxAgentID like '"+agent.getIdxAgentId()+"%')";
		}
		return  queryList(sql, TbCountDailyInfo.class).get(0);
	}
}

       