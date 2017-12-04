package net.eoutech.webmin.user.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.*;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbUserFlow;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.user.service.UserFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * Created by wei on 2017/10/31.
 * 用户当月可用流量，总共可用流量
 */
@Controller
@RequestMapping( "/user/userflow" )
@CommonTabCtrlInit(resource = "user_userflow" )
public class UserFlowCtrl extends FrameBaseCtrl<TbUserFlow>{
    @Autowired
    UserFlowService userFlowService;
    @Autowired
    VNSService vnsService;
    @Autowired
    public void setCfrmBaseService(UserFlowService commonTabService){
        this.frameBaseService = userFlowService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model){
        JSONObject view = getModelAttrView(model);
        view.put("agentSelData",vnsService.getVNSSelData());
        return super.view(model);
    }

    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbUserFlow> page = userFlowService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }


}
