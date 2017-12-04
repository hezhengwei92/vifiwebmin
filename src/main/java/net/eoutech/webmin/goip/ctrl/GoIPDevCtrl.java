
package net.eoutech.webmin.goip.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.CommonUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbGoIPDev;
import net.eoutech.webmin.commons.entity.TbGoIPPort;
import net.eoutech.webmin.commons.entity.TbSimPPort;
import net.eoutech.webmin.goip.service.GoIPDevService;
import net.eoutech.webmin.goip.service.GoIPPortService;
import net.eoutech.webmin.vsw.service.VSWService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/goip/goIPDev")
@CommonTabCtrlInit(resource = "goip_goIPDev", viewName = "/page/goip/goIPDev")
public class GoIPDevCtrl extends FrameBaseCtrl<TbGoIPDev> {
    GoIPDevService goIPDevService;
    @Autowired
    VSWService vswService;
    @Autowired
    GoIPPortService goIPPortService;

    @Autowired
    public void setCfrmBaseService(GoIPDevService commonTabService) {
        this.frameBaseService = goIPDevService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("vswSelData", vswService.getVSWSelData());
        view.put("graphView", goIPDevService.queryAllGoIPDevPortInfo());
        return super.view(model);
    }


    @RequestMapping(value = "goip-port-info.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject goipPortInfoAjax(Integer keyID) {
        TbGoIPPort goIPPort = goIPPortService.get(keyID);
        return RestObject.newOk("", goIPPort);
    }


}
       