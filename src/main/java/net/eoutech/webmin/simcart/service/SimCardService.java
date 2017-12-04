package net.eoutech.webmin.simcart.service;

import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.github.underscore.$;
import com.github.underscore.Function1;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbSCGroup;
import net.eoutech.webmin.commons.entity.TbSimCard;
import net.eoutech.webmin.simcart.dao.SimCardDao;
import net.eoutech.webmin.simcart.vo.AreaSimCardStatusCountVO;
import net.eoutech.webmin.simcart.vo.StatusVO;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SimCardService extends FrameBaseService<TbSimCard> {

    @Autowired
    SimCardDao simCardDao;
    @Autowired
    SCGroupService scGroupService;

    @Override
    public TbSimCard save(TbSimCard simCard, boolean isEdit, List<String> idList) {
        simCard.setMdfTm(new Date());
        simCard.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	if(simCard.getImei()==null){
        		simCard.setImei("");
        	}
        	if(simCard.getSsId()==null){
        		simCard.setSsId(0);
        	}
            simCard.setIdxIccid("tmp_" + System.currentTimeMillis());
            simCard.setCrtBy(simCard.getMdfBy());
            simCard.setCrtTm(simCard.getMdfTm());
            simCard.setStatus(0);
            simCard.setOnlineTime(0);
            simCard.setTotalSuccess(0);
            simCard.setTotalFailed(0);
            simCard.setTotalData(0);
            simCard.setImei("");

        }
        return super.save(simCard, isEdit, idList);
    }


    public List<Map<String, Object>> querySimCardState() {
        return simCardDao.querySimCardState();
    }


    public List<Map<String, Object>> queryBalanceStati() {
        return simCardDao.queryBalanceStati();
    }


    public int querySimCardCount() {
        return jdbcDao.queryCount(new TbSimCard());
    }

    @SuppressWarnings("all")
    public Map<String, List<AreaSimCardStatusCountVO>> queryAreaSimCardStatusCount() {
        List<AreaSimCardStatusCountVO> AreaSimCardStatusCount = simCardDao.queryAreaSimCardStatusCount();
        for (AreaSimCardStatusCountVO vo : AreaSimCardStatusCount) {
            vo.setStatusCountMap((Map) JsonUtils.parseObject(vo.getStatusCountJSON()));
            vo.setStatusCountJSON(null);
        }
        // 按照大洲分开,地区
        return (Map) $.groupBy(AreaSimCardStatusCount, new Function1<AreaSimCardStatusCountVO, Object>() {
            @Override
            public Object apply(AreaSimCardStatusCountVO vo) {
                return vo.getContinent();
            }
        });
    }


    /**
     * 获得组,select 控件数据
     */
    public List<String[]> getSimcardIDSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbSimCard tbSimCard : queryAll()) {
            selDatas.add(new String[]{tbSimCard.getKeySimCardID(), tbSimCard.getKeySimCardID()});
        }
        return selDatas;
    }
    
    //统计流量卡和流量卡组表
    public List<SIMAndSIMgrpVO> selectCount(){
    	return simCardDao.selectCount();
    }
    
   //统计流量卡组中卡的状态
    public List<StatusVO> selectCount8(int keySCGroupID){
    	return simCardDao.selectCount8(keySCGroupID);
    }
    
    public Page<TbSimCard> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
