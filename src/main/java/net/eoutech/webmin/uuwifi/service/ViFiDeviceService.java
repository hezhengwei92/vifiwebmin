package net.eoutech.webmin.uuwifi.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import net.eoutech.webmin.commons.utils.CSVUtils;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.uuwifi.dao.ViFiDeviceDao;
import net.eoutech.webmin.uuwifi.vo.DeviceAndGroupVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ViFiDeviceService extends FrameBaseService<TbViFiDevice> {

    @Autowired
    ViFiDeviceDao viFiDeviceDao;

    @Override
    public TbViFiDevice save(TbViFiDevice viFiDevice, boolean isEdit, List<String> idList) {
        Date nowDate = new Date();
        viFiDevice.setMdfTm(nowDate);
        viFiDevice.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            viFiDevice.setCrtBy(viFiDevice.getMdfBy());
            viFiDevice.setCrtTm(viFiDevice.getMdfTm());
            viFiDevice.setRedirectTimes(0);
//            viFiDevice.setLastRedirectDate(nowDate);
            viFiDevice.setExpire(0);
            viFiDevice.setLastDomain("v");
            viFiDevice.setUpdateIdt(0);
//            viFiDevice.setLastUpdateDate(nowDate);
			viFiDevice.setMdfTm(nowDate);
			viFiDevice.setMdfBy(UserUtils.getUserName());//当前用户
			viFiDevice.setOnline(0);//默认0
			viFiDevice.setIdxDevGrpID("1");
			viFiDevice.setIdxVNSID("0");
			viFiDevice.setDevState("N");
			viFiDevice.setCos("x");
			viFiDevice.setIdxUserID("0");
//			viFiDevice.setIdxAgentID(UserUtils.getUserName());
			viFiDevice.setRedirectTimes(0);
			viFiDevice.setDebugIdt(0);
			viFiDevice.setHardwareVer("1");
			viFiDevice.setFirmwareVer("1");
			viFiDevice.setSoftwareVer("1");
            viFiDevice.setLastConnectTime(nowDate);
            viFiDevice.setLastConnectIP("-");
        }

        return super.save(viFiDevice, isEdit, idList);
    }
    
    public List<CommonOutlineInfoVO> devCount4china(){
    	Map<String,Integer> map = new HashMap<String, Integer>();
    	List<CommonOutlineInfoVO> list = viFiDeviceDao.devCount4china();
    	for(int i=0,len=list.size();i<len;i++){
    		String codeVal = list.get(i).getCode();
    		String code = "";
    		if(codeVal!=null){
    			String[] codeArr = codeVal.split("\\.");
    			if(codeArr!=null&&codeArr.length>=2){
    				code = codeArr[1];
    			}
    		}
    		if("".equals(code)){
    			continue;
    		}
    		if(map.containsKey(code)){
				map.put(code, map.get(code) +list.get(i).getValue());
			}else{
				map.put(code, list.get(i).getValue());
			}
    	}
    	List<CommonOutlineInfoVO> result = new ArrayList<CommonOutlineInfoVO>(); 
    	for(Map.Entry<String, Integer> entry : map.entrySet()){
    		CommonOutlineInfoVO vo = initAndTransformVO(entry.getKey());
    		vo.setValue(entry.getValue());
    		result.add(vo);
    	}
    	return result;
    }
    
    /**
     * 
     */
    private CommonOutlineInfoVO initAndTransformVO(String code){
    	CommonOutlineInfoVO vo = new CommonOutlineInfoVO();
    	if("cn".equals(code)){
    		vo.setCode("CN");
    		vo.setName("CHINA");
    		vo.setColor("#d8854f");
    	}else if("eout".equals(code)){
    		vo.setCode("AD");
    		vo.setName("eout");
    		vo.setColor("#de4c4f");
    	}else{
    		vo.setCode("AF");
    		vo.setName("other country");
    		vo.setColor("#a7a737");
    	}
    	return vo;
    }
