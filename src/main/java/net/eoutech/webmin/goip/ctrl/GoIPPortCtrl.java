
package net.eoutech.webmin.goip.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbGoIPPort;
import net.eoutech.webmin.goip.service.GoIPDevService;
import net.eoutech.webmin.goip.service.GoIPPortService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/goip/goIPPort" )
@CommonTabCtrlInit( resource = "goip_goIPPort", viewName = "/page/goip/goIPPort" )
public class GoIPPortCtrl extends FrameBaseCtrl< TbGoIPPort > {
    GoIPPortService goIPPortService;
    @Autowired
    public void setCfrmBaseService( GoIPPortService commonTabService ) {
        this.frameBaseService = goIPPortService = commonTabService;
    }
    @Autowired
    GoIPDevService goIPDevService;
    @Autowired
    ViFiDeviceService viFiDeviceService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("goipdevSelData", goIPDevService.getGoIPDevSelData());
        view.put("vifideviceSelData",viFiDeviceService.getViFiDeviceSelData());
        return super.view(model);
    }
}
       