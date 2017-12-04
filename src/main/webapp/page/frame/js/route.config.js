// 初始化require 载入的控制器集合列表
require("./frameHome");
require("./frameResource");
require("./framePassword");
require("./frameRole");
require("./frameUser");
require("./frameLog");
require("./blackList");



require("../../sysconfig/js/configure");
require("../../sysconfig/js/wifiArea");
require("../../sysconfig/js/vns");
require("../../sysconfig/js/version");
require("../../sysconfig/js/supplier");
require("../../sysconfig/js/agentManager");
require("../../sysconfig/js/dictionary");
require("../../sysconfig/js/devicever");

require("../../packageConsume/js/dailyRental");
require("../../packageConsume/js/consume");
require("../../packageConsume/js/dataPkg");
require("../../packageConsume/js/voicePkg");

require("../../vpx/js/vpx");
require("../../vpx/js/trunk");
require("../../vpx/js/outboundRoute");
require("../../vpx/js/goIPDevNew");
require("../../vpx/js/rateNewVer");
require("../../vpx/js/online_user/index");
require("../../vpx/js/cdrTariffe");
require("../../vpx/js/cdrNew");
require("../../vpx/js/LaiXunAuth");

require("../../vsw/js/cdrNew");
/*require("../../vsw/js/vSW");*/
require("../../vsw/js/uUWiFiSession");
require("../../vsw/js/vswExchangeSer");
require("../../vsw/js/simPDevNew");
require("../../vsw/js/simCardNew");
require("../../vsw/js/viFiDeviceNew");
require("../../vsw/js/globalSIMNew");

require("../../goip/js/goIPDev");
require("../../goip/js/goIPPort");

require("../../simp/js/simPDev");
require("../../simp/js/simPPort");

require("../../uuwifi/js/viFiDevGroup");
require("../../uuwifi/js/viFiDevice");
require("../../uuwifi/js/globalSIM");
require("../../uuwifi/js/globalSIMGrp"); 

require("../../user/js/user");
require("../../user/js/userTopupRcd");
require("../../user/js/feedback");
require("../../user/js/smsNew");



require("../../agent/js/agent");
require("../../agent/js/agentAdditionRcd");
require("../../agent/js/agentDeductionRcd");

require("../../rate/js/area");
require("../../rate/js/dataRate");
require("../../rate/js/iSP");
require("../../rate/js/rateNew");

require("../../simcard/js/sCGroup");
require("../../simcard/js/simCard");
require("../../simcard/js/simBind");
require("../../simcard/js/simGuBind");

require("../../cdr/js/dataCDR");
require("../../cdr/js/sMS");

require("../../count/js/countDaily");
require("../../count/js/countMonthly");

require("../../syslog/js/audit");
require("../../syslog/js/vifiAction");

require("../../task/js/task");
require("../../help/js/help");
require("../../residualflow/js/residualflow");
require("../../msg/js/msg");
require("../../anyibao/js/anyibao");
require("../../taobao/js/taobao");
require("../../bindcode/js/bindcode");
require("../../cardstatus/js/cardstatus");

require("../../banner/js/banner");
require("../../redeem/js/redeem");
require("../../freeflow/js/freeflow");
require("../../user/js/userflow");

require("../../lucky/js/totalIntegral");
require("../../lucky/js/integralLucky");
require("../../lucky/js/integralWay");
require("../../lucky/js/integralExchange");
require("../../lucky/js/sendGoods");
require("../../lucky/js/transfer");
//require("../../vifi/js/viFiCtrlCmd");
//require("../../vifi/js/route");
//require("../../vifi/js/supplier");
//require("../../vifi/js/countOnlineDaily");
//require("../../vifi/js/countSrcIP");
//require("../../vifi/js/cronLog");
//require("../../vifi/js/domain");
//require("../../vifi/js/fireWall");
//require("../../vifi/js/sMSCountDaily");
//require("../../vifi/js/sMSGateway");
//require("../../vifi/js/simPDevGrp");
//require("../../vifi/js/subscription");
//require("../../vifi/js/viFiCtrlRcd");
//require("../../vifi/js/viFiStatus");


/**
 * 路由配置
 * ctrl:angular控制器名 默认使用: 文件名+Ctrl
 * path:路由使用的path
 * url : html模板 url,(哪一个页面~!) 默认使用:path
 */
