package net.eoutech.webmin.rate.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbISP;
import net.eoutech.webmin.rate.service.ISPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rate/isp")
@CommonTabCtrlInit(resource = "rate_isp")
public class ISPCtrl extends FrameBaseCtrl<TbISP> {
    ISPService iSPService;

    @Autowired
    public void setCfrmBaseService(ISPService commonTabService) {
        this.frameBaseService = iSPService = commonTabService;
    }

}
       