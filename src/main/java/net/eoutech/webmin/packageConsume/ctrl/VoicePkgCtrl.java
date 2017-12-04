package net.eoutech.webmin.packageConsume.ctrl;

import java.util.Map;
import javax.servlet.ServletRequest;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.entity.TbUserSuite;
import net.eoutech.webmin.user.service.UserService;
import net.eoutech.webmin.user.service.UserSuiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping( "/packageConsume/voicePkg" )
@CommonTabCtrlInit( resource = "packageConsume_voicePkg" )
public class VoicePkgCtrl extends FrameBaseCtrl< TbUserSuite > {
    UserSuiteService userSuiteService;
    @Autowired
    public void setCfrmBaseService( UserSuiteService commonTabService ) {
        this.frameBaseService = userSuiteService = commonTabService;
    }
    /**
     * 获得组,select 控件数据
     */
    @Autowired
    UserService userService;

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        //JSONObject view = getModelAttrView(model);
        //view.put("phoneNumSelData", userService.getphoneNumSelData());
        return super.view(model);
    }

    @RequestMapping(value = "list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        LogUtils.dbg("query  " + resource);
        //初始查询参数：套餐类型["L","本地(呼出)通话"],["I","国际(呼出)通话"]
        Object[] rateMode = {"L","I"};
        queryParam.put("IN-|-suiteType", rateMode);
        Page<TbUserSuite> page = frameBaseService.query(pageNumber, pageSize, queryParam);
        
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        return RestObject.newOk("", pageView);
    }
}