
var appModule = require("appModule");
appModule.controller("goIPGrpCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/goIPGrp",
        fields:[{name: "keyGoIPDevGrpID", pk: true, disabled: "E", vali: {maxlength: 64}},
            {name: "groupName", vali: {maxlength: 128}},
            {name: "remarks", vali: {maxlength: 128}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 