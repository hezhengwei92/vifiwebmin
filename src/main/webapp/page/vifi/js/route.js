var appModule = require("appModule");


appModule.controller("routeCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/route/",
        fields:[{name: "keyRouteId", type: "I", pk: true, disabled: "E", vali: {maxlength: 11}},
            {name: "srcNodeIds", vali: {maxlength: 128}},
            {name: "protocol", vali: {maxlength: 5}},
            {name: "callerId", vali: {maxlength: 32}},
            {name: "srcNumber", vali: {maxlength: 32}},
            {name: "srcDomain", vali: {maxlength: 64}},
            {name: "dstNumber", vali: {maxlength: 32}},
            {name: "dstDomain", vali: {maxlength: 64}},
            {name: "destNodeIds", vali: {maxlength: 128}},
            {name: "multiTrunk", type: "I", vali: {maxlength: 11}},
            {name: "remarks", vali: {maxlength: 128}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);