//        Criteria criteria = Criteria.create(getEntityClass());
//        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
//        
//        if(agent !=null){
//        	Object[] obj = null ;
//        	Object[] objSimpDev = null;
//        	Object[] objSimpPort = null;
//        	Criteria cspg= Criteria.create(TbSCGroup.class);
//        	cspg.where("idxAgentID", " LIKE ",  new Object[]{agent.getIdxAgentId()+"%"});
//        	//找到组编号
//        	List<TbSCGroup> list = jdbcDao.queryList(cspg);
//        	if(list.size()>0){
//	        	obj = new Object[list.size()];
//	        	for (int i = 0; i < list.size(); i++) {
//	        		TbSCGroup spg = list.get(i);
//					obj[i] = spg.getKeySCGroupID() +"%";
//				}
//	        	//queryParam.put("IN-|-idxSCGroupID", obj);
//        	}else{
//        		queryParam.put("EQ-|-idxSCGroupID", "ERROR");
//        		return query(pageNumber, pageSize, queryParam, criteria);
//        	}
//        	/**** 尚未测试，目前有问题，该方法对比2069之前的版本 ***/
//        	Criteria crSimp= Criteria.create(TbSimPDev.class);
//        	crSimp.where("idxSCGroupID", " LIKE ",  obj);
//        	List<TbSimPDev> listSimpDev = jdbcDao.queryList(cspg);
//        	//找到组编号找到设备名称
//        	if(listSimpDev.size()>0){
//        		objSimpDev = new Object[listSimpDev.size()];
//        		for(int i=0;i<listSimpDev.size();i++){
//        			objSimpDev[i] = listSimpDev.get(i).getDevName();
//        		}
//        	}else{
//        		//exception  
//        	}
//        	Criteria crSimpPort= Criteria.create(TbSimPPort.class);
//        	crSimp.where("devName", " LIKE ",  obj);
//        	List<TbSimPPort> listSimpPort = jdbcDao.queryList(crSimpPort);
//        	//从设备名称找到卡编号,然后添加到参数中，搜索结果
//        	if(listSimpPort.size()>0){
//        		objSimpPort = new Object[listSimpPort.size()];
//        		for(int i=0;i<listSimpPort.size();i++){
//        			objSimpPort[i] = listSimpPort.get(i).getIdxIccid();
//        		}
//        		queryParam.put("EQ-|-keySimCardID", objSimpPort);
//        	}else{
//        		queryParam.put("EQ-|-keySimCardID", "ERROR");
//        	}
//        	
//        }
//        return query(pageNumber, pageSize, queryParam, criteria);
////        原版
        Criteria criteria = Criteria.create(getEntityClass());
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	Criteria cspg= Criteria.create(TbSCGroup.class);
        	cspg.where("idxAgentID", " LIKE ",  new Object[]{agent.getIdxAgentId()+"%"});
        	List<TbSCGroup> list = jdbcDao.queryList(cspg);
        	if(list.size()>0){
	        	Object[] obj = new Object[list.size()];
	        	for (int i = 0; i < list.size(); i++) {
	        		TbSCGroup spg = list.get(i);
					obj[i] = spg.getKeySCGroupID();
				}
	        	queryParam.put("IN-|-idxSCGroupID", obj);
        	}else{
        		queryParam.put("EQ-|-idxSCGroupID", "ERROR");
        	}
        }
        return query(pageNumber, pageSize, queryParam, criteria);
    }
    
    public CommonOutlineInfoVO getSimCardOutlineInfo(){
    	return simCardDao.getSimCardOutlineInfo();
    }
    
    /**
     * 供应商： 卡数量 /正常状态卡数量
     * @param userName
     * @return
     */
    public int getMyCardNum(String userName){
    	return  simCardDao.getMyCardNum(userName);
    }
    public List<Integer> getMyNormalCardPercent(String userName){
    	int normal = simCardDao.getMyNormalCardNum(userName), 
            other = simCardDao.getMyCardNum(userName) - normal;
        return Arrays.asList(normal, other);
    }
    /**
     * sim卡状态百分比
     * @return
     */
    public List< Map< String, Object > > querySimCardByStatus () {
        return simCardDao.querySimCardByStatus();
    }
    
    
    /**
     * 前30的卡数量和流量统计图
     * @return
     */
    public Map<String,Object> getMonthDay4SimcardAndTraffic(){
    	//返回天数版本
    	Map<String,Object> result = new HashMap<String, Object>();
    	Map<Object,Integer> simCardCount = new HashMap<Object, Integer>();
    	Map<Object,Integer> trafficSum = new HashMap<Object, Integer>();
    	
    	List<TbSimCard> simcardList = simCardDao.getSimcardAndTraffic();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	long todayTime;
		try {
			todayTime = sdf.parse(sdf.format(new Date())).getTime();
		} catch (ParseException e) {
			todayTime = (new Date()).getTime();
		}
		for(int i=0;i<40;i++){//容器，可以大于需求
    		simCardCount.put(i, 0);
    		trafficSum.put(i, 0);
    	}
		//数据集合，向上取整
    	for(int i=0,len=simcardList.size();i<len;i++){
    		long mdfTm = simcardList.get(i).getMdfTm().getTime();
    		int days = (int) ((todayTime-mdfTm)/(24*60*60*1000))+1;//向上取整
    		int netData = simcardList.get(i).getRestNetData();
    		int val = simCardCount.get(days)!=null?simCardCount.get(days):0;
    		int val2 = trafficSum.get(days)!=null?trafficSum.get(days):0;
    		simCardCount.put(days, val+1);
        	trafficSum.put(days, val2 + netData);
    	}
    	//转换成数组，目标容器,倒序
    	Object[] simCardArr = new Object[30];
    	Object[] trafficArr = new Object[30];
    	for(int i=29;i>=0;i--){
    		int index = i+1;
    		int val1 = simCardCount.get(index)!=null?simCardCount.get(index):0;
    		int val2 = trafficSum.get(index)!=null?trafficSum.get(index)/1024:0;
    		Object[] content = new Object[2];
    		content[0] = index;
    		content[1] = val1;
    		Object[] content2 = new Object[2];
    		content2[0] = index;
    		content2[1] = val2;
    		simCardArr[i] = content;
    		trafficArr[i] = content2;
    	}
    	result.put("simCardCount", simCardArr);
    	result.put("trafficSum", trafficArr);
    	
//    	//返回日期毫秒数时间版本
//    	Map<String,Object> result = new HashMap<String, Object>();
//    	Map<Object,Integer> simCardCount = new HashMap<Object, Integer>();
//    	Map<Object,Integer> trafficSum = new HashMap<Object, Integer>();
//    	
//    	List<TbSimCard> simcardList = simCardDao.getSimcardAndTraffic();
//    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//    	//为了防止int数据超出取值范围，这里除以了1000毫秒，在最后返回的时候*1000
//    	long todayTime = 0;
//		try {
//			todayTime = (sdf.parse(sdf.format(new Date())).getTime())/1000;
//		} catch (ParseException e) {
//			todayTime = ((new Date()).getTime())/1000;
//		}
//		for(int i=0;i<30;i++){
//			//String dateStr = sdf.format(new Date(todayTime-24*60*60*1000*i));
//			long time = todayTime-24*60*60*(i+1);
//    		simCardCount.put(time, 0);
//    		trafficSum.put(time, 0);
//    	}
//    	for(int i=0,len=simcardList.size();i<len;i++){
//    		//int days = (int) Math.ceil((todayTime-mdfTm)/(24*60*60*1000));
//    		int netData = simcardList.get(i).getRestNetData();
//    		long mdfTm = simcardList.get(i).getMdfTm().getTime();
//    		try {
//				mdfTm = (sdf.parse(sdf.format(new Date(mdfTm))).getTime())/1000;
//			} catch (ParseException e) {
//				mdfTm = todayTime;
//			}
//    		//String xalis = sdf.format(simcardList.get(i).getMdfTm());
//    		
//    		int val = simCardCount.get(mdfTm)!=null?simCardCount.get(mdfTm):0;
//    		int val2 = trafficSum.get(mdfTm)!=null?trafficSum.get(mdfTm):0;
//    		simCardCount.put(mdfTm, val+1);
//        	trafficSum.put(mdfTm, val2 + netData);
//    	}
//    	//转换成数组
//    	Object[] simCardArr = new Object[30];
//    	Object[] trafficArr = new Object[30];
//    	for(int i=0;i<30;i++){
//    		//String dateStr = sdf.format(new Date(todayTime-24*60*60*1000*i));
//    		long time = todayTime-24*60*60*(i+1);
//    		int val1 = simCardCount.get(time)!=null?simCardCount.get(time):0;
//    		int val2 = trafficSum.get(time)!=null?trafficSum.get(time)/1000000:0;
//    		Object[] content = new Object[2];
//    		content[0] = time*1000;
//    		content[1] = val1;
//    		Object[] content2 = new Object[2];
//    		content2[0] = time*1000;
//    		content2[1] = val2;
//    		simCardArr[i] = content;
//    		trafficArr[i] = content2;
//    	}
//    	result.put("simCardCount", simCardArr);
//    	result.put("trafficSum", trafficArr);
    	
    	return result;
    }
}

       