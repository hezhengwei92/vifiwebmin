package net.eoutech.webmin.uuwifi.ctrl;

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
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbGlobalSIM;
import net.eoutech.webmin.commons.entity.TbGlobalSIMGrp;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.uuwifi.service.GlobalSIMGrpService;
import net.eoutech.webmin.uuwifi.service.GlobalSIMService;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;
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
@RequestMapping("/vsw/globalSIMNew")
@CommonTabCtrlInit(resource = "vsw_globalSIMNew", viewName = "/page/vsw/globalSIMNew")
public class GlobalSIMNewCtrl extends FrameBaseCtrl<TbGlobalSIM> {
    GlobalSIMService globalSIMService;

    @Autowired
    GlobalSIMGrpService globalSIMGrpService;
    
    @Autowired
    AreaService areaService;
    @Autowired
    ISPService ispService;

    @Autowired
    AgentService agentService;

    @Autowired
    public void setCfrmBaseService(GlobalSIMService commonTabService) {
        this.frameBaseService = globalSIMService = commonTabService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        List<IdxViFiIDVO> list = globalSIMService.queryIdxViFiID();
        view.put("globalSIMGrpSelData", globalSIMGrpService.getGlobalSIMGrpSelData());
        
        view.put("areaSelData", areaService.getAreaSelData());
        //view.put("ispSelData", ispService.getISPSelDataOfName());
        view.put("ispSelData", ispService.getISPSelData());
        view.put("agentSelData", agentService.getAgentSelData());
        view.put("idxViFiIDVO", list);
        view.put("flowTop10", globalSIMService.queryFlowTop10());
        
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
        Page<TbGlobalSIM> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbGlobalSIM entity, String actionName
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
    
    
    
    /**
     * ajax查询
     */
    @RequestMapping(value = "list.ajax1", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbGlobalSIMGrp> page = globalSIMGrpService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = "save.ajax1", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax1(TbGlobalSIMGrp entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = globalSIMGrpService.save(entity, isEdit, idList);
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
    @RequestMapping(value = "delete.ajax1", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax1(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	globalSIMGrpService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
    
    /**
     * 统计
     */
    @RequestMapping(value = "selectCount.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject simpPortInfoAjax(Integer keyID) {
    	List<SIMAndSIMgrpVO> list = globalSIMService.selectCount();
        return RestObject.newOk("", list);
    }
    
    /**
     * 以下16.5.25启动卡新增相关数据
     * 
     */
    @RequestMapping(value="simStatisticInfo.ajax",method=RequestMethod.POST,produces=MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject simInfoAjax(){
    	List<SIMAndSIMgrpVO> list = globalSIMService.selectSimInfo();
		return RestObject.newOk("",list);
    	
    }
    
    /**
     * 最近充值记录查询
     */
    @RequestMapping(value="recentCharge.ajax", method=RequestMethod.POST, produces=MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject recentChargeRecord(){
    	List<SIMAndSIMgrpVO> list = globalSIMService.queryRecentCharge();
		return RestObject.newOk("",list);
    }
    
    
}
       