var appModule = require("appModule");
appModule.controller("agentManagerCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
	$rootScope.childPage = "/sysconfig/agentManager";
}]);