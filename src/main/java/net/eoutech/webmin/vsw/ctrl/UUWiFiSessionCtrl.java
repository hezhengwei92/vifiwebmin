
package net.eoutech.webmin.vsw.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbUUWiFiSession;
import net.eoutech.webmin.goip.service.GoIPDevService;
import net.eoutech.webmin.simcart.service.SimCardService;
import net.eoutech.webmin.simp.service.SimPDevService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import net.eoutech.webmin.vsw.service.UUWiFiSessionService;
import net.eoutech.webmin.vsw.service.VSWService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/syslog/uUWiFiSession" )
@CommonTabCtrlInit(viewName = "/page/commons/export",resource = "syslog_uUWiFiSession" )
public class UUWiFiSessionCtrl extends FrameBaseCtrl< TbUUWiFiSession > {
    UUWiFiSessionService uUWiFiSessionService;
    @Autowired
    public void setCfrmBaseService( UUWiFiSessionService commonTabService ) {
        this.frameBaseService = uUWiFiSessionService = commonTabService;
    }
    @Autowired
    ViFiDeviceService viFiDeviceService;
    @Autowired
    SimCardService simCardService;
    @Autowired
    SimPDevService simPDevService;
    @Autowired
    GoIPDevService goIPDevService;
    @Autowired
    VSWService vswService;


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("idxvifiIDSelData", viFiDeviceService.getViFiDeviceSelData());
        view.put("keysimcardIDSelData",simCardService.getSimcardIDSelData());
        view.put("keySimPDevIDSelData",simPDevService.getSimPDevSelData());
        view.put("keygoipdevSelData",goIPDevService.getGoIPDevSelData());
        view.put("keyvswidSelData",vswService.getVSWSelData());
        return super.view(model);
    }




}
       