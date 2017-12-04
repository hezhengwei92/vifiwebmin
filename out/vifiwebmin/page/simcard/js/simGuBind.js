var appModule = require("appModule"); 
appModule.controller("simGuBindCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前子页面
    $rootScope.childPage = "/simcard/simGuBind";
    var prefixUrl = PATH + $rootScope.childPage; 

}]);   



 