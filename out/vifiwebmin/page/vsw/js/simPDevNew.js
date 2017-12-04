require("../css/simp.css");

var appModule = require("appModule"); 
appModule.controller("simPDevNewCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
    $rootScope.childPage = "/vsw/simPDevNew/";
    var prefixUrl = PATH + $rootScope.childPage;

}]);





 