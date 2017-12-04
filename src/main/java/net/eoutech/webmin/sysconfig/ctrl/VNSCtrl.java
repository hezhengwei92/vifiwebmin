
package net.eoutech.webmin.sysconfig.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbVNS;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/sysconfig/vns" )
@CommonTabCtrlInit( resource = "sysconfig_vns" )
public class VNSCtrl extends FrameBaseCtrl< TbVNS > {
    VNSService vNSService;
    @Autowired
    public void setCfrmBaseService( VNSService commonTabService ) {
        this.frameBaseService = vNSService = commonTabService;
    }
    @Autowired
    AreaService areaService;
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("languageSelData",areaService.getAreaLangSelData());
        view.put("currencySelData",areaService.getAreaCurrencySelData());
        return super.view(model);
    }
}
       