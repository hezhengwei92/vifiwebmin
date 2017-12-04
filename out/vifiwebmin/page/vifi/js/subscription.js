
var appModule = require("appModule");
appModule.controller("subscriptionCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/subscription",
        fields:[{name: "keySubscriptionId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}},
            {name: "idxPhoneNumber", vali: {maxlength: 20}},
            {name: "deviceId", vali: {maxlength: 40}},
            {name: "checkCode", vali: {maxlength: 6}},
            {name: "state", vali: {maxlength: 1}},
            {name: "subscribeTime", type: "D"},
            {name: "checkTime", type: "D"},
            {name: "subscribeNum", type: "I", vali: {maxlength: 2}},
            {name: "ipaddress", vali: {maxlength: 16}},
            {name: "deviceInfo", vali: {maxlength: 50}},
            {name: "osInfo", vali: {maxlength: 30}},
            {name: "mappVersion", vali: {maxlength: 32}},
            {name: "recommendByCode", vali: {maxlength: 20}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 