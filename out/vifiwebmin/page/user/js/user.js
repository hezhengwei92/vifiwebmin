var appModule = require("appModule");
//var rateBase = require("./rateBase");
var useBase = require("./userBase");
appModule.controller("userCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbUser",
        currentUri: "/user/user/",
        fields:[{name: "keyUserID", pk: true, left: true, disabled: "E", vali: {maxlength: 32},width:170,show:false},
            {name: "idxAppId", left: true, vali: {maxlength: 20},disabled: "E",width:100},
            {name: "nickname", left: true, vali: {maxlength: 20,required:false},disabled: "E",width:100},
            {name: "idxPhoneNumber", left: true, vali: {maxlength: 20},disabled: "E",advQry:['LIKE'],width:100},
            //{name: "idxAreaCode", left: true,width:150, vali: {maxlength: 16},advQry:['LIKE'],comType:"select",comData:g_var.view.areaSelData},
            {name: "password", left: true, vali: {rangelength: [6,20]}, hideEdit: "E",comType:"password",show:true},
            //{name: "language", left: true, vali: {maxlength: 30},show:false,comType:"select",comData:g_var.view.languageSelData},
            //{name: "roamAreaCode", left: true, vali: {maxlength: 16,required:false},show:false,comType:"select",comData:g_var.view.roamareacodesSelData},
            //{name: "roamTimeZone", type:"I", left: true, vali: {maxlength: 11,required:false},show:false,comType:"select",comData:g_var.view.roamTimeZoneSelData},
            //{name: "idxDomain", left: true, vali: {maxlength: 64}, query: true,width:120},
            //{name: "displayNumber", left: true, vali: {maxlength: 32,required:false},show:true},
            //{name: "accountState", left: true,hideEdit:"N", vali: {maxlength: 1},advQry:['LIKE'],comType:"select",valFormat:"<i class='img-fmt user-user-account-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "appState", type: "I", left: true, vali: {maxlength: 11,required:false},comType:"select",advQry:['LIKE'],valFormat:"<i class='img-fmt user-user-app-{a}'></i><i class='f-tips'>{b}</i>"},
            //{name: "vifiState", width:100, type: "I", left: true, vali: {maxlength: 11},comType:"select",advQry:['LIKE'],valFormat:"<i class='img-fmt user-user-uuwifi-{a}'></i><i class='f-tips'>{b}</i>"},
            //{name: "idxViFiID", left: true, vali: {maxlength: 64}, show: false, hideEdit: "A"},
            //{name: "idxVPXID", left: true, vali: {maxlength: 64}, show: false, hideEdit: "A"},
            //{name: "idxVSWID", left: true, vali: {maxlength: 64}, show: false, hideEdit: "A"},
            //{name: "idxGoIPPortID", left: true, vali: {maxlength: 64}, show: false, hideEdit: "A"},
            //{name: "idxSimpPortID", left: true, vali: {maxlength: 64}, show: false, hideEdit: "A", query: true},
            //{name: "idxSimCardID", left: true, vali: {maxlength: 64}, show: false, hideEdit: "A"},
            //{name: "lastAPPPublicPort", vali:{maxlength: 32},type: "I"},
            {name: "userBalance", type: "F", left: true,advQry:['LIKE'], comType:"select",width:90},
            //{name: "userBalance", type: "F", left: false,vali: {maxlength:11, decimals: 3},advQry:['LIKE'],unitMul:0.001 ,disabled:"E",width:90},
            //{name: "voiceBalance", type: "F", left: false,vali: {maxlength:11, decimals: 3},unitMul:0.001, show: true,disabled:"E",width:90},
            //{name: "dataBalance", type: "F", left: false, vali: {maxlength:11, decimals: 3},unitMul:0.001,disabled:"E",width:90},
            {name: "credit", type: "I", left: true, vali: {maxlength: 11,required:false},disabled: "E",width:50},
            //{name: "sex", type: "I", left: true, vali: {maxlength: 11},disabled: "E",comType:"select",valFormat:"<i class='img-fmt user-user-app-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "idxAgentID", left: true, advQry:['LIKE'],comType:"select",comData: g_var.view.agentSelData},//代理商编号
            //{name: "sipExpire", type: "I", left: false, vali: {maxlength: 11}, show: false},
            //{name: "lastUUWiFiData", type: "I", left: false, hideEdit: "A",width:125},
            //{name: "lastUUWiFiSessId", type: "S", left: false, hideEdit: "A",width:125},
            //{name: "todayUUWiFiData", type: "I", left: false, hideEdit: "A",width:125},
            //{name: "lastUUWiFiDate", type: "D", left: false, hideEdit: "A",width:125},
            {name: "lastAPPOnlineDate", type: "D", left: true, hideEdit: "A",width:125},
            //{name: "lastAPPPublicIP", left: false, vali: {maxlength: 32}, show: false, hideEdit: "A"},
            //{name: "lastAPPDevInfo", left: false, vali: {maxlength: 32}, show: false, hideEdit: "A"},
            //{name: "lastAPPVer", left: false, vali: {maxlength: 32}, show: false, hideEdit: "A"},
            //{name: "lastViFiDate", type: "D", left: false, show: false, hideEdit: "A"},
            //{name: "lastViFiID", left: false, vali: {maxlength: 32}, show: false, hideEdit: "A", query: true},
            //{name: "lastViFiPublicIP", left: false, vali: {maxlength: 32}, show: false, hideEdit: "A"},
            {name: "userType", type: "I", left: true, vali: {maxlength: 11,required :false}, disabled: "E",show: true, comType:"select",advQry:['LIKE']},//用户类型
            {name: "remarks", left: false, vali: {maxlength: 128,required:false},disabled: "E", show: true},
            {name: "reqCodeMine", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "reqCodeOther", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "avatar", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "lastAPPDevInfo", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "addrMAC", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "idxWechatId", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "idxQQId", left: false, vali: {maxlength: 128,required:false}, disabled: "E",show: true},
            {name: "idxMicroblogId", left: false, vali: {maxlength: 128,required:false},disabled: "E", show: true},
            {name: "mdfTm", type: "D", left: false, hideEdit: "A",width:125},
            {name: "mdfBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", left: false,show: false, hideEdit: "A" },
            {name: "crtBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false}]};


    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
    useBase.call(this, $scope);
}]);




