package net.eoutech.webmin.lucky.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbIntegralLucky;
import net.eoutech.webmin.commons.entity.TbSendGoods;
import net.eoutech.webmin.lucky.service.IntegralWayService;
import net.eoutech.webmin.lucky.service.SendGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wei on 2017/11/23.
 */
@Controller
@RequestMapping("/lucky/sendGoods")
@CommonTabCtrlInit(resource = "lucky_sendGoods")
public class SendGoodsCtrl extends FrameBaseCtrl<TbSendGoods> {
    @Autowired
    SendGoodsService sendGoodsService;
    @Autowired
    public void setCfrmBaseService(SendGoodsService commonTabService) {
        this.frameBaseService =sendGoodsService= commonTabService;
    }
}
