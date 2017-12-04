var appModule = require("appModule");

appModule.controller("sendGoodsCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbsendGoods",
        currentUri: "/lucky/sendGoods/",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxOrderID", width:120},
            {name: "idxExplain", vali: {maxlength: 32},width:120 },
            {name: "idxUserName", vali: {maxlength: 45}},
            {name: "idxPhoneNumber", vali: {maxlength: 1}},
            {name: "idxAddress", vali: {maxlength: 11}},
            {name: "sendTime", vali: {maxlength: 45},width:120},
            {name: "idxCourier", vali: {maxlength: 1024},width:180},
            {name: "idxTracking", vali: {maxlength: 2048},width:500},
            {name: "idxProcessor",vali: {maxlength: 10},show:false},
            {name: "message", vali: {maxlength: 128},show:false},
            {name: "flowType", vali: {maxlength: 45},show:false},
            {name: "idxReceiver",  vali: {maxlength: 2048},comType:"select",show:false},
            {name: "remark", vali: {maxlength: 2048},show:false},
            {name: "crtTm", type: "D", vali: {maxlength: 2048},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
