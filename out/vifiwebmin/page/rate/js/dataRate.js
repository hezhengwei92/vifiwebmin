var appModule = require("appModule");
var rateBase = require("./rateBase");

appModule.controller("dataRateCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var STAN_TITLE = "prefix,country code,country,price", STAN_TITLE_LEN = 4;

    var viewCfg = {
        i18nPrefix: "db.tbDataRate",
        currentUri: "/vsw/data-rate/",
        fields: [{name: "keyRateID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},width:100},
            {name: "countryCode", vali: {maxlength: 16}, comType: "select", comData: g_var.view.areaSelData, advQry: ['LIKE'], width: 240},
            {name:"idxAgentID", vali:{required:false},width:100, advQry: ['LIKE'], comType: "select", comData: g_var.view.agentSelData},
            {name: "rateMode", vali: {maxlength: 1}, comType: "select"},//, advQry: ['LIKE'] 通话费率和流量费率，service已初始化计费模式参数，取消搜索
            //{name: "direction", vali: {maxlength: 11},width:125, advQry: ['LIKE'], comType: "select", valFormat: "<i class='img-fmt rate-rate-dir-{a}'></i><i class='f-tips'>{b}</i>"},
            //{name: "idxCallPrefix", vali: {maxlength: 16},width:125,  advQry: ['LIKE']},
            //{name: "country",  vali: {maxlength: 45} ,hideEdit:"A",show:false },
            //{name: "priceCallOnline",  vali: {maxlength: 11}  ,hideEdit:"A",show:false},
            //{name: "priceCallOffline",   vali: {maxlength: 11},hideEdit:"A",show:false},
            //{name: "priceCallbackOff",  vali: {maxlength: 11} ,hideEdit:"A",show:false},
            //{name: "priceCallGoIP", vali: {maxlength: 11},hideEdit:"A",show:false},
            //{name: "priceCallbackGoIP",  vali: {maxlength: 11},hideEdit:"A",show:false},
            //{name: "priceSMS", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001, width: 150},
            {name: "priceNET", vali: {range: [0, 1000], decimals: 3}, unitMul: 0.001, width: 120, advQry: ['LIKE']},
            {name: "dayDataPrice", vali: {range: [0, 100000], decimals: 3}, unitMul: 0.001, width: 120},
            {name: "dayDataLimit", vali: {range: [0, 100000], decimals: 3}, unitMul: 0.001, width: 130},
            {name: "remarks", vali: {maxlength: 128,required:false}, width:120},
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




