package net.eoutech.webmin.vpx.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbTrunk;
import net.eoutech.webmin.vifi.service.SupplierService;
import net.eoutech.webmin.vpx.service.TrunkService;
import net.eoutech.webmin.vpx.service.VPXService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/vpx/trunk")
@CommonTabCtrlInit(resource = "vpx_trunk",viewName = "page/vpx/trunk")
public class TrunkCtrl extends FrameBaseCtrl<TbTrunk> {
    @Autowired
    public void setCfrmBaseService(TrunkService commonTabService) {
        this.frameBaseService = commonTabService;
    }

    @Autowired
    SupplierService supplierService;
    @Autowired
    VPXService vpxService;

    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("supplierSelData", supplierService.getSupplierSelData());
        view.put("vpxSelData", vpxService.getVPXSelData());
        return super.view(model);
    }

}
