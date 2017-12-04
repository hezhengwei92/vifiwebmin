var appModule = require("appModule");
appModule.controller("rewardRcdCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbRewardRcd",
        currentUri: "/user/rewardRcd",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},width:110},
            {name: "idxPhoneNumber", vali: {maxlength: 45},width:270,advQry:['LIKE']},
            //{name: "idxRewardId", vali: {maxlength: 45}},
            {name: "type", vali: {maxlength: 45},comType:"select",width:270,advQry:['LIKE']},
            {name: "amount", vali: {range: [0,10000],decimals:3},unitMul:0.001,width:270},
            {name: "effectDate", type: "D",width:125},
            {name: "invalidDate", type: "D",width:125},
            //{name: "remarks", vali: {maxlength: 128}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A",width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 