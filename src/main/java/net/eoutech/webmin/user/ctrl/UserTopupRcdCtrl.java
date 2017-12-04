
package net.eoutech.webmin.user.ctrl;

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
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbSCGroup;
import net.eoutech.webmin.commons.entity.TbUserTopupRcd;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.user.service.UserTopupRcdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping( "/user/userTopupRcd" )
@CommonTabCtrlInit(  viewName = "/page/user/payRecord",resource = "user_userTopupRcd" )
public class UserTopupRcdCtrl extends FrameBaseCtrl< TbUserTopupRcd > {
    @Autowired
    UserTopupRcdService userTopupRcdService;
    @Autowired
    AgentService agentService;
    @Autowired
    VNSService vnsService;
    @Autowired
    public void setCfrmBaseService( UserTopupRcdService commonTabService ) {
        this.frameBaseService = userTopupRcdService = commonTabService;
    }




    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("agentSelData", vnsService.getVNSSelData());
        return super.view(model);
    }
    /**
     * ajax查询
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
        if(agent !=null){
        	queryParam.put("LIKE-|-idxAgentID", agent.getIdxAgentId()+"*");
        }
        LogUtils.dbg("query  " + resource);
        Page<TbUserTopupRcd> page = frameBaseService.query(pageNumber, pageSize, queryParam);
        	
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }

    /**
     * 导出充值记录
     */
    @RequestMapping(value = "/exportUserCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportRateCsvByDbAjax(String tbHead) {
        String data = userTopupRcdService.exportUserCsvByDb(tbHead);


        return RestObject.newOk("", data);
    }
}
       