var appModule = require("appModule");
var rateBase = require("./rateBaseNew");

appModule.controller("rateCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {

    var viewCfg = {
        i18nPrefix: "db.tbRate",
        currentUri: "/vpx/rateNewVer/",
        fields: [{name: "keyRateID", type: "I", pk: true, show: false, disabled: "A", vali: {maxlength: 11}},
            {name: "rateMode", vali: {maxlength: 1}, advQry: ['LIKE'], comType: "select"},
            {name: "direction", type: "I", vali: {maxlength: 11}, width:85, advQry: ['LIKE'], comType: "select", valFormat: "<i class='img-fmt rate-rate-dir-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "idxCallPrefix", vali: {maxlength: 16}, advQry: ['LIKE'], width:75},
            {name: "idxAgentID", vali:{required:false},width:100, advQry: ['LIKE'], comType: "select", comData: g_var.view.agentSelData},
            {name: "countryCode", vali: {maxlength: 16}, comType: "select", comData: g_var.view.areaSelData, advQry: ['LIKE'], width:200},
            //{name: "country", vali: {maxlength: 45}, show: false, hideEdit: "A"},
            {name: "priceCallOnline", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001, advQry: ['LIKE'],width:115},
            {name: "priceCallOffline", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001,width:115},
            {name: "priceCallbackOff", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001,width:115},
            {name: "priceCallGoIP", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001,width:125},
            {name: "priceCallbackGoIP", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001,width:125},
            {name: "priceSMS", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001,width:90},
            //{name: "priceNET", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001, hideEdit: "A", show: false},
            //{name: "dayDataPrice", vali: {range: [0, 100000], decimals: 3}, unitMul: 0.001, hideEdit: "A", show: false},
            //{name: "dayDataLimit", vali: {range: [0, 100000]}, unitMul: 0.001, hideEdit: "A", show: false},
            {name: "remarks", vali: {maxlength: 128,required:false}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width: 125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
    // 暂时 通话费率,和流量费率使用相同的实现
    rateBase.call(this, $scope);
}]);




