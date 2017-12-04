
package net.eoutech.webmin.vsw.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbVSW;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.vsw.service.VSWService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/vsw/vsw")
@CommonTabCtrlInit(resource = "vsw_vsw")
public class VSWCtrl extends FrameBaseCtrl<TbVSW> {
    VSWService vSWService;

    @Autowired
    AreaService areaService;

    @Autowired
    ISPService ispService;

    @Autowired
    public void setCfrmBaseService(VSWService commonTabService) {
        this.frameBaseService = vSWService = commonTabService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("ispSelData", ispService.getISPSelDataOfName());
        return super.view(model);
    }
}
       