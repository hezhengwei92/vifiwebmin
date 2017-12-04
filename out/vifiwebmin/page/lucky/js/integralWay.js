var appModule = require("appModule");

appModule.controller("integralWayCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbintegralWay",
        currentUri: "/lucky/integralWay/",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxIntegralType",width:120},
            {name: "idxPackageType", vali: {maxlength: 32},width:120 },
            {name: "idxGoodsID", vali: {maxlength: 45}},
            {name: "idxImgUrl", vali: {maxlength: 1}},
            {name: "idxExplain",  vali: {maxlength: 11}},
            {name: "idxIsWork", type: "I",vali: {maxlength: 45},comType:"select",width:120},
            {name: "idxValue", type: "I",vali: {maxlength: 1024},width:180},
            {name: "mdTm",type: "D", vali: {maxlength: 10},show:false},
            {name: "mdBy", vali: {maxlength: 128},show:false},
            {name: "crtTm",type: "D", vali: {maxlength: 45},show:false},
            {name: "crtBy", vali: {maxlength: 2048},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
