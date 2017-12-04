var appModule = require("appModule");
appModule.controller("configureCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbConfigure",
        currentUri: "/sysconfig/configure",
        fields: [{name: "keyConfigureId", type: "I", pk: true, hideEdit: "A", vali: {maxlength: 11},show:false},
            {name: "name", vali: {maxlength: 45}, advQry: ['LIKE'],width:120},
            {name: "type", vali: {maxlength: 1}, comType:"select",width:90,show:false},
            {name: "value", vali: {maxlength: 100},width:120},
            {name: "description", vali: {maxlength: 256},width:240},
            {name: "mdfTm", type: "D", hideEdit: "A", width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45},width:140},
            {name: "crtTm", type: "D", hideEdit: "A",width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45},width:140}
        ]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    $scope.$watch("form.copyData.type", function (nData) {
        if (!nData) return;
        var $value = $("#editModal [name=value]");
        nData == "I" ? $value.rules("add", {number: true}) : $value.rules("remove", "number");
        if ($value.val()) {
            $value.valid();
        }
    });
}]);
 