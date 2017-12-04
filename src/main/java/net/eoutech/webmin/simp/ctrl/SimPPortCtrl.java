
package net.eoutech.webmin.simp.ctrl;

import java.util.Map;

import javax.servlet.ServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbSimPPort;
import net.eoutech.webmin.simp.service.SimPDevService;
import net.eoutech.webmin.simp.service.SimPPortService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/simp/simPPort")
@CommonTabCtrlInit(resource = "simp_simPPort", viewName = "/page/simp/simPPort")
public class SimPPortCtrl extends FrameBaseCtrl<TbSimPPort> {
    SimPPortService simPPortService;

    @Autowired
    public void setCfrmBaseService(SimPPortService commonTabService) {
        this.frameBaseService = simPPortService = commonTabService;
    }
    @Autowired
    SimPDevService simPDevService;
    @Autowired
    ViFiDeviceService viFiDeviceService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("simpdevSelData", simPDevService.getSimPDevSelData());
        view.put("uuwifiSelData",viFiDeviceService.getViFiDeviceSelData());
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
        Page<TbSimPPort> page = simPPortService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
}
       