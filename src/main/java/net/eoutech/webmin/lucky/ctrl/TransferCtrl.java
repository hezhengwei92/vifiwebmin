package net.eoutech.webmin.lucky.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbIntegralLucky;
import net.eoutech.webmin.commons.entity.TbTransfer;
import net.eoutech.webmin.lucky.service.TotalIntegralService;
import net.eoutech.webmin.lucky.service.TransferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wei on 2017/11/23.
 */
@Controller
@RequestMapping("/lucky/transfer")
@CommonTabCtrlInit(resource = "lucky_transfer")
public class TransferCtrl extends FrameBaseCtrl<TbTransfer> {
    @Autowired
    TransferService transferService;
    @Autowired
    public void setCfrmBaseService(TransferService commonTabService) {
        this.frameBaseService =transferService= commonTabService;
    }
}
