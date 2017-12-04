//require("../tableModelVer.js");
var appModule = require("appModule"); 
require("../../../assets/beyond/js/charts/flot/jquery.flot.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.tooltip.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.time.js");
appModule.controller("globalSIMNewCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
	$scope.view = g_var.view;
    $rootScope.childPage = "/vsw/globalSIMNew/";
    var prefixUrl = PATH + $rootScope.childPage; 

}]);   



 