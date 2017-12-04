
package net.eoutech.webmin.vpx.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbVPX;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.vpx.service.VPXService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/vpx/vpx")
@CommonTabCtrlInit(resource = "vpx_vpx",viewName = "page/vpx/vpx")
public class VPXCtrl extends FrameBaseCtrl<TbVPX> {
    VPXService vPXService;

    @Autowired
    public void setCfrmBaseService(VPXService commonTabService) {
        this.frameBaseService = vPXService = commonTabService;
    }

    @Autowired
    AreaService areaService;

    @Autowired
    ISPService ispService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("ispSelData", ispService.getISPSelDataOfName());
        return super.view(model);
    }


}
       