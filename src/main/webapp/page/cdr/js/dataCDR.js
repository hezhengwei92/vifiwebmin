var appModule = require("appModule");


appModule.controller("dataCdrCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbCDR",
        currentUri: "/cdr/data-cdr/",
        fields: [{name: "keyCDRID", type: "I", pk: true, left: true, disabled: "A", vali: {maxlength: 11},width:70},
            {name: "idxUserId", left: true, vali: {maxlength: 64},width:120,advQry:['LIKE']},
            //{name: "idxDeductUserId", left: true, vali: {maxlength: 64}},
            {name: "cdrType", left: true, vali: {maxlength: 1},width:80,advQry:['LIKE'],comType:"select"},
            //{name: "direction", left: true, vali: {maxlength: 1},width:80,advQry:['LIKE'],comType:"select",valFormat:"<i class='img-fmt cdr-cdr-dir-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "distance", left: true, vali: {maxlength: 1},width:80,advQry:['LIKE'],comType:"select"},
            {name: "idxRateId", type: "I", left: true, vali: {maxlength: 11},width:70},
            //{name: "dnis", left: true, vali: {maxlength: 32},width:105},
            //{name: "caller", left: true, vali: {maxlength: 32},width:105},
            //{name: "callee", left: true, vali: {maxlength: 32},width:115},
            //{name: "StartTime", type: "D", left: true,width:150},
            //{name: "AnswerTime", type: "D", left: true,width:150},
            //{name: "StopTime", type: "D", left: true,width:150},
            //{name: "callDuration", type: "I", left: true, vali: {maxlength: 11}},
            {name: "dataTraffic", type: "I", left: true, vali: {range:[0,10000], decimals: 3},unitMul:0.001,width:125},
            {name: "uuwifiDataUp", type: "I", left: true, vali: {range:[0,10000], decimals: 3},unitMul:0.001},
            {name: "uuwifiDataDown", type: "I", left: true, vali: {range:[0,10000], decimals: 3},unitMul:0.001},
            {name: "uuwifiSessId", left: true},
            {name: "costCash", left: true, vali: {range:[0,10000], decimals: 3},unitMul:0.001,width:92},
            //{name: "costReward", type: "I", left: true, vali: {maxlength: 11}},
            //{name: "bonus", type: "I", left: true, vali: {maxlength: 11}},
            //{name: "idxSupplierId", left: true, vali: {maxlength: 32}},
            //{name: "supplierDiscount", type: "I", left: false, vali: {maxlength: 11}},
            //{name: "idxAgentID", left: false, vali: {maxlength: 32}},
            //{name: "agentDiscount", type: "I", left: false, vali: {maxlength: 11}},
            //{name: "idxCallID", left: false, vali: {maxlength: 128}},
            //{name: "idxVPXID", left: false, vali: {maxlength: 32}},
            //{name: "idxTrunkID", left: false, vali: {maxlength: 32}},
            //{name: "hangupPart", type: "I", left: false, vali: {maxlength: 11}},
            //{name: "idxVSWID", left: false, vali: {maxlength: 32}},
            //{name: "idxGoIPID", left: false, vali: {maxlength: 32}},
            //{name: "idxSimPID", left: false, vali: {maxlength: 32}},
            //{name: "idxSimCardID", left: false, vali: {maxlength: 32}},
            //{name: "idxSMSGate", left: false, vali: {maxlength: 32}},
            //{name: "idxVAPPID", left: false, vali: {maxlength: 32}},
            //{name: "idxViFiID", left: false, vali: {maxlength: 32}},
            //{name: "ispID", left: false, vali: {maxlength: 32}},
            //{name: "countryCode", left: false, vali: {maxlength: 32}},
            {name: "crtTm", type: "D", left: false, hideEdit: "A",width:125},
            {name: "crtBy", left: false, hideEdit: "A", vali: {maxlength: 45},show:false}
        ]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);



}]);




