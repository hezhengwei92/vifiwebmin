
package net.eoutech.webmin.cdr.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSMS;
import net.eoutech.webmin.cdr.service.SMSService;
import net.eoutech.webmin.rate.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/cdr/sms" )
@CommonTabCtrlInit( resource = "cdr_sms" )
public class SMSCtrl extends FrameBaseCtrl< TbSMS > {
    SMSService sMSService;
    @Autowired
    public void setCfrmBaseService( SMSService commonTabService ) {
        this.frameBaseService = sMSService = commonTabService;
    }


}
       