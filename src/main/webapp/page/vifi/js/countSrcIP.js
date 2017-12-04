
var appModule = require("appModule");
appModule.controller("countSrcIPCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/countSrcIP",
        fields:[{name: "keyCountSrcIPId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}},
            {name: "idxSrcIP", vali: {maxlength: 64}},
            {name: "idxCountDate", type: "D"},
            {name: "idxServType", type: "I", vali: {maxlength: 11}},
            {name: "cntNumber", type: "I", vali: {maxlength: 11}},
            {name: "lastCntNumber", type: "I", vali: {maxlength: 11}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 