
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSMSCountDaily;
import net.eoutech.webmin.vifi.service.SMSCountDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/sMSCountDaily" )
@CommonTabCtrlInit( resource = "vifi_sMSCountDaily" )
public class SMSCountDailyCtrl extends FrameBaseCtrl< TbSMSCountDaily > {
    SMSCountDailyService sMSCountDailyService;
    @Autowired
    public void setCfrmBaseService( SMSCountDailyService commonTabService ) {
        this.frameBaseService = sMSCountDailyService = commonTabService;
    }

}
       