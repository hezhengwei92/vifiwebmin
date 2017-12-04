
var appModule = require("appModule");
appModule.controller("cronLogCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/cronLog",
        fields:[{name: "keyCronLogId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}},
            {name: "state", type: "I", vali: {maxlength: 4}},
            {name: "cronType", vali: {maxlength: 80}},
            {name: "influenceRow", type: "I", vali: {maxlength: 11}},
            {name: "remarks", vali: {maxlength: 255}},
            {name: "runCycle", vali: {maxlength: 127}},
            {name: "createTime", type: "D"}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 