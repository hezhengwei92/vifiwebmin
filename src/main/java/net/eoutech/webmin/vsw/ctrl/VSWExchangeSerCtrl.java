package net.eoutech.webmin.vsw.ctrl;

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
import net.eoutech.webmin.commons.entity.TbSUStaticBind;
import net.eoutech.webmin.commons.entity.TbUUWiFiSession;
import net.eoutech.webmin.commons.entity.TbVSW;
import net.eoutech.webmin.commons.entity.VswStatisticInfo;
import net.eoutech.webmin.goip.service.GoIPDevService;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.simcart.service.SCGroupService;
import net.eoutech.webmin.simcart.service.SimBindRecordService;
import net.eoutech.webmin.simcart.service.SimBindService;
import net.eoutech.webmin.simcart.service.SimCardService;
import net.eoutech.webmin.simp.service.SimPDevService;
import net.eoutech.webmin.uuwifi.service.ViFiDevGroupService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import net.eoutech.webmin.vsw.service.UUWiFiSessionService;
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

@Controller
@RequestMapping("/vsw/vswExchangeSer")
@CommonTabCtrlInit(resource = "vsw_vswExchangeSer",viewName="/page/vsw/vswExchangeSer")
public class VSWExchangeSerCtrl extends FrameBaseCtrl<TbVSW> {
    VSWService vSWService;

    @Autowired
    AreaService areaService;

    @Autowired
    ISPService ispService;
    
    @Autowired
    SimBindService simBindService; 

    @Autowired
    SimBindRecordService simBindRecordService; 
    
    @Autowired
    UUWiFiSessionService uUWiFiSessionService;
    @Autowired
    ViFiDeviceService viFiDeviceService;
    @Autowired
    SimCardService simCardService;
    @Autowired
    SimPDevService simPDevService;
    @Autowired
    GoIPDevService goIPDevService;
    @Autowired
    VSWService vswService;
    @Autowired
	ViFiDevGroupService viFiDevGroupService;
    @Autowired
	SCGroupService sCGroupService;
	

    @Autowired
    public void setCfrmBaseService(VSWService commonTabService) {
        this.frameBaseService = vSWService = commonTabService;
    }

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("areaSelData", areaService.getAreaSelData());
        view.put("ispSelData", ispService.getISPSelDataOfName());
        
        //List<IdxViFiIDVO> listIdxViFiID = simBindService.queryIdxViFiID(); //没有被绑定的IdxViFiID
        //List<IdxSimCardIDVO> listIdxSimCardID = simBindService.queryIdxSimCardID();
        //List<IdxViFiIDVO> listIdxViFiIDED = simBindService.queryIdxViFiIDED(); //已经被绑定的IdxViFiID
        //List<IdxSimCardIDVO> listIdxSimCardIDED = simBindService.queryIdxSimCardIDED();
        //List<IdxViFiIDVO> listIdxViFiIDEDRecord = simBindService.queryIdxViFiIDEDRecord(); //tbSUStaticBindRecord 表中 已经被绑定的IdxViFiID
        //List<IdxSimCardIDVO> listIdxSimCardIDEDRecord = simBindService.queryIdxSimCardIDEDRecord();
         
        //view .put("listIdxViFiID", listIdxViFiID);
        //view .put("listIdxSimCardID", listIdxSimCardID);

        //view .put("listIdxViFiIDEDRecord", listIdxViFiIDEDRecord);
        //view .put("listIdxSimCardIDEDRecord", listIdxSimCardIDEDRecord);
        
//        view .put("listIdxViFiIDED", simBindService.getIdxViFiIDEDList());
//        view .put("listIdxSimCardIDED", simBindService.getIdxSimCardIDEDList());
        
        view.put("viFiDevGrpSelData", viFiDevGroupService.getDevGroupSelData());
        view.put("sCGroupSelData", sCGroupService.getSCGroupSelData());
        
        view.put("keysimcardIDSelData",simCardService.getSimcardIDSelData());
        view.put("keySimPDevIDSelData",simPDevService.getSimPDevSelData());
        view.put("keygoipdevSelData",goIPDevService.getGoIPDevSelData());
        view.put("keyvswidSelData",vswService.getVSWSelData());
        view.put("uuwifiSessionRecord", vswService.get10Record());
        view.put("sessionCount", vSWService.getRealTimeExchangeCount());
        //返回页面路径
        return super.view(model);
    }
    //概要信息的数据
    @RequestMapping(value = "vswStatisticInfo.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject vswStatisticInfo(){
    	VswStatisticInfo statisticInfoList = vSWService.getVswStatisticInfo();//new ArrayList<VswStatisticInfo>();
    	return RestObject.newOk("", statisticInfoList);
    }
    
    @RequestMapping(value = "realTime.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject realTime(){
    	int count = vSWService.getRealTimeExchangeCount();
    	return RestObject.newOk("", count);
    }
    
    /**
     * ajax查询 卡交换策略 TbSUStaticBind
     */
    @RequestMapping(value = "simBindlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax1(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");

        LogUtils.dbg("query  " + resource);
        Page<TbSUStaticBind> page = simBindService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = "simBindsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax1(TbSUStaticBind entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = simBindService.save(entity, isEdit, idList);
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
    @RequestMapping(value = "simBinddelete.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax1(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	simBindService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
    
    
    /**
     * ajax查询  卡交换队列数据
     */
    @RequestMapping(value = "sessionlist.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax2(
            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGE_SIZE) int pageSize,
            ServletRequest request) {

        Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
        //初始化参数：1 设备已连接  8 断网重连
//        Object[] status = {"0","1","2","8","9"};
//        queryParam.put("IN-|-status", status);// IN-|-status 会转成sql语句 where status in （11,12）
//        LogUtils.dbg("query  " + resource);

        Page<TbUUWiFiSession> page = uUWiFiSessionService.query(pageNumber, pageSize, queryParam);


        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = "sessionsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax2(TbUUWiFiSession entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = uUWiFiSessionService.save(entity, isEdit, idList);
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
    @RequestMapping(value = "sessiondelete.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax2(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	uUWiFiSessionService.delete(idList);
            LogUtils.dbg("delete " + resource);
            return RestObject.newOk(sucMsg);
        } catch (Exception e) {
            e.printStackTrace();
            String failureMsg = lanDel + CommonUtils.lang("failure") + " : " + e.getMessage();
            throw new FrameException(failureMsg);
        }
    }
    @RequestMapping(value = "sessionexportCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportUwifiByAjax(String tbHead) {
//        String data = uUWiFiSessionService.exportUwifiCsvByDb(tbHead);

        String data="aaa,bbb"+tbHead;
        return RestObject.newOk("", data);
    }


}
       