var appModule = require("appModule"); 
appModule.controller("simBindCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
    $rootScope.childPage = "/vsw/simBind";
    var prefixUrl = PATH + $rootScope.childPage; 

}]);   



 