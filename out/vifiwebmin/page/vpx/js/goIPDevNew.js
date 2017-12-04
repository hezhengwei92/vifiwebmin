require("../../goip/css/goIPDev.css");

var appModule = require("appModule"); 
appModule.controller("goIPDevNew2Ctrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
    $scope.view = g_var.view;
    $rootScope.childPage = "/vpx/goIPDevNew/";
    var prefixUrl = PATH + $rootScope.childPage; 

}]);