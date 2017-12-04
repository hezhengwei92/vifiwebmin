require("../css/simp.css");
var jsConst = require("jsConst");
var appModule = require("appModule");
appModule.controller("simPPortCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbSimPPort",
        currentUri: "/simp/simPPort/",
        fields: [{name: "keyID", type: "I", pk: true, show: false, disabled: "A", vali: {maxlength: 11}},
            {name: "idxSimPDevID", vali: {maxlength: 64}, advQry: ["LIKE"], comType: "select", comData: g_var.view.simpdevSelData, width:150},
            {name: "idxSlotNum", type: "I", vali: {maxlength: 11}, width:150},
            {name: "status", type: "I", comType: "select", valFormat: "<i class='img-fmt simp-port-sta-{a}'></i><i class='f-tips'>{b}</i>", vali: {maxlength: 11}, advQry: ["LIKE"]},
            {name: "idxIccid", vali: {maxlength: 24}, width:245},
            {name: "idxViFiId", vali: {maxlength: 30}, advQry: ["LIKE"], width:245},
            {name: "usage", type: "I", vali: {maxlength: 11}, width:140},
            {name: "duration", type: "I", vali: {maxlength: 11}, width:140},
            {name: "remarks", show: false, vali: {maxlength: 128, required: false}},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    //

    // *** tb详情
    var tbEOption = {
        title: {text: 'simp ' + $.i18n("state"), x: 'center'},
        tooltip: {trigger: 'item', formatter: p=>p.data.fmt},
        series: [{
            type: 'pie', itemStyle: {normal: {label: {show: false}, labelLine: {show: false}}}
        }]
    };

    this.openTbDtlCallback = function () {
        var eOpt = angular.copy(tbEOption);
        // 饼图数据
        eOpt.series[0].data = _.map($scope.view.tbDetails.statusCount,function (sta) {
            return {
                name: sta.statusAs,
                fmt: `<div class="img-fmt simp-port-sta-${sta.status}"></div> ${Utils.getSelVal($.i18n("db.tbSimPPort.status.comData"),sta.status)}:${sta.count}`,
                value: sta.count
            };
        });

        // 转换为2维数组
        $scope.view.tbDetails.portStatus = _.toArray(_.groupBy($scope.view.tbDetails.portStatus, (v, k)=>parseInt(k / 32)));

        $scope.tbEOp = eOpt;
    };


    // **************************************** 多个详情---------------
    this.openMulDtlCallback = function (result) {
        // 转换为2维数组
        $scope.view.mulDetails.portStatus = _.toArray(_.groupBy($scope.view.mulDetails.portStatus, (v, k)=>parseInt(k / 32)));

    };

}]);
 