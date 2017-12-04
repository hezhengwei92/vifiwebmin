
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbCountSrcIP;
import net.eoutech.webmin.vifi.service.CountSrcIPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/countSrcIP" )
@CommonTabCtrlInit( resource = "vifi_countSrcIP" )
public class CountSrcIPCtrl extends FrameBaseCtrl< TbCountSrcIP > {
    CountSrcIPService countSrcIPService;
    @Autowired
    public void setCfrmBaseService( CountSrcIPService commonTabService ) {
        this.frameBaseService = countSrcIPService = commonTabService;
    }

}
       