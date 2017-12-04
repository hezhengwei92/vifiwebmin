
var appModule = require("appModule");
appModule.controller("countDailyCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbCountDaily",
        currentUri: "/count/countDaily",
        fields:[{name: "keyCDID", pk: true, left: true, disabled: "E", vali: {maxlength: 10}},
            {name: "numTotalMMIn", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numTotalMMOut", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numTotalMO", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numTotalMOCb", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numTotalMTGoip", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numTotalMOGoip", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numTotalMOGoipCb", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMMIn", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMMOut", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMO", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMOCb", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMTGoip", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMOGoip", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numFailedMOGoipCb", type: "I", left: true, vali: {maxlength: 11}},
            {name: "numShortMMIn", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numShortMMOut", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numShortMO", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numShortMOCb", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numShortMTGoip", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numShortMOGoip", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numShortMOGoipCb", type: "I", left: false, vali: {maxlength: 11}},
            {name: "numSMSRecv", type: "I", left: false, vali: {maxlength: 11},show:false},
            {name: "numSMSSend", type: "I", left: false, vali: {maxlength: 11},show:false},
            {name: "cntDataDown", type: "I", left: false, vali: {maxlength: 11},show:false},
            {name: "cntDataUp", type: "I", left: false, vali: {maxlength: 11},show:false},
            {name: "mdfTm", type: "D", left: false, hideEdit: "A",show:false},
            {name: "mdfBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", left: false, hideEdit: "A",show:false},
            {name: "crtBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 