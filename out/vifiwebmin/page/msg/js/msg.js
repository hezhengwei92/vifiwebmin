var appModule = require("appModule");
appModule.controller("msgCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
	$rootScope.childPage = "/msg/msg";
}]);