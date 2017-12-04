
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbCountOnlineDaily;
import net.eoutech.webmin.vifi.service.CountOnlineDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/countOnlineDaily" )
@CommonTabCtrlInit( resource = "vifi_countOnlineDaily" )
public class CountOnlineDailyCtrl extends FrameBaseCtrl< TbCountOnlineDaily > {
    CountOnlineDailyService countOnlineDailyService;
    @Autowired
    public void setCfrmBaseService( CountOnlineDailyService commonTabService ) {
        this.frameBaseService = countOnlineDailyService = commonTabService;
    }

}
       