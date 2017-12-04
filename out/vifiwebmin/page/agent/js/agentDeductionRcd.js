var appModule = require("appModule");
appModule.controller("agentDeductionRcdCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbAgentDeductionRcd",
        currentUri: "/agent/agentDeductionRcd",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},width:100},
            {name: "idxAgentID", vali: {maxlength: 128},width:270},
            {name: "idxCDRId", vali: {maxlength: 128},width:110},
            {name: "discount", type: "I", vali: {range: [0,100]},advQry:['LIKE'],width:100},
            {name: "amount", unitMul: 0.001, vali: {range: [0, 10000], decimals: 3},advQry:['LIKE'],width:140},
            {name: "beforeValue", unitMul: 0.001, vali: {range: [-10000000, 10000000], decimals: 3},advQry:['LIKE'],width:220},
            {name: "afterValue", unitMul: 0.001, vali: {range: [-10000000, 10000000], decimals: 3},advQry:['LIKE'],width:210},
            {name: "remark", vali: {maxlength: 256}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A",width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140},
            {name: "crtTm", type: "D", hideEdit: "A", show: false, width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 