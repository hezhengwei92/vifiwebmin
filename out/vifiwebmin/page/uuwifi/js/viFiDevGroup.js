var appModule = require("appModule");
appModule.controller("viFiDevGroupCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbViFiDevGroup",
        currentUri: "/uuwifi/viFiDevGroup",
        fields: [{name: "keyDevGrpID", pk: true, disabled: "E", vali: {maxlength: 64}, advQry: ['LIKE'],width:100},
            {name: "name", vali: {maxlength: 128}, advQry: ['LIKE'],width:140},
            {name: "productionDate", type: "D", disabled: "E"},
            {name: "productionNo", vali: {maxlength: 100}, disabled: "E", advQry: ['LIKE']},
            {name: "productionVer", vali: {maxlength: 128}, disabled: "E", advQry: ['LIKE']},
            {name: "hardwareVer", vali: {maxlength: 10}, disabled: "E", advQry: ['LIKE']},
            {name: "firmwareVer", vali: {maxlength: 10}, disabled: "E", advQry: ['LIKE']},
            {name: "softwareVer", vali: {maxlength: 10}, disabled: "E", advQry: ['LIKE']},
            {name: "initNumber", type: "I", vali: {maxlength: 11}, disabled: "E",width:90},
            {name: "currentNumber", type: "I", vali: {maxlength: 11},width:90},
            {name: "normalNumber", type: "I", vali: {maxlength: 11},width:90},
            {name: "repairTimes", type: "I", vali: {maxlength: 11}, hideEdit: "N", disabled: "E",width:90},
            {name: "remark", vali: {maxlength: 256,required:false},show:false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);


    var sgEOpt = {
        title: {text: "本组状态", x: 'center'},
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
                name: '状态',
                draggable: false,
                type: 'pie',
                radius: '55%',
                center: ['50%', '40%'],
                data: []
            }
        ]
    };

    var sgDtlChart = null;

    this.openSgDtlCallback = function (result) {
        // 单例,初始化  echarts 实例
        sgDtlChart = sgDtlChart || echarts.init($("#sg-dtl-echarts")[0], 'macarons');

        var devState = result.devState;
        if (!devState.length) {
            devState.push({status: 0, count: 0});
        }

        sgEOpt.series[0].data = [];
        _.each(devState,function (devSte) {
            sgEOpt.series[0].data.push({name: Utils.getSelVal($.i18n("db.tbViFiDevice.devState.comData"),devSte.status), value: devSte.count});
        });
        sgDtlChart.clear();
        sgDtlChart.setOption(sgEOpt);
    };


}]);
 