package net.eoutech.webmin.cdr.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.DateUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.AutoField;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.cdr.dao.CdrDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbCDR;
import net.eoutech.webmin.commons.entity.TbUseFlowRcd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CdrService extends FrameBaseService<TbCDR> {

    @Autowired
    CdrDao cdrDao;
    public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    public static final SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:00");
    @Override
    public TbCDR save(TbCDR cdr, boolean isEdit, List<String> idList) {
        Date nowDate = new Date();
        if (!isEdit) {
            cdr.setCrtTm(nowDate);
            cdr.setCrtBy(UserUtils.getUserName());
        }

        return super.save(cdr, isEdit, idList);
    }

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }

    // 用这个来判断是否是数据话单请求,用于做不同的处理
    private boolean isCDRDataReq() {
        return ActionUtils.getRequest().getRequestURL().indexOf("data-cdr") != -1;
    }
    // 用这个来判断是否是数据话单请求,用于做不同的处理
    private boolean isCDRDataReq2() {
    	return ActionUtils.getRequest().getRequestURL().indexOf("cdrNew") != -1;
    }

    @Override
    public Page<TbCDR> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(TbCDR.class);
        if(ActionUtils.getRequest().getRequestURL().indexOf("cdrNew") !=-1){
        	queryParam.put((isCDRDataReq2() ? "" : "N") + "EQ-|-cdrType", "V");
        }else{
        	queryParam.put((isCDRDataReq() ? "" : "N") + "EQ-|-cdrType", "V");
        }
        // 如果没有排序参数,就使用此字段排序
        if (!hasOrderParam(queryParam)) {
            criteria.desc("keyCDRID");
        }
        return super.query(pageNumber, pageSize, queryParam, criteria);
    }
    public Page<TbUseFlowRcd> query2(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(TbUseFlowRcd.class);
//      当前代理商用户ID前缀,查询条件
        boolean isFirstWhere = true;
//        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
//        if (agent != null) {
//            criteria.where("idxAgentID", " like ", new Object[]{agent.getIdxAgentId() + "%"});
//            isFirstWhere = false;
//            //queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
//        }
//        queryParam.put("EQ-|-cdrType", "V");
        String userName=UserUtils.getUserName();
        if (null != userName && !EUConst.ADMIN.equals(userName) ) {
            criteria.where("idxAgentID", " like ", new Object[]{userName});
            isFirstWhere = false;
        }
//         解析查询参数到
        FrameBaseService.parseQueryCriteria(queryParam, criteria,isFirstWhere);
//         如果没有设置排序,  默认使用主键降序排序
        List<AutoField> orderByFields = criteria.getOrderByFields();
        if (orderByFields == null || orderByFields.isEmpty()) {
            criteria.desc("keyId");
        }
        return jdbcDao.queryPage(TbUseFlowRcd.class, criteria, pageNumber, pageSize);
    }
    public Page<TbCDR> queryTariffe(int pageNumber, int pageSize, Map<String, Object> queryParam) {
    	Criteria criteria = Criteria.create(TbCDR.class);
    	// 当前代理商用户ID前缀,查询条件
    	boolean isFirstWhere = true;
    	TbAgent agent = UserUtils.getUserProfile().getTbAgent();
    	if (agent != null) {
    		criteria.where("idxAgentID", " like ", new Object[]{agent.getIdxAgentId() + "%"});
    		isFirstWhere = false;
    		//queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
    	}
    	queryParam.put("NEQ-|-cdrType", "V");
    	// 解析查询参数到
    	FrameBaseService.parseQueryCriteria(queryParam, criteria,isFirstWhere);
    	// 如果没有设置排序,  默认使用主键降序排序
    	List<AutoField> orderByFields = criteria.getOrderByFields();
    	if (orderByFields == null || orderByFields.isEmpty()) {
    		criteria.desc("keyCDRID");
    	}
    	return jdbcDao.queryPage(getEntityClass(), criteria, pageNumber, pageSize);
    }
    public Map<String, Object> queryCdrStatisInfo(Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(getEntityClass());
        // 解析查询参数到
        FrameBaseService.parseQueryCriteria(queryParam, criteria);
        return cdrDao.queryCdrStatisInfo(criteria);
    }


    /**
     * 最近五天通话时长/通话数量/通话费用(厘)
     *
     * @return [{date:Long,callDuration:Long,callCount:Long,costCash:Long}]
     */
    public List<Map<String, Object>> queryTopFiveDayCallInfo() {
        return cdrDao.queryTopFiveDayCallInfo();
    }


    /**
     * 查询今天通话时长/流量
     *
     * @return [{
     * hour:Long, // 小时
     * callDuration:Long,   //通话时长
     * dataTraffic:Long//流量
     * }]
     */
    public List<Map<String, Object>> queryTodayDuraAndTraf() {
        return cdrDao.queryTodayDuraAndTraf();
    }


    /**
     * 年度话单数量,通话时长,流量
     *
     * @return {
     * callCountList:Array, // 12个月的通话数量
     * callCountSum:Long,        //年度通话数量总数
     * callCountAvg:Long,     //每月通话数量平均数量
     * }
     */
    public JSONObject queryYearCdrInfo() {
        JSONObject rest = new JSONObject();

        JSONArray callCountList = new JSONArray(), callDurList = new JSONArray(), dataTraList = new JSONArray();
        long callCountSum = 0, callDurSum = 0, dataTraSum = 0;
        for (Map<String, Object> monthCdrInfo : cdrDao.queryYearCdrInfo()) {
            long callCount = Long.valueOf(monthCdrInfo.get("callCount") + "");
            long callDur = Long.valueOf(monthCdrInfo.get("callDuration") + "");
            long dataTra = Long.valueOf(monthCdrInfo.get("dataTraffic") + "");

            callCountList.add(callCount);
            callDurList.add(callDur);
            dataTraList.add(dataTra);

            callCountSum += callCount;
            callDurSum += callDur;
            dataTraSum += dataTra;
        }


        rest.put("callCountList", callCountList);
        rest.put("callDurList", callDurList);
        rest.put("dataTraList", dataTraList);

        rest.put("callCountSum", callCountSum);
        rest.put("callDurSum", callDurSum);
        rest.put("dataTraSum", dataTraSum);

        rest.put("callCountAvg", callCountSum / 12);
        rest.put("callDurAvg", callCountSum / 12);
        rest.put("dataTraAvg", callCountSum / 12);

        return rest;
    }
    
    public TbCDR queryCountByNow(){
		List<TbCDR> cdrs = cdrDao.queryCountByNow();
		TbCDR cdr = new TbCDR();
		cdr.setDataTraffic(0);
		if(cdrs!=null && cdrs.size()>0){
			cdr = cdrs.get(0);
		}
		return  cdr;
	}
    public Object[] queryCountByTime(){
    	List<TbCDR> cdrs = cdrDao.queryCountByTime();
    	Object[] obj = new Object[3];
    	String[] times = new String[0];
    	Integer[] datas = new Integer[0];
    	Calendar calendar = Calendar.getInstance();
	    calendar.setTime(new Date());
	    int maxVal = 0;
		times = new String[60];
		datas = new Integer[60];
		for (int i = 0; i < 60; i++) {
			boolean flag = true;
			if(cdrs.size()>0){
    			for (int j = 0; j < cdrs.size(); j++) {
					TbCDR cdr = cdrs.get(j);
					if(sdf.format(calendar.getTime()).equals(sdf.format(cdr.getCrtTm()))){
						times[i] = sdf2.format(cdr.getCrtTm());
						datas[i] = cdr.getDataTraffic();
						if(cdr.getDataTraffic() > maxVal){
							maxVal = cdr.getDataTraffic();
						}
						flag = false;
						break;
					}
				}
			}
			if(flag){
				times[i] = sdf2.format(calendar.getTime());
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
    
    /**
     * 查询前20天流量的情况
     * @return
     */
    public List< Map< String, Object > > cdrTrafficStatistic () {
        List< Map< String, Object > > result = new ArrayList< Map< String, Object > >();
        List< Map< String, Object > > queryList = cdrDao.cdrTrafficStatistic();

        String myDates[] = DateUtils.beforeDaysFormat( 20 );
        for ( String date : myDates ) {
            Map< String, Object > one = new HashMap< String, Object >();
            Object value = 0;

            for ( Map< String, Object > map : queryList ) {
                String myDate = String.valueOf( map.get( "myDate" ) );
                if ( date.equals( myDate )) {
                    value = map.get( "trafficSum" );
                    break;
                }
            }
            one.put( "myDate", date );
            one.put( "trafficSum", value );
            result.add( one );

        }
        return result;
    }
    
    /**
     * 查询前20天流量的情况
     * @return
     */
    public List< Map< String, Object > > recentCalltime () {
        List< Map< String, Object > > result = new ArrayList< Map< String, Object > >();
        List< Map< String, Object > > queryList = cdrDao.recentCalltime();

        String myDates[] = DateUtils.beforeDaysFormat( 20 );
        for ( String date : myDates ) {
            Map< String, Object > one = new HashMap< String, Object >();
            Object value = 0;

            for ( Map< String, Object > map : queryList ) {
                String myDate = String.valueOf( map.get( "myDate" ) );
                if ( date.equals( myDate )) {
                    value = map.get( "callDurationSum" );
                    break;
                }
            }
            one.put( "myDate", date );
            one.put( "callDurationSum", value );
            result.add( one );

        }
        return result;
    }
    
    /**
     * 供应商： 今日数据流量
     */
    public int supplierTodayTrafficData(String userName){
    	return cdrDao.supplierTodayTrafficData(userName);
    }
    /**
     * 供应商： 今日通话时长
     * @param userName
     * @return
     */
    public int supplierTodayCallTime(String userName){
    	return cdrDao.supplierTodayCallTime(userName);
    }
    /**
     * 国内外通话百分比
     * @return
     */
    public List< Map< String, Object > > querycdrByDistance () {
    	return cdrDao.querycdrByDistance();
    }
    /**
     * 代理商：今日资费总数
     * @param userName
     * @return
     */
    public int getAgentCostCashSum(String userName){
    	return cdrDao.getAgentCostCashSum(userName);
    }
    
    
    
}
