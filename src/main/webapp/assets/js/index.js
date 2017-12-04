require("../css/index.css");
var Utils = require("commonUtils");
var indexHelps = require("./indexHelps.js");

indexHelps.i18nUtil();

/**
 * 插件-- 部分插件用到了国际化, 国际化处理要在前面.
 * validate 验证,
 * layer 弹窗
 * laydate 时间选择
 */
require("./utils/prototypeExUtils");
require("validate");
require("layer");
require("laydate");

// bootstrap 窗口 移动扩展
indexHelps.btModalMoveEx();

//***
var appModule = require("appModule");
// 一下全局rootScope初始化
appModule.run(["$rootScope", "$http", function ($rootScope, $http) {
    $rootScope.Utils = Utils;// 大家一起用Utils
    $rootScope.i18n = $.i18n; // 国际化工具
    $rootScope.language = window.LANGUAGE; //语言
    $rootScope.homeMenu = g_var.homeMenu; //菜单
    // 帮助模块,显示详细用法
    var $helpHtml = null, $helpBtn = null;
    $rootScope.goHelpPage = function (path) {
        /* /home/.test(path) 测试 "home" 是否包含在字符串（path）的最开始，返回布尔值 */
        $rootScope.isHomeHelp = !path || /home/.test(path);
        // *** 帮助的面包屑导航
        var resArr = path.split("/");
        if(resArr[3]){
        	$rootScope.helpPath = $.i18n("menu." + resArr[1]) + " / " + $.i18n("menu." + resArr[1] + "_" + resArr[2] + "_" + resArr[3]);
        }else if (resArr[2]) {
            $rootScope.helpPath = $.i18n("menu." + resArr[1]) + " / " + $.i18n("menu." + resArr[1] + "_" + resArr[2]);
        } else {
            $rootScope.helpPath = $.i18n("menu.home");
        }
        // ***
        $helpBtn = $helpBtn || $("#help-link");
        // 帮助层未打开 且 是 home 页面的话, 不用去加载帮助文件.
        if (!$helpBtn.hasClass("open") || $rootScope.isHomeHelp) return;

        // 加载帮助文件到 div 显示
        $helpHtml = $helpHtml || $("#help-html");
        // 显示帮助信息...
        var url = PATH + "/assets/helps/" + window.LANGUAGE + path.replace(/\/$|$/, '.html');
        $helpHtml.html("load...");
        $http.get(url, {cache: true}).success(function (data) {
            $helpHtml.html(data);
        }).error(function (data, header, config, status) {
            if (404 == header) {
                $helpHtml.html("not help file");
            }
        });
    };


    // 切换子页面后动作..
    $rootScope.$watch("childPage", function (nData) {
        if (!nData) return;
        // 侧边栏选择状态
        indexHelps.navbarSelState();
        // 帮助页面.切换
        var helpPath = (/home/.test(nData) ? "" : nData);
        $rootScope.goHelpPage(helpPath);

        // 面包导航.改变文字
        indexHelps.syncBreadcrumb();
    });


    setTimeout(indexHelps.initIndexAct, 200);
}]);
require("../../page/frame/js/route.config.js");


