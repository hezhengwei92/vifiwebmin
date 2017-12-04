
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSMSGateway;
import net.eoutech.webmin.vifi.service.SMSGatewayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/sMSGateway" )
@CommonTabCtrlInit( resource = "vifi_sMSGateway" )
public class SMSGatewayCtrl extends FrameBaseCtrl< TbSMSGateway > {
    SMSGatewayService sMSGatewayService;
    @Autowired
    public void setCfrmBaseService( SMSGatewayService commonTabService ) {
        this.frameBaseService = sMSGatewayService = commonTabService;
    }

}
       