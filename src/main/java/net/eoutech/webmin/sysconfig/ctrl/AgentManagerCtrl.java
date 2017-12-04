package net.eoutech.webmin.sysconfig.ctrl;

import java.util.Map;
import javax.servlet.ServletRequest;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbAgentAdditionRcd;
import net.eoutech.webmin.commons.entity.TbAgentDeductionRcd;
import net.eoutech.webmin.sysconfig.service.AgentAdditionRcdNewService;
import net.eoutech.webmin.sysconfig.service.AgentDeductionRcdNewService;
import net.eoutech.webmin.sysconfig.service.AgentManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping( "/sysconfig/agentManager" )
@CommonTabCtrlInit( viewName="/page/sysconfig/agentManager", resource = "sysconfig_agentManager" )
public class AgentManagerCtrl extends FrameBaseCtrl< TbAgent > {

	AgentManagerService agentManagerService;
	@Autowired
	AgentAdditionRcdNewService agentAdditionRcdNewService;
	@Autowired
	AgentDeductionRcdNewService agentDeductionRcdNewService;
	
    @Autowired
    public void setCfrmBaseService( AgentManagerService commonTabService ) {
        this.frameBaseService = agentManagerService = commonTabService;
    }
    
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("parentsSelData", agentManagerService.getParentsSelData());
        view.put("agentSelData", agentManagerService.getAgentSelData());
        return super.view(model);
    }
    


    
    /**
     * ajax查询
     */
    @RequestMapping(value = "agentAdditionRcdlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        
        LogUtils.dbg("query  " + resource);
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
        }
        Page<TbAgentAdditionRcd> page = agentAdditionRcdNewService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    
    /**
     * ajax查询
     */
    @RequestMapping(value = "agentDeductionRcdlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax2(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
        }
        Page<TbAgentDeductionRcd> page = agentDeductionRcdNewService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }


}