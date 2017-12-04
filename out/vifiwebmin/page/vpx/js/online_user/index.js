var appModule = require("appModule");
var onlineUserService = require("./onlineUserService");


appModule.controller("vpxOnlineUserCtrl", ["$scope", "$rootScope", function ($scope, $rootScope) {

    onlineUserService.drawMap();
    onlineUserService.refreshMap();

}]);




