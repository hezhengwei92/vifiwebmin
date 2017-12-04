
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbViFiCtrlRcd;
import net.eoutech.webmin.vifi.service.ViFiCtrlRcdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/viFiCtrlRcd" )
@CommonTabCtrlInit( resource = "vifi_viFiCtrlRcd" )
public class ViFiCtrlRcdCtrl extends FrameBaseCtrl< TbViFiCtrlRcd > {
    ViFiCtrlRcdService viFiCtrlRcdService;
    @Autowired
    public void setCfrmBaseService( ViFiCtrlRcdService commonTabService ) {
        this.frameBaseService = viFiCtrlRcdService = commonTabService;
    }

}
       