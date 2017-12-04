package com.frame.ctrl;

import javax.servlet.ServletRequest;
import com.alibaba.fastjson.JSONObject;
import com.frame.commons.constant.MediaTypes;
import com.frame.commons.entity.TbCfrmRole;
import com.frame.commons.entity.base.RestObject;
import com.frame.commons.utils.LogUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameHomeService;
import net.eoutech.webmin.cdr.service.CdrService;
import net.eoutech.webmin.commons.entity.TbCDR;
import net.eoutech.webmin.count.service.CountDailyService;
import net.eoutech.webmin.simcart.service.SimCardService;
import net.eoutech.webmin.user.service.UserService;
import net.eoutech.webmin.user.service.UserTopupRcdService;
import net.eoutech.webmin.uuwifi.service.ViFiDeviceService;
import net.eoutech.webmin.vpx.service.APPAuthService;
import net.eoutech.webmin.vpx.service.APPServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/home")
//@CommonTabCtrlInit( resource = "frame_user")
public class FrameHomeCtrl {
	
//    @Autowired
//    private CdrService cdrService;
//    @Autowired
//    private AgentService agentService;
//    @Autowired
//    private GoIPDevService goIPDevService;
//    @Autowired
//    private SimPDevService simPDevService;
//    @Autowired
//    private GlobalSIMService globalSIMService;
//    @Autowired
//    private FeedbackService feedbackService;
    @Autowired
    private SimCardService simCardService;
    @Autowired
    private ViFiDeviceService vifiDeviceService;
    
    @Autowired
    private FrameHomeService frameHomeService;
    @Autowired
    private UserService userService;
    @Autowired
    private CdrService cdrService;
    @Autowired
    private UserTopupRcdService userTopupRcfService;
    @Autowired
    private CountDailyService countDailyService;
    @Autowired
    private APPServerService appServerService;
    @Autowired
    private APPAuthService appAuthService;

    @RequestMapping(method = RequestMethod.GET)
    public String homeView(Model model) {
        LogUtils.dbg("access home page");
        JSONObject view = new JSONObject();
        model.addAttribute("view", view);

        //获取用户和角色，根据对应的设置的homePage加载不同的数据
        String userName =UserUtils.getUserName();
        TbCfrmRole tbcfrmrole = frameHomeService.getRoleByUserName(userName);
        //String role = tbcfrmrole.getKeyRoleId();
        String homePage = tbcfrmrole.getHomePage();
        view.put("roleInfo", tbcfrmrole);
        
        if("agentHome".equals(homePage)){
        	view.put("agentUserCount", userService.getAgentUserCount(userName));//名下用户总数
        	view.put("agentUserOnlinePercent", userService.getAgentOnlineUserPercent(userName));//名下用户在线比例
        	view.put("agentDeviceCount", vifiDeviceService.getAgentUUWiFiCount(userName));//名下设备数
        	view.put("agentDevOnlinePercent", vifiDeviceService.getAgentOnlineUuwifiPercent(userName));//名下设备在线比例
        	view.put("todayTotalConsume", ((double)cdrService.getAgentCostCashSum(userName))/1000);//今日资费总量
        	view.put("recentRegisterUser", userService.recentRegisterUser());//最近十天新增用户数
        	view.put("chargeRecord", userTopupRcfService.recentTopupRcd());//充值记录——需要限制代理商名下
        	view.put("agenthomeRealTimeTraffic", cdrService.queryCountByTime());//今日流量
        	view.put("agentTodayHUADAN", countDailyService.queryCountByTime(CountDailyService.IS_TODAY));//今日话单
        	
        }else if("supplierHome".equals(homePage)){
        	view.put("supplierCardNum", simCardService.getMyCardNum(userName));//卡数量
        	view.put("supplierNormalCardPercent", simCardService.getMyNormalCardPercent(userName));//正常状态卡数量百分比 
        	view.put("todayTrafficData", ((double)cdrService.supplierTodayTrafficData(userName))/1000);//今日数据流量 
        	view.put("todayCallTime", cdrService.supplierTodayCallTime(userName));//今日通话时长
        	view.put("cdrTrafficStatistic", cdrService.cdrTrafficStatistic());//最近20天的流量统计
        	view.put("recentCalltime", cdrService.recentCalltime());//最近20通话时长统计
        	view.put("simCardByStatus", simCardService.querySimCardByStatus());//卡状态百分比
        	view.put("callTimeByDistance", cdrService.querycdrByDistance());//国内外通话百分比
        	
        }else if("frameHome".equals(homePage)){
        	view.put("userCount", userService.getUserCount());//用户数
        	view.put("onlineUserPercent", userService.queryOnlineUserPercent());//用户在线比例
        	view.put("frmhomeRealTimeTraffic", cdrService.queryCountByTime());//实时流量查询
        	view.put("UUWiFiCount", vifiDeviceService.getUUWiFiCount());//设备数
        	view.put("devOnlinePercent", vifiDeviceService.getOnlineUuwifiPercent());//在线设备比例
        	//view.put("frmhomeRealTimeCalltime", cdrService.queryCalltimeByTime());
        	
        	//default: frameHome;
//            view.put("todayDuraAndTraf", cdrService.queryTodayDuraAndTraf());
//            view.put("goIPDevState", goIPDevService.queryGoIPDevState());
//            view.put("simPDevState", simPDevService.querySimPDevState());
//            view.put("globDevState", globalSIMService.queryGlobDevState());
//            view.put("topThreeFeedback", feedbackService.queryTopThree());
//            view.put("topFiveDayCallInfo", cdrService.queryTopFiveDayCallInfo());
//            view.put("yearCdrInfo", cdrService.queryYearCdrInfo());
//            view.put("userFiveChildAgent", agentService.queryUserFiveChildAgent());
//            // *** simCart state
//            view.put("simCardState", simCardService.querySimCardState());
//            view.put("balanceStati", simCardService.queryBalanceStati());
        }else if("redirectHome".equals(homePage)){
        	view.put("serverCount", appServerService.getServerCount());//服务器数量
        	view.put("licenseAuthSum", appServerService.getLicenseSum());//已用授权数量
        	view.put("licenseAllow", appServerService.getAuthSum());//lisence数量
        	//view.put("authCount", appAuthService.getAuthCount());//用户数量
        	view.put("recentAuthAccount", appServerService.getRecentAuthAccount());
        }else{
        	//do nothing
        }
        
        return "page/frame/" + (homePage!= null&& !"".equals(homePage)? homePage: "frameHome");
    }

    /**
     * ajax实时查询 !! 302 请求权限
     */
    @RequestMapping(value = "realTime", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public RestObject queryAjax(String idxUserId,String beginTime,String endTime,
    		@RequestParam(value = "page", defaultValue = "1") int pageNumber,
    		@RequestParam(value = "pageSize", defaultValue = "12") int pageSize,
    		ServletRequest request) {
    	TbCDR info = cdrService.queryCountByNow();
    	return RestObject.newOk("", info.getDataTraffic());
    }
    
    
    
    
    
    
}
