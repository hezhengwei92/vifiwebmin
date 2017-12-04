var appModule = require("appModule");

appModule.controller("agentCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var parentsSelData = g_var.view.parentsSelData;
    var parentDef = parentsSelData.length == 1 ? parentsSelData[0][0] : undefined;

    var viewCfg = {
        i18nPrefix:"db.tbAgent",
        currentUri: "/agent/agent/",
        fields:[{name: "idxAgentId", pk: true, disabled: "E", vali: {maxlength:128},width:260},
            {name: "idxParentsId", vali: {maxlength: 128}, advQry:['LIKE'], def: parentDef, comType: "select", comData: parentsSelData,width:230},
            {name: "idxAgentName", vali: {maxlength: 32}, advQry:['LIKE'],width:120},
            {name: "agentLevel", type: "I", vali: {maxlength: 11}, comType:"select", advQry:['LIKE']},
            {name: "name", vali: {maxlength: 128}, advQry:['LIKE'],width:140},
            {name: "phoneNumber", vali: {maxlength: 32},  advQry:['LIKE'],width:110},
            {name: "balance", unitMul: 0.001, vali: {range: [-10000000, 10000000], decimals: 3},width:110},
            {name: "credit", type: "I", vali: {maxlength: 11, decimals: 3},width:135,unitMul: 0.001,},
            {name: "discount", type: "I", show: false,vali: {range:[0,100]}},
            {name: "remark", vali: {maxlength: 255,required:false},show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140},
            {name: "crtTm", type: "D", hideEdit: "A", show: false, width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);



}]);
