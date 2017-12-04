
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbFireWall;
import net.eoutech.webmin.vifi.service.FireWallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/fireWall" )
@CommonTabCtrlInit( resource = "vifi_fireWall" )
public class FireWallCtrl extends FrameBaseCtrl< TbFireWall > {
    FireWallService fireWallService;
    @Autowired
    public void setCfrmBaseService( FireWallService commonTabService ) {
        this.frameBaseService = fireWallService = commonTabService;
    }

}
       