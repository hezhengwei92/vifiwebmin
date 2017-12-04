
var appModule = require("appModule");
var userBase = require("./userBase");
appModule.controller("userTopupRcdCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbUserTopupRcd",
        currentUri: "/user/userTopupRcd",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},width:70},
            {name: "idxOrderID", vali: {maxlength: 128},advQry:['LIKE'],width:200},
            {name: "idxUserID", vali: {maxlength: 128},advQry:['LIKE'],width:145},
            {name: "topupType", vali: {maxlength: 128},advQry:['LIKE'],width:80,comType:"select"},
            //{name: "idxExID", vali: {maxlength: 256},width:80},
            {name: "idxAgentID", vali: {maxlength: 64},advQry:['LIKE'],comType:"select",comData: g_var.view.agentSelData,width:120},
            {name: "goodsID", vali: {maxlength: 256},advQry:['LIKE'],width:90},
            {name: "amount", vali: {range:[0,10000],decimals:3},unitMul:0.01,advQry:['LIKE'],width:90},
            {name: "ipAddr",width:240,show: true,width:110},
            {name: "status", vali: {maxlength: 1},advQry:['LIKE'],comType:"select"},
            {name: "remark", vali: {maxlength: 256,required:false}, show: false,width:100},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:130},
            {name: "crtTm", type: "D", hideEdit: "A", show: true, width:130},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: true, width:130}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
    userBase.call(this, $scope);
}]);
 