
package net.eoutech.webmin.count.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbCountMonthly;
import net.eoutech.webmin.count.service.CountMonthlyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/count/countMonthly" )
@CommonTabCtrlInit( resource = "count_countMonthly" )
public class CountMonthlyCtrl extends FrameBaseCtrl< TbCountMonthly > {
    CountMonthlyService countMonthlyService;
    @Autowired
    public void setCfrmBaseService( CountMonthlyService commonTabService ) {
        this.frameBaseService = countMonthlyService = commonTabService;
    }

}
       