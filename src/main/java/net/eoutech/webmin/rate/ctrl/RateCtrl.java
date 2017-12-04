package net.eoutech.webmin.rate.ctrl;

import java.util.Map;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbRate;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.ServletRequest;

@Controller
@RequestMapping(value = {"/rate/rate", "/vpx/rateNewVer"})
@CommonTabCtrlInit(viewName = "/page/rate/rate", resource = "vpx_rateNewVer")//viewName = "/page/rate/rate", 
public class RateCtrl extends FrameBaseCtrl<TbRate> {
    RateService rateService = null;

    @Autowired
    public void setCfrmBaseService(RateService commonTabService) {
        this.frameBaseService = rateService = commonTabService;
    }


//    /**
//     * ajax查询
//     */
//    @RequestMapping(value = "/list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
//    @ResponseBody
//    public RestObject queryAjax(
//            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
//            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
//            ServletRequest request) {
//        RestObject restObject = super.queryAjax(pageNumber, pageSize, request);
////        JSONObject pageView = (JSONObject) restObject.getData();
////        pageView.put("maxKeyRateId", rateService.queryMaxKeyRateId());
//
//        return restObject;
//    }
    
    /**
     * ajax查询
     */
    @RequestMapping(value = "list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        LogUtils.dbg("query  " + resource);
        //初始查询参数：计费模式=呼叫  C/S
        Object[] rateMode = {"C","S"};
        queryParam.put("IN-|-rateMode", rateMode);
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
        }
        Page<TbRate> page = frameBaseService.query(pageNumber, pageSize, queryParam);
        
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
//      JSONObject pageView = (JSONObject) restObject.getData();
//      pageView.put("maxKeyRateId", rateService.queryMaxKeyRateId());
        return RestObject.newOk("", pageView);
    }


    /**
     * 导入费率
     */
    @RequestMapping(value = "/importRateCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject importRateCsvToDbAjax(String csvStr) {
        int resCount = 0;
        try {
            resCount = rateService.importRateCsvToDb(csvStr);
        } catch (DuplicateKeyException e) {
            String msg = "import failure key id index repeat!" + e.getMessage();

            if (e.getMessage().contains("idxCallPrefix_index_unique")) {
                msg = CommonUtils.lang("page.rate.imp_prefix_repeat");
            }
            return RestObject.newError(msg);
        }
        return RestObject.newOk("import rate success,insert count : " + resCount);
    }

    /**
     * 导出费率
     */
    @RequestMapping(value = "/exportRateCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportRateCsvByDbAjax(String tbHead) {
        String data = rateService.exportRateCsvByDb(tbHead);
        return RestObject.newOk("", data);
    }

    @Autowired
    AreaService areaService;
    @Autowired
	AgentService agentService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("rateGroupByArea", rateService.queryRateGroupByCountry());
        view.put("agentSelData", agentService.getAgentSelData());
        return super.view(model);
    }
}
