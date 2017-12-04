var appModule = require("appModule");
appModule.controller("residualflowCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
	$rootScope.childPage = "/residualflow/residualflow";
}]);