
package net.eoutech.webmin.uuwifi.ctrl;

import java.util.Map;

import javax.servlet.ServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.uuwifi.service.ViFiDevGroupService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/uuwifi/viFiDevice")
@CommonTabCtrlInit(resource = "uuwifi_viFiDevice", viewName = "page/uuwifi/viFiDevice")
public class ViFiDeviceCtrl extends FrameBaseCtrl<TbViFiDevice> {
    ViFiDeviceService viFiDeviceService;

    @Autowired
    ViFiDevGroupService viFiDevGroupService;
    @Autowired
    VNSService vnsService;
    @Autowired
    AgentService agentService;


    @Autowired
    public void setCfrmBaseService(ViFiDeviceService commonTabService) {
        this.frameBaseService = viFiDeviceService = commonTabService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("devGroupSelData", viFiDevGroupService.getDevGroupSelData());
        view.put("vnsSelData", vnsService.getVNSSelData());
        view.put("agentSelData", agentService.getAgentSelData());
        view.put("hardwareVerSelData", viFiDevGroupService.getDevGroup1SelData());
        view.put("firmwareVerSelData", viFiDevGroupService.getDevGroup2SelData());
        view.put("softwareVerSelData", viFiDevGroupService.getDevGroup3SelData());

        return super.view(model);
    }


    /**
     * ajax查询
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
        }
        Page<TbViFiDevice> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 导入
     */
    @RequestMapping(value = "/importCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject importCsvToDbAjax(String csvStr) {
        int resCount = 0;
        try {
            resCount = viFiDeviceService.importCsvToDb(csvStr);
        } catch (DuplicateKeyException e) {
            return RestObject.newError("import failure key id index repeat!" + e.getMessage());
        }
        return RestObject.newOk("import rate success,insert count : " + resCount);
    }


    /**
     * 导出
     */
    @RequestMapping(value = "/exportCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportCsvByDbAjax() {
        String data = viFiDeviceService.exportDevCsvByDb();
        return RestObject.newOk("", data);
    }

}
       