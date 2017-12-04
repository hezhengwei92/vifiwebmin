
var appModule = require("appModule");
appModule.controller("countOnlineDailyCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/countOnlineDaily",
        fields:[{name: "keyCODID", pk: true, disabled: "E", vali: {maxlength: 10}},
            {name: "appOnline", type: "I", vali: {maxlength: 11}},
            {name: "newRegister", type: "I", vali: {maxlength: 11}},
            {name: "UUWiFiOnline", type: "I", vali: {maxlength: 11}},
            {name: "VNSOnline", type: "I", vali: {maxlength: 11}},
            {name: "VPXOnline", type: "I", vali: {maxlength: 11}},
            {name: "VSWOnline", type: "I", vali: {maxlength: 11}},
            {name: "TrunkOnline", type: "I", vali: {maxlength: 11}},
            {name: "GoIPOnline", type: "I", vali: {maxlength: 11}},
            {name: "SimPOnline", type: "I", vali: {maxlength: 11}},
            {name: "SIMOnline", type: "I", vali: {maxlength: 11}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 