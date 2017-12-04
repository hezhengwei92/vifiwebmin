
var appModule = require("appModule");
appModule.controller("dailyRentalCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbDailyRental",
        currentUri: "/packageConsume/dailyRental",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxViFiID", vali: {maxlength: 32},advQry:["LIKE"],width:180,comType:"select",comData:g_var.view.idxViFiIDSelData},
            {name: "idxPhoneNumber", vali: {maxlength: 32},advQry:["LIKE"],width:95},
            {name: "startDate", type: "D",advQry:["LIKE"],width:125},
            {name: "endDate", type: "D",width:125},
            {name: "maxData",valid: {range:[0,100000],decimals:3},unitMul:0.001 , width:100},
            {name: "rateLimit",valid: {range:[0,10000],decimals:3},unitMul:0.001, width:100},
            {name: "price", vali: {range:[0,10000],decimals:3},unitMul:0.001, width:100},
            {name: "areaCodes", vali: {maxlength: 256},comType:"mulSelect",comData:g_var.view.areaCodesSelData,width:200},
            {name: "todayUsage",  vali: {range:[0,100000],decimals:3},unitMul:0.001, width:100},
            {name: "remarks", vali: {maxlength: 128,required:false}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140},
            {name: "crtTm", type: "D", hideEdit: "A",show:false, width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 