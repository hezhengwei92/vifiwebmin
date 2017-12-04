package net.eoutech.webmin.cron.va.cronctrl;

import net.eoutech.webmin.cron.va.service.VaUserOnlineCronService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class VaUserOnlineCronCtrl {
    @Autowired
    VaUserOnlineCronService vaUsrOnlineCronService;


    /**
     * 更新用户在线状态,如果用户超时则下线处理!!!!!!
     */
    @Scheduled( cron = "0 0/30 * * * ?" )
    public void updateUsrTimeoutOffline() {
//        vaUsrOnlineCronService.updateUsrTimeoutOffline();
    }


}
