
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSimPDevGrp;
import net.eoutech.webmin.vifi.service.SimPDevGrpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/simPDevGrp" )
@CommonTabCtrlInit( resource = "vifi_simPDevGrp" )
public class SimPDevGrpCtrl extends FrameBaseCtrl< TbSimPDevGrp > {
    SimPDevGrpService simPDevGrpService;
    @Autowired
    public void setCfrmBaseService( SimPDevGrpService commonTabService ) {
        this.frameBaseService = simPDevGrpService = commonTabService;
    }

}
       