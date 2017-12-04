package net.eoutech.webmin.syslog.ctrl;

import java.util.ArrayList;
import java.util.List;
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

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAudit;
import net.eoutech.webmin.syslog.service.AuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping( "/syslog/audit" )
@CommonTabCtrlInit( resource = "syslog_audit" )
public class AuditCtrl extends FrameBaseCtrl< TbAudit > {

    @Autowired
    public void setCfrmBaseService( AuditService commonTabService ) {
        this.frameBaseService = commonTabService;
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
        Page<TbAudit> page = frameBaseService.query(pageNumber, pageSize, queryParam);
        List<TbAudit>	data = page.getContent();
        List<TbAudit>	result = new ArrayList<TbAudit>();
        for(TbAudit tbAudit:data){
        	String fields = tbAudit.getFields().replace("|", ",&nbsp ").replace("`", "");
        	tbAudit.setFields(fields);
        	result.add(tbAudit);
        }
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", result);

        return RestObject.newOk("", pageView);
    }


}
