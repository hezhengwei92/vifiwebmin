package com.frame.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.*;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.constant.EUConst;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;


/**
 * 通用表操作 controller
 *
 * @param <T_Entity>
 */
public abstract class FrameBaseCtrl<T_Entity> {
    // 并没有什么用,,,让编译器去加载 LogUtils类而已.  不然不知道为什么,运行时报错加载不到LogUtils类 TMD
    public static LogUtils logUtils = new LogUtils();

    // 默认每页显示数据条数
    protected final String PAGE_SIZE = "12";

    protected FrameBaseService<T_Entity> frameBaseService;
    // 视图文件
    protected String viewName = null;
    // 资源名
    protected String resource = null;


    public FrameBaseCtrl() {
        CommonTabCtrlInit commonTabCtrlInit = this.getClass().getAnnotation(CommonTabCtrlInit.class);
        if (commonTabCtrlInit == null) {
            throw new RuntimeException("请在类上使用注解配置信息.例:@CommonTabCtrlInit(viewName = \"vifiCtrlCmd\",resource = \"vifi_ctrlcmd\" )");
        }
        viewName = commonTabCtrlInit.viewName();//viewName 返回视图  如果没有 则是返回默认的视图名  /page/commons/frameCommonTpl
        resource = commonTabCtrlInit.resource();//resource 查询数据库中 此次登录对象的权限 例如 0|0|0|0
    }

    /**
     * 获得视图模型,中属性"view":{JSONObject} ,没有则创建     111
     */
    public JSONObject getModelAttrView(Model model) {
        Map<String, Object> modelMap = model.asMap();
        // 视图数据对象.没有则建立
        JSONObject view = modelMap.containsKey("view") ? (JSONObject) modelMap.get("view") : new JSONObject();
        modelMap.put("view", view);
        return view;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        String agentName = UserUtils.getUserName();
        LogUtils.dbg(" access " + resource + " page ");

        JSONObject view = getModelAttrView(model);

        String curUri = ActionUtils.getRequest().getRequestURI();
        String[] curPermi = (String[]) ActionUtils.getSession().getAttribute(curUri);

        if (curPermi == null) {
            // 操作许可   0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止
            String curPermiStr = frameBaseService.getPermissions(agentName, resource);
            curPermi = curPermiStr.split("\\|");
            ActionUtils.getSession().setAttribute(curUri, curPermi);
        }

        view.put("permissions", curPermi);
        view.put("agentName",agentName);

        return viewName;
    }


    /**
     * ajax查询  list.ajax
     */
    @RequestMapping(value = EUConst.URI_QUERY_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource); 
        Page<T_Entity> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }

    /**
     * table 表数据详情查看 table-detail.ajax
     */
    @RequestMapping(value = EUConst.URI_TABLE_DETAIL_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryTableDetails() {
        JSONObject result = frameBaseService.queryTbDetails();
        return RestObject.newOk("", result);
    }

    /**
     * 单个数据详情查看    对应的请求： /vsw/simPDevNew/single-detail.ajax
     */
    @RequestMapping(value = EUConst.URI_SINGLE_DETAIL_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject querySingleDetails(String id) {
        JSONObject result = frameBaseService.querySingleDetails(id);
        return RestObject.newOk("", result);
    }


    /**
     * 多个数据详情查看
     */
    @RequestMapping(value = EUConst.URI_MULTI_DETAIL_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryMultiDetails(@RequestParam(value = "idList[]") List<String> idList) {
        JSONObject result = frameBaseService.queryMultiDetails(idList);
        return RestObject.newOk("", result);
    }


    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(T_Entity entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {

        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

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


    /**
     * 删除
     */
    @RequestMapping(value = EUConst.URI_DELETE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
            frameBaseService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }

    //导出表记录
   @RequestMapping(value = "/exportCsvv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportRateCsvByDbAjax(String tbHead) {
        String data = frameBaseService.exportCsvByDb(tbHead);

     //  String data="gg";

        return RestObject.newOk("", data);
    }
}