var routeCfg = [
    // frame
    {ctrl: "frameHomeCtrl", path: "/home"},//// 资源管理
    {ctrl: "frameResourceCtrl", path: "/frame/resource"},//// 资源管理
    {ctrl: "framePasswordCtrl", path: "/frame/password"},//// 密码修改
    {ctrl: "frameRoleCtrl", path: "/frame/role"},//// 角色权限管理
    {ctrl: "frameUserCtrl", path: "/frame/user"},//// 系统管理管理
    {ctrl: "frameLogCtrl", path: "/syslog/fs/:modelName", url: "/syslog/fs"},//日志管理列表,url html模板都使用webmin的.
    {ctrl: "blackListCtrl", path: "/frame/blackList"},



    // sysconfig
    {ctrl: "configureCtrl", path: "/sysconfig/configure"},
    //{ctrl: "sMSTemplateCtrl", path: "/sysconfig/sMSTemplate"},
    {ctrl: "wifiAreaCtrl", path: "/sysconfig/wifiArea"},
    {ctrl: "vnsCtrl", path: "/sysconfig/vns"},
    {ctrl: "versionCtrl", path: "/sysconfig/version"},
    {ctrl: "sysSupplierCtrl", path: "/sysconfig/sysSupplier"},
    {ctrl: "agentManagerCtrl", path: "/sysconfig/agentManager"},
    {ctrl: "dictionaryCtrl", path: "/sysconfig/dictionary"},
    {ctrl: "deviceverCtrl", path: "/sysconfig/devicever"},
    //vpx
    {ctrl: "vpxCtrl", path: "/vpx/vpx"},
    {ctrl: "trunkCtrl", path: "/vpx/trunk"},
    {ctrl: "outboundRouteCtrl", path: "/vpx/outboundRoute"},
    {ctrl: "callCtrl", path: "/vpx/call"},
    {ctrl: "vpxOnlineUserCtrl", path: "/vpx/online-user"},
    {ctrl: "goIPDevNew2Ctrl", path: "/vpx/goIPDevNew"},
    {ctrl: "rateCtrl", path: "/vpx/rateNewVer"},
    {ctrl: "cdrCtrl", path: "/vpx/cdrNew"},
    {ctrl: "cdrTariffeCtrl", path: "/vpx/cdrTariffe"},
    {ctrl: "laiXunAuthenticationCtrl", path: "/vpx/LaiXunAuth"},
    //vsw
   /* {ctrl: "vswCtrl", path: "/vsw/vsw"},*/
    {ctrl: "uUWiFiSessionCtrl", path: "/syslog/uUWiFiSession"},
    {ctrl: "vswExchangeSerCtrl",path:"/vsw/vswExchangeSer"},
    {ctrl: "simCardNewCtrl", path: "/vsw/simCardNew"},
    {ctrl: "simPDevNewCtrl", path: "/vsw/simPDevNew"},
    {ctrl: "viFiDeviceNewCtrl",path:"/vsw/viFiDeviceNew"},
    {ctrl: "globalSIMNewCtrl", path: "/vsw/globalSIMNew"},
    {ctrl: "cdrNewCtrl", path: "/vsw/cdrNew"},
    //goip
    {ctrl: "goIPDevCtrl", path: "/goip/goIPDev"},
    {ctrl: "goIPPortCtrl", path: "/goip/goIPPort"},
    //simp
    {ctrl: "simPDevCtrl", path: "/simp/simPDev"},
    {ctrl: "simPPortCtrl", path: "/simp/simPPort"},
    //uuwifi
    {ctrl: "viFiDevGroupCtrl", path: "/uuwifi/viFiDevGroup"},
    {ctrl: "viFiDeviceCtrl", path: "/uuwifi/viFiDevice"},
    {ctrl: "globalSIMCtrl", path: "/uuwifi/globalSIM"},
    {ctrl: "globalSIMGrpCtrl", path: "/uuwifi/globalSIMGrp"},
    //user
    {ctrl: "userCtrl", path: "/user/user"},
    {ctrl: "dailyRentalCtrl", path: "/packageConsume/dailyRental"},
    {ctrl: "userTopupRcdCtrl", path: "/user/userTopupRcd"},
    {ctrl: "feedbackCtrl", path: "/user/feedback"},
    {ctrl: "smsNewCtrl", path : "/user/smsNew" },

    //package
    {ctrl: "consumerPkgCtrl", path: "/packageConsume/consume"},
    {ctrl: "userSuiteCtrl", path: "/packageConsume/dataPkg"},
    {ctrl: "voicePkgCtrl", path: "/packageConsume/voicePkg"},
    //agent
    {ctrl: "agentCtrl", path: "/agent/agent"},
    {ctrl: "agentAdditionRcdCtrl", path: "/agent/agentAdditionRcd"},
    {ctrl: "agentDeductionRcdCtrl", path: "/agent/agentDeductionRcd"},
    //rate
    {ctrl: "areaCtrl", path: "/rate/area"},
    //{ctrl: "rateCtrl", path: "/rate/rate"},
    {ctrl: "dataRateCtrl", path: "/vsw/data-rate"},
    {ctrl: "iSPCtrl", path: "/rate/isp"},
    {ctrl: "rateNewCtrl", path: "/rate/rateNew"},
    //simcard
    {ctrl: "sCGroupCtrl", path: "/simcard/sCGroup"},
    {ctrl: "simCardCtrl", path: "/simcard/simCard"},
    {ctrl: "simBindCtrl", path: "/vsw/simBind"},
    {ctrl: "simGuBindCtrl", path: "/simcard/simGuBind"},
    //cdr   {"/cdr/cdr", "/cdr/data-cdr","/vpx/cdrNew"
    {ctrl: "dataCdrCtrl", path: "/cdr/data-cdr"},
    {ctrl: "smsCtrl", path: "/cdr/sms"},
    //count
    {ctrl: "countDailyCtrl", path: "/count/countDaily"},
    {ctrl: "countMonthlyCtrl", path: "/count/countMonthly"},
    //{ctrl: "countAccessIPCtrl", path: "/count/countAccessIP"},
    {ctrl: "auditCtrl", path: "/syslog/audit"},
    {ctrl: "vifiActionCtrl", path: "/syslog/vifiAction"},
    //task
    {ctrl:"taskCtrl",path:"/task/task"},
    {ctrl:"helpCtrl",path:"/help/help"},
    {ctrl:"residualflowCtrl",path:"/residualflow/residualflow"},
    {ctrl:"msgCtrl",path:"/msg/msg"},
    {ctrl:"anyibaoCtrl",path:"simPDevNew"},
    {ctrl:"taobaoCtrl",path:"/taobao/taobao"},
    {ctrl:"bindcodeCtrl",path:"/bindcode/bindcode"},
    {ctrl:"cardStatusCtrl",path:"/cardstatus/cardstatus"},

    {ctrl:"freeFlowCtrl",path:"/user/freeflow"},

    {ctrl:"bannerCtrl",path:"/banner/banner"},//活动链接
    {ctrl:"redeemCtrl",path:"/redeem/redeem"},//APP任务管理图片 兑换方法等
    {ctrl: "userFlowCtrl", path : "/user/userflow" },

    //lucky
    {ctrl: "totalIntegralCtrl", path : "/lucky/totalintegral" },
    {ctrl: "integralWayCtrl", path : "/lucky/integralWay" },
    {ctrl: "integralLuckyCtrl", path : "/lucky/integralLucky" },
    {ctrl: "integralExchangeCtrl", path : "/lucky/integralExchange" },
    {ctrl: "sendGoodsCtrl", path : "/lucky/sendGoods" },
    {ctrl: "transferCtrl", path : "/lucky/transfer" }

    //vifi
//    {ctrl: "ctrlcmdCtrl", path: "/vifi/ctrlcmd"},
//    {ctrl: "routeCtrl", path: "/vifi/route"},
//    {ctrl: "supplierCtrl", path: "/vifi/supplier"},
//    {ctrl: "countOnlineDailyCtrl", path: "/vifi/countOnlineDaily"},
//    {ctrl: "countSrcIPCtrl", path: "/vifi/countSrcIP"},
//    {ctrl: "cronLogCtrl", path: "/vifi/cronLog"},
//    {ctrl: "domainCtrl", path: "/vifi/domain"},
//    {ctrl: "fireWallCtrl", path: "/vifi/fireWall"},
//    {ctrl: "goIPPortCtrl", path: "/vifi/goIPPort"},
//    {ctrl: "sMSCountDailyCtrl", path: "/vifi/sMSCountDaily"},
//    {ctrl: "sMSGatewayCtrl", path: "/vifi/sMSGateway"},
//    {ctrl: "simPDevGrpCtrl", path: "/vifi/simPDevGrp"},
//    {ctrl: "subscriptionCtrl", path: "/vifi/subscription"},
//    {ctrl: "viFiCtrlRcdCtrl", path: "/vifi/viFiCtrlRcd"},
//    {ctrl: "viFiStatusCtrl", path: "/vifi/viFiStatus"},
];


//////////////////////////////////////////////////
// 下面自动配置固定,不用变更
//////////////////////////////////////////////////

var appModule = require("appModule");
appModule.config(['$routeProvider', function ($routeProvider) {
    // 默认欢迎页
    $routeProvider.otherwise({
        redirectTo: '/home'
    });
    // 根据配置,配置路由  {ctrl: "simPDevNewCtrl", path: "/vsw/simPDevNew"},
   _.each(routeCfg, function (cfg) {
        $routeProvider.when(cfg.path, {
            templateUrl: PATH + (cfg.url || cfg.path),/* 返回的页面 就是在这里 */
            controller: cfg.ctrl // 默认文件名+Ctrl 作为,控制器名
        });
    });
}]);
