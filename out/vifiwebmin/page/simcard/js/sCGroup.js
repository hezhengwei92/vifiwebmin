var appModule = require("appModule");
var jsConst = require("jsConst");

appModule.controller("sCGroupCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var areaSelData = g_var.view.areaSelData;
    var ispSelData = g_var.view.ispSelData;
    var supplierSelData = g_var.view.supplierSelData;
    var viewCfg = {
        i18nPrefix: "db.tbSCGroup",
        currentUri: "/simcard/sCGroup/",
        fields: [{name: "keySCGroupID", type: "I", pk: true, disabled: "A", vali: {maxlength: 11}, left: true},
            {name: "groupName", vali: {maxlength: 128}, advQry: ["LIKE"], left: true, width:100},
            {name: "idxSalerId", vali: {maxlength: 64,required:false}, comType: "select", comData: supplierSelData, show: false, left: true},
            //{name: "areaName", vali: {maxlength: 32}, advQry: ["LIKE"],hideEdit:"A",left:true},
            {name: "areaCode", vali: {maxlength: 16}, advQry: ["LIKE"], comType: "area", comData: areaSelData, left: true, width:220},
            {name: "ispID", type: "I", vali: {maxlength: 16}, advQry: ["LIKE"], comType: "select", comData: ispSelData, left: true, width:220},
            //{name: "ispName", vali: {maxlength: 64}, advQry: ["LIKE"], hideEdit: "A",left:true},
            {name: "cardType", type: "I", vali: {maxlength: 11}, comType: "select", left: true, advQry: ["LIKE"]},
            {name: "cardSize", type: "I", vali: {maxlength: 11}, comType: "select", show: false, left: true, advQry: ["LIKE"]},
            {name: "monthlyRental", type: "F", vali: {range: [0, 10000], decimals: 3}, unitMul: 0.001, left: true},
            {name: "dataUsage", unitMul: 0.001, vali: {maxlength: 11}, left: true},
            {name: "dataPrice", unitMul: 0.001, vali: {range: [0, 1000], decimals: 3}, left: true, width:110},
            {name: "roamSupport", type: "I", vali: {maxlength: 1}, comType: "checkbox", comData: [[1, 0]], left: true},
            {name: "roamAreaCodes", vali: {maxlength: 256}, comType: "mulSelect", comData: areaSelData, left: false, width:120},
            {name: "roamDataPrice", unitMul: 0.001, vali: {range: [0, 1000], decimals: 3}, left: false, width:110},
            {
                name: "priority", type: "I", vali: {maxlength: 11}, left: false, advQry: ["LIKE"], comType: "select",
                comData:_.map(_.range(1,10),d=>[d+"",d+""])
            },
            {name: "number", type: "I", vali: {maxlength: 11}, left: false},
            {name: "remarks", vali: {maxlength: 128,required:false}, show: false, left: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    // 国家联动运营商
    $scope.$watch("form.copyData.areaCode", function (nData) {
        if (!nData) return;
        var newSelData = _.filter(ispSelData, v =>v[2] == nData);
        _.each(viewCfg.fields,function (field, i) {
            if (field.name == "ispID") {
                viewCfg.fields[i].comData = newSelData;
            }
        });
    });

    var proxySave = $scope.save;
    $scope.save = function () {
        var copyData = $scope.form.copyData;
        var areaName = _.filter(areaSelData, o=>o[0] == copyData.areaCode)[0][1];
        copyData.areaName = areaName.split("-")[1];

        var ispName = _.filter(ispSelData, o=>o[0] == copyData.ispID)[0][1];
        copyData.ispName = ispName.split("-")[1];
        // 未勾选漫游支持,   不收集漫游信息
        if (!copyData.roamSupport) {
            copyData.roamAreaCodes = "";
            copyData.roamDataPrice = 0;
        }
        proxySave();
    };

    $scope.$watch("form.copyData.roamSupport", function (nData) {
        _.each(["roamAreaCodes", "roamDataPrice"],function (v) {
            $scope.viewCfgMap[v].disabled = nData ? undefined : "A";
        });
    });


    // **************************************** 多个详情---------------
    var mulEOption = {
        title: {
            text: $.i18n("page.sCGroup.simCardNum"), subtext: "", x: 'center'
        },
        legend: {x: 'center', y: 'center', data: []},
        series: []
    };

    this.openMulDtlCallback = function (result) {
        var eOp = angular.copy(mulEOption);

        eOp.series = _.map(result.scGroups, function (scGroup, i) {
            var ratio = (scGroup.number / result.simCardCount * 100).toFixed(2);
            return {
                type: 'pie',
                center: [((i + 1) * 15) + '%', '30%'],
                radius: [40, 55],
                x: '0%', // for funnel
                itemStyle: {
                    normal: {
                        label: {
                            formatter: function (params) {
                                return (100 - params.value).toFixed(2) + '%'
                            },
                            textStyle: {
                                baseline: 'top'
                            }
                        }
                    }
                },
                data: [{
                    name: 'other', value: 100 - ratio, itemStyle: {
                        normal: {
                            color: '#ccc',
                            label: {
                                show: true,
                                position: 'center'
                            },
                            labelLine: {
                                show: false
                            }
                        },
                        emphasis: {
                            color: 'rgba(0,0,0,0)'
                        }
                    }
                }, {
                    name: scGroup.groupName, value: ratio, itemStyle: {
                        normal: {
                            label: {
                                show: true,
                                position: 'center',
                                formatter: '{b}\n' + scGroup.number,
                                textStyle: {
                                    baseline: 'bottom'
                                }
                            },
                            labelLine: {
                                show: false
                            }
                        }
                    }
                }]
            };
        });
        $scope.mulEOp = eOp;
    };


    // **************************************** 单个详情
    var sgEOption = {
        title: {
            text: $.i18n("state"), subtext: $.i18n("sum")+":", x: 'center'
        },
        tooltip: {trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)"},
        legend: {
            orient: 'vertical',x: 'left',data: []
        },
        series: [{
            name: $.i18n("state"),
            draggable: false,
            type: 'pie',
            radius: '55%',
            center: ['50%', '30%'],
            data: []
        }]
    };

    // 单个操作详情回调
    this.openSgDtlCallback = function (result) {
        var eOp = angular.copy(sgEOption);
        if (!result.sgDetails.length) {
            result.sgDetails.push({status: 0, count: 0});
        }

        eOp.series[0].data = [];
        var sum = 0;
        _.each(result.sgDetails,function (sgDetail) {
            sum += sgDetail.count * 1;
            eOp.series[0].data.push({name: Utils.getSelVal($.i18n("db.tbSimCard.status.comData"), sgDetail.status), value: sgDetail.count});
        });
        var format = eOp.title.subtext.replace(/:.*/, ":");
        eOp.title.subtext = format + sum;

        $scope.tbEOp = eOp;
    };
}]);

