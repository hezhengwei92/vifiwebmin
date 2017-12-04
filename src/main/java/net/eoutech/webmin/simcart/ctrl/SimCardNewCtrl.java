
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
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbSCGroup;
import net.eoutech.webmin.commons.entity.TbSimCard;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.simcart.service.SCGroupService;
import net.eoutech.webmin.simcart.service.SimCardService;
import net.eoutech.webmin.simcart.vo.StatusVO;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;
import net.eoutech.webmin.vifi.service.SupplierService;
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
@RequestMapping("/vsw/simCardNew")
@CommonTabCtrlInit(resource = "vsw_simCardNew", viewName = "/page/vsw/simCardNew")
public class SimCardNewCtrl extends FrameBaseCtrl<TbSimCard> {
    SimCardService simCardService;
    @Autowired
    SCGroupService scGroupService;
    @Autowired
    SupplierService supplierService;
    @Autowired
    AreaService areaService;
    @Autowired
    ISPService ispService;
    @Autowired
    VNSService vnsService;
    

    @Autowired
    public void setCfrmBaseService(SimCardService commonTabService) {
        this.frameBaseService = simCardService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("scGroupSelData", scGroupService.getSCGroupSelData());
        view.put("areaSimCardStatusCount", simCardService.queryAreaSimCardStatusCount());
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("ispSelData", ispService.getISPSelData());
        view.put("supplierSelData", supplierService.getSupplierSelData());
        //view.put("outlineInfo", simCardService.getSimCardOutlineInfo());
        view.put("simcardAndTraffic", simCardService.getMonthDay4SimcardAndTraffic());
        view.put("agentSelData", vnsService.getVNSSelData());
        return super.view(model);
    }
    
    @RequestMapping(value = "outlineInfo.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject outlineInfo(){
    	CommonOutlineInfoVO vo = simCardService.getSimCardOutlineInfo();
    	return RestObject.newOk("", vo);
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
        Page<TbSimCard> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbSimCard entity, String actionName
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
    @RequestMapping(value = "grouplist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbSCGroup> page = scGroupService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = "groupsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax1(TbSCGroup entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = scGroupService.save(entity, isEdit, idList);
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
    @RequestMapping(value = "groupdelete.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax1(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	scGroupService.delete(idList);
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
    public RestObject simpPortInfoAjax() {
    	List<SIMAndSIMgrpVO> list = simCardService.selectCount();
        return RestObject.newOk("", list);
    }
    
    /**
     * 统计流量卡组中卡的状态
     */
    @RequestMapping(value = "selectCount8.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject simpPortInfoAjax8(int keySCGroupID) {
    	List<StatusVO> list = simCardService.selectCount8(keySCGroupID);
        return RestObject.newOk("", list);
    }
    
    
    
    
}
       