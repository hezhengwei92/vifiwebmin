var appModule = require("appModule");
appModule.controller("deviceverCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbDevicever",
        currentUri: "/sysconfig/devicever",
        fields: [
            {name: "keyId", type: "I", pk: true, vali: {maxlength: 11},show:true},
            {name: "version",type: "I", vali: {maxlength: 45},width:120},
            {name: "type", type: "I",vali: {maxlength: 45},width:120},
            {name: "batch", vali: {maxlength: 45},width:120},
            {name: "remarks", vali: {maxlength: 45},width:120},
            {name: "updateUrl", vali: {maxlength: 45},width:120},
            {name: "hardware", vali: {maxlength: 45},width:120},
            {name: "devType", vali: {maxlength: 45},width:120},
            {name: "idxAgentID", vali: {maxlength: 45},width:120,comType:"select", comData:g_var.view.agentSelData},
            {name: "crtTm",type: "D",  hideEdit: "A",vali: {maxlength: 45}, width:130,show:true}
        ]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 