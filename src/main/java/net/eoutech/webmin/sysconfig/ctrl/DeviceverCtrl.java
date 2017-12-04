package net.eoutech.webmin.sysconfig.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbDevicever;
import net.eoutech.webmin.sysconfig.service.ConfigureService;
import net.eoutech.webmin.sysconfig.service.DeviceverService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * Created by wei on 2017/10/27.
 */
@Controller
@RequestMapping( "/sysconfig/devicever" )
@CommonTabCtrlInit( resource = "sysconfig_devicever" )
public class DeviceverCtrl extends FrameBaseCtrl<TbDevicever>{
    @Autowired
    VNSService vnsService;
    @Autowired
    DeviceverService deviceverService;
    @Autowired
    public void setCfrmBaseService( DeviceverService commonTabService ) {
        this.frameBaseService = deviceverService = commonTabService;
    }
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("agentSelData", vnsService.getVNSSelData());
        return super.view(model);
    }

}
