package net.eoutech.webmin.vpx.ctrl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAPPAuth;
import net.eoutech.webmin.commons.entity.TbAPPAuth2;
import net.eoutech.webmin.commons.entity.TbAPPAuthRcd;
import net.eoutech.webmin.commons.entity.TbAPPServer;
import net.eoutech.webmin.commons.entity.TbAPPServer2;
import net.eoutech.webmin.vpx.service.APPAuthRcdService;
import net.eoutech.webmin.vpx.service.APPAuthService;
import net.eoutech.webmin.vpx.service.APPServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/vpx/LaiXunAuth")
@CommonTabCtrlInit(resource = "vpx_LaiXunAuth",viewName = "page/vpx/LaiXunAuth")
public class LaiXunAuthenticationCtrl extends FrameBaseCtrl<TbAPPServer> {
	
	private APPServerService appServerService;
	@Autowired
	private APPAuthService appAuthService;
	@Autowired
	private APPAuthRcdService appAuthRcdService;
	
	//每个子tab的权限问题?
    @Autowired
    public void setCfrmBaseService(APPServerService commonTabService) {
        this.frameBaseService = appServerService = commonTabService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("authRemain", appServerService.getAuthRemain());
        view.put("authSum", appServerService.getAuthSum());
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
        LogUtils.dbg("query  " + resource);
        Page<TbAPPServer> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        //表外字段：特殊处理
        List<TbAPPServer> appServerList = page.getContent();
        List<TbAPPServer2> result = new ArrayList<TbAPPServer2>();
        for(TbAPPServer vo : appServerList){
        	result.add(new TbAPPServer2(vo, appServerService.getServerLicenseNum(vo.getIdxASCode())));
        }
        pageView.put("contentList", result);
        return RestObject.newOk("", pageView);
    }

    @RequestMapping(value = "appAuthlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        //企业名称的搜索条件：将企业名称转化成企业编码
        
        LogUtils.dbg("query  " + resource);
        Page<TbAPPAuth> page = appAuthService.query(pageNumber, pageSize, queryParam);
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        //表外字段：company
        List<TbAPPAuth> list = page.getContent();
        List<TbAPPAuth2> result = new ArrayList<TbAPPAuth2>();
        for(TbAPPAuth vo: list){
        	result.add(new TbAPPAuth2(vo, appServerService.getCompanyBycode(vo.getIdxASCode())));
        }
        pageView.put("contentList", result);
        return RestObject.newOk("", pageView);
    }

    @RequestMapping(value = "appAuthRcdlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax2(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        LogUtils.dbg("query  " + resource);
        Page<TbAPPAuthRcd> page = appAuthRcdService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        return RestObject.newOk("", pageView);
    }
    
    
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbAPPServer entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = frameBaseService.save(entity, isEdit, idList);
            return RestObject.newOk(sucMsg, entity);
        } catch (DuplicateKeyException e) { // 唯一key重复
            String errorMsg = CommonUtils.lang("frame.tips.error.repeat_insert");
            // 取出重复的字段名
            String rapField = e.getCause().getMessage().replaceAll(".*entry '(.*?)'.*", "$1");
            actionMsg += String.format(errorMsg, rapField);
            throw new DuplicateKeyException(actionMsg);
        }
    }
//    /**
//     * 保存
//     */
//    @RequestMapping(value = "appAuthsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
//    @ResponseBody
//    public RestObject saveAjax(TbAPPAuth entity, String actionName
//            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
//        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
//        LogUtils.dbg(actionName + resource);
//
//        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
//        try {
//            String sucMsg = actionName + CommonUtils.lang("success");
//            entity = appAuthService.save(entity, isEdit, idList);
//            return RestObject.newOk(sucMsg, entity);
//        } catch (DuplicateKeyException e) { // 唯一key重复
//            String errorMsg = CommonUtils.lang("frame.tips.error.repeat_insert");
//            // 取出重复的字段名
//            String rapField = e.getCause().getMessage().replaceAll(".*entry '(.*?)'.*", "$1");
//            actionMsg += String.format(errorMsg, rapField);
//            throw new DuplicateKeyException(actionMsg);
//        }
//    }

}
