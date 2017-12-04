package net.eoutech.webmin.cdr.ctrl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;
import net.eoutech.webmin.cdr.service.CdrService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.*;
import net.eoutech.webmin.count.service.CountDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;

@Controller
@RequestMapping(value = "/vsw/cdrNew" )
@CommonTabCtrlInit(viewName = "/page/vsw/cdrNew", resource = "vsw_cdrNew")
public class CdrNewCtrl extends FrameBaseCtrl<TbCDR> {
    CdrService cdrService;
    public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:00");
    @Autowired
    public void setCfrmBaseService(CdrService commonTabService) {
        this.frameBaseService = cdrService = commonTabService;
    }
//    @Autowired
//    private ViFiDeviceService viFiDeviceService;
    @Autowired
    private CountDailyService countDailyService;
    
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        TbCountDailyInfo info = countDailyService.getQueryCountInfo(false);
        info.setCountDevice(countDailyService.querCountOnlineDevice(false,"today").getCountDevice());
        TbCountDailyInfo infoMon = countDailyService.getQueryCountInfo(true);
        infoMon.setCountDevice(countDailyService.querCountOnlineDevice(false,"month").getCountDevice());
    	List<TbCountDailyInfo> hours = countDailyService.queryCountByHour();
    	//Object[] todays = countDailyService.queryCountByHour2();
    	//Object[] months2 = countDailyService.queryCountByMonth2();
    	//Object[] years2 = countDailyService.queryCountByYear2();
    	int maxUserHours = 0;
    	int maxDataHours = 0;
    	for (TbCountDailyInfo inf : hours) {
			if(maxUserHours < inf.getCountUser()){
				maxUserHours = inf.getCountUser();
			}
			if(maxDataHours < inf.getCntDataSum()){
				maxDataHours = inf.getCntDataSum();
			}
		}
    	List<TbCountDailyInfo> months = countDailyService.queryCountByMonth();
    	int maxUserMonths = 0;
    	int maxDataMonths = 0;
    	for (TbCountDailyInfo inf : months) {
    		if(maxUserMonths < inf.getCountUser()){
    			maxUserMonths = inf.getCountUser();
    		}
    		if(maxDataMonths < inf.getCntDataSum()){
    			maxDataMonths = inf.getCntDataSum();
    		}
    	}
    	List<TbCountDailyInfo> years = countDailyService.queryCountByYear();
    	int maxUserYears = 0;
    	int maxDataYears = 0;
    	for (TbCountDailyInfo inf : years) {
    		if(maxUserYears < inf.getCountUser()){
    			maxUserYears = inf.getCountUser();
    		}
    		if(maxDataYears < inf.getCntDataSum()){
    			maxDataYears = inf.getCntDataSum();
    		}
    	}
    	List<TbCountDailyInfo> tops = countDailyService.queryTop();
    	TbCountDailyInfo onlineInfo = countDailyService.queryCountUser(null);
    	onlineInfo.setCountOnLineUser(countDailyService.queryCountUser("10").getCountUser());
    	onlineInfo.setCountDevice(countDailyService.queryCountVifiDevice(false).getCountDevice());
    	onlineInfo.setCountOnLineDevice(countDailyService.querCountOnlineDevice(true,null).getCountDevice());

    	view.put("realtimeData", cdrService.queryCountByTime());
    	view.put("maxUserHours", maxUserHours);
    	view.put("maxDataHours", maxDataHours);
    	view.put("maxUserMonths", maxUserMonths);
    	view.put("maxDataMonths", maxDataMonths);
    	view.put("maxUserYears", maxUserYears);
    	view.put("maxDataYears", maxDataYears);
    	view.put("onlineInfo", onlineInfo);
    	view.put("info", info);
    	view.put("infoMon", infoMon);
    	//view.put("todays", todays);
    	//view.put("months2", months2);
    	//view.put("years2", years2);
    	view.put("hours", hours);
    	view.put("months", months);
    	view.put("years", years);
    	view.put("tops", tops);
    	try {
    		//ActionUtils.getRequest().getSession().removeAttribute("dataTras");
		} catch (Exception e) {
		}
        return super.view(model);
    }
    /**
     * ajax查询  流量账单
     */
    @Override
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbUseFlowRcd> page = cdrService.query2(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        pageView.put("statisInfo", ((CdrService) frameBaseService).queryCdrStatisInfo(queryParam));

        return RestObject.newOk("", pageView);
    }

    /**
     * 用户用量统计列表ajax查询
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX_1, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(String idxUserId,String beginTime,String endTime,
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        //countDailyService.query(pageNumber, pageSize, queryParam);  查出的流量是已经除过1024/1024
        Page<TbUseFlowRcd> page = countDailyService.queryCountDataByUser(idxUserId, beginTime, endTime, queryParam, pageNumber, pageSize);
        LogUtils.dbg("query  " + resource);
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        return RestObject.newOk("", pageView);
    }
    /**
     * 设备用量统计列表ajax查询
     */
