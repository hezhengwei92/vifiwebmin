package net.eoutech.webmin.sysconfig.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbUUWiFiArea;
import net.eoutech.webmin.sysconfig.service.WifiAreaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/sysconfig/wifiArea" )
@CommonTabCtrlInit( resource = "sysconfig_wifiArea" )
public class WifiAreaCtrl extends FrameBaseCtrl< TbUUWiFiArea > {
	WifiAreaService wifiAreaService;
    @Autowired
    public void setCfrmBaseService( WifiAreaService commonTabService ) {
        this.frameBaseService = wifiAreaService = commonTabService;
    }

}