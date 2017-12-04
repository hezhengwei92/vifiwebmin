package net.eoutech.webmin.freeflow.ctrl;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.*;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.banner.service.BannerService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbBanner;
import net.eoutech.webmin.commons.entity.TbFreeFlow;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.commons.utils.ToolRandoms;
import net.eoutech.webmin.freeflow.service.FreeFlowService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by wei on 2017/9/20.
 */
@Controller
@RequestMapping( "/user/freeflow" )
@CommonTabCtrlInit(resource = "user_freeflow" )
public class FreeFlowCtrl extends FrameBaseCtrl<TbFreeFlow> {


    @Autowired
    private FreeFlowService freeFlowService;
    @Autowired
    private VNSService vnsService;
    @Autowired
    public void setCfrmBaseService(FreeFlowService commonTabService){
        this.frameBaseService = freeFlowService = commonTabService;
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
        Page<TbFreeFlow> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }


    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbFreeFlow entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {

        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);
        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
//        boolean boo=ToolRandoms.compare_date(new Date(),entity.getEffectiveTm());
//        if (!boo){
//            throw new Exception(" 有效时间应当大于当前时间 ！");
//        }
        String agentName= UserUtils.getUserName();
        TbUser tbUser=freeFlowService.queryUser(entity,agentName);
        if (null==tbUser){
            return RestObject.newOk("添加失败，不存在此用户，请正确输入用户信息！", entity);
        }
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            freeFlowService.save(entity,tbUser);
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
            freeFlowService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
}
