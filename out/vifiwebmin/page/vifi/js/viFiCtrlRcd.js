
var appModule = require("appModule");
appModule.controller("viFiCtrlRcdCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/viFiCtrlRcd",
        fields:[{name: "keyCtrlRcdID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}},
            {name: "idxCtrlRcdID", vali: {maxlength: 20}},
            {name: "idxViFiID", vali: {maxlength: 45}},
            {name: "cmdState", vali: {maxlength: 1}},
            {name: "respCode", type: "I", vali: {maxlength: 11}},
            {name: "respDetail", vali: {maxlength: 128}},
            {name: "reqDate", type: "D"},
            {name: "updateDate", type: "D"}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 