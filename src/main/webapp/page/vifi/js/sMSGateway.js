
var appModule = require("appModule");
appModule.controller("sMSGatewayCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/sMSGateway",
        fields:[{name: "keySMSGWID", vali: {maxlength: 45}},
            {name: "smsGwName", vali: {maxlength: 45}},
            {name: "countryCode", vali: {maxlength: 10}},
            {name: "routePrefix", vali: {maxlength: 16}},
            {name: "gwUID", vali: {maxlength: 32}},
            {name: "gwPwd", vali: {maxlength: 32}},
            {name: "remarks", vali: {maxlength: 128}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 