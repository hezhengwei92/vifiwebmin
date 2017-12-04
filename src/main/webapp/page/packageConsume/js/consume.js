var appModule = require("appModule");
appModule.controller("consumerPkgCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
	$rootScope.childPage = "/packageConsume/consume";
}]);