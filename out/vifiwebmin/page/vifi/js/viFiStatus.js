
var appModule = require("appModule");
appModule.controller("viFiStatusCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/viFiStatus",
        fields:[{name: "keyStatusID", type: "I", pk: true, left: true, disabled: "A", vali: {maxlength: 11}},
            {name: "idxViFiID", left: true, vali: {maxlength: 45}},
            {name: "vnsDomain", left: true, vali: {maxlength: 64}},
            {name: "cos", left: true, vali: {maxlength: 10}},
            {name: "uptime", type: "I", left: true, vali: {maxlength: 11}},
            {name: "lastChargingTime", type: "D", left: true},
            {name: "battery", type: "I", left: true, vali: {maxlength: 11}},
            {name: "wifiSignal", type: "I", left: true, vali: {maxlength: 11}},
            {name: "gsmSignal", type: "I", left: true, vali: {maxlength: 11}},
            {name: "gsmRate", type: "I", left: true, vali: {maxlength: 11}},
            {name: "wifiDevNum", type: "I", left: false, vali: {maxlength: 11}},
            {name: "gsmRxBytes", type: "I", left: false, vali: {maxlength: 11}},
            {name: "gsmTxBytes", type: "I", left: false, vali: {maxlength: 11}},
            {name: "wifiRxBytes", type: "I", left: false, vali: {maxlength: 11}},
            {name: "wifiTxBytes", type: "I", left: false, vali: {maxlength: 11}},
            {name: "timezone", type: "I", left: false, vali: {maxlength: 11}},
            {name: "ispID", left: false, vali: {maxlength: 30}},
            {name: "updateDate", type: "D", left: false},
            {name: "updateIP", left: false, vali: {maxlength: 32}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 