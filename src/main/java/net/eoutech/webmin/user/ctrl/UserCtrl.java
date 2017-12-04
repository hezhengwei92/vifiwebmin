package net.eoutech.webmin.user.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2015/8/11.
 */
@Controller
@RequestMapping("/user/user")
@CommonTabCtrlInit(viewName = "/page/user/user",resource = "user_user")
public class UserCtrl extends FrameBaseCtrl<TbUser> {
    @Autowired
    UserService userService;
    @Autowired
    AgentService agentService;
    @Autowired
    AreaService areaService;
    @Autowired
    VNSService vnsService;
    @Autowired
    public void setCfrmBaseService(UserService commonTabService) {
        this.frameBaseService =userService= commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
//        view.put("agentSelData", agentService.getAgentSelData());
        view.put("agentSelData", vnsService.getVNSSelData());
        view.put("languageSelData", areaService.getAreaLangSelData());
        view.put("roamareacodesSelData", areaService.getAreaSelData());
        view.put("roamTimeZoneSelData", areaService.getAreaTimeZoneSelData());
        view.put("areaSelData", areaService.getAreaSelData());
        return super.view(model);
    }

    /**
     *导出注册用户
     */
    @RequestMapping(value = "/exportUserCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportRateCsvByDbAjax(String tbHead) {
        String data = userService.exportUserCsvByDb(tbHead);
        return RestObject.newOk("", data);
    }
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbUser entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {

        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);
        String agentName=UserUtils.getUserName();
        if(null==entity.getIdxAgentID() || "".equals(entity.getIdxAgentID())){
            entity.setIdxAgentID(agentName);
        }
        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = frameBaseService.save(entity, isEdit, idList);
            return RestObject.newOk(sucMsg, entity);

        } catch (DuplicateKeyException e) { // 唯一key
            // 重复
            String errorMsg = CommonUtils.lang("frame.tips.error.repeat_insert");
            // 取出重复的字段名
            String rapField = e.getCause().getMessage().replaceAll(".*entry '(.*?)'.*", "$1");
            actionMsg += String.format(errorMsg, rapField);
            throw new DuplicateKeyException(actionMsg);
        }
    }

}
