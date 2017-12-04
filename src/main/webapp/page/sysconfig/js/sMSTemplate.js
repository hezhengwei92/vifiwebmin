var appModule = require("appModule");
appModule.controller("sMSTemplateCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbSMSTemplate",
        currentUri: "/sysconfig/sMSTemplate",
        fields:[{name: "keySmsTemplateId", type: "I", pk: true, disabled: "E", vali: {maxlength: 11},advQry:['LIKE']},
            {name: "name", vali: {maxlength: 15},advQry:['LIKE'],width:150},
            {name: "lang", vali: {maxlength: 32},advQry:['LIKE'],comType:"select",width:90},
            {name: "msgTmpl", vali: {maxlength: 1024},advQry:['LIKE'],width:785},
            {name: "mdfTm", type: "D", hideEdit: "A",width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, width:105},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 