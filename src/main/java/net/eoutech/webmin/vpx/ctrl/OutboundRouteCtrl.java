
package net.eoutech.webmin.vpx.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbOutboundRoute;
import net.eoutech.webmin.vpx.service.OutboundRouteService;
import net.eoutech.webmin.vpx.service.TrunkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/vpx/outboundRoute")
@CommonTabCtrlInit(resource = "vpx_outboundRoute")
public class OutboundRouteCtrl extends FrameBaseCtrl<TbOutboundRoute> {
    OutboundRouteService outboundRouteService;

    @Autowired
    public void setCfrmBaseService(OutboundRouteService commonTabService) {
        this.frameBaseService = outboundRouteService = commonTabService;
    }

    @Autowired
    TrunkService trunkService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("trunkSelData", trunkService.getTrunkSelData());
        return super.view(model);
    }


}
       