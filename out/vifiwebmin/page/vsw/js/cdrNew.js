require("../css/cdrNew.css");
var appModule = require("appModule"); 
require("../../../assets/beyond/js/charts/flot/jquery.flot.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.tooltip.js");
require("../../../assets/beyond/js/charts/flot/jquery.flot.time.js");
appModule.controller("cdrNewCtrl", ["$scope", "$rootScope", "Utils", "$interval", "frameAdminBase", function ($scope, $rootScope, Utils, $interval, AngularBaseCtrl) {
    // 当前子页面
	 $scope.view = g_var.view;
    $rootScope.childPage = "/vsw/cdrNew/";
    var prefixUrl = PATH + $rootScope.childPage; 
}]);   

