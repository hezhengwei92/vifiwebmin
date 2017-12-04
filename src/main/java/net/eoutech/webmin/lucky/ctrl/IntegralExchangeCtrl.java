package net.eoutech.webmin.lucky.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbBanner;
import net.eoutech.webmin.commons.entity.TbIntegralExchange;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.lucky.service.IntegralExchangeService;
import net.eoutech.webmin.user.service.UserService;
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
 * Created by wei on 2017/11/23.
 */
@Controller
@RequestMapping("/lucky/integralExchange")
@CommonTabCtrlInit(resource = "lucky_integralExchange")
public class IntegralExchangeCtrl  extends FrameBaseCtrl<TbIntegralExchange> {
    @Autowired
    IntegralExchangeService integralExchangeService;
    @Autowired
    public void setCfrmBaseService(IntegralExchangeService commonTabService) {
        this.frameBaseService =integralExchangeService= commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model){
        JSONObject view = getModelAttrView(model);
        // view.put("agentSelData",agentService.getAgentSelData());
        return super.view(model);
    }

//    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
//    @ResponseBody
//    public RestObject queryAjax(
//            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
//            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
//            ServletRequest request) {
//
//        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
//
//        LogUtils.dbg("query  " + resource);
//        Page<TbIntegralExchange> page = frameBaseService.query(pageNumber, pageSize, queryParam);
//
//        JSONObject pageView = LehmanCommonUtils.createPageView(page);
//        pageView.put("contentList", page.getContent());
//
//        return RestObject.newOk("", pageView);
//    }


}
