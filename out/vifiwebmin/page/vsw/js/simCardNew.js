var appModule = require("appModule"); 
appModule.controller("simCardNewCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
    $rootScope.childPage = "/vsw/simCardNew/";
    var prefixUrl = PATH + $rootScope.childPage; 

}]);   



 