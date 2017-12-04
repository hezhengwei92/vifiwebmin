var appModule = require("appModule");
appModule.controller("smsCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbSMS",
        currentUri: "/cdr/sms",
        fields:[{name: "keySMSId", type: "I", pk: true, left: true, disabled: "A", vali: {maxlength: 11},width:90},
            {name: "idxPhoneNumber", left: true, vali: {maxlength: 20},advQry:['LIKE'],width:150},
            {name: "message", left: true, vali: {maxlength: 256},advQry:['LIKE'],width:700},
            {name: "state", left: true, vali: {maxlength: 1},advQry:['LIKE'],comType:"select",valFormat:"<i class='img-fmt cdr-sms-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "idxSMSGWID", left: true, vali: {maxlength: 15},advQry:['LIKE'],width:150},
            //{name: "messageId", left: true, vali: {maxlength: 45},show:false},
            //{name: "responseCode", left: true, vali: {maxlength: 10},show:false},
            //{name: "responseMessage", left: true, vali: {maxlength: 45},show:false},
            //{name: "repeatNum", type: "I", left: true, vali: {maxlength: 2},show:false},
            //{name: "maxRepeatNum", type: "I", left: true, vali: {maxlength: 2},show:false},
            //{name: "pri", type: "I", left: false, vali: {maxlength: 1},show:false},
            //{name: "idxExternalID", left: false, vali: {maxlength: 32},show:false},
            //{name: "exValue1", left: false, vali: {maxlength: 64},show:false},
            //{name: "exValue2", left: false, vali: {maxlength: 64}},
            //{name: "exValue3", left: false, vali: {maxlength: 64}},
            {name: "createdBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "createdTime", type: "D", left: false, hideEdit: "A",show:false},
            {name: "sendTime", type: "D", left: false,width:140},
            {name: "timeused", type: "I", left: false, vali: {maxlength: 11},show:false}
            ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 