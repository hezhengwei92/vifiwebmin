var appModule = require("appModule");
appModule.controller("vpxCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var ispSelData = g_var.view.ispSelData;
    var viewCfg = {
        i18nPrefix: "db.tbVPX",
        currentUri: "/vpx/vpx",
        fields: [{name: "keyVPXID", pk: true, left: true, disabled: "E", vali: {maxlength: 32}, width:140, advQry: ["LIKE"]},
            {name: "hostname", left: true, vali: {maxlength: 32}, advQry: ['LIKE'], width:140},
            {name: "state", left: true, vali: {maxlength: 1}, comType: "select", advQry: ['LIKE'], valFormat: "<i class='img-fmt vpx-vpx-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            //{name: "onlineUserNum", type: "I", left: true,hideEdit: "A",show:false, vali: {maxlength: 11}},
            //{name: "callingUserNum", type: "I", left: true,hideEdit: "A",show:false, vali: {maxlength: 11}},
            {name: "maxOnlineNum", type: "I", left: true, vali: {maxlength: 11}, show: false},
            {name: "maxCallingNum", type: "I", left: true, vali: {maxlength: 11}, show: false},
            {name: "publicIP", left: true, vali: {maxlength: 128}, width:110},
            {name: "publicPort", type: "I", left: true, vali: {maxlength: 11}},
            {name: "location", left: true, vali: {maxlength: 256}, width:200},
            {name: "admin", left: true, vali: {maxlength: 256}, show: false, advQry: ['LIKE']},
            {name: "countryCode", left: true, vali: {maxlength: 32},width:200, comType: "area", comData: g_var.view.areaSelData},
            {name: "ISPName", left: true, vali: {maxlength: 32}, advQry: ['LIKE'], show: false, comType: "select", comData: ispSelData},
            {name: "bandwidth", type: "I", left: false, vali: {maxlength: 11}, show: false},
            {name: "star", type: "I", left: false, vali: {maxlength: 11}, advQry: ['LIKE'], show: false, comType: "select", comData: [["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"], ["5", "5"]]},
            {name: "esxiHost", left: false, vali: {maxlength: 32,required:false}, show: false},
            {name: "CPU", left: false, vali: {maxlength: 128,required:false}, show: false},
            {name: "MEM", type: "I", left: false, vali: {maxlength: 11,required:false}, show: false},
            {name: "HARDDISK", type: "I", left: false, vali: {maxlength: 11,required:false}, show: false},
            {name: "diskUsage", type: "I", left: false, hideEdit: "A", vali: {range: [0, 100]}},
            {name: "powerDate", type: "D", left: false, show: false, vali:{required:false}},
            {name: "remarks", left: false, vali: {maxlength: 128,required:false}, show: false},
            {name: "mdfTm", type: "D", left: false, hideEdit: "A", width:125},
            {name: "mdfBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", left: false, hideEdit: "A", show: false},
            {name: "crtBy", left: false, hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);


    // 国家联动运营商
    $scope.$watch("form.copyData.countryCode", function (nData) {
        if (!nData) return;
        var newSelData = _.filter(ispSelData, v =>v[2] == nData);
        _.each(viewCfg.fields,function (field, i) {
            if (field.name == "ISPName") {
                viewCfg.fields[i].comData = newSelData
            }
        });
    });

    // *** table详情
    var tbEOpt = {
        title: {
            text: $.i18n("state"),
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: []
        },
        series: [
            {
                name: $.i18n("state"),
                draggable: false,
                type: 'pie',
                radius: '55%',
                center: ['50%', '40%'],
                data: []
            }
        ]
    };

    this.openTbDtlCallback = function (result) {
        var eOp = angular.copy(tbEOpt);
        if (!result.stateStatis.length) {
            result.stateStatis.push({status: 0, count: 0});
        }

        eOp.series[0].data = [];
        _.each(result.stateStatis,function (sgDetail) {
            var name = $scope.viewCfgMap["state"].valAs[sgDetail.state] || sgDetail.state;
            eOp.series[0].data.push({name: name, value: sgDetail.count});
        });
        $scope.tbEOp = eOp;
    };

    // *** 多选详情
    var mulEOpt = {
        title: {
            text: $.i18n("state"),
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: []
        },
        calculable: true,
        series: [
            {
                name: $.i18n("state"),
                draggable: false,
                type: 'pie',
                radius: '55%',
                center: ['50%', '40%'],
                data: []
            }
        ]
    };

    var mulDtlChart = null;

    this.openMulDtlCallback = function (result) {
        // 单例,初始化  echarts 实例
        mulDtlChart = mulDtlChart || echarts.init($("#mul-dtl-echarts")[0], 'macarons');

        if (!result.stateStatis.length) {
            result.stateStatis.push({status: 0, count: 0});
        }

        mulEOpt.series[0].data = [];
        _.each(result.stateStatis,function (sgDetail) {
            var name = $scope.viewCfgMap["state"].valAs[sgDetail.state] || sgDetail.state;
            mulEOpt.series[0].data.push({name: name, value: sgDetail.count});
        });
        mulDtlChart.clear();
        mulDtlChart.setOption(mulEOpt);
    };


}]);
 