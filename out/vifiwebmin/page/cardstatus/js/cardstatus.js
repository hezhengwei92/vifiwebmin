var appModule = require("appModule");
appModule.controller("cardStatusCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
	$rootScope.childPage = "/cardstatus/cardstatus";
}]);