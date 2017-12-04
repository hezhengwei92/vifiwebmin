package net.eoutech.webmin.simcart.ctrl;

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
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbSUStaticBind;
import net.eoutech.webmin.commons.entity.TbSUStaticBindRecord;
import net.eoutech.webmin.simcart.service.SimBindRecordService;
import net.eoutech.webmin.simcart.service.SimBindService;
import net.eoutech.webmin.simcart.vo.IdxSimCardIDVO;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;
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
@RequestMapping("/vsw/simBind")
@CommonTabCtrlInit(resource = "vsw_simBind", viewName = "/page/simcard/simBind")
public class SimBindCtrl extends FrameBaseCtrl<TbSUStaticBind> { 
    SimBindService simBindService; 

    @Autowired
    SimBindRecordService simBindRecordService; 
    
    @Autowired
    public void setCfrmBaseService(SimBindService commonTabService) {
        this.frameBaseService = simBindService = commonTabService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        List<IdxViFiIDVO> listIdxViFiID = simBindService.queryIdxViFiID(); //没有被绑定的IdxViFiID
        List<IdxSimCardIDVO> listIdxSimCardID = simBindService.queryIdxSimCardID(); //没有被绑定的IdxViFiID
        
        //List<IdxViFiIDVO> listIdxViFiIDED = simBindService.queryIdxViFiIDED(); //已经被绑定的IdxViFiID
        //List<IdxSimCardIDVO> listIdxSimCardIDED = simBindService.queryIdxSimCardIDED(); //已经被绑定的IdxViFiID
        
        List<IdxViFiIDVO> listIdxViFiIDEDRecord = simBindService.queryIdxViFiIDEDRecord(); //tbSUStaticBindRecord 表中 已经被绑定的IdxViFiID
        List<IdxSimCardIDVO> listIdxSimCardIDEDRecord = simBindService.queryIdxSimCardIDEDRecord(); //tbSUStaticBindRecord 表中 已经被绑定的IdxViFiID
         
        view .put("listIdxViFiID", listIdxViFiID);
        view .put("listIdxSimCardID", listIdxSimCardID);
        //view .put("listIdxViFiIDED", listIdxViFiIDED);
        //view .put("listIdxSimCardIDED", listIdxSimCardIDED);
        view .put("listIdxViFiIDED", simBindService.getIdxViFiIDEDList());
        view .put("listIdxSimCardIDED", simBindService.getIdxSimCardIDEDList());
        view .put("listIdxViFiIDEDRecord", listIdxViFiIDEDRecord);
        view .put("listIdxSimCardIDEDRecord", listIdxSimCardIDEDRecord);
        
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
        Page<TbSUStaticBind> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbSUStaticBind entity, String actionName
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
        Page<TbSUStaticBindRecord> page = simBindRecordService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    } 
    
    /**
     * 保存
     */
    /*@RequestMapping(value = "save.ajax1", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
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
    }*/


    /**
     * 删除
     */
    @RequestMapping(value = "delete.ajax1", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax1(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	simBindRecordService.delete(idList);
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
    /*@RequestMapping(value = "selectCount.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject simpPortInfoAjax(Integer keyID) {
    	List<SIMAndSIMgrpVO> list = globalSIMService.selectCount();
        return RestObject.newOk("", list);
    }*/


}
       