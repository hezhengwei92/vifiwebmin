package net.eoutech.webmin.packageConsume.ctrl;

import java.util.Map;

import javax.servlet.ServletRequest;

import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbConsumerPackage;
import net.eoutech.webmin.sysconfig.service.ConsumerPkgService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;

@Controller
@RequestMapping( "/packageConsume/consume" )
@CommonTabCtrlInit( viewName="/page/packageConsume/consume", resource = "packageConsume_consume" )
public class ConsumerPkgCtrl extends FrameBaseCtrl<TbConsumerPackage> {
	
	ConsumerPkgService consumerPkgService;
	@Autowired
	AgentService agentService;
    @Autowired
    VNSService vnsService;
    
	@Autowired
    public void setCfrmBaseService( ConsumerPkgService commonTabService ) {
        this.frameBaseService = consumerPkgService = commonTabService;
    }
    
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
//        view.put("agentSelData", agentService.getAgentSelData());vnsService
        view.put("agentSelData", vnsService.getVNSSelData());

        return super.view(model);
    }
    
    /**  http://localhost:8080/vifiwebmin/packageConsume/consumelist.ajax?pageSize=25&page=1
     * ajax查询
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbConsumerPackage> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
	
}