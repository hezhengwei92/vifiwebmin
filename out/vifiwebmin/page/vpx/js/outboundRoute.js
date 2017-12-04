var appModule = require("appModule");
appModule.controller("outboundRouteCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbOutboundRoute",
        currentUri: "/vpx/outboundRoute",
        fields:[{name: "keyOutboundRouteId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},advQry:['LIKE'], width:100},
            {name: "dnisPrefix", vali: {maxlength: 32,required:false},advQry:['LIKE'],width:120},
            {name: "dnisDomain", vali: {maxlength: 128,required:false},width:120},
            {name: "idxTrunkID", type: "I",comType:"select",comData:g_var.view.trunkSelData, vali: {maxlength: 11},advQry:['LIKE'],width:160},
            {name: "delDnisPrefixNum", type: "I", vali: {maxlength: 11,required:false},width:120},
            {name: "addDnisPrefixStr", vali: {maxlength: 16,required:false},advQry:['LIKE'],width:120},
            {name: "remarks", vali: {maxlength: 128,required:false},width:180},
            {name: "mdfTm", type: "D", hideEdit: "A",width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45},show:false,width:140},
            {name: "crtTm", type: "D", hideEdit: "A",show:false,width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45},show:false,width:140}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 