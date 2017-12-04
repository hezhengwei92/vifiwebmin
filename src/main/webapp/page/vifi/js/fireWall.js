
var appModule = require("appModule");
appModule.controller("fireWallCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/fireWall",
        fields:[{name: "keyFireWallId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}},
            {name: "reqType", type: "I", vali: {maxlength: 11}},
            {name: "idxPhoneNumber", vali: {maxlength: 23}},
            {name: "fromIp", vali: {maxlength: 64}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 64}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 