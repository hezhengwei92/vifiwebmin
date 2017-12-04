package net.eoutech.webmin.lucky.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbIntegralExchange;
import net.eoutech.webmin.commons.entity.TbIntegralLucky;
import net.eoutech.webmin.lucky.service.IntegralExchangeService;
import net.eoutech.webmin.lucky.service.IntegralLuckyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wei on 2017/11/23.
 */
@Controller
@RequestMapping("/lucky/integralLucky")
@CommonTabCtrlInit(resource = "lucky_integralLucky")
public class IntegralLuckyCtrl extends FrameBaseCtrl<TbIntegralLucky> {
    @Autowired
    IntegralLuckyService integralLuckyService;
    @Autowired
    public void setCfrmBaseService(IntegralLuckyService commonTabService) {
        this.frameBaseService =integralLuckyService= commonTabService;
    }
}
