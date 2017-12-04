package net.eoutech.webmin.lucky.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbIntegralLucky;
import net.eoutech.webmin.commons.entity.TbTotalIntegral;
import net.eoutech.webmin.lucky.service.SendGoodsService;
import net.eoutech.webmin.lucky.service.TotalIntegralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wei on 2017/11/23.
 */
@Controller
@RequestMapping("/lucky/totalintegral")
@CommonTabCtrlInit(resource = "lucky_totalIntegral")
public class TotalIntegralCtrl extends FrameBaseCtrl<TbTotalIntegral> {
    @Autowired
    TotalIntegralService totalIntegralService;
    @Autowired
    public void setCfrmBaseService(TotalIntegralService commonTabService) {
        this.frameBaseService =totalIntegralService= commonTabService;
    }
}
