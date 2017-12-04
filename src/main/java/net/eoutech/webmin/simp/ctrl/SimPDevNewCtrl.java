
package net.eoutech.webmin.simp.ctrl;

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
import net.eoutech.webmin.commons.entity.TbSimPDev;
import net.eoutech.webmin.commons.entity.TbSimPDevGrp;
import net.eoutech.webmin.commons.entity.TbSimPPort;
import net.eoutech.webmin.simp.service.SimPDevNewService;
import net.eoutech.webmin.simp.service.SimPDevService;
import net.eoutech.webmin.simp.service.SimPPortService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import net.eoutech.webmin.vifi.service.SimPDevGrpService;
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
@RequestMapping("/vsw/simPDevNew")
@CommonTabCtrlInit(resource = "vsw_simPDevNew", viewName = "/page/vsw/simPDevNew")
public class SimPDevNewCtrl extends FrameBaseCtrl<TbSimPDev> {
    SimPDevNewService simPDevNewService;
    @Autowired
    VSWService vswService;
    @Autowired
    SimPPortService simPPortService;
    @Autowired
    SimPDevService simPDevService;
    @Autowired
    SimPDevGrpService simPDevGrpService;
    @Autowired
    ViFiDeviceService viFiDeviceService;
    @Autowired
	AgentService agentService;
    @Autowired
    VNSService vnsService;
    @Autowired
    public void setCfrmBaseService(SimPDevNewService commonTabService) {
        this.frameBaseService = simPDevNewService = commonTabService;
    }


    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("graphView", simPDevNewService.queryAllSimPDevPortInfo());
        view.put("vswSelData", vswService.getVSWSelData());
        view.put("simpdevSelData", simPDevService.getSimPDevSelData());
        view.put("uuwifiSelData",viFiDeviceService.getViFiDeviceSelData());
        view.put("simpDevGrpData", simPDevService.getsimPDevGrpData());
        //view.put("outlineInfo", simPDevNewService.getOutlineInfo());
        view.put("usingCardsCount", simPPortService.getUsingCardsCount());
//        view.put("agentSelData", agentService.getAgentSelData());
        view.put("agentSelData", vnsService.getVNSSelData());

        return super.view(model);
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
        Page<TbSimPDev> page = simPDevService.query(pageNumber, pageSize, queryParam);
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    
    @RequestMapping(value = "realTime4UsingCards.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject realTime4UsingCards() {
    	int usingCardsCount = simPPortService.getUsingCardsCount();

        RestObject rs=RestObject.newOk("", usingCardsCount);//RestObject( 0, "", data );
        return RestObject.newOk("", usingCardsCount);
    }
    
    /**
     * 保存  新增 修改 save.ajax
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbSimPDev entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = frameBaseService.save(entity, isEdit, idList);
            try{
                if (isEdit){//编辑
                    simPPortService.updatePort(entity);
                }else{//新增
//                simPPortService.insertPort(entity);
                }
            }catch (Exception e){
                e.printStackTrace();
            }
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
     * 删除   删除卡池 卡槽上的相关信息 卡槽上的卡也要删了  copy卡不删 ！
     */
    @RequestMapping(value = EUConst.URI_DELETE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
            simPDevService.deleteAll(idList);
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
    //返回卡池上的卡槽的信息
    @RequestMapping(value = "queryDev.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        LogUtils.dbg("query  " + resource);

        return RestObject.newOk("graphView", simPDevNewService.queryAllSimPDevPortInfo());
    }


    @RequestMapping(value = "simp-port-info.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject simpPortInfoAjax(Integer keyID) {
        TbSimPPort simPPort = simPPortService.get(keyID);
        return RestObject.newOk("", simPPort);
    }

    /**
     * ajax查询*端口查询
     */
    @RequestMapping(value = "portlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax2(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        LogUtils.dbg("query  " + resource);
        Page<TbSimPPort> page = simPPortService.query(pageNumber, pageSize, queryParam);
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        return RestObject.newOk("", pageView);
    }
    
    /**
     * ajax查询*端口查询
     */
    @RequestMapping(value = "grouplist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax3(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {
        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        LogUtils.dbg("query  " + resource);
        Page<TbSimPDevGrp> page = simPDevGrpService.query(pageNumber, pageSize, queryParam);
        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());
        return RestObject.newOk("", pageView);
    }
    @RequestMapping(value = "groupsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax2(TbSimPDevGrp entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = simPDevGrpService.save(entity, isEdit, idList);
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
    public RestObject deleteAjax2(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	simPDevGrpService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
    
    @RequestMapping(value = "outlineInfo.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject outlineInfo(){
    	CommonOutlineInfoVO vo = simPDevNewService.getOutlineInfo();
    	return RestObject.newOk("", vo);
    }
}
       