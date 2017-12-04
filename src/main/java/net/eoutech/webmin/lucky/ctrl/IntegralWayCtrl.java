package net.eoutech.webmin.lucky.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbIntegralLucky;
import net.eoutech.webmin.commons.entity.TbIntegralWay;
import net.eoutech.webmin.lucky.service.IntegralLuckyService;
import net.eoutech.webmin.lucky.service.IntegralWayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wei on 2017/11/23.
 */
@Controller
@RequestMapping("/lucky/integralWay")
@CommonTabCtrlInit(resource = "lucky_integralWay")
public class IntegralWayCtrl extends FrameBaseCtrl<TbIntegralWay> {
    @Autowired
    IntegralWayService integralWayService;
    @Autowired
    public void setCfrmBaseService(IntegralWayService commonTabService) {
        this.frameBaseService =integralWayService= commonTabService;
    }
}
