var appModule = require("appModule");
appModule.controller("trunkCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix: "db.tbTrunk",
        currentUri: "/vpx/trunk",
        fields: [{name: "keyTrunkID", type: "I", pk: true, left: true, advQry: ['LIKE'], disabled: "E", vali: {maxlength: 11},width:60},
            {name: "idxTrunkName", left: true, vali: {maxlength: 64}, advQry: ['LIKE'], width:100},
            {name: "trusty", type: "I", left: true, vali: {maxlength: 1}, comType: "checkbox", comData: [[1, 0]], width:45},
            {name: "dynamic", type: "I", left: true, vali: {maxlength: 1}, comType: "checkbox", comData: [[1, 0]], width:45},
            {name: "username", left: true, vali: {maxlength: 64}, advQry: ['LIKE'], width:90},
            {name: "realm", left: true, vali: {maxlength: 64}, width:90},
            {name: "host", left: true, vali: {maxlength: 32,required:false}, width:95},
            {name: "expires", type: "I", left: true, vali: {maxlength: 11,required:false}, width:90},
            {name: "port", type: "I", left: true, vali: {maxlength: 11,required:false}, width:55},
            {name: "Prefix", left: true, vali: {maxlength: 45}, advQry: ['LIKE']},
            {name: "replaceUsername", type: "I", left: true, vali: {maxlength: 1}, comType: "checkbox", comData: [[1, 0]], width:70},
            {name: "state", type: "I", left: false, vali: {maxlength: 11}, comType: "select", advQry: ['LIKE'], valFormat: "<i class='img-fmt vpx-tru-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            //     {name: "callingNum", type: "I", left: false, vali: {maxlength: 11}},keyVPXIDSelData
            {name: "maxCallNum", type: "I", left: false, vali: {maxlength: 11,required:false}, width:80},
            {name: "mcSupport", type: "I", left: false, vali: {maxlength: 1}, comType: "checkbox", comData: [[0, 1]], width:90},
            {name: "VPXID", left: false, vali: {maxlength: 32,required:false}, advQry: ['LIKE'], comType: "select", comData: g_var.view.vpxSelData, width:100},
            {name: "idxSalerID", left: false, vali: {maxlength: 64,required:false}, advQry: ['LIKE'], comType: "select", comData: g_var.view.supplierSelData, show:false},
            {name: "Remarks", left: false, vali: {maxlength: 128, required: false}, show: false},
            {name: "mdfTm", type: "D", left: false, hideEdit: "A", width:125},
            {name: "mdfBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", left: false, hideEdit: "A", show: false},
            {name: "crtBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    // 勾选信任同步.其他项...
    $scope.$watch("form.copyData.trusty", function (nData) {
        _.each(["dynamic", "username", "realm"], function (name) {
            $scope.viewCfgMap[name].disabled = nData ? "A" : undefined;
        });
    });


    // *********************************** 单个详情
    // 基于准备好的dom，初始化echarts图表

    var initData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var sgChartOption = {

        tooltip: {trigger: 'axis'},
        legend: {
            x: 'left',data: ["data(kb)"]
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: new Array(24).map((v, k)=>k + 1)
            }
        ],
        yAxis: [
            {type: 'value'}
        ],
        grid: {x: 30, y: 30, x2: 30, y2: 30},
        series: [{
            name: "data(kb)", type: 'line',
            data: []
        }]
    };


    this.openSgDtlCallback = function (result) {
        var sgChart = echarts.init($("#sg-dtl-echarts")[0], 'macarons');
        var data = angular.copy(initData);

        _.each(result.todayFlow, function (v) {
            data[v.time - 1] = v.dataTraffic;
        });
        sgChartOption.series[0].data = data;
        sgChart.clear();
        sgChart.setOption(sgChartOption);
    }


}]);
 