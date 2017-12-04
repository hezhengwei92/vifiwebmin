
package net.eoutech.webmin.vpx.ctrl;

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
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbGoIPDev;
import net.eoutech.webmin.commons.entity.TbGoIPGrp;
import net.eoutech.webmin.commons.entity.TbGoIPPort;
import net.eoutech.webmin.goip.service.GoIPDevService;
import net.eoutech.webmin.goip.service.GoIPPortService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import net.eoutech.webmin.vifi.service.GoIPGrpService;
import net.eoutech.webmin.vsw.service.VSWService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

@Controller
@RequestMapping(value={"/vpx/goIPDevNew"})
@CommonTabCtrlInit(resource = "vpx_goIPDevNew", viewName = "/page/vpx/goIPDevNew")
public class GoIPDevNew2Ctrl extends FrameBaseCtrl<TbGoIPDev> {
    GoIPDevService goIPDevService;
    @Autowired
    VSWService vswService;

    @Autowired
    GoIPPortService goIPPortService;
    
    @Autowired
    ViFiDeviceService viFiDeviceService;
    @Autowired
    GoIPGrpService goipGrpService;
    @Autowired
	AgentService agentService;

    @Autowired
    public void setCfrmBaseService(GoIPDevService commonTabService) {
        this.frameBaseService = goIPDevService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("graphView", goIPDevService.queryAllGoIPDevPortInfo());
        view.put("vswSelData", vswService.getVSWSelData());
        view.put("goipdevSelData", goIPDevService.getGoIPDevSelData());
        view.put("vifideviceSelData",viFiDeviceService.getViFiDeviceSelData());
        view.put("goipDevGrpData", goIPDevService.getGoIPDevGrpData());
        view.put("recentOnlineDev", goIPDevService.getRecentOnlineDev());
        view.put("activityPortsNum", goIPDevService.getActivityPortsNum());
        view.put("agentSelData", agentService.getAgentSelData());
        return super.view(model);
    }
    
    @RequestMapping(value = "outlineInfo.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject getOutlineInfo(){
    	CommonOutlineInfoVO vo = goIPDevService.getOutlineInfo();
    	return RestObject.newOk("", vo);
    }
    
    /**
     * ajax查询
     */
    @RequestMapping(value = "list.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbGoIPDev> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /*
    @RequestMapping(value = "simp-port-info.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject simpPortInfoAjax(Integer keyID) {
        TbSimPPort simPPort = simPPortService.get(keyID);
        return RestObject.newOk("", simPPort);
    }*/
    
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbGoIPDev entity, String actionName
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
    @RequestMapping(value = "queryDev.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        LogUtils.dbg("query  " + resource);
        return RestObject.newOk("graphView", goIPDevService.queryAllGoIPDevPortInfo());
    }
    
    
    @RequestMapping(value = "goip-port-info.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject goipPortInfoAjax(Integer keyID) {
        TbGoIPPort goIPPort = goIPPortService.get(keyID);
        return RestObject.newOk("", goIPPort);
    }
    
    /**
     * 查询：端口 
     * NOTICE：只有查询的权限
     * 原始地址加上了port：/goip/goIPDevNew/port
     */
    @RequestMapping(value = "portlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax2(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbGoIPPort> page = goIPPortService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    @RequestMapping(value = "grouplist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax3(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbGoIPGrp> page = goipGrpService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    @RequestMapping(value = "groupsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax3(TbGoIPGrp entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = goipGrpService.save(entity, isEdit, idList);
            return RestObject.newOk(sucMsg, entity);
        } catch (DuplicateKeyException e) { // 唯一key重复
            String errorMsg = CommonUtils.lang("frame.tips.error.repeat_insert");
            // 取出重复的字段名
            String rapField = e.getCause().getMessage().replaceAll(".*entry '(.*?)'.*", "$1");
            actionMsg += String.format(errorMsg, rapField);
            throw new DuplicateKeyException(actionMsg);
        }
    }
    
    @RequestMapping(value = "groupdelete.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax3(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	goipGrpService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
    
    @RequestMapping(value = "goipActivityPortsNum.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject getActivityPortsNum() {
        int num = goIPDevService.getActivityPortsNum();
        return RestObject.newOk("", num);
    }
}
       