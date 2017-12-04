
package net.eoutech.webmin.agent.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.agent.service.AgentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;

@Controller
@RequestMapping("/agent/agent")
@CommonTabCtrlInit(resource = "agent_agent")
public class AgentCtrl extends FrameBaseCtrl<TbAgent> {

    AgentService agentService;

    @Autowired
    public void setCfrmBaseService(AgentService commonTabService) {
        this.frameBaseService = agentService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("parentsSelData", agentService.getParentsSelData());
        return super.view(model);
    }

    @Override
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(@RequestParam(value = "page", defaultValue = "1") int pageNumber, @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize, ServletRequest request) {

        RestObject restObject = super.queryAjax(pageNumber, pageSize, request);
        JSONObject pageView = (JSONObject) restObject.getData();
        return restObject;
    }
}
