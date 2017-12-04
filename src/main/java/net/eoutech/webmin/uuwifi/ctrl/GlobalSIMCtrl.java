
package net.eoutech.webmin.uuwifi.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbGlobalSIM;
import net.eoutech.webmin.uuwifi.service.GlobalSIMGrpService;
import net.eoutech.webmin.uuwifi.service.GlobalSIMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/uuwifi/globalSIM")
@CommonTabCtrlInit(resource = "uuwifi_globalSIM")
public class GlobalSIMCtrl extends FrameBaseCtrl<TbGlobalSIM> {
    GlobalSIMService globalSIMService;

    @Autowired
    GlobalSIMGrpService globalSIMGrpService;

    @Autowired
    public void setCfrmBaseService(GlobalSIMService commonTabService) {
        this.frameBaseService = globalSIMService = commonTabService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("globalSIMGrpSelData", globalSIMGrpService.getGlobalSIMGrpSelData());
        return super.view(model);
    }


}
       