package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbRoute;
import net.eoutech.webmin.vifi.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/route" )
@CommonTabCtrlInit( resource = "vifi_route" )
public class RouteCtrl extends FrameBaseCtrl< TbRoute > {

    @Autowired
    public void setCfrmBaseService( RouteService commonTabService ) {
        this.frameBaseService = commonTabService;
    }

}
