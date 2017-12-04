
package net.eoutech.webmin.count.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbCountDaily;
import net.eoutech.webmin.count.service.CountDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/count/countAccessIP" )
@CommonTabCtrlInit( resource = "count_countAccessIP" )
public class CountAccessIPCtrl extends FrameBaseCtrl< TbCountDaily > {
    CountDailyService countDailyService;
    @Autowired
    public void setCfrmBaseService( CountDailyService commonTabService ) {
        this.frameBaseService = countDailyService = commonTabService;
    }

}