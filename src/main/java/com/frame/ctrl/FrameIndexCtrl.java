package com.frame.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.*;
import com.frame.commons.web.UserProfile;
import com.frame.service.FrameIndexService;
import com.frame.service.FrameUserService;
import org.apache.shiro.session.Session;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;
import java.util.Locale;


@Controller
public class FrameIndexCtrl {
    @Autowired
    private FrameUserService frameUserService;

    @Autowired
    private FrameIndexService frameIndexService;


    private static final String ADM_PSW_RESOUCE = "frame_password";


    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String indexView(Model model, HttpServletRequest request) {
        LogUtils.dbg("access / page");
        Locale locale = RequestContextUtils.getLocaleResolver(request).resolveLocale(request);

        Collection<JSONObject> homeMenu = frameIndexService.createSysMenu();
        model.addAttribute("homeMenu", JsonUtils.toJSONString(homeMenu));
        model.addAttribute("language", locale.toString());

        return "page/frame/index";
    }

    // 各种状态码页面~
    @RequestMapping(value = "state/{stateNum}", method = {RequestMethod.GET, RequestMethod.POST})
    public String statePage(@PathVariable String stateNum) {
        return "page/commons/state/" + stateNum;
    }

    @RequestMapping(value = "login", method = {RequestMethod.GET, RequestMethod.POST})
    public String loginView(Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
        UserProfile userInfo = UserUtils.getUserProfile();
        if (userInfo != null) {
            response.sendRedirect(request.getContextPath() + "/index");
        }

        // 根据验证异常类名获得国际化错误信息,  提示给用户知道
        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String errorMsg = null;
        if (error != null) {
            String[] packName = error.split("\\.");
            errorMsg = CommonUtils.lang("page.login.error." + packName[packName.length - 1]);// 取异常 类名
            errorMsg = errorMsg == null ? CommonUtils.lang("page.login.error") : errorMsg; // 如果未知错误,默认一个错误提示
        }

        model.addAttribute("errorMsg", errorMsg);
//        model.addAttribute("errorMsg", "falire");


        return "page/frame/login";
    }


    @RequestMapping(value = "/frame/password", method = RequestMethod.GET)
    public ModelAndView passwordView() {
        LogUtils.dbg("access System welcome page");
        String curUri = ActionUtils.getRequest().getRequestURI();
        String[] curPermi = (String[]) ActionUtils.getSession().getAttribute(curUri);
        if (curPermi == null) {
            // 操作许可   0|0|0|0 对应,details|add|edit|delete|报表? ,0=许可,1=禁止
            String curPermiStr = frameUserService.getPermissions(UserUtils.getUserName(), ADM_PSW_RESOUCE);
            curPermi = curPermiStr.split("\\|");
            ActionUtils.getSession().setAttribute(curUri, curPermi);
        }

        return new ModelAndView("page/frame/framePassword");
    }

    @RequestMapping(value = "/frame/password/save.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject updatePasswordAjax(String userName, String oldPsw, String cfmPsw) {
        int result = frameUserService.updatePassword(userName, oldPsw, cfmPsw);
        if (result == 1)
            return RestObject.newOk(CommonUtils.lang("frame.password.update_success"));
        else
            return RestObject.newError(CommonUtils.lang("frame.tips.error.unknown"));
    }
}
