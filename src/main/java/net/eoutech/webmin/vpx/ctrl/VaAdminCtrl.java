package net.eoutech.webmin.vpx.ctrl;

import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.DateUtils;
import net.eoutech.webmin.vpx.service.VaAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.MessageFormat;
import java.util.Map;

/**
 * Created by Administrator on 2015/9/28.
 */
@Controller
@RequestMapping("/vpx")
public class VaAdminCtrl {
    @Autowired
    VaAdminService vaAdminService;


    @RequestMapping(value = "account", method = RequestMethod.GET)
    public String viewAccount(Model model) {
        return "page/commons/frameCommonTpl";
    }

    @RequestMapping(value = "call", method = RequestMethod.GET)
    public String viewCall() {
        return "page/vpx/accountOl";
    }

    @RequestMapping(value = "online-user", method = RequestMethod.GET)
    public String viewOnlineUser() {
        String curUri = ActionUtils.getRequest().getRequestURI();
        String[] curPermi = {"0", "0", "0", "0"};
        ActionUtils.getSession().setAttribute(curUri, curPermi);
        return "page/vpx/onlineUser";
    }

    @RequestMapping(value = "online-user/list.ajax", produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject onlineUserAjax() {
        return RestObject.newOk("", vaAdminService.queryOnlineUser());
    }


    /**
     * 统计接口
     */
    @RequestMapping(value = "statistics", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject statisticsAs() {

        Map<String, Object> statisticsInfo = vaAdminService.statisticsAsInfo();
        statisticsInfo.put("lastUpdate", DateUtils.formatDate());
        return RestObject.newOk("ok", statisticsInfo);
    }

    /**
     * jsonp 统计接口
     */
    @RequestMapping(value = "statistics_jsonp", method = RequestMethod.GET, produces = MediaTypes.TEXT_PLAIN)
    @ResponseBody
    public String statisticsAsJsonp(String jsonpcallback) {

        Map<String, Object> statisticsInfo = vaAdminService.statisticsAsInfo();
        statisticsInfo.put("lastUpdate", DateUtils.formatDate());

        String resJSON = JsonUtils.toJSONString(RestObject.newOk("", statisticsInfo));

        return MessageFormat.format("{0}({1})", jsonpcallback, resJSON);
    }


}
