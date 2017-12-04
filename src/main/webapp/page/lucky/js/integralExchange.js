var appModule = require("appModule");

appModule.controller("integralExchangeCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbintegralExchange",
        currentUri: "/lucky/integralExchange/",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxGoodsType",width:120,comType:"select"},
            {name: "idxGoodsID", vali: {maxlength: 32},width:120},
            {name: "idxExplain", vali: {maxlength: 45}},
            {name: "idxImgUrl", vali: {maxlength: 1}},
            {name: "idxStore", type: "I", vali: {maxlength: 11}},
            {name: "idxValue", type: "I",vali: {maxlength: 45},width:120},
            {name: "mdTm",type: "D", vali: {maxlength: 1024},width:180},
            {name: "mdBy", vali: {maxlength: 2048},width:500},
            {name: "crtTm", type: "D",vali: {maxlength: 10},show:false},
            {name: "crtBy", vali: {maxlength: 128},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
