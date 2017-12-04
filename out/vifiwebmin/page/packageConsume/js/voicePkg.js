
var appModule = require("appModule");
appModule.controller("voicePkgCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbVoicePkg",
        currentUri: "/packageConsume/voicePkg",
        fields:[{name: "keyID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},width:100},
            {name: "idxPhoneNumber", vali: {maxlength: 20},advQry:['LIKE'],width:140},
            {name: "suiteType", vali: {maxlength: 1},comType:"select",advQry:['LIKE'],width:140},
            {name: "remainValue", type: "I", vali: {maxlength: 11},width:140},
            {name: "effectDate", type: "D", width:140},
            {name: "invalidDate", type: "D",width:140},
            {name: "remarks", vali: {maxlength: 128,required:false},width:170},
            {name: "mdfTm", type: "D", hideEdit: "A", width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140},
            {name: "crtTm", type: "D", hideEdit: "A",show:false, width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140}]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 