var appModule = require("appModule");

appModule.controller("totalIntegralCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbtotalIntegral",
        currentUri: "/lucky/totalintegral/",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxOrderID",width:120},
            {name: "idxUserID", vali: {maxlength: 32},width:120 },
            {name: "idxScores", type: "I",vali: {maxlength: 45}},
            {name: "idxPayORGet",type: "I", vali: {maxlength: 1}},
            {name: "idxType",  vali: {maxlength: 11}},
            {name: "idxGoodsID", vali: {maxlength: 45},width:120},
            {name: "idxWin",  type: "I",vali: {maxlength: 1024},comType:"select",width:180},
            {name: "idxHandle",type: "I",vali: {maxlength: 2048},comType:"select",width:500},
            {name: "idxAwardType",type: "I",vali: {maxlength: 10},comType:"select"},
            {name: "crtTm", type: "D", vali: {maxlength: 128},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
