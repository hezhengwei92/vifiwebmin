
var appModule = require("appModule"); 
appModule.controller("laiXunAuthenticationCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
    $scope.view = g_var.view;
    $rootScope.childPage = "/vpx/LaiXunAuth/";
    //var prefixUrl = PATH + $rootScope.childPage; 

}]);