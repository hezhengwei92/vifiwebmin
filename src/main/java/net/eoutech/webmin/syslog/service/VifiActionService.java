package net.eoutech.webmin.syslog.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import net.eoutech.webmin.commons.entity.DateVO;
import net.eoutech.webmin.commons.entity.TbViFiAction;
import net.eoutech.webmin.syslog.dao.VifiActionDao;

import com.frame.dao.FrameBaseDao;
import com.frame.service.FrameBaseService;
import com.frame.service.FrameUserService;
import com.spring.jdbc.assistants.persistence.AutoField;
import com.spring.jdbc.assistants.persistence.Criteria;
import com.spring.jdbc.assistants.persistence.JdbcDao;

@Service
public class VifiActionService extends FrameBaseService<TbViFiAction>
{
	
	@Autowired
    protected JdbcDao jdbcDao;
	

	
	public List<DateVO> queryAnalysisData(Map<String, Object> queryParam) throws ParseException
	{
    	Map<Long, Integer> t2vs = new HashMap<Long, Integer>();
    	Map<Long, String> t2des = new HashMap<Long, String>();
    	Map<Long, String> t2act = new HashMap<Long, String>();
    	//计数
    	int getSuccess =0;
    	int getFailure =0;
    	int openSuccess =0;
    	int openFailure =0;
    	int update =0;
    	int close =0;
    	
    	for (int i=0;i<144;i++) {
    		t2vs.put((long) (i*600), 0);
    		t2des.put((long) (i*600), "");
    		t2act.put((long) (i*600), "");
    	}
    	    	
		SimpleDateFormat sdfCompleteFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startStr = (String) queryParam.get("GTE-|-reqDate");
		Date startDate = sdfCompleteFormat.parse(startStr);
    	long dayStartSecs = startDate.getTime()/1000;
    	
		Criteria criteria = Criteria.create(getEntityClass());
		FrameBaseService.parseQueryCriteria(queryParam, criteria);
		List<TbViFiAction> result = jdbcDao.queryList(criteria);

		for (int i=0; i<result.size(); i++) {
			long reqDateTime = result.get(i).getReqDate().getTime()/1000;
			int responseCode = result.get(i).getRespCode();
			int myVal = (responseCode==200 || responseCode==0) ? 1 : -1;
			String act = result.get(i).getReqAct();
			String des = "  "+ sdfCompleteFormat.format(result.get(i).getReqDate()) + " " + act + " " +(myVal==1 ? "SUCCESS" : "FAIL");
			if ("GET".equals(act) || "VOPEN".equals(act) || "VCLOSE".equals(act)) {
				long mytm = reqDateTime-dayStartSecs;
				t2vs.put(mytm, myVal);
				t2des.put(mytm, des);
				t2act.put(mytm, act);
			}else { //VUPDATE
				long secs = (reqDateTime-dayStartSecs)/600*600;    		
				int value = t2vs.containsKey(secs) ? t2vs.get(secs) : 0;
				
				t2vs.put(secs, t2vs.get(secs)+1);				
				t2des.put(secs, t2des.get(secs) + (t2des.get(secs).isEmpty() ? "" : "<br/>") + des);
				t2act.put(secs, act);
			}
			if("GET".equals(act)){
				if(myVal>0){
					getSuccess += 1;
				}else{
					getFailure += 1;
				}
			}else if("VOPEN".equals(act)){
				if(myVal>0){
					openSuccess += 1;
				}else{
					openFailure += 1;
				}
			}else if("VCLOSE".equals(act)){
				close += 1;
			}else if("VUPDATE".equals(act)){
				update += 1;
			}
			
 		}
		
		
    	List<DateVO> analysisResult = new ArrayList<DateVO>();    	
    	for(long key: t2vs.keySet()){ 
    		DateVO dateVO = new DateVO();
    		long mytimes = dayStartSecs + key;
    		dateVO.setTimes(mytimes);
    		dateVO.setKey(sdfCompleteFormat.format(new Date(mytimes*1000)));
    		int val = t2vs.get(key);
    		if(val>0) {
    			dateVO.setStatus(1);
    			dateVO.setCountSuccess(val);
    		}else if (val<0) {
    			dateVO.setCountFailure(val);
    			dateVO.setStatus(2);
    		}else{
    			dateVO.setStatus(0);
    		}
    		dateVO.setAct(t2act.get(key));
    		dateVO.setDesc(t2des.get(key));
    		
    		int pos = 0;
    		for (pos=0; pos<analysisResult.size(); pos++) {
    			long t = analysisResult.get(pos).getTimes();
    			if (mytimes<t) break;
    		}
    		
    		if (mytimes%3600==0) {
    			dateVO.setHms(new SimpleDateFormat("HH").format(new Date(mytimes*1000)));
    		}else {
    			dateVO.setHms("");
    		}
    		
    		analysisResult.add(pos,dateVO);
    	}
    	if(analysisResult.size()>0){
    		DateVO vo = analysisResult.get(0);
        	vo.setGetSuccess(getSuccess);
        	vo.setGetFailure(getFailure);
        	vo.setOpenSuccess(openSuccess);
        	vo.setOpenFailure(openFailure);
        	vo.setUpdate(update);
        	vo.setClose(close);
        	analysisResult.set(0, vo);
    	}
    		
		return analysisResult;
	}
	
	
	
	
	
	
	
