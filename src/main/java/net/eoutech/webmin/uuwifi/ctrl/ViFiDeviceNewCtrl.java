package net.eoutech.webmin.uuwifi.ctrl;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletRequest;
import net.eoutech.webmin.agent.service.AgentService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.DateVO;
import net.eoutech.webmin.commons.entity.TbViFiDevGroup;
import net.eoutech.webmin.commons.entity.TbViFiDevice;
import net.eoutech.webmin.rate.service.RateService;
import net.eoutech.webmin.sysconfig.service.VNSService;
import net.eoutech.webmin.syslog.service.VifiActionService;
import net.eoutech.webmin.uuwifi.service.ViFiDevGroupService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import net.eoutech.webmin.uuwifi.vo.DeviceAndGroupVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

@Controller
@RequestMapping( value={"/vsw/viFiDeviceNew"} )
@CommonTabCtrlInit(resource = "vsw_viFiDeviceNew",viewName = "page/vsw/viFiDeviceNew")
public class ViFiDeviceNewCtrl extends FrameBaseCtrl<TbViFiDevice> {
	ViFiDeviceService viFiDeviceService;

    @Autowired
    ViFiDevGroupService viFiDevGroupService;
    @Autowired
    VNSService vnsService;
    @Autowired
    AgentService agentService;
    @Autowired
    RateService rateService;
    @Autowired
	VifiActionService actionService;

