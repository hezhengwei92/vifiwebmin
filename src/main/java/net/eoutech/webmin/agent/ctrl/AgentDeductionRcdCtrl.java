
package net.eoutech.webmin.agent.ctrl;

import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbAgentDeductionRcd;
import net.eoutech.webmin.agent.service.AgentDeductionRcdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/agent/agentDeductionRcd" )
@CommonTabCtrlInit( resource = "agent_agentDeductionRcd" )
public class AgentDeductionRcdCtrl extends FrameBaseCtrl< TbAgentDeductionRcd > {
    AgentDeductionRcdService agentDeductionRcdService;
    @Autowired
    public void setCfrmBaseService( AgentDeductionRcdService commonTabService ) {
        this.frameBaseService = agentDeductionRcdService = commonTabService;
    }

}
       