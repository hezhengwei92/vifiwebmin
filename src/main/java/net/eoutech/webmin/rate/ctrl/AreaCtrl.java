
package net.eoutech.webmin.rate.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbArea;
import net.eoutech.webmin.rate.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/rate/area" )
@CommonTabCtrlInit( resource = "rate_area" )
public class AreaCtrl extends FrameBaseCtrl< TbArea > {
    AreaService areaService;
    @Autowired
    public void setCfrmBaseService( AreaService commonTabService ) {
        this.frameBaseService = areaService = commonTabService;
    }

}
       