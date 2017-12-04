package com.frame.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.commons.vo.FrameUserMenuVO;
import com.frame.commons.web.UserProfile;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class FrameIndexService {
    static final String LAN_MENU_PREFIX = "menu.";


    /**
     * 返回例子:[{"twoMenu":[{"name":"资源管理","url":"/frame/resource"},{"name":"资源管理","url":"/frame/resource"},{"name":"系统用户","url":"/frame/user"},{"name":"用户权限","url":"/frame/role"},{"name":"修改密码","url":"/frame/password"}],"name":"系统管理"},{"twoMenu":[{"name":"基本设置","url":"/sysconfig/configure"},{"name":"短信模板","url":"/sysconfig/sMSTemplate"},{"name":"VNS节点","url":"/sysconfig/vns"},{"name":"版本管理","url":"/sysconfig/version"},{"name":"IP黑名单","url":"/sysconfig/blackList"}],"name":"系统设置"},{"twoMenu":[{"name":"VPX列表","url":"/vpx/vpx"},{"name":"SIP Trunk","url":"/vpx/trunk"},{"name":"外呼路由","url":"/vpx/outboundRoute"},{"name":"注册的账号","url":"/vpx/account"},{"name":"app在线分布图","url":"/vpx/online-user"}],"name":"VPX管理"},{"twoMenu":[{"name":"VSW列表","url":"/vsw/vsw"}],"name":"VSW管理"},{"twoMenu":[{"name":"GoIP设备","url":"/goip/goIPDev"},{"name":"GoIP插槽","url":"/goip/goIPPort"}],"name":"GoIP设备"},{"twoMenu":[{"name":"SimP设备","url":"/simp/simPDev"},{"name":"SimP插槽","url":"/simp/simPPort"}],"name":"SimP设备"},{"twoMenu":[{"name":"设备组","url":"/uuwifi/viFiDevGroup"},{"name":"UUWiFi列表","url":"/uuwifi/viFiDevice"},{"name":"启动卡","url":"/uuwifi/globalSIM"}],"name":"UUWiFi管理"},{"twoMenu":[{"name":"用户列表","url":"/user/user"},{"name":"赠送账号","url":"/user/userSuite"},{"name":"UUWiFi日租","url":"/user/dailyRental"},{"name":"充值记录","url":"/user/userTopupRcd"},{"name":"赠送记录","url":"/user/rewardRcd"},{"name":"用户反馈","url":"/user/feedback"}],"name":"用户管理"},{"twoMenu":[{"name":"代理商列表","url":"/agent/agent"},{"name":"增值记录","url":"/agent/agentAdditionRcd"},{"name":"扣费记录","url":"/agent/agentDeductionRcd"}],"name":"代理商管理"},{"twoMenu":[{"name":"支持地区","url":"/rate/area"},{"name":"通话费率","url":"/rate/rate"},{"name":"流量费率","url":"/rate/llrate"}],"name":"费率管理"},{"twoMenu":[{"name":"SIM卡组","url":"/simcard/sCGroup"},{"name":"SIM卡列表","url":"/simcard/simCard"}],"name":"SIM卡管理"},{"twoMenu":[{"name":"历史话单","url":"/cdr/cdr"},{"name":"短信记录","url":"/cdr/sms"},{"name":"会话记录","url":"/cdr/uUWiFiSession"}],"name":"话单记录"},{"twoMenu":[{"name":"每日统计","url":"/count/countDaily"},{"name":"月度统计","url":"/count/countMonthly"}],"name":"统计报表"},{"twoMenu":[{"name":"操作审计","url":"/syslog/audit"},{"name":"vpx日志","url":"/syslog/vpx"},{"name":"vsw日志","url":"/syslog/vsw"},{"name":"ws日志","url":"/syslog/ws"},{"name":"as日志","url":"/syslog/as"},{"name":"webmin日志","url":"/syslog/webmin"}],"name":"系统日志"},{"twoMenu":[{"name":"CtrlCmd","url":"/vifi/ctrlcmd"},{"name":"路由","url":"/vifi/route"},{"name":"供应商","url":"/vifi/supplier"},{"name":"CountOnlineDaily","url":"/vifi/countOnlineDaily"},{"name":"CountSrcIP","url":"/vifi/countSrcIP"},{"name":"CronLog","url":"/vifi/cronLog"},{"name":"Domain","url":"/vifi/domain"},{"name":"FireWall","url":"/vifi/fireWall"},{"name":"GlobalSIMGrp","url":"/vifi/globalSIMGrp"},{"name":"ViFiStatus","url":"/vifi/viFiStatus"},{"name":"SMSCountDaily","url":"/vifi/sMSCountDaily"},{"name":"SMSGateway","url":"/vifi/sMSGateway"},{"name":"SimPDevGrp","url":"/vifi/simPDevGrp"},{"name":"Subscription","url":"/vifi/subscription"},{"name":"ViFiCtrlRcd","url":"/vifi/viFiCtrlRcd"}],"name":"ViFi"}]
     *
     * @return
     */
    public Collection<JSONObject> createSysMenu() {
        UserProfile userInfo = UserUtils.getUserProfile();
        List<FrameUserMenuVO> menuList = userInfo.getMenu();

        Map<String, JSONObject> subMenu = new LinkedHashMap<String, JSONObject>();
        for (FrameUserMenuVO menu : menuList) {
            String resName[] = menu.getName().split("_");
            if (resName.length < 2) continue;    //hard code !!!!
            String mOne = resName[0];
            String mTwo = resName[1];

            // 按照规则切割,菜单编号,进行分类
            String mIdArr[] = menu.getMenu().split("-");
            String mId = mIdArr[0];
            // 取得一级菜单 ,
            JSONObject oneMenu;
            if ((!subMenu.containsKey(mId))) {
                oneMenu = new JSONObject();
                //检测并获取正确的系统目录图标
                String iconClass = menu.getIconClass();
                if(iconClass==null ||("").equals(iconClass)){
                	for(FrameUserMenuVO targetMenu : menuList){
                		String targetMIdArr[] = targetMenu.getMenu().split("-");
                        String targetMId = targetMIdArr[0];
                        String targetIconClass = targetMenu.getIconClass();
                        if(targetMId.equals(mId) && (targetIconClass !=null && !("").equals(targetIconClass))){
                        	iconClass = targetIconClass;
                        	break;
                        }
                	}
                }
                iconClass = (iconClass !=null && !("").equals(iconClass))?iconClass : "fa fa-indent";//default
                oneMenu.put("iconClass", iconClass);
                oneMenu.put("name", CommonUtils.lang(LAN_MENU_PREFIX + mOne));
                subMenu.put(mId, oneMenu);
            }
            oneMenu = subMenu.get(mId);

            // 塞入二级菜单
            List<JSONObject> twoMenu = null;
            if (!oneMenu.containsKey("twoMenu")) {
                twoMenu = new ArrayList<JSONObject>();
                oneMenu.put("twoMenu", twoMenu);
            }
            twoMenu = (List) oneMenu.get("twoMenu");

            JSONObject childMenu = new JSONObject();
            childMenu.put("name", CommonUtils.lang(LAN_MENU_PREFIX + mOne + "_" + mTwo));
            childMenu.put("url", menu.getUri());
            twoMenu.add(childMenu);
        }

        return subMenu.values();
    }

}
