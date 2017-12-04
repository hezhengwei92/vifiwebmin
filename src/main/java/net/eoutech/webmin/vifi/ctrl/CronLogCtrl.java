
package net.eoutech.webmin.vifi.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbCronLog;
import net.eoutech.webmin.vifi.service.CronLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/vifi/cronLog" )
@CommonTabCtrlInit( resource = "vifi_cronLog" )
public class CronLogCtrl extends FrameBaseCtrl< TbCronLog > {
    CronLogService cronLogService;
    @Autowired
    public void setCfrmBaseService( CronLogService commonTabService ) {
        this.frameBaseService = cronLogService = commonTabService;
    }

}
       