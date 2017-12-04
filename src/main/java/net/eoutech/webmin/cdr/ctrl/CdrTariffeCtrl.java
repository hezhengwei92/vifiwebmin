package net.eoutech.webmin.cdr.ctrl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;
import net.eoutech.webmin.cdr.service.CdrService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbCDR;
import net.eoutech.webmin.commons.entity.TbCountDaily;
import net.eoutech.webmin.commons.entity.TbCountDailyInfo;
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
@RequestMapping(value = "/vpx/cdrTariffe" )
@CommonTabCtrlInit(viewName = "/page/vpx/cdrTariffe", resource = "vpx_cdrTariffe")
public class CdrTariffeCtrl extends FrameBaseCtrl<TbCDR> {
    CdrService cdrService;

    @Autowired
    public void setCfrmBaseService(CdrService commonTabService) {
        this.frameBaseService = cdrService = commonTabService;
    }
    public static final SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
    @Autowired
    private CountDailyService countDailyService;
    
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        //每日信息
        TbCountDailyInfo info = countDailyService.getQueryCountTariffeInfo(false);
        //每月信息
        TbCountDailyInfo infoMon = countDailyService.getQueryCountTariffeInfo(true);
        //本月费用top排行榜
    	List<TbCountDailyInfo> tops = countDailyService.queryTariffeTop();
    	//今日时长
    	List<TbCountDailyInfo> timeTops = countDailyService.queryTariffeTimeTop();
    	//所有用户、在线用户
    	TbCountDailyInfo onlineInfo = countDailyService.queryCountUser(null);
    	onlineInfo.setCountOnLineUser(countDailyService.queryCountUser("10").getCountUser());
    	onlineInfo.setCalls(countDailyService.queryCountOnlineCalls().getCalls());
    	onlineInfo.setGoIPNum(countDailyService.queryCountOnlineGoIPs().getGoIPNum());
    	// 每日 通话数量、费用 图
    	Object[] todays = countDailyService.queryCountByTime(CountDailyService.IS_TODAY);
    	Object[] months = countDailyService.queryCountByTime(CountDailyService.IS_MONTH);
    	Object[] years = countDailyService.queryCountByTime(CountDailyService.IS_YEAR);
    	view.put("todays", todays);
    	view.put("months", months);
    	view.put("years", years);
    	
    	view.put("onlineInfo", onlineInfo);
    	view.put("info", info);
    	view.put("infoMon", infoMon);
    	view.put("tops", tops);
    	view.put("timeTops", timeTops);
    	view.put("realtimeData", countDailyService.queryCountTariffeTime());
    	try {
    		ActionUtils.getRequest().getSession().removeAttribute("dataTariffes");
		} catch (Exception e) {
		}
        return super.view(model);
    }
    /**
     * ajax查询
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
        Page<TbCDR> page = cdrService.queryTariffe(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        pageView.put("statisInfo", ((CdrService) frameBaseService).queryCdrStatisInfo(queryParam));

        return RestObject.newOk("", pageView);
    }

    /**
     * ajax查询
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX_1, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(String idxUserId,String beginTime,String endTime,
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        //countDailyService.query(pageNumber, pageSize, queryParam);
        Page<TbCountDaily> page = countDailyService.queryCountTariffeDataByUser(idxUserId, beginTime, endTime, queryParam, pageNumber, pageSize);
        LogUtils.dbg("query  " + resource);
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        return RestObject.newOk("", pageView);
    }
    /**历史话单通话详情
     * ajax查询
     */
    @RequestMapping(value = "list.ajax2", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax3(String idxUserId,String beginTime,String endTime,
    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
    		@RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
    		ServletRequest request) {
    	//Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
    	Object[] results = countDailyService.queryListDataByUser(idxUserId, beginTime, endTime,true);
    	
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
    	TbCountDailyInfo info = countDailyService.queryCountTariffeNow();
    	@SuppressWarnings("unused")
		int[] dataTariffes = new int[100];
    	try {
    		if(ActionUtils.getRequest().getSession().getAttribute("dataTariffes") !=null ){
    			dataTariffes =(int[]) ActionUtils.getRequest().getSession().getAttribute("dataTariffes");
    		}
		} catch (Exception e) {
		}
    	//dataTariffes = getArrayByData(dataTariffes, info.getNumTotal());
    	//Object[] datas = new Object[2];
    	//datas[0]= dataTariffes;
    	//datas[1]= info.getNumTotal();
    	//ActionUtils.getRequest().getSession().setAttribute("dataTariffes", dataTariffes);
    	return RestObject.newOk("", info.getNumTotal());
    }
//    private int[] getArrayByData(int[] datas,int dataTra){
//    	int[] temps = new int[datas.length];
//    	for (int i =0; i < datas.length ;i++) {
//			if(i !=0){
//				temps[i-1] = datas[i];
//				if(i == datas.length-1){
//					temps[i] = dataTra;
//				}
//			}
//		}
//    	return temps;
//    }
    //************************* 统计查询

}
