
var appModule = require("appModule");
appModule.controller("domainCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/domain",
        fields:[{name: "keyDomain", pk: true, disabled: "E", vali: {maxlength: 64}},
            {name: "idxParentsDomain", vali: {maxlength: 64}},
            {name: "state", vali: {maxlength: 1}},
            {name: "vnsAddrList", vali: {maxlength: 256}},
            {name: "countryCode", vali: {maxlength: 10}},
            {name: "lang", vali: {maxlength: 10}},
            {name: "currency", vali: {maxlength: 10}},
            {name: "timezone", type: "I", vali: {maxlength: 11}},
            {name: "authToken", vali: {maxlength: 128}},
            {name: "devNumber", type: "I", vali: {maxlength: 11}},
            {name: "actNumber", type: "I", vali: {maxlength: 11}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 