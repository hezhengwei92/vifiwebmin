require("../css/cdrTariffe.css");
require("../../../assets/beyond/js/charts/flot/jquery.flot.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.tooltip.js");
var appModule = require("appModule"); 
appModule.controller("cdrTariffeCtrl", ["$scope", "$rootScope", "Utils", "$interval", "frameAdminBase", function ($scope, $rootScope, Utils, $interval, AngularBaseCtrl) {
    // 当前子页面
	 $scope.view = g_var.view;
    $rootScope.childPage = "/vpx/cdrTariffe/";
    var prefixUrl = PATH + $rootScope.childPage; 
     
}]);   