//    @RequestMapping(value = "list.ajax3", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
//    @ResponseBody
//    public RestObject queryAjax4(String idxViFiID,String beginTime,String endTime,
//    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
//    		@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
//    		ServletRequest request) {
//    	Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
//    	Page<TbUUWiFiCountDaily> page = countDailyService.queryCountUUWIFIDataByUser(idxViFiID, beginTime, endTime, queryParam, pageNumber, pageSize);
//    	LogUtils.dbg("query  " + resource);
//    	JSONObject pageView = LehmanCommonUtils.createPageView(page);
//    	pageView.put("contentList", page.getContent());
//    	return RestObject.newOk("", pageView);
//    }
//    /**
//     * 设备用量统计 详情ajax查询
//     */
//    @RequestMapping(value = "list.ajax4", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
//    @ResponseBody
//    public RestObject queryAjax5(String idxViFiID,String beginTime,String endTime,
//    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
//    		@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
//    		ServletRequest request) {
//    	//Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
//    	List<TbUseFlowRcd> list = countDailyService.queryListDataByUserNew(idxViFiID, beginTime, endTime,true);
//    	Object[] results = new Object[2];
//    	int listSize = list.size();
//    	String[] xVals = new String[listSize];
//    	for (int i = 0; i < xVals.length; i++) {
//			xVals[i]=new String(" ");
//		}
//    	double [] series1 = new double[listSize];
//    	for (int i = 0; i < list.size(); i++) {
//			TbUseFlowRcd td = list.get(i);
//			xVals[i] = sdf.format(td.getCrtTm());
//			series1[i] = ((double)(td.getDownFlow()+td.getUpFlow()))/1000;
//			if(series1[i] <0){
//				series1[i] = 0;
//			}
//    	}
//    	results[0] = xVals;
//    	results[1] = series1;
//    	LogUtils.dbg("query  " + resource);
//    	return RestObject.newOk("", results);
//    }
    /**
     * 用户用量统计 详情ajax查询
     */
    @RequestMapping(value = "list.ajax2", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax3(String idxUserId,String beginTime,String endTime,
    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
    		@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
    		ServletRequest request) {
    	//Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
    	//List<TbCountDaily> list = countDailyService.queryListDataByUser(idxUserId, beginTime, endTime,false);
		//查出的流量是  bit
    	List<TbUseFlowRcd> list = countDailyService.queryListDataByUserNew(idxUserId, beginTime, endTime,false);
    	Object[] results = new Object[2];
    	int listSize = list.size();
    	String[] xVals = new String[listSize];
    	double [] series1 = new double[listSize];
    	for (int i = 0; i < list.size(); i++) {
			TbUseFlowRcd td = list.get(i);
			xVals[i] = sdf.format(td.getCrtTm());
			if(td.getUpFlow() != null){//
				series1[i] = ((double)(td.getUpFlow()));
			}
			if(series1[i] <0){
				series1[i] = 0;
			}
    	}
    	results[0] = xVals;
    	results[1] = series1;
    	LogUtils.dbg("query  " + resource);
    	return RestObject.newOk("", results);
    }
    /**
     * ajax实时查询
     */
    @RequestMapping(value = "realTime.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax2(String idxUserId,String beginTime,String endTime,
    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
    		@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
    		ServletRequest request) {
    	//Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
    	//countDailyService.query(pageNumber, pageSize, queryParam);
    	TbCDR info = cdrService.queryCountByNow();
		/*int[] dataTras = new int[150];
    	try {
    		if(ActionUtils.getRequest().getSession().getAttribute("dataTras") !=null ){
    			dataTras =(int[]) ActionUtils.getRequest().getSession().getAttribute("dataTras");
    		}
		} catch (Exception e) {
		}
    	//dataTras = getArrayByData(dataTras, info.getDataTraffic());
    	ActionUtils.getRequest().getSession().setAttribute("dataTras", dataTras);*/
    	return RestObject.newOk("", info.getDataTraffic());
    }
//    private int[] getArrayByData(int[] dataTras,int dataTra){
//    	int[] temps = new int[dataTras.length];
//    	for (int i =0; i < dataTras.length ;i++) {
//			if(i !=0){
//				temps[i-1] = dataTras[i];
//				if(i == dataTras.length-1){
//					temps[i] = dataTra;
//				}
//			}
//		}
//    	return temps;
//    }
    //************************* 统计查询

}
