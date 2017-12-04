var appModule = require("appModule");

appModule.controller("auditCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbAudit",
        currentUri: "/syslog/audit/",
        fields:[{name: "keyAdtID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
                {name: "actionDate", type: "D",width:120},
                {name: "userIP", vali: {maxlength: 32},width:120 },
                {name: "idxActionUser", vali: {maxlength: 45}},
                {name: "action", vali: {maxlength: 1},comType:"select"},
                {name: "result", type: "I", vali: {maxlength: 11}},
                {name: "idxTableName", vali: {maxlength: 45},width:120},
                {name: "condition", vali: {maxlength: 1024},width:180},
                {name: "fields", vali: {maxlength: 2048},width:500},
            {name: "userType", vali: {maxlength: 10},show:false},
            {name: "idxTbKeyValue", vali: {maxlength: 128},show:false},
            {name: "tbKeyName", vali: {maxlength: 45},show:false},
            {name: "beforeValues", vali: {maxlength: 2048},show:false},
            {name: "afterValues", vali: {maxlength: 2048},show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
