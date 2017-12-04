var appModule = require("appModule");
appModule.controller("globalSIMCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbGlobalSIM",
        currentUri: "/uuwifi/globalSIM",
        fields:[{name: "keyGlobalSIMID", pk: true, disabled: "E", vali: {maxlength: 64},advQry:['LIKE'],width:180},
            {name: "idxGlobalSIMGrpID", vali: {maxlength: 64},advQry:['LIKE'],width:180,comType: "select",comData:g_var.view.globalSIMGrpSelData},
            //{name: "iccid", vali: {maxlength: 24}},
            {name: "imsi", vali: {maxlength: 15},show:false},
            {name: "imei",type:"I", vali: {rangelength: [15,15]},show:false},
            {name: "status", type: "I", vali: {maxlength: 11},comType: "select",advQry:['LIKE'],valFormat:"<i class='img-fmt uuw-gsim-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "number", vali: {maxlength: 32,required:false},advQry:['LIKE'],width:180},
            {name: "balance",  vali: {range:[0,100000],decimals:3,required:false},unitMul:0.001,advQry:['LIKE'],width:100},
            {name: "lastQryDate", type: "D",hideEdit:"A",width:125,required:false},
            {name: "netData",  vali: {maxlength:32,required:false},hideEdit:"A",unitMul:0.001,advQry:['LIKE'],width:100},
            {name: "remarks", vali: {maxlength: 128,required:false},width:220},
            {name: "mdfTm", type: "D", hideEdit: "A",width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 