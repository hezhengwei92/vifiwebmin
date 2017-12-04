var appModule = require("appModule");

appModule.controller("integralLuckyCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbintegralLucky",
        currentUri: "/lucky/integralLucky/",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxGoodsID", vali: {maxlength: 32},width:120 },
            {name: "idxGoodsType", type: "D",width:120,comType:"select"},
            {name: "idxExplain", vali: {maxlength: 45}},
            {name: "idxImgUrl", vali: {maxlength: 1}},
            {name: "idxProb", type: "I", vali: {maxlength: 11}},
            {name: "idxStore", type: "I",vali: {maxlength: 45},width:120},
            {name: "idxIsWork",type: "I", vali: {maxlength: 1024},comType:"select",width:180},
            {name: "idxValue",type: "I", vali: {maxlength: 2048},width:500},
            {name: "mdTm",type: "D", vali: {maxlength: 10},show:false},
            {name: "mdBy", vali: {maxlength: 128},show:false},
            {name: "crtTm",type: "D", vali: {maxlength: 45},show:false},
            {name: "crtBy", vali: {maxlength: 2048},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
