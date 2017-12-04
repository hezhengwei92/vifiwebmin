var appModule = require("appModule");
var jsConst = require("jsConst");
appModule.controller("goIPPortCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix: "db.tbGoIPPort",
        currentUri: "/goip/goIPPort",
        fields: [{name: "keyID", type: "I", pk: true, disabled: "A", hideEdit: "A", vali: {maxlength: 11}, show: false},
            {name: "idxGoIPDevID", vali: {maxlength: 64}, advQry: ["LIKE"], comType: "select", comData: g_var.view.goipdevSelData, width:150},
            {name: "idxportNum", type: "I", vali: {maxlength: 11}, width:80},
            {name: "status", type: "I", vali: {maxlength: 11}, valFormat: "<i class='img-fmt goip-port-sta-{a}'></i><i class='f-tips'>{b}</i>", comType: "select", advQry: ["LIKE"]},
            {name: "idxViFiID", vali: {maxlength: 30}, advQry: ["LIKE"], comType: "select", comData: g_var.view.vifideviceSelData, width:150},
            {name: "uuIccid", vali: {maxlength: 30}, hideEdit: "A", width:150},
            {name: "uuImsi", vali: {maxlength: 30}, hideEdit: "A", width:150},
            {name: "userAct", vali: {maxlength: 64}, hideEdit: "A", advQry: ["LIKE"], width:150},
            {name: "usage", type: "I", vali: {maxlength: 11}, width:115},
            {name: "duration", type: "I", vali: {maxlength: 11}},
            //{name: "remarks", vali: {maxlength: 128}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };


    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    // *** tb 详情
    var tbEOption = {
        title: {text: 'goIP ' + $.i18n("state"), x: 'center'},
        tooltip: {trigger: 'item', formatter: p=>p.data.fmt},
        series: [{
            type: 'pie', itemStyle: {normal: {label: {show: false}, labelLine: {show: false}}}
        }]
    };

    this.openTbDtlCallback = function () {
        var eOpt = angular.copy(tbEOption);
        eOpt.series[0].data = _.map($scope.view.tbDetails.statusCount, function (sta) {
            return {
                name: sta.statusAs,
                fmt: `<div class="img-fmt goip-port-sta-${sta.status}"></div> ${Utils.getSelVal($.i18n("db.tbGoIPPort.status.comData"), sta.status)}:${sta.count}`,
                value: sta.count
            };
        });

        // 转换为2维数组
        $scope.view.tbDetails.staDtlList = _.toArray(_.groupBy($scope.view.tbDetails.staDtlList, (v, k)=>parseInt(k / 32)));

        $scope.tbEOp = eOpt;
    };


    //************************************************ 多选 详情
    this.openMulDtlCallback = function () {
        // 转换为2维数组
        $scope.view.mulDetails.staDtlList = _.toArray(_.groupBy($scope.view.mulDetails.staDtlList, (v, k)=>parseInt(k / 32)));

    };

}]);
 