    @Autowired
    public void setCfrmBaseService(ViFiDeviceService commonTabService) {
        this.frameBaseService = viFiDeviceService = commonTabService;
    }
    
    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        JSONObject view = getModelAttrView(model);
        view.put("vnsSelData", vnsService.getVNSSelData());
        view.put("devGroupSelData", viFiDevGroupService.getDevGroupSelData());
        view.put("agentSelData", vnsService.getVNSSelData());
//        view.put("hardwareVerSelData", viFiDevGroupService.getDevGroup1SelData());
        view.put("firmwareVerSelData", viFiDevGroupService.getDevGroup2SelData());
//        view.put("softwareVerSelData", viFiDevGroupService.getDevGroup3SelData());
        //view.put("outlineInfo", viFiDeviceService.getOutlineInfo());
        view.put("devCount4china", viFiDeviceService.devCount4china());
        view.put("recentOnlineDev", viFiDeviceService.getRecentOnlineDev());
        return super.view(model);
    }
    
    @RequestMapping(value = "outlineInfo.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject outlineInfo(){
    	CommonOutlineInfoVO vo = viFiDeviceService.getOutlineInfo();
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
        Page<TbViFiDevice> page = frameBaseService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    /**
     * 保存
     */
    @RequestMapping(value = EUConst.URI_SAVE_AJAX, method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax(TbViFiDevice entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);
        entity.setIdxDevGrpID("1");
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
        Page<TbViFiDevGroup> page = viFiDevGroupService.query(pageNumber, pageSize, queryParam);

        JSONObject pageView = LehmanCommonUtils.createPageView(page);
        pageView.put("contentList", page.getContent());

        return RestObject.newOk("", pageView);
    }
    
    /**
     * 保存
     */
    @RequestMapping(value = "groupsave.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject saveAjax1(TbViFiDevGroup entity, String actionName
            , @RequestParam(value = "idList[]", required = false) List<String> idList) throws Exception {
        boolean isEdit = CommonUtils.lang("edit").equals(actionName);
        LogUtils.dbg(actionName + resource);

        String actionMsg = actionName + CommonUtils.lang("failure") + " : ";
        try {
            String sucMsg = actionName + CommonUtils.lang("success");
            entity = viFiDevGroupService.save(entity, isEdit, idList);
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
    @RequestMapping(value = "groupdelete.ajax", produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject deleteAjax1(@RequestParam(value = "idList[]") List<String> idList) {
        String lanDel = CommonUtils.lang("delete");
        String sucMsg = lanDel + CommonUtils.lang("success");

        try {
        	viFiDevGroupService.delete(idList);
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
    	List<DeviceAndGroupVO> list = viFiDeviceService.selectCount();
        return RestObject.newOk("", list);
    }


    /**
     * 导入
     */
    @RequestMapping(value = "/importCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject importCsvToDbAjax(String csvStr) {
        @SuppressWarnings("unused")
		String resCount = "";
        try {
            resCount = viFiDeviceService.importCsvToDbNew(csvStr);
        } catch (DuplicateKeyException e) {
            return RestObject.newError("import failure key id index repeat!" + e.getMessage());
        }
        return RestObject.newOk("import rate success");
    }


    /**
     * 导出
     */
    @RequestMapping(value = "/exportCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportCsvByDbAjax() {
        String data = viFiDeviceService.exportDevCsvByDbNew();

        return RestObject.newOk("", data);
    }
    
    /**
     * 导出模板
     */
    @RequestMapping(value = "/exportTempCsv.ajax", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject exportCsvTempByDbAjax() {
        String data = viFiDeviceService.exportTemplate();
        return RestObject.newOk("", data);
    }
    
    @RequestMapping(value = "queryAnalysisDate.json", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAnalysisJson(ServletRequest request) throws ParseException{
    	LogUtils.dbg("VIFIACTIONCTRL | queryAnalysisJson begin ; ");
    	Map<String, Object> queryParam = ActionUtils.parseParameters(request, "cx_");
    	List<DateVO> result = actionService.queryAnalysisData(queryParam);
    	
    	JSONObject view = new JSONObject();
    	view.put("content", result);
    	return RestObject.newOk("", view);
    }



//    var mapData = [
//    {'code':'AF' , 'name':'Afghanistan', 'value':3235860, 'color':'#eea638'},
//    {'code':'AL' , 'name':'Albania', 'value':3215988, 'color':'#d8854f'},
//    {'code':'DZ' , 'name':'Algeria', 'value':35980193, 'color':'#de4c4f'},
//    {'code':'AO' , 'name':'Angola', 'value':19618432, 'color':'#de4c4f'},
//    {'code':'AR' , 'name':'Argentina', 'value':40764561, 'color':'#86a965'},
//    {'code':'AM' , 'name':'Armenia', 'value':3100236, 'color':'#d8854f'},
//    {'code':'AU' , 'name':'Australia', 'value':22605732, 'color':'#8aabb0'},
//    {'code':'AT' , 'name':'Austria', 'value':8413429, 'color':'#d8854f'},
//    {'code':'AZ' , 'name':'Azerbaijan', 'value':9306023, 'color':'#d8854f'},
//    {'code':'BH' , 'name':'Bahrain', 'value':1323535, 'color':'#eea638'},
//    {'code':'BD' , 'name':'Bangladesh', 'value':150493658, 'color':'#eea638'},
//    {'code':'BY' , 'name':'Belarus', 'value':9559441, 'color':'#d8854f'},
//    {'code':'BE' , 'name':'Belgium', 'value':10754056, 'color':'#d8854f'},
//    {'code':'BJ' , 'name':'Benin', 'value':9099922, 'color':'#de4c4f'},
//    {'code':'BT' , 'name':'Bhutan', 'value':738267, 'color':'#eea638'},
//    {'code':'BO' , 'name':'Bolivia', 'value':10088108, 'color':'#86a965'},
//    {'code':'BA' , 'name':'Bosnia and Herzegovina', 'value':3752228, 'color':'#d8854f'},
//    {'code':'BW' , 'name':'Botswana', 'value':2030738, 'color':'#de4c4f'},
//    {'code':'BR' , 'name':'Brazil', 'value':196655014, 'color':'#86a965'},
//    {'code':'BN' , 'name':'Brunei', 'value':405938, 'color':'#eea638'},
//    {'code':'BG' , 'name':'Bulgaria', 'value':7446135, 'color':'#d8854f'},
//    {'code':'BF' , 'name':'Burkina Faso', 'value':16967845, 'color':'#de4c4f'},
//    {'code':'BI' , 'name':'Burundi', 'value':8575172, 'color':'#de4c4f'},
//    {'code':'KH' , 'name':'Cambodia', 'value':14305183, 'color':'#eea638'},
//    {'code':'CM' , 'name':'Cameroon', 'value':20030362, 'color':'#de4c4f'},
//    {'code':'CA' , 'name':'Canada', 'value':34349561, 'color':'#a7a737'},
//    {'code':'CV' , 'name':'Cape Verde', 'value':500585, 'color':'#de4c4f'},
//    {'code':'CF' , 'name':'Central African Rep.', 'value':4486837, 'color':'#de4c4f'},
//    {'code':'TD' , 'name':'Chad', 'value':11525496, 'color':'#de4c4f'},
//    {'code':'CL' , 'name':'Chile', 'value':17269525, 'color':'#86a965'},
//    {'code':'CN' , 'name':'China', 'value':1347565324, 'color':'#eea638'},
//    {'code':'CO' , 'name':'Colombia', 'value':46927125, 'color':'#86a965'},
//    {'code':'KM' , 'name':'Comoros', 'value':753943, 'color':'#de4c4f'},
//    {'code':'CD' , 'name':'Congo, Dem. Rep.', 'value':67757577, 'color':'#de4c4f'},
//    {'code':'CG' , 'name':'Congo, Rep.', 'value':4139748, 'color':'#de4c4f'},
//    {'code':'CR' , 'name':'Costa Rica', 'value':4726575, 'color':'#a7a737'},
//    {'code':'CI' , 'name':'Cote d\'Ivoire', 'value':20152894, 'color':'#de4c4f'},
//    {'code':'HR' , 'name':'Croatia', 'value':4395560, 'color':'#d8854f'},
//    {'code':'CU' , 'name':'Cuba', 'value':11253665, 'color':'#a7a737'},
//    {'code':'CY' , 'name':'Cyprus', 'value':1116564, 'color':'#d8854f'},
//    {'code':'CZ' , 'name':'Czech Rep.', 'value':10534293, 'color':'#d8854f'},
//    {'code':'DK' , 'name':'Denmark', 'value':5572594, 'color':'#d8854f'},
//    {'code':'DJ' , 'name':'Djibouti', 'value':905564, 'color':'#de4c4f'},
//    {'code':'DO' , 'name':'Dominican Rep.', 'value':10056181, 'color':'#a7a737'},
//    {'code':'EC' , 'name':'Ecuador', 'value':14666055, 'color':'#86a965'},
//    {'code':'EG' , 'name':'Egypt', 'value':82536770, 'color':'#de4c4f'},
//    {'code':'SV' , 'name':'El Salvador', 'value':6227491, 'color':'#a7a737'},
//    {'code':'GQ' , 'name':'Equatorial Guinea', 'value':720213, 'color':'#de4c4f'},
//    {'code':'ER' , 'name':'Eritrea', 'value':5415280, 'color':'#de4c4f'},
//    {'code':'EE' , 'name':'Estonia', 'value':1340537, 'color':'#d8854f'},
//    {'code':'ET' , 'name':'Ethiopia', 'value':84734262, 'color':'#de4c4f'},
//    {'code':'FJ' , 'name':'Fiji', 'value':868406, 'color':'#8aabb0'},
//    {'code':'FI' , 'name':'Finland', 'value':5384770, 'color':'#d8854f'},
//    {'code':'FR' , 'name':'France', 'value':63125894, 'color':'#d8854f'},
//    {'code':'GA' , 'name':'Gabon', 'value':1534262, 'color':'#de4c4f'},
//    {'code':'GM' , 'name':'Gambia', 'value':1776103, 'color':'#de4c4f'},
//    {'code':'GE' , 'name':'Georgia', 'value':4329026, 'color':'#d8854f'},
//    {'code':'DE' , 'name':'Germany', 'value':82162512, 'color':'#d8854f'},
//    {'code':'GH' , 'name':'Ghana', 'value':24965816, 'color':'#de4c4f'},
//    {'code':'GR' , 'name':'Greece', 'value':11390031, 'color':'#d8854f'},
//    {'code':'GT' , 'name':'Guatemala', 'value':14757316, 'color':'#a7a737'},
//    {'code':'GN' , 'name':'Guinea', 'value':10221808, 'color':'#de4c4f'},
//    {'code':'GW' , 'name':'Guinea-Bissau', 'value':1547061, 'color':'#de4c4f'},
//    {'code':'GY' , 'name':'Guyana', 'value':756040, 'color':'#86a965'},
//    {'code':'HT' , 'name':'Haiti', 'value':10123787, 'color':'#a7a737'},
//    {'code':'HN' , 'name':'Honduras', 'value':7754687, 'color':'#a7a737'},
//    {'code':'HK' , 'name':'Hong Kong, China', 'value':7122187, 'color':'#eea638'},
//    {'code':'HU' , 'name':'Hungary', 'value':9966116, 'color':'#d8854f'},
//    {'code':'IS' , 'name':'Iceland', 'value':324366, 'color':'#d8854f'},
//    {'code':'IN' , 'name':'India', 'value':1241491960, 'color':'#eea638'},
//    {'code':'ID' , 'name':'Indonesia', 'value':242325638, 'color':'#eea638'},
//    {'code':'IR' , 'name':'Iran', 'value':74798599, 'color':'#eea638'},
//    {'code':'IQ' , 'name':'Iraq', 'value':32664942, 'color':'#eea638'},
//    {'code':'IE' , 'name':'Ireland', 'value':4525802, 'color':'#d8854f'},
//    {'code':'IL' , 'name':'Israel', 'value':7562194, 'color':'#eea638'},
//    {'code':'IT' , 'name':'Italy', 'value':60788694, 'color':'#d8854f'},
//    {'code':'JM' , 'name':'Jamaica', 'value':2751273, 'color':'#a7a737'},
//    {'code':'JP' , 'name':'Japan', 'value':126497241, 'color':'#eea638'},
//    {'code':'JO' , 'name':'Jordan', 'value':6330169, 'color':'#eea638'},
//    {'code':'KZ' , 'name':'Kazakhstan', 'value':16206750, 'color':'#eea638'},
//    {'code':'KE' , 'name':'Kenya', 'value':41609728, 'color':'#de4c4f'},
//    {'code':'KP' , 'name':'Korea, Dem. Rep.', 'value':24451285, 'color':'#eea638'},
//    {'code':'KR' , 'name':'Korea, Rep.', 'value':48391343, 'color':'#eea638'},
//    {'code':'KW' , 'name':'Kuwait', 'value':2818042, 'color':'#eea638'},
//    {'code':'KG' , 'name':'Kyrgyzstan', 'value':5392580, 'color':'#eea638'},
//    {'code':'LA' , 'name':'Laos', 'value':6288037, 'color':'#eea638'},
//    {'code':'LV' , 'name':'Latvia', 'value':2243142, 'color':'#d8854f'},
//    {'code':'LB' , 'name':'Lebanon', 'value':4259405, 'color':'#eea638'},
//    {'code':'LS' , 'name':'Lesotho', 'value':2193843, 'color':'#de4c4f'},
//    {'code':'LR' , 'name':'Liberia', 'value':4128572, 'color':'#de4c4f'},
//    {'code':'LY' , 'name':'Libya', 'value':6422772, 'color':'#de4c4f'},
//    {'code':'LT' , 'name':'Lithuania', 'value':3307481, 'color':'#d8854f'},
//    {'code':'LU' , 'name':'Luxembourg', 'value':515941, 'color':'#d8854f'},
//    {'code':'MK' , 'name':'Macedonia, FYR', 'value':2063893, 'color':'#d8854f'},
//    {'code':'MG' , 'name':'Madagascar', 'value':21315135, 'color':'#de4c4f'},
//    {'code':'MW' , 'name':'Malawi', 'value':15380888, 'color':'#de4c4f'},
//    {'code':'MY' , 'name':'Malaysia', 'value':28859154, 'color':'#eea638'},
//    {'code':'ML' , 'name':'Mali', 'value':15839538, 'color':'#de4c4f'},
//    {'code':'MR' , 'name':'Mauritania', 'value':3541540, 'color':'#de4c4f'},
//    {'code':'MU' , 'name':'Mauritius', 'value':1306593, 'color':'#de4c4f'},
//    {'code':'MX' , 'name':'Mexico', 'value':114793341, 'color':'#a7a737'},
//    {'code':'MD' , 'name':'Moldova', 'value':3544864, 'color':'#d8854f'},
//    {'code':'MN' , 'name':'Mongolia', 'value':2800114, 'color':'#eea638'},
//    {'code':'ME' , 'name':'Montenegro', 'value':632261, 'color':'#d8854f'},
//    {'code':'MA' , 'name':'Morocco', 'value':32272974, 'color':'#de4c4f'},
//    {'code':'MZ' , 'name':'Mozambique', 'value':23929708, 'color':'#de4c4f'},
//    {'code':'MM' , 'name':'Myanmar', 'value':48336763, 'color':'#eea638'},
//    {'code':'NA' , 'name':'Namibia', 'value':2324004, 'color':'#de4c4f'},
//    {'code':'NP' , 'name':'Nepal', 'value':30485798, 'color':'#eea638'},
//    {'code':'NL' , 'name':'Netherlands', 'value':16664746, 'color':'#d8854f'},
//    {'code':'NZ' , 'name':'New Zealand', 'value':4414509, 'color':'#8aabb0'},
//    {'code':'NI' , 'name':'Nicaragua', 'value':5869859, 'color':'#a7a737'},
//    {'code':'NE' , 'name':'Niger', 'value':16068994, 'color':'#de4c4f'},
//    {'code':'NG' , 'name':'Nigeria', 'value':162470737, 'color':'#de4c4f'},
//    {'code':'NO' , 'name':'Norway', 'value':4924848, 'color':'#d8854f'},
//    {'code':'OM' , 'name':'Oman', 'value':2846145, 'color':'#eea638'},
//    {'code':'PK' , 'name':'Pakistan', 'value':176745364, 'color':'#eea638'},
//    {'code':'PA' , 'name':'Panama', 'value':3571185, 'color':'#a7a737'},
//    {'code':'PG' , 'name':'Papua New Guinea', 'value':7013829, 'color':'#8aabb0'},
//    {'code':'PY' , 'name':'Paraguay', 'value':6568290, 'color':'#86a965'},
//    {'code':'PE' , 'name':'Peru', 'value':29399817, 'color':'#86a965'},
//    {'code':'PH' , 'name':'Philippines', 'value':94852030, 'color':'#eea638'},
//    {'code':'PL' , 'name':'Poland', 'value':38298949, 'color':'#d8854f'},
//    {'code':'PT' , 'name':'Portugal', 'value':10689663, 'color':'#d8854f'},
//    {'code':'PR' , 'name':'Puerto Rico', 'value':3745526, 'color':'#a7a737'},
//    {'code':'QA' , 'name':'Qatar', 'value':1870041, 'color':'#eea638'},
//    {'code':'RO' , 'name':'Romania', 'value':21436495, 'color':'#d8854f'},
//    {'code':'RU' , 'name':'Russia', 'value':142835555, 'color':'#d8854f'},
//    {'code':'RW' , 'name':'Rwanda', 'value':10942950, 'color':'#de4c4f'},
//    {'code':'SA' , 'name':'Saudi Arabia', 'value':28082541, 'color':'#eea638'},
//    {'code':'SN' , 'name':'Senegal', 'value':12767556, 'color':'#de4c4f'},
//    {'code':'RS' , 'name':'Serbia', 'value':9853969, 'color':'#d8854f'},
//    {'code':'SL' , 'name':'Sierra Leone', 'value':5997486, 'color':'#de4c4f'},
//    {'code':'SG' , 'name':'Singapore', 'value':5187933, 'color':'#eea638'},
//    {'code':'SK' , 'name':'Slovak Republic', 'value':5471502, 'color':'#d8854f'},
//    {'code':'SI' , 'name':'Slovenia', 'value':2035012, 'color':'#d8854f'},
//    {'code':'SB' , 'name':'Solomon Islands', 'value':552267, 'color':'#8aabb0'},
//    {'code':'SO' , 'name':'Somalia', 'value':9556873, 'color':'#de4c4f'},
//    {'code':'ZA' , 'name':'South Africa', 'value':50459978, 'color':'#de4c4f'},
//    {'code':'ES' , 'name':'Spain', 'value':46454895, 'color':'#d8854f'},
//    {'code':'LK' , 'name':'Sri Lanka', 'value':21045394, 'color':'#eea638'},
//    {'code':'SD' , 'name':'Sudan', 'value':34735288, 'color':'#de4c4f'},
//    {'code':'SR' , 'name':'Suriname', 'value':529419, 'color':'#86a965'},
//    {'code':'SZ' , 'name':'Swaziland', 'value':1203330, 'color':'#de4c4f'},
//    {'code':'SE' , 'name':'Sweden', 'value':9440747, 'color':'#d8854f'},
//    {'code':'CH' , 'name':'Switzerland', 'value':7701690, 'color':'#d8854f'},
//    {'code':'SY' , 'name':'Syria', 'value':20766037, 'color':'#eea638'},
//    {'code':'TW' , 'name':'Taiwan', 'value':23072000, 'color':'#eea638'},
//    {'code':'TJ' , 'name':'Tajikistan', 'value':6976958, 'color':'#eea638'},
//    {'code':'TZ' , 'name':'Tanzania', 'value':46218486, 'color':'#de4c4f'},
//    {'code':'TH' , 'name':'Thailand', 'value':69518555, 'color':'#eea638'},
//    {'code':'TG' , 'name':'Togo', 'value':6154813, 'color':'#de4c4f'},
//    {'code':'TT' , 'name':'Trinidad and Tobago', 'value':1346350, 'color':'#a7a737'},
//    {'code':'TN' , 'name':'Tunisia', 'value':10594057, 'color':'#de4c4f'},
//    {'code':'TR' , 'name':'Turkey', 'value':73639596, 'color':'#d8854f'},
//    {'code':'TM' , 'name':'Turkmenistan', 'value':5105301, 'color':'#eea638'},
//    {'code':'UG' , 'name':'Uganda', 'value':34509205, 'color':'#de4c4f'},
//    {'code':'UA' , 'name':'Ukraine', 'value':45190180, 'color':'#d8854f'},
//    {'code':'AE' , 'name':'United Arab Emirates', 'value':7890924, 'color':'#eea638'},
//    {'code':'GB' , 'name':'United Kingdom', 'value':62417431, 'color':'#d8854f'},
//    {'code':'US' , 'name':'United States', 'value':313085380, 'color':'#a7a737'},
//    {'code':'UY' , 'name':'Uruguay', 'value':3380008, 'color':'#86a965'},
//    {'code':'UZ' , 'name':'Uzbekistan', 'value':27760267, 'color':'#eea638'},
//    {'code':'VE' , 'name':'Venezuela', 'value':29436891, 'color':'#86a965'},
//    {'code':'PS' , 'name':'West Bank and Gaza', 'value':4152369, 'color':'#eea638'},
//    {'code':'VN' , 'name':'Vietnam', 'value':88791996, 'color':'#eea638'},
//    {'code':'YE' , 'name':'Yemen, Rep.', 'value':24799880, 'color':'#eea638'},
//    {'code':'ZM' , 'name':'Zambia', 'value':13474959, 'color':'#de4c4f'},
//    {'code':'ZW' , 'name':'Zimbabwe', 'value':12754378, 'color':'#de4c4f'}];
}
