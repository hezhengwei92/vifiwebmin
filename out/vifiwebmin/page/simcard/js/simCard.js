require("../css/simCard.css");
var appModule = require("appModule");
appModule.controller("simCardCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var scGroupSelData = g_var.view.scGroupSelData;
    var viewCfg = {
        i18nPrefix: "db.tbSimCard",
        currentUri: "/simcard/simCard/",

        fields: [{name: "keySimCardID", pk: true, advQry: ['LIKE'], disabled: "E", vali: {maxlength: 64}, width:170},
            {name: "idxSCGroupID", advQry: ['LIKE'], vali: {maxlength: 64}, mulEdit: "True", comType: "select", comData: scGroupSelData, width:120},
            //{name: "idxIccid",  vali: {maxlength: 24}},
            {name: "imsi", show: false, vali: {maxlength: 16}},
            {name: "imei", show: false, vali: {maxlength: 16,required:false}},
            {name: "ssId", type: "I", show: false, vali: {maxlength: 11}},
            {name: "status", type: "I", comType: "select", vali: {maxlength: 11}, mulEdit: true, valFormat: "<i class='img-fmt simc-simc-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "number", advQry: ['LIKE'], vali: {maxlength: 32, required: false}, width:90},
            {name: "balance", unitMul: 0.001, advQry: ['LIKE'], vali: {range: [0, 100000], decimals: 3,required:false}, mulEdit: true, width:110},
            {name: "restNetData", unitMul: 0.001, advQry: ['LIKE'], vali: {range: [0, 1000000], decimals: 3,required:false}},
            // {name: "restCallDur", type: "I",  vali: {maxlength: 11}},
            // {name: "restSMSNum", type: "I",  vali: {maxlength: 11}},
            {name: "onlineTime", type: "I", hideEdit: "A", vali: {maxlength: 11}},
            // {name: "outCalls", type: "I",  vali: {maxlength: 11}},
            // {name: "outCallDuration", type: "I",  vali: {maxlength: 11}},
            //  {name: "inCalls", type: "I",  vali: {maxlength: 11}},
            // {name: "inCallDuration", type: "I",  vali: {maxlength: 11}},
            //  {name: "successCalls", type: "I",  vali: {maxlength: 11}},
            //  {name: "failedCalls", type: "I",  vali: {maxlength: 11}},
            // {name: "shortCalls", type: "I",  vali: {maxlength: 11}},
            //  {name: "contFailedCalls", type: "I",  vali: {maxlength: 11}},
            {name: "totalSuccess", type: "I", hideEdit: "A", vali: {maxlength: 11}, width:105},
            {name: "totalFailed", type: "I", hideEdit: "A", vali: {maxlength: 11}, width:105},
            //{name: "contFailed", type: "I",  vali: {maxlength: 11}},
            {name: "totalData", hideEdit: "A", vali: {maxlength: 11},unitMul:0.001},
            {name: "lastIdleTime", type: "D", hideEdit: "A", width:125},
            {name: "remarks", show: false, vali: {maxlength: 128, required: false}},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", show: false, hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", show: false, type: "D", hideEdit: "A"},
            {name: "crtBy", show: false, hideEdit: "A", vali: {maxlength: 45}}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);


    // *** 状态层
    // 按3个一组分开.方便视图循环 展示
    $scope.form.areaMap = _.mapObject($scope.view.areaSimCardStatusCount, v=>_.toArray(_.groupBy(v, (v2, k2)=>parseInt(k2 / 3))));

}]);
 