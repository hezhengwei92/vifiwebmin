
package net.eoutech.webmin.count.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.*;
import net.eoutech.webmin.count.dao.CountDailyDao;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;

@Service
public class CountDailyService extends FrameBaseService<TbCountDaily> {
	public static final String IS_TODAY = "isToday";
	public static final String IS_MONTH = "isMonth";
	public static final String IS_YEAR = "isYear";
	public static final SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
	public static final SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm:00");
    @Autowired
    CountDailyDao countDailyDao;

    @Override
    public TbCountDaily save(TbCountDaily countDaily, boolean isEdit, List<String> idList) {

        countDaily.setMdfTm(new Date());
        countDaily.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            countDaily.setCrtBy(countDaily.getMdfBy());
            countDaily.setCrtTm(countDaily.getMdfTm());
        }

        return super.save(countDaily, isEdit, idList);
    }

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }
    public Page<TbUseFlowRcd> queryCountDataByUser(String idxUserId,String beginTime,String endTime,Map<String, Object> queryParam,int pageNumber, int pageSize ){
    	//Criteria criteria = Criteria.create(getEntityClass());
    	//FrameBaseService.parseQueryCriteria(queryParam, criteria);
    	String orderBy = " order by ";
    	String orderVal = "";
    	String orderListJSON = (String) queryParam.get("ORDER_LIST");
        if (hasOrderParam(queryParam)) {
            JSONArray orderList = JsonUtils.parseArray(orderListJSON);
            for (Object orderObj : orderList) {
                JSONArray orderArr = (JSONArray) orderObj;
                if ("1".equals(orderArr.get(1).toString())) {
                	orderVal += "c."+orderArr.get(0)+",";
                } else if ("2".equals(orderArr.get(1).toString())) {
                	orderVal += "c."+orderArr.get(0) +" desc,";
                }
            }
        }
        if(orderVal.length()>1){
        	if(orderVal.endsWith(",")){
        		orderVal = orderVal.substring(0,orderVal.length()-1);
        	}
        	orderBy += orderVal;
        }else{
        	orderBy +="c.crtTm desc";
        }
    	List<TbUseFlowRcd> list = countDailyDao.queryCountDataByUser(idxUserId, beginTime, endTime, orderBy,pageNumber,pageSize );
    	List<TbUseFlowRcd> list2 = countDailyDao.queryCountDataByUser(idxUserId, beginTime, endTime, orderBy);
    	int total = 0;
    	if(list !=null && list2.size()>0 && list2.get(0) !=null){
//    		total = list2.get(0).getNumTotalMO();
			total=list2.size();
    	}
    	Pageable pageable = new PageRequest(pageNumber-1, pageSize);
    	Page<TbUseFlowRcd> page = new PageImpl<TbUseFlowRcd>(list, pageable, total);
    	//Map<String, Object> map =  countDailyDao.queryCount(criteria);
    	return page;
    }
    /**
     * 设备用量统计列表
     * @param idxUserId
     * @param beginTime
     * @param endTime
     * @param queryParam
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<TbUUWiFiCountDaily> queryCountUUWIFIDataByUser(String idxViFiID,String beginTime,String endTime,Map<String, Object> queryParam,int pageNumber, int pageSize ){
    	String orderBy = " order by ";
    	String orderVal = "";
    	String orderListJSON = (String) queryParam.get("ORDER_LIST");
    	if (hasOrderParam(queryParam)) {
    		JSONArray orderList = JsonUtils.parseArray(orderListJSON);
    		for (Object orderObj : orderList) {
    			JSONArray orderArr = (JSONArray) orderObj;
    			if ("1".equals(orderArr.get(1).toString())) {
    				orderVal += "c."+orderArr.get(0)+",";
    			} else if ("2".equals(orderArr.get(1).toString())) {
    				orderVal += "c."+orderArr.get(0) +" desc,";
    			}
    		}
    	}
    	if(orderVal.length()>1){
    		if(orderVal.endsWith(",")){
    			orderVal = orderVal.substring(0,orderVal.length()-1);
    		}
    		orderBy += orderVal;
    	}else{
    		orderBy +="c.crtTm desc";
    	}
    	List<TbUUWiFiCountDaily> list = countDailyDao.queryCountUUWIFIDataByUser(idxViFiID, beginTime, endTime, orderBy,pageNumber,pageSize );
    	List<TbUUWiFiCountDaily> list2 = countDailyDao.queryCountUUWIFIDataByUser(idxViFiID, beginTime, endTime, orderBy);
    	int total = 0;
    	if(list !=null && list2.size()>0 && list2.get(0) !=null && list2.get(0).getDurMTGoip() !=null){
    		total = list2.get(0).getDurMTGoip();
    	}
    	Pageable pageable = new PageRequest(pageNumber-1, pageSize);
    	Page<TbUUWiFiCountDaily> page = new PageImpl<TbUUWiFiCountDaily>(list, pageable, total);
    	//Map<String, Object> map =  countDailyDao.queryCount(criteria);
    	return page;
    }
    /**
     * 历史话单
     * @param idxUserId
     * @param beginTime
     * @param endTime
     * @param queryParam
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<TbCountDaily> queryCountTariffeDataByUser(String idxUserId,String beginTime,String endTime,Map<String, Object> queryParam,int pageNumber, int pageSize ){
    	String orderBy = " order by ";
    	String orderVal = "";
    	String orderListJSON = (String) queryParam.get("ORDER_LIST");
    	if (hasOrderParam(queryParam)) {
    		JSONArray orderList = JsonUtils.parseArray(orderListJSON);
    		for (Object orderObj : orderList) {
    			JSONArray orderArr = (JSONArray) orderObj;
    			if ("1".equals(orderArr.get(1).toString())) {
    				orderVal += "c."+orderArr.get(0)+",";
    			} else if ("2".equals(orderArr.get(1).toString())) {
    				orderVal += "c."+orderArr.get(0) +" desc,";
    			}
    		}
    	}
    	if(orderVal.length()>1){
    		if(orderVal.endsWith(",")){
    			orderVal = orderVal.substring(0,orderVal.length()-1);
    		}
    		orderBy += orderVal;
    	}else{
    		orderBy +="c.crtTm desc";
    	}
    	List<TbCountDaily> list = countDailyDao.queryCountTariffeDataByUser(idxUserId, beginTime, endTime, orderBy,pageNumber,pageSize );
    	List<TbCountDaily> list2 = countDailyDao.queryCountTariffeDataByUser(idxUserId, beginTime, endTime);
    	int total = 0;
    	if(list !=null && list2.size()>0){
    		total = list2.get(0).getNumTotalMO();
    	}
    	Pageable pageable = new PageRequest(pageNumber-1, pageSize);
    	Page<TbCountDaily> page = new PageImpl<TbCountDaily>(list, pageable, total);
    	return page;
    }
    public Object[] queryListDataByUser(String idxUserId,String beginTime,String endTime,boolean isTariffe){
    	List<TbCountDaily> list = countDailyDao.queryListDataByUser(idxUserId, beginTime, endTime,isTariffe);
    	Object[] results = new Object[4];
    	int listSize = list.size();
    	String[] xVals = new String[listSize];
    	Calendar calendar = Calendar.getInstance();
    	int[] series1 = new int[listSize];
    	int[] series2 = new int[listSize];
    	int[] series3 = new int[listSize];
    	for (int i = 0; i < list.size(); i++) {
			TbCountDaily td = list.get(i);
			xVals[i] = sdf2.format(td.getCrtTm());
			series1[i] = td.getNumFailedMMIn()+td.getNumFailedMMOut()+td.getNumFailedMO()+ td.getNumFailedMOCb() +td.getNumFailedMOGoip()+td.getNumFailedMOGoipCb()+td.getNumFailedMTGoip();
			series2[i] = td.getNumShortMMIn()+td.getNumShortMMOut()+td.getNumShortMO()+td.getNumShortMOCb()+td.getNumShortMOGoip()+td.getNumShortMOGoipCb()+td.getNumShortMTGoip();
			series3[i] = td.getNumTotalMMOut()+td.getNumTotalMO()+td.getNumTotalMOCb()+td.getNumTotalMOGoip()+td.getNumTotalMOGoipCb()+td.getNumTotalMTGoip()-series1[i]-series2[i];
			if(series1[i] <0){
				series1[i] = 0;
			}
			if(series2[i] <0){
				series2[i] = 0;
			}
			if(series3[i] <0){
				series3[i] = 0;
			}
			if(i ==list.size()-1){
				try {
					calendar.setTime(sdf2.parse(sdf2.format(td.getCrtTm())));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
    	}
    	if(listSize > 0){
    		String tempEndTime = endTime;
    		if(StringUtils.isEmpty(tempEndTime)){
    			tempEndTime = new String(sdf2.format(new Date()));
    		}
    		if(!tempEndTime.equals(xVals[xVals.length-1])){
    			xVals = (String[]) ArrayUtils.add(xVals, tempEndTime);
    			series1 =  ArrayUtils.add(series1, 0);
    			series2 =  ArrayUtils.add(series2, 0);
    			series3 =  ArrayUtils.add(series3, 0);
    		}
    		if(listSize < 20 && StringUtils.isNotEmpty(beginTime) && !beginTime.equals( xVals[0])){
    			xVals = (String[]) ArrayUtils.addAll(new String[]{beginTime}, xVals);
    			series1 =  ArrayUtils.addAll(new int[]{0}, series1);
    			series2 =  ArrayUtils.addAll(new int[]{0}, series2);
    			series3 =  ArrayUtils.addAll(new int[]{0}, series3);
    		}
    	}else{
    		if(StringUtils.isNotEmpty(beginTime)){
    			xVals = (String[]) ArrayUtils.add(xVals, beginTime);
    			series1 =  ArrayUtils.add(series1, 0);
    			series2 =  ArrayUtils.add(series2, 0);
    			series3 =  ArrayUtils.add(series3, 0);
    		}
    		if(StringUtils.isEmpty(endTime)){
    			xVals = (String[]) ArrayUtils.add(xVals, sdf2.format(new Date()));
    		}else{
    			xVals = (String[]) ArrayUtils.add(xVals, endTime);
    		}
    		series1 =  ArrayUtils.add(series1, 0);
			series2 =  ArrayUtils.add(series2, 0);
			series3 =  ArrayUtils.add(series3, 0);
    	}
    	results[0] = xVals;
    	results[1] = series1;
    	results[2] = series2;
    	results[3] = series3;
    	return results;
    }
    public List<TbUUWiFiCountDaily> queryListDataByUUWIFI(String idxUserId,String beginTime,String endTime){
    	List<TbUUWiFiCountDaily> list = countDailyDao.queryListDataByUUWIFI(idxUserId, beginTime, endTime);
    	return list;
    }
    /**
	 * 流量 每日 每月 概要
	 * @param isMonth
	 * @return
	 */
    public  TbCountDailyInfo getQueryCountInfo(boolean isMonth){
		 List<TbCountDailyInfo> list = countDailyDao.getQueryCountInfo(isMonth);
		 TbCountDailyInfo info = new TbCountDailyInfo();
		 if(list.size()>0){
			 info = list.get(0);
		 }
		return info;
	}
    /**
	 * 话单 每日 每月 概要
	 * @param isMonth
	 * @return
	 */
    public  TbCountDailyInfo getQueryCountTariffeInfo(boolean isMonth){
    	List<TbCountDailyInfo> list = countDailyDao.getQueryCountTariffeInfo(isMonth);
    	TbCountDailyInfo info = new TbCountDailyInfo();
    	if(list.size()>0){
    		info = list.get(0);
    	}
    	return info;
    }
    public String toDecimal(double x,int y) {    
        double f = Math.round(x*10)/10; 
        if(y==2){
        	f = Math.round(x*100)/100; 
        }
        String s = f+"";    
        int rs = s.indexOf('.');    
        if (rs < 0) {    
            rs = s.length();    
            s += '.';    
        }    
        while (s.length() <= rs + y) {    
            s += '0';    
        }    
        return s;    
  }
    /**
	 * 话单 今日、本月、今年 通话数量和总费用 状态图
	 * @return
	 */
	public Object[] queryCountByTime(String type){
		List<TbCountDailyInfo> list = countDailyDao.queryCountByTime(type);
		Object[] result =  new  Object[7];
		Object[] list_temp =  new  Object[1];
		Object[] list_temp2=  new  Object[1];
		Object[] list_temp3=  new  Object[1];
		int maxNum =100;
		int numInterval = 20;
		int maxCost =200;
		int costInterval = 50;
		Calendar c = Calendar.getInstance();
	    c.setTime(new Date());
		if(CountDailyService.IS_YEAR.equals(type)){
			try {
				list_temp =  new  Object[12];
				list_temp2=  new  Object[12];
				list_temp3=  new  Object[12];
				
				for (int i = 0; i < 12; i++) {
					boolean flag = true;
					if(list !=null && list.size()>0){
						for (int j = 0; j < list.size(); j++) {
							if(list.get(j) !=null && list.get(j).getYears() !=null){
								 if((((i+1)<10 ? "0"+(i+1):(i+1))+"").equals(list.get(j).getYears())){
									 list_temp[i]=(i+1)+"";
									 list_temp2[i]=(list.get(j).getNumTotal());
									 if(maxNum < list.get(j).getNumTotal()){
										 maxNum = list.get(j).getNumTotal();
									 }
									 list_temp3[i]=(toDecimal(list.get(j).getCost()/1000,2));
									 if(maxCost < list.get(j).getCost()/1000){
										 maxCost = Math.round(list.get(j).getCost()/1000);
									 }
									 flag = false;
									 break;
								 }
							}
						}
					}
					if(flag){
							list_temp[i]=(i+1)+"";
							if(i <= c.get(c.MONTH)){
								 list_temp2[i]=(0);
								 list_temp3[i]=("0.00");
							}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(CountDailyService.IS_MONTH.equals(type)){
			try {
			    Calendar calendar = Calendar.getInstance();
			    calendar.setTime(new Date());
			    int monthSize = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			    list_temp =  new  Object[monthSize];
				list_temp2=  new  Object[monthSize];
				list_temp3=  new  Object[monthSize];
				for (int i = 0; i < monthSize; i++) {
					boolean flag = true;
					if(list !=null && list.size()>0){
						for (int j = 0; j < list.size(); j++) {
							if(list.get(j) !=null && list.get(j).getMonths() !=null){
								 if((((i+1)<10 ? "0"+(i+1):(i+1))+"").equals(list.get(j).getMonths())){
									 list_temp[i]=(calendar.get(Calendar.MONTH)+1)+"-"+((i+1)<10 ? "0"+(i+1):(i+1));
									 list_temp2[i]=(list.get(j).getNumTotal());
									 list_temp3[i]=toDecimal(list.get(j).getCost()/1000,2);
									 if(maxNum < list.get(j).getNumTotal()){
										 maxNum = list.get(j).getNumTotal();
									 }
									 if(maxCost < list.get(j).getCost()/1000){
										 maxCost = Math.round(list.get(j).getCost()/1000);
									 }
									 flag = false;
									 break;
								 }
							}
						}
					}
					if(flag){
						 list_temp[i]=(calendar.get(Calendar.MONTH)+1)+"-"+((i+1)<10 ? "0"+(i+1):(i+1));
						 if(i <= c.get(c.DAY_OF_MONTH)){
							 list_temp2[i]=0;
							 list_temp3[i]="0.00";
						 }
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			try {
				list_temp =  new  Object[24];
				list_temp2=  new  Object[24];
				list_temp3=  new  Object[24];
				for (int i = 0; i < 24; i++) {
					boolean flag = true;
					if(list !=null && list.size()>0){
						for (int j = 0; j < list.size(); j++) {
							if(list.get(j) !=null && list.get(j).getHours() !=null){
								 if(((i<10 ? ("0"+i):i)+"").equals(list.get(j).getHours())){
									 list_temp[i]=list.get(j).getHours()+":00";
									 list_temp2[i]=(list.get(j).getNumTotal());
									 list_temp3[i]=toDecimal(list.get(j).getCost()/1000,2);
									 if(maxNum < list.get(j).getNumTotal()){
										 maxNum = list.get(j).getNumTotal();
									 }
									 if(maxCost < list.get(j).getCost()/1000){
										 maxCost = Math.round(list.get(j).getCost()/1000);
									 }
									 flag = false;
									 break;
								 }
							}
						}
					}
					if(flag){
						list_temp[i]=(i<10 ? ("0"+i):i)+":00";
						if(i <= c.get(c.HOUR_OF_DAY)){
							list_temp2[i]=0;
							list_temp3[i]="0.00";
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(maxNum !=100){
			try {
				//maxNum = (int) (maxNum + Math.round(maxNum*0.3));
				String temp = (Integer.parseInt((""+maxNum).substring(0,1))+1)+"";
				int size = (""+maxNum).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxNum = Integer.parseInt(temp);
				numInterval = Math.round(maxNum/5);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(maxCost !=200){
			try {
				//maxCost = maxCost + Math.round(maxCost/5);
				String temp = (Integer.parseInt((""+maxCost).substring(0,1))+1)+"";
				int size = (""+maxCost).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxCost = Integer.parseInt(temp);
				costInterval = Math.round(maxCost/5);
			} catch (Exception e) {
			}
		}
		result[0]=(list_temp);
		result[1]=(list_temp2);
		result[2]=(list_temp3);
		result[3]= maxNum;
		result[4]= numInterval;
		result[5]= maxCost;
		result[6]= costInterval;
		return result;
	}
    
	public Object[] queryCountByHour2(){
		List<TbCountDailyInfo> list = countDailyDao.queryCountByHour();
		Object[] result =  new  Object[7];
		Object[] list_temp =  new  Object[24];
		Object[] list_temp2=  new  Object[24];
		Object[] list_temp3=  new  Object[24];
		int maxNum =200;
		int numInterval = 40;
		int maxCost =1000;
		int costInterval = 200;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(sdf.parse(sdf.format(date)));
			//date = sdf.parse(startTime);
			for (int i = 0; i < 24; i++) {
				boolean flag = true;
				if(list !=null && list.size()>0){
					for (int j = 0; j < list.size(); j++) {
						if(list.get(j) !=null && list.get(j).getHours() !=null){
							if(sdf.format(calendar.getTime()).equals(list.get(j).getHours())){
								 list_temp[i]=  sdf.format(calendar.getTime());
								 list_temp2[i]=(list.get(j).getCountUser());
								 list_temp3[i]=(list.get(j).getCntDataSum()/1000);
								 if(maxNum < list.get(j).getCountUser()){
									 maxNum = list.get(j).getCountUser();
								 }
								 if(maxCost < list.get(j).getCntDataSum()/1000){
									 maxCost = Math.round(list.get(j).getCntDataSum()/1000);
								 }
								flag = false;
								break;
							}
						}
					}
				}
				if(flag){
					 list_temp[i]= sdf.format(calendar.getTime());
					 list_temp2[i]=0;
					 list_temp3[i]=0;
				}
				calendar.add(Calendar.HOUR_OF_DAY, -1);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(maxNum !=200){
			try {
				//maxNum = (int) (maxNum + Math.round(maxNum*0.3));
				String temp = (Integer.parseInt((""+maxNum).substring(0,1))+1)+"";
				int size = (""+maxNum).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxNum = Integer.parseInt(temp);
				numInterval = Math.round(maxNum/5);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(maxCost !=1000){
			try {
				//maxCost = maxCost + Math.round(maxCost/5);
				String temp = (Integer.parseInt((""+maxCost).substring(0,1))+1)+"";
				int size = (""+maxCost).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxCost = Integer.parseInt(temp);
				costInterval = Math.round(maxCost/5);
			} catch (Exception e) {
			}
		}
		result[0]=(list_temp);
		result[1]=(list_temp2);
		result[2]=(list_temp3);
		result[3]= maxNum;
		result[4]= numInterval;
		result[5]= maxCost;
		result[6]= costInterval;
		return result;
	}
    
    
    
    
	public List<TbCountDailyInfo> queryCountByHour(){
		 List<TbCountDailyInfo> list = countDailyDao.queryCountByHour();
		 List<TbCountDailyInfo> list2 = new ArrayList<TbCountDailyInfo>();
		 
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
			 Date date = new Date();
			 Calendar calendar = Calendar.getInstance();
			 try {
				 calendar.setTime(sdf.parse(sdf.format(date)));
				 //date = sdf.parse(startTime);
		         for (int i = 0; i < 12; i++) {
		        	 boolean flag = true;
		        	 if(list !=null && list.size()>0){
			        	 for (int j = 0; j < list.size(); j++) {
			        		 if(list.get(j) !=null && list.get(j).getHours() !=null){
				        		 if(sdf.format(calendar.getTime()).equals(list.get(j).getHours())){
				        			 list2.add(list.get(j));
				        			 flag = false;
				        			 break;
				        		 }
			        		 }
						}
		        	 }
		        	if(flag){
		        		list2.add(new TbCountDailyInfo());
		        	}
		        	calendar.add(Calendar.HOUR_OF_DAY, -1);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		 return list2;
	}
	
	public Object[] queryCountByMonth2(){
		List<TbCountDailyInfo> list = countDailyDao.queryCountByMonth();
		Object[] result =  new  Object[7];
		Object[] list_temp =  new  Object[30];
		Object[] list_temp2=  new  Object[30];
		Object[] list_temp3=  new  Object[30];
		int maxNum =200;
		int numInterval = 40;
		int maxCost =1000;
		int costInterval = 200;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(sdf.parse(sdf.format(date)));
			//date = sdf.parse(startTime);
			for (int i = 0; i < 30; i++) {
				boolean flag = true;
				if(list !=null && list.size()>0){
					for (int j = 0; j < list.size(); j++) {
						if(list.get(j) !=null && list.get(j).getMonths() !=null){
			        		 if(sdf.format(calendar.getTime()).equals(list.get(j).getMonths())){
								 list_temp[i]=  sdf.format(calendar.getTime());
								 list_temp2[i]=(list.get(j).getCountUser());
								 list_temp3[i]=(list.get(j).getCntDataSum()/1000);
								 if(maxNum < list.get(j).getCountUser()){
									 maxNum = list.get(j).getCountUser();
								 }
								 if(maxCost < list.get(j).getCntDataSum()/1000){
									 maxCost = Math.round(list.get(j).getCntDataSum()/1000);
								 }
								flag = false;
								break;
							}
						}
					}
				}
				if(flag){
					 list_temp[i]= sdf.format(calendar.getTime());
					 list_temp2[i]=0;
					 list_temp3[i]=0;
				}
				calendar.add(Calendar.DATE, -1);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(maxNum !=200){
			try {
				//maxNum = (int) (maxNum + Math.round(maxNum*0.3));
				String temp = (Integer.parseInt((""+maxNum).substring(0,1))+1)+"";
				int size = (""+maxNum).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxNum = Integer.parseInt(temp);
				numInterval = Math.round(maxNum/5);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(maxCost !=1000){
			try {
				//maxCost = maxCost + Math.round(maxCost/5);
				String temp = (Integer.parseInt((""+maxCost).substring(0,1))+1)+"";
				int size = (""+maxCost).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxCost = Integer.parseInt(temp);
				costInterval = Math.round(maxCost/5);
			} catch (Exception e) {
			}
		}
		result[0]=(list_temp);
		result[1]=(list_temp2);
		result[2]=(list_temp3);
		result[3]= maxNum;
		result[4]= numInterval;
		result[5]= maxCost;
		result[6]= costInterval;
		return result;
	}
	public List<TbCountDailyInfo> queryCountByMonth(){
		List<TbCountDailyInfo> list = countDailyDao.queryCountByMonth(); 
		List<TbCountDailyInfo> list2 = new ArrayList<TbCountDailyInfo>();
		 
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 Date date = new Date();
			 Calendar calendar = Calendar.getInstance();
			 try {
				 calendar.setTime(sdf.parse(sdf.format(date)));
				 //date = sdf.parse(startTime);
		         for (int i = 0; i < 30; i++) {
		        	 boolean flag = true;
		        	 if(list !=null && list.size()>0){
			        	 for (int j = 0; j < list.size(); j++) {
			        		 if(list.get(j) !=null && list.get(j).getMonths() !=null){
				        		 if(sdf.format(calendar.getTime()).equals(list.get(j).getMonths())){
				        			 list2.add(list.get(j));
				        			 flag = false;
				        			 break;
				        		 }
			        		 }
						}
		        	}
		        	if(flag){
		        		list2.add(new TbCountDailyInfo());
		        	}
		        	calendar.add(Calendar.DATE, -1);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		 return list2;
	}
	public Object[] queryCountByYear2(){
		List<TbCountDailyInfo> list = countDailyDao.queryCountByYear();
		Object[] result =  new  Object[7];
		Object[] list_temp =  new  Object[12];
		Object[] list_temp2=  new  Object[12];
		Object[] list_temp3=  new  Object[12];
		int maxNum =200;
		int numInterval = 40;
		int maxCost =1000;
		int costInterval = 200;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(sdf.parse(sdf.format(date)));
			//date = sdf.parse(startTime);
			for (int i = 0; i < 12; i++) {
				boolean flag = true;
				if(list !=null && list.size()>0){
					for (int j = 0; j < list.size(); j++) {
						if(list.get(j) !=null && list.get(j).getYears() !=null){
			        		 if(sdf.format(calendar.getTime()).equals(list.get(j).getYears())){
								 list_temp[i]=  sdf.format(calendar.getTime());
								 list_temp2[i]=(list.get(j).getCountUser());
								 list_temp3[i]=(list.get(j).getCntDataSum()/1000);
								 if(maxNum < list.get(j).getCountUser()){
									 maxNum = list.get(j).getCountUser();
								 }
								 if(maxCost < list.get(j).getCntDataSum()/1000){
									 maxCost = Math.round(list.get(j).getCntDataSum()/1000);
								 }
								flag = false;
								break;
							}
						}
					}
				}
				if(flag){
					 list_temp[i]= sdf.format(calendar.getTime());
					 list_temp2[i]=0;
					 list_temp3[i]=0;
				}
				calendar.add(Calendar.MONTH, -1);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(maxNum !=200){
			try {
				//maxNum = (int) (maxNum + Math.round(maxNum*0.3));
				String temp = (Integer.parseInt((""+maxNum).substring(0,1))+1)+"";
				int size = (""+maxNum).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxNum = Integer.parseInt(temp);
				numInterval = Math.round(maxNum/5);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(maxCost !=1000){
			try {
				//maxCost = maxCost + Math.round(maxCost/5);
				String temp = (Integer.parseInt((""+maxCost).substring(0,1))+1)+"";
				int size = (""+maxCost).length()-1;
				for (int i = 0; i < size; i++) {
					temp +="0";
				}
				maxCost = Integer.parseInt(temp);
				costInterval = Math.round(maxCost/5);
			} catch (Exception e) {
			}
		}
		result[0]=(list_temp);
		result[1]=(list_temp2);
		result[2]=(list_temp3);
		result[3]= maxNum;
		result[4]= numInterval;
		result[5]= maxCost;
		result[6]= costInterval;
		return result;
	}
	public List<TbCountDailyInfo> queryCountByYear(){
		 List<TbCountDailyInfo> list = countDailyDao.queryCountByYear();
		 List<TbCountDailyInfo> list2 = new ArrayList<TbCountDailyInfo>();
		 
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			 Date date = new Date();
			 Calendar calendar = Calendar.getInstance();
			 try {
				 calendar.setTime(sdf.parse(sdf.format(date)));
				 //date = sdf.parse(startTime);
		         for (int i = 0; i < 12; i++) {
		        	 boolean flag = true;
		        	 if(list !=null && list.size()>0){
			        	 for (int j = 0; j < list.size(); j++) {
			        		 if(list.get(j) !=null && list.get(j).getYears() !=null){
				        		 if(sdf.format(calendar.getTime()).equals(list.get(j).getYears())){
				        			 list2.add(list.get(j));
				        			 flag = false;
				        			 break;
				        		 }
			        		 }
						}
		        	}
		        	if(flag){
		        		list2.add(new TbCountDailyInfo());
		        	}
		        	calendar.add(Calendar.MONTH, -1);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		 return list2;
	}
	public TbCountDailyInfo queryCountByNow(){
		List<TbCountDailyInfo> list = countDailyDao.queryCountByNow();
		TbCountDailyInfo count= new TbCountDailyInfo();
		if(list !=null && list.size()>0){
			count = list.get(0);
		}
		return count;
	}
	public List<TbCountDailyInfo> queryTop(){
		List<TbCountDailyInfo> list = countDailyDao.queryTop();
		return list;
	}
	public List<TbCountDailyInfo> queryTariffeTop(){
		List<TbCountDailyInfo> list = countDailyDao.queryTariffeTop();
		return list;
	}
	public List<TbCountDailyInfo> queryTariffeTimeTop(){
		List<TbCountDailyInfo> list = countDailyDao.queryTariffeTimeTop();
		return list;
	}
	 
	public TbCountDailyInfo queryCountUser(String appState){
		return countDailyDao.queryCountUser(appState);
	}
	public TbCountDailyInfo queryCountVifiDevice(boolean isonLine){
		return countDailyDao.queryCountVifiDevice(isonLine);
	}
	public TbCountDailyInfo queryCountTariffeNow(){
		List<TbCountDailyInfo> cdis = countDailyDao.queryCountTariffeNow();
		TbCountDailyInfo cdi = new TbCountDailyInfo();
		if(cdis!=null && cdis.size()>0){
			cdi = cdis.get(0);
		}
		return  cdi;
	}
	public Object[] queryCountTariffeTime(){
		List<TbCountDailyInfo> cdis = countDailyDao.queryCountTariffeTime();
		Object[] obj = new Object[3];
    	String[] times = new String[0];
    	Integer[] datas = new Integer[0];
    	Calendar calendar = Calendar.getInstance();
	    calendar.setTime(new Date());
	    int maxVal = 0;
	    int size = 100;
		times = new String[size];
		datas = new Integer[size];
		for (int i = 0; i < size; i++) {
			boolean flag = true;
			if(cdis.size()>0){
    			for (int j = 0; j < cdis.size(); j++) {
    				TbCountDailyInfo cdr = cdis.get(j);
					if(sdf.format(calendar.getTime()).equals(cdr.getHours())){
						times[i] = cdr.getHours();
						datas[i] = cdr.getNumTotal();
						if(cdr.getNumTotal() > maxVal){
							maxVal = cdr.getNumTotal();
						}
						flag = false;
						break;
					}
				}
			}
			if(flag){
				times[i] = sdf3.format(calendar.getTime());
				datas[i] = 0;
			}
			calendar.add(Calendar.MINUTE, -1);//1分钟前
    	}
    	obj[0]=getArrayObj(times);
    	obj[1]=getArrayObj(datas);
    	obj[2]=maxVal;
    	return  obj;
	}
	public Object[] getArrayObj(Object[] objs){
    	Object[] newObj = new Object[objs.length];
    	for (int i = 0; i < objs.length; i++) {
			newObj[newObj.length-(i+1)]=objs[i];
		}
    	return newObj;
    }
	public TbCountDailyInfo queryCountOnlineCalls(){
		return countDailyDao.queryCountOnlineCalls();
	}
	public TbCountDailyInfo queryCountOnlineGoIPs(){
		return countDailyDao.queryCountOnlineGoIPs();
	}
	public TbCountDailyInfo querCountOnlineDevice(boolean isOnline,String time){
		return countDailyDao.querCountOnlineDevice(isOnline, time);
	}
	/**
	 * 话单、流量统计列表详情
	 * @param id
	 * @param beginTime
	 * @param endTime
	 * @param isTariffe
	 * @return
	 */
	public List<TbUseFlowRcd> queryListDataByUserNew(String id, String beginTime, String endTime, boolean isTariffe){
		
		return countDailyDao.queryListDataByUserNew(id, beginTime, endTime, isTariffe);
	}
}

       