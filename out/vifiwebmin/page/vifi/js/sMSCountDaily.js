
var appModule = require("appModule");
appModule.controller("sMSCountDailyCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/sMSCountDaily",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}},
            {name: "idxSMSGWId", vali: {maxlength: 64}},
            {name: "idxCountDate", type: "D"},
            {name: "cntSend", type: "I", vali: {maxlength: 11}},
            {name: "cntSucc", type: "I", vali: {maxlength: 11}},
            {name: "cntFail", type: "I", vali: {maxlength: 11}},
            {name: "cntRecv", type: "I", vali: {maxlength: 11}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 