	/*
	public List<DateVO> queryAnalysisData(Map<String, Object> queryParam) throws ParseException
	{
    	Map<Long, Integer> t2vs = new HashMap<Long, Integer>();
    	Map<Long, String> t2des = new HashMap<Long, String>();
    	
    	for (int i=0;i<144;i++) {
    		t2vs.put((long) (i*600), 0);
    		t2des.put((long) (i*600), "");
    	}
    	    	
		SimpleDateFormat sdfCompleteFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startStr = (String) queryParam.get("GTE-|-reqDate");
		Date startDate = sdfCompleteFormat.parse(startStr);
    	long dayStartSecs = startDate.getTime()/1000;
    	
		Criteria criteria = Criteria.create(getEntityClass());
		FrameBaseService.parseQueryCriteria(queryParam, criteria);
		List<TbViFiAction> result = jdbcDao.queryList(criteria);
		for (int i=0; i<result.size(); i++) {
    		long reqDateTime = result.get(i).getReqDate().getTime()/1000;
    		long secs = (reqDateTime-dayStartSecs)/600*600;    		
    		int value = t2vs.containsKey(secs) ? t2vs.get(secs) : 0;
    		
    		int responseCode = result.get(i).getRespCode();
    		int myVal = (responseCode==200 || responseCode==0) ? 1 : -1;
    		if (value == 0) {
    			t2vs.put(secs, myVal);
    			t2des.put(secs, result.get(i).getReqAct());
    		}else if (value*myVal >0) {
    			t2vs.put(secs, value+myVal);
    			t2des.put(secs, t2des.get(secs)+"<br/>"+result.get(i).getReqAct());    			
    		}else { //
    			long newKey = secs + 9;
    			if (t2vs.containsKey(newKey)) {
    				t2vs.put(newKey,  t2vs.get(newKey)+myVal);
        			t2des.put(newKey, t2des.get(newKey)+"<br/>"+result.get(i).getReqAct());    			
    			}else {
    				t2vs.put(newKey, myVal);
        			t2des.put(newKey, result.get(i).getReqAct());
    			}
    		}
		}
		
		
    	List<DateVO> analysisResult = new ArrayList<DateVO>();    	
    	for(long key: t2vs.keySet()){ 
    		DateVO dateVO = new DateVO();
    		long mytimes = dayStartSecs + key;
    		dateVO.setTimes(mytimes);
    		dateVO.setKey(sdfCompleteFormat.format(new Date(mytimes*1000)));
    		int val = t2vs.get(key);
    		if(val>0) {
    			dateVO.setStatus(1);
    			dateVO.setCountSuccess(val);
    		}else if (val<0) {
    			dateVO.setCountFailed(val);
    			dateVO.setStatus(2);
    		}else{
    			dateVO.setStatus(0);
    		}
    		dateVO.setAct(t2des.get(key));
    		
    		int pos = 0;
    		for (pos=0; pos<analysisResult.size(); pos++) {
    			long t = analysisResult.get(pos).getTimes();
    			if (mytimes<t) break;
    		}
    		
    		if (mytimes%3600==0) {
    			dateVO.setHms(new SimpleDateFormat("HH").format(new Date(mytimes*1000)));
    		}else {
    			dateVO.setHms("");
    		}
    		
    		analysisResult.add(pos,dateVO);
    	}
    		
		return analysisResult;
	}
	
	*/
	

	public List<DateVO> queryAnalysisData_GYA(Map<String, Object> queryParam) throws ParseException{
		Criteria criteria = Criteria.create(getEntityClass());
		FrameBaseService.parseQueryCriteria(queryParam, criteria);
		List<TbViFiAction> result = jdbcDao.queryList(criteria);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startStr = (String) queryParam.get("GTE-|-reqDate");
		Date startDate = sdf.parse(startStr);
    	List<DateVO> analysisResult = new ArrayList<DateVO>();
    	DateVO dateVO = new DateVO();
    	dateVO.setKey(startDate.toString());
    	long ascFastTime = startDate.getTime()+600000;
    	long endTime = startDate.getTime()+ 24*60*60*1000;
    	int len = result.size();
    	for(int i=0;i<len;i++){
    		long reqDateTime = result.get(i).getReqDate().getTime();
    		if(reqDateTime>=ascFastTime){
    			//按时间粒度递增，构造下一个数据点
    			//将此日期作为截至，加入到resultList中；
    			//构造：时间粒度为10分钟：600秒：600000毫秒
    			analysisResult.add(dateVO);
    			dateVO = new DateVO();
    			Date key = new Date();
    			key.setTime(ascFastTime);
    			dateVO.setKey(key.toString());
    			ascFastTime += 600000;
    			i--;
    			continue;
    		}else{
    			/** status定义：0：无数据，1：仅success,2:仅fail,3:success+fail,4:fail+success; **/
    			int responseCode = result.get(i).getRespCode();
    			int status = dateVO.getStatus();
    			if(responseCode==0 ||responseCode==200){
    				if(status==0){
    					dateVO.setStatus(1);
    				}else if(status==2){
    					dateVO.setStatus(4);
    				}
    				dateVO.setCountSuccess(dateVO.getCountSuccess()+1);
    			}else{
    				if(status==0){
    					dateVO.setStatus(2);
    				}else if(status==1){
    					dateVO.setStatus(3);
    				}
    				dateVO.setCountFailure(dateVO.getCountFailure()+1);
    			}
    		}
    		
    	}
    	analysisResult.add(dateVO);//last
    	do {
    		ascFastTime += 600000;
			Date key = new Date();
			key.setTime(ascFastTime);
			dateVO.setKey(key.toString());
			analysisResult.add(dateVO);
		} while (ascFastTime<endTime);
		return analysisResult;
	}
	

	
	
	
	
	
}
