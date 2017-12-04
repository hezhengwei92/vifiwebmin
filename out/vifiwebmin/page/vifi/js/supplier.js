var appModule = require("appModule");


appModule.controller("supplierCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/supplier/",
        fields:[{name: "idxSupplierId", pk: true, disabled: "E", vali: {maxlength: 128}},
            {name: "name", vali: {maxlength: 128}},
            {name: "phoneNumber", vali: {maxlength: 32}},
            {name: "supplierLevel", type: "I", vali: {maxlength: 11}},
            {name: "status", type: "I", vali: {maxlength: 11}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);




