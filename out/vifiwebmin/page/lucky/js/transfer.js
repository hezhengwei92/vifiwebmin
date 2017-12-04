var appModule = require("appModule");

appModule.controller("transferCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbtransfer",
        currentUri: "/lucky/transfer/",
        fields:[{name: "transferId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxOrderId", width:120},
            {name: "sendUid", vali: {maxlength: 32},width:120 },
            {name: "sendAvatar", vali: {maxlength: 45}},
            {name: "sendNickname", vali: {maxlength: 1}},
            {name: "recAvatar", vali: {maxlength: 11}},
            {name: "recNickname", vali: {maxlength: 45},width:120},
            {name: "recAvatar", vali: {maxlength: 1024},width:180},
            {name: "receiveUid", vali: {maxlength: 2048},width:500},
            {name: "flow",  type: "I",vali: {maxlength: 10},show:false},
            {name: "message", vali: {maxlength: 128},show:false},
            {name: "flowType", vali: {maxlength: 45},comType:"select",show:false},
            {name: "status", type: "I", vali: {maxlength: 2048},show:false},
            {name: "effectiveTm", type: "D", vali: {maxlength: 2048},show:false},
            {name: "crtTm", type: "D", vali: {maxlength: 2048},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
