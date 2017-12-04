package net.eoutech.webmin.cdr.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.annotation.CommonTabCtrlInit;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.ActionUtils;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.LehmanCommonUtils;
import com.frame.commons.utils.LogUtils;
import com.frame.ctrl.FrameBaseCtrl;
import net.eoutech.webmin.cdr.service.SMSService;
import net.eoutech.webmin.commons.entity.TbSMS;
import net.eoutech.webmin.commons.entity.TbSMSTemplate;
import net.eoutech.webmin.sysconfig.service.SMSTemplateService;

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
@RequestMapping(value = "/user/smsNew" )
@CommonTabCtrlInit(viewName = "/page/user/smsNew", resource = "user_smsNew")
public class SmsNewCtrl extends FrameBaseCtrl<TbSMS> {

    private SMSService smsService;
    @Autowired
    private SMSTemplateService sMSTemplateService;

    @Autowired
    public void setSmsService( SMSService commonSmsService ) {
        this.frameBaseService = smsService = commonSmsService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view( Model model ) {
        JSONObject view = getModelAttrView( model );

        view.put( "smsGatewayInfo", smsService.getSMSGatewayCount() );
        view.put( "smsCountInfo", smsService.getSMSCountInfo() );
        view.put( "emaySMSCount", smsService.queryEmaySMSCount() );
        view.put( "smsCountByType", smsService.querySMSCountByType() );
        view.put( "smsCountMonthInfo", smsService.smsCountMonthInfo() );
        view.put( "queryDetails", smsService.queryDetails() );

        return super.view( model );
    }
    
    /*************************************   短信模板请求 ****************************************/
    
    
    /**
     * ajax查询
     */
    @RequestMapping(value = "smsTemplist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbSMSTemplate> page = sMSTemplateService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }

    /**
     * table 表数据详情查看
     */
    @RequestMapping(value = "smsTemptable-detail.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryTableDetails1() {
        JSONObject result = sMSTemplateService.queryTbDetails();
        return RestObject.newOk("", result);
    }

    /**
     * 单个数据详情查看
     */
    @RequestMapping(value = "smsTempsingle-detail.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject querySingleDetails1(String id) {
        JSONObject result = sMSTemplateService.querySingleDetails(id);
        return RestObject.newOk("", result);
    }


    /**
     * 多个数据详情查看
     */
    @RequestMapping(value = "smsTempmulti-detail.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryMultiDetails1(@RequestParam(value = "idList[]") List<String> idList) {
        JSONObject result = sMSTemplateService.queryMultiDetails(idList);
        return RestObject.newOk("", result);
    }


    /**
     * 保存
     */
    @RequestMapping(value = "smsTempsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax1(TbSMSTemplate entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = sMSTemplateService.save(entity, isEdit, idList);
            return RestObject.newOk(sucMsg, entity);
        } catch (DuplicateKeyException e) { // 唯一key重复
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
    @RequestMapping(value = "smsTempdelete.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax1(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	sMSTemplateService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
}
