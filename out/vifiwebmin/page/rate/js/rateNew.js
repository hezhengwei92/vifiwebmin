/**
 * 每一个页面单独使用一个jsp，且对应写一个controller，然后在路由中配置jsp和controller
 * 多个controller就写在同一个js中
 * 
 */

require("../../../assets/beyond/js/charts/flot/jquery.flot.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.tooltip.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.time.js");
//require("../../../assets/js/libs/echarts/map/world.js");//地图
var appModule = require("appModule");
var rateBase = require("./rateBase");

appModule.controller("rateNewCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {

    $scope.view = g_var.view;
    $rootScope.childPage = "/rate/rateNew/";
    var prefixUrl = PATH + $rootScope.childPage; 
    rateBase.call(this, $scope);

}]);
 