//导入
    public int importCsvToDb(String csvStr) {
        List<List<String>> csvData = CSVUtils.csvToData(csvStr);
        Date nowDate = new Date();
        TbViFiDevice dev = new TbViFiDevice();
//        dev.setRedirectTimes(0);
//        dev.setLastRedirectDate(nowDate);
//        dev.setExpire(600);
//        dev.setLastDomain("-");
//        dev.setUpdateIdt(0);
//        dev.setLastUpdateDate(nowDate);
//        dev.setLastConnectTime(nowDate);
//        dev.setLastConnectIP("-");
//        dev.setIdxDevGrpID("0");
//        dev.setDevState("N");
//        dev.setDebugIdt(1);
//        dev.setRemark("-");

        dev.setCrtTm(nowDate);
        dev.setCrtBy(UserUtils.getUserName());
        dev.setMdfTm(nowDate);
        dev.setMdfBy(UserUtils.getUserName());

        int addCount = 0, csvInx = 0;
        for (List<String> csvRow : csvData) {
            if (csvInx++ == 0 || csvRow.size() == 0) {
                continue;
            }
            try {
                dev.setKeyDevID(csvRow.get(0));
                dev.setIdxViFiID(csvRow.get(1));
                dev.setPwd(csvRow.get(2));
//                dev.setIdxVNSID(csvRow.get(3));
//                dev.setIdxAgentID(csvRow.get(4));
//                dev.setHardwareVer(csvRow.get(5));
//                dev.setFirmwareVer(csvRow.get(6));
//                dev.setSoftwareVer(csvRow.get(7));
            } catch (Exception e) {
                e.printStackTrace();
                throw new FrameException(String.format("rate data error : %s", JsonUtils.toJSONString(csvRow)));
            }
            jdbcDao.insert(dev);
            addCount++;
        }
        return addCount;
    }
    //导出
    public String exportDevCsvByDb() {
        List<TbViFiDevice> rates = queryAll();
        List<List<Object>> csvRateData = new ArrayList<List<Object>>();
        for (TbViFiDevice dev : rates) {
            List<Object> csvRow = new ArrayList<Object>();
            csvRow.add(dev.getKeyDevID());
            csvRow.add(dev.getIdxViFiID());
//            csvRow.add(dev.getIdxVNSID());
//            csvRow.add(dev.getDevState());
            csvRateData.add(csvRow);
        }
        return CSVUtils.dataToCsv(csvRateData);
    }
    /**
     * 导入
     * @param csvStr
     * @return
     */
    public String importCsvToDbNew(String csvStr) {
    	List<List<String>> csvData = CSVUtils.csvToData(csvStr);
    	Date nowDate = new Date();
    	TbViFiDevice dev = new TbViFiDevice();
//    	dev.setRedirectTimes(0);
//    	dev.setLastRedirectDate(nowDate);
    	dev.setExpire(0);
    	dev.setLastDomain("v");
    	dev.setUpdateIdt(0);
//    	dev.setLastUpdateDate(nowDate);
//    	dev.setLastConnectTime(nowDate);
//    	dev.setLastConnectIP("-");
//    	dev.setIdxDevGrpID("0");
//    	dev.setDevState("N");
//    	dev.setDebugIdt(1);
//    	dev.setRemark("-");
    	
    	dev.setCrtTm(nowDate);
    	dev.setCrtBy(UserUtils.getUserName());
    	dev.setMdfTm(nowDate);
    	dev.setMdfBy(UserUtils.getUserName());//当前用户
    	String addResult = "";
    	int csvInx = 0;
    	/**
    	 * csvRow.add(dev.getKeyDevID());
    		csvRow.add(dev.getIdxViFiID());
    		csvRow.add(dev.getPwd());
    		csvRow.add(dev.getIdxDevGrpID());
    		csvRow.add(dev.getIdxVNSID());
    		csvRow.add(dev.getDevState());
    		csvRow.add(dev.getIdxUserID());
    		csvRow.add(dev.getIdxAgentID());
    		csvRow.add(dev.getDebugIdt());
    		csvRow.add(dev.getHardwareVer());
    		csvRow.add(dev.getFirmwareVer());
    		csvRow.add(dev.getSoftwareVer());
    		csvRateData.add(csvRow);
    	 */
    	for (List<String> csvRow : csvData) {
    		if (csvInx++ == 0 || csvRow.size() == 0) {
				continue;//
    		}
    		if("keyDevID".equals(csvRow.get(0).trim()) || StringUtils.isEmpty(csvRow.get(0).trim())){
    			continue;
    		}
    		try {
    			dev.setKeyDevID(csvRow.get(0));
    			dev.setIdxViFiID(csvRow.get(1));
				dev.setPwd("xxxxxx");
				dev.setAlaisName(csvRow.get(2));

				dev.setOnline(0);//默认0
    			dev.setIdxDevGrpID("1");
    			dev.setIdxVNSID("0");
    			dev.setDevState("N");
                dev.setCos("x");
                dev.setIdxUserID("0");
    			dev.setIdxAgentID(csvRow.get(3));
				dev.setRemark(csvRow.get(4));
                dev.setRedirectTimes(0);

//    			try {
//    				dev.setDebugIdt(Integer.parseInt(csvRow.get(7)));
//				} catch (Exception e) {
					dev.setDebugIdt(0);
//				}
    			dev.setHardwareVer("1");
    			dev.setFirmwareVer("1");
    			dev.setSoftwareVer("1");
    			jdbcDao.insert(dev);
    		} catch (Exception e) {
    			e.printStackTrace();
    			throw new FrameException(String.format("rate data '"+ csvInx +"' line error : %s", JsonUtils.toJSONString(csvRow)));
    		}
    	}
    	return addResult;
    }
    /**
     * 导出新
     * @return
     */
    public String exportDevCsvByDbNew() {
    	List<TbViFiDevice> rates = queryAll();
    	List<List<Object>> csvRateData = new ArrayList<List<Object>>();
    	List<Object> csvHeaderRow = new ArrayList<Object>();
    	//"keyDevID,idxViFiID,pwd,idxDevGrpID,idxVNSID,devState,idxAgentID,debugIdt,hardwareVer,firmwareVer,softwareVer,idxUserId"
		csvHeaderRow.add("keyDevID");
		csvHeaderRow.add("idxViFiID");
		csvHeaderRow.add("alaisName");
//		csvHeaderRow.add("pwd");
//		csvHeaderRow.add("idxDevGrpID");
//		csvHeaderRow.add("idxVNSID");
//		csvHeaderRow.add("devState");
		csvHeaderRow.add("idxAgentID");
		csvHeaderRow.add("remark");
//		csvHeaderRow.add("debugIdt");
//		csvHeaderRow.add("hardwareVer");
//		csvHeaderRow.add("firmwareVer");
//		csvHeaderRow.add("softwareVer");
//		csvHeaderRow.add("idxUserId");
		csvRateData.add(csvHeaderRow);
    	for (TbViFiDevice dev : rates) {
    		List<Object> csvRow = new ArrayList<Object>();
    		csvRow.add(dev.getKeyDevID());
    		csvRow.add(dev.getIdxViFiID());
    		csvRow.add(dev.getAlaisName());
//			csvRow.add(dev.getPwd());//密码导出为空
//    		csvRow.add(dev.getIdxDevGrpID());
//    		csvRow.add(dev.getIdxVNSID());
//    		csvRow.add(dev.getDevState());
    		csvRow.add(dev.getIdxAgentID());
			csvRow.add(dev.getRemark());
//    		csvRow.add(dev.getDebugIdt());
//    		csvRow.add(dev.getHardwareVer());
//    		csvRow.add(dev.getFirmwareVer());
//    		csvRow.add(dev.getSoftwareVer());
    		csvRateData.add(csvRow);
//    		if(StringUtils.isNotEmpty(dev.getIdxUserID())){
//    			csvRow.add("id: "+dev.getIdxUserID());
//    		}else{
//    			csvRow.add("");
//    		}
    	}
    	return CSVUtils.dataToCsv(csvRateData);
    }
  
    /**
     * 导出模板
     */
    public String exportTemplate(){
    	List<List<Object>> csvRateData = new ArrayList<List<Object>>();
    	List<Object> csvHeaderRow = new ArrayList<Object>();
    	//"keyDevID,idxViFiID,pwd,idxDevGrpID,idxVNSID,devState,idxAgentID,debugIdt,hardwareVer,firmwareVer,softwareVer,idxUserId"
		csvHeaderRow.add("keyDevID");
		csvHeaderRow.add("idxViFiID");
		csvHeaderRow.add("pwd");
		csvHeaderRow.add("idxDevGrpID");
		csvHeaderRow.add("idxVNSID");
		csvHeaderRow.add("devState");
		csvHeaderRow.add("idxAgentID");
		csvHeaderRow.add("debugIdt");
		csvHeaderRow.add("hardwareVer");
		csvHeaderRow.add("firmwareVer");
		csvHeaderRow.add("softwareVer");
		csvHeaderRow.add("idxUserId");
		csvRateData.add(csvHeaderRow);
		List<Object> csvHeaderRow0 = new ArrayList<Object>();
    	csvHeaderRow0.add("");
    	csvRateData.add(csvHeaderRow0);
		List<Object> csvHeaderRow1 = new ArrayList<Object>();
    	csvHeaderRow1.add("以下为提示信息，导入时请删除：");
    	csvRateData.add(csvHeaderRow1);
    	List<Object> csvHeaderRow2 = new ArrayList<Object>();
    	csvHeaderRow2.add("1.字段对应的列分别为：a/b/c/d/.....");
    	csvRateData.add(csvHeaderRow2);
    	List<Object> csvHeaderRow3 = new ArrayList<Object>();
    	csvHeaderRow3.add("2.所有字段为必填字段。");
    	csvRateData.add(csvHeaderRow3);
    	
    	return CSVUtils.dataToCsv(csvRateData);
    }

    @Override
    public JSONObject querySingleDetails(String id) {
        JSONObject rest = new JSONObject();
        rest.put("devState", viFiDeviceDao.querySgDevState(id));
        return rest;
    }


    /**
     * 用组ID 查询设备状态
     *
     * @param grpID 设备组ID
     * @return [{state:"",count:0}]
     */
    public List<StatusCountVO> queryStateByGrpID(String grpID) {
        return viFiDeviceDao.queryStateByGrpID(grpID);
    }


    public int queryCountByGrpID(List<String> listGrpID) {
        Criteria criteria = Criteria.create(TbViFiDevice.class).where("idxDevGrpID", " in ", listGrpID.toArray());
        return jdbcDao.queryCount(criteria);
    }


    /**
     * 获得组,select 控件数据
     */
    public List<String[]> getViFiDeviceSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbViFiDevice tbViFiDevice : queryAll()) {
            selDatas.add(new String[]{tbViFiDevice.getIdxViFiID(), tbViFiDevice.getIdxViFiID()});
        }
        return selDatas;
    }
    /**
     * tzy
     */
    public List<DeviceAndGroupVO> selectCount(){
    	return viFiDeviceDao.selectCount();
    }

    public CommonOutlineInfoVO getOutlineInfo(){
    	List<CommonOutlineInfoVO> list = viFiDeviceDao.getOutlineInfo();
    	return list!=null&&list.size()>0?list.get(0):null;
    }
    
    public List<TbViFiDevice> getRecentOnlineDev(){
    	return viFiDeviceDao.getRecentOnlineDev();
    }
    
    /**
     * 获取uuwifi设备数 / 在线比例
     * @param userName
     * @return
     */
    public int getAgentUUWiFiCount(String userName){
    	return viFiDeviceDao.getAgentUUWiFiCount(userName, false);
    }
    public int getUUWiFiCount( ){
    	return viFiDeviceDao.getUUWiFiCount(false);
    }
    public List<Integer> getAgentOnlineUuwifiPercent(String userName){
    	int online = viFiDeviceDao.getAgentUUWiFiCount(userName, true);
    	int offline = viFiDeviceDao.getAgentUUWiFiCount(userName, false) - online;
    	return Arrays.asList(online, offline);
    }
    public List<Integer> getOnlineUuwifiPercent(){
    	int online = viFiDeviceDao.getUUWiFiCount( true);
    	int offline = viFiDeviceDao.getUUWiFiCount( false) - online;
    	return Arrays.asList(online, offline);
    }
    
}