
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbGoIPGrp;
import net.eoutech.webmin.vifi.service.GoIPGrpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/goIPGrp" )
@CommonTabCtrlInit( resource = "vifi_goIPGrp" )
public class GoIPGrpCtrl extends FrameBaseCtrl< TbGoIPGrp > {
    GoIPGrpService goIPGrpService;
    @Autowired
    public void setCfrmBaseService( GoIPGrpService commonTabService ) {
        this.frameBaseService = goIPGrpService = commonTabService;
    }

}
       