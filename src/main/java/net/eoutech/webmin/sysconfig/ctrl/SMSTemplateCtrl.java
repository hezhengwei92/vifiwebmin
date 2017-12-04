
package net.eoutech.webmin.sysconfig.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbSMSTemplate;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.sysconfig.service.SMSTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/sysconfig/sMSTemplate" )
@CommonTabCtrlInit( resource = "sysconfig_sMSTemplate" )
public class SMSTemplateCtrl extends FrameBaseCtrl< TbSMSTemplate > {
    SMSTemplateService sMSTemplateService;
    @Autowired
    public void setCfrmBaseService( SMSTemplateService commonTabService ) {
        this.frameBaseService = sMSTemplateService = commonTabService;
    }
    @Autowired
    AreaService areaService;
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("langSelData", areaService.getAreaLangSelData());
        return super.view(model);
    }
}
       