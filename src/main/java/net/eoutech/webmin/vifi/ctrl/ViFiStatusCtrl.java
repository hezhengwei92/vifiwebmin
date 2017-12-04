
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbViFiStatus;
import net.eoutech.webmin.vifi.service.ViFiStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/viFiStatus" )
@CommonTabCtrlInit( resource = "vifi_viFiStatus" )
public class ViFiStatusCtrl extends FrameBaseCtrl< TbViFiStatus > {
    ViFiStatusService viFiStatusService;
    @Autowired
    public void setCfrmBaseService( ViFiStatusService commonTabService ) {
        this.frameBaseService = viFiStatusService = commonTabService;
    }

}
       