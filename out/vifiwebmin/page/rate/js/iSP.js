var appModule = require("appModule");
appModule.controller("iSPCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbISP",
        currentUri: "/rate/isp/",
        fields:[{name: "keyISPID", type: "I", pk: true, disabled: "E", vali: {maxlength: 11}},
            {name:"mcc", vali:{maxlength:11,required:false}},
            {name: "ispName", vali: {maxlength: 64}},
            {name: "areaCode", vali: {maxlength: 10}},
            {name:"idxUUWiFiAreaId", vali:{maxlength:128,required:false}},
            {name: "remark", vali: {maxlength: 256}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 