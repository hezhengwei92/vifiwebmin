var appModule = require("appModule");
var sessionBase=require("../../../page/commons/js/export");
appModule.controller("uUWiFiSessionCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbUUWiFiSession",
        currentUri: "/syslog/uUWiFiSession",
        fields: [{name: "keySessID", pk: true, disabled: "E", vali: {maxlength: 24}, width:170},
            {name: "sessType", vali: {maxlength: 1}, comType: "select", advQry: ["LIKE"], width:110},
            {name: "bindType", vali: {maxlength: 1}, width:110, comType: "select" },
            {name: "idxVifiID", vali: {maxlength: 64}, advQry: ["LIKE"], width:195},
            {name: "idxSimCIccId", vali: {maxlength: 64}, advQry: ["LIKE"], width:160, comType: "select", comData: g_var.view.keysimcardIDSelData},
            {name: "idxSimPDevID", vali: {maxlength: 64}, advQry: ["LIKE"], comType: "select", comData: g_var.view.keySimPDevIDSelData},
            {name: "idxSimPPortId", vali: {maxlength: 64}},
            {name: "idxGoipDevID", vali: {maxlength: 64}, advQry: ["LIKE"], width:195},//, comType: "select", comData: g_var.view.keygoipdevSelData},
            {name: "idxGoipPortID", type: "I", vali: {maxlength: 11}},
            {name: "idxVSWID", vali: {maxlength: 64},  advQry: ["LIKE"],comType: "select", comData: g_var.view.keyvswidSelData},
            {name: "status", type: "I", vali: {maxlength: 11}, comType: "select", advQry: ["LIKE"], valFormat:"<i class='img-fmt vsw-session-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "expire", type: "I", vali: {maxlength: 11}},
            {name: "userAct", vali:{maxlength:64}, width:125},
            {name: "lastUpdate", type: "D", width:125},
            //{name: "remarks", vali: {maxlength: 128}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", advQry: ["GTE"], width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:125},
            {name: "crtTm", type: "D", hideEdit: "A", show: false, width:125},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:125}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
   sessionBase.call(this, $scope);
}]);
 