
package net.eoutech.webmin.uuwifi.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.entity.TbGlobalSIMGrp;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.uuwifi.service.GlobalSIMGrpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/uuwifi/globalSIMGrp" )
@CommonTabCtrlInit( resource = "uuwifi_globalSIMGrp" )
public class GlobalSIMGrpCtrl extends FrameBaseCtrl< TbGlobalSIMGrp > {
    GlobalSIMGrpService globalSIMGrpService;

    @Autowired
    AreaService areaService;
    @Autowired
    ISPService ispService;

    @Autowired
    AgentService agentService;


    @Autowired
    public void setCfrmBaseService( GlobalSIMGrpService commonTabService ) {
        this.frameBaseService = globalSIMGrpService = commonTabService;
    }



    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        //view.put("ispSelData", ispService.getISPSelDataOfName());
        view.put("ispSelData", ispService.getISPSelData());
        view.put("agentSelData", agentService.getAgentSelData());
        return super.view(model);
    }


}
       