var appModule = require("appModule");
appModule.controller("userFlowCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbUserFlow",
        currentUri: "/user/userflow/",
        fields:[{name: "keyUserID", pk: true, left: true, disabled: "E", vali: {maxlength: 32},width:170,show:false},
            {name: "idxAppId", vali: {maxlength: 20},width:100},//UID
            {name: "nickname",  vali: {maxlength: 20},width:100},//别名
            {name: "idxPhoneNumber",  vali: {maxlength: 20},advQry:['LIKE'],width:100},//手机号
            {name: "idxOrderID", vali: {maxlength: 64,required:false},width:170},//订单号
            {name: "residualflow", type: "I", vali: {maxlength: 11,required :false}, show: true},//剩余流量
            //{name: "totalFlow", type: "I", vali: {maxlength: 11,required :false}, show: true},//总流量
            {name: "priority",  vali: {maxlength: 64,required:false}},//使用级别
            {name: "pkgType", vali: {maxlength: 64,required:false},comType:"select"},//流量类型
            {name: "effectiveTm", type: "D", left: false, hideEdit: "A",width:125},
            //{name: "status",  vali: {maxlength: 64,required:false},advQry:['LIKE'],comType:"select"},//状态
            {name: "idxAgentID",  vali: {maxlength: 64,required:false},advQry:['LIKE'],comType:"select",comData: g_var.view.agentSelData},//代理商编号
            {name: "crtTm", type: "D", show: false, hideEdit: "A" }
        ]};


    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);




