var rateBase = function ($scope) {
    var Utils = require("commonUtils");
    // 代理装饰包装 搜索方法
    var proxySearch = $scope.search;
    $scope.search = function (pageNumber) {
        proxySearch(pageNumber, function (res) {
            $scope.viewCfg.fields[0].def = res.data.maxKeyRateId + 1;
        });
    };

    
//	地图jsp
//	<!-- c:param name="graphViewEx">
//		<echart data-options="graphViewEOp" style="height: calc(100vh - 160px) ;width:86.6vw;"></echart>
//	</c:param>-->
//	<!--c:param name="footScopeEx">
//		<%--引入世界地图js--%>
//		<script src="${path}/assets/js/libs/echarts/map/world.js"></script>
//	</c:param-->


    // ****************** 状态视图
//    $scope.graphViewEOp = {
//        tooltip: {
//            trigger: 'item', enterable: true,
//            formatter: params=>`<p class="red font-150">${params.name}</p>` + (params.data.tips || "")
//        },
//        dataRange: {
//            show: false, min: 0, max: 1, realtime: false, calculable: true,
//            color: ['green', '#CCC']
//        },
//        series: [{
//            type: 'map',
//            mapType: 'world',
//            roam: true,
//            itemStyle: {
//                emphasis: {label: {show: true}}
//            },
//            data: _.map($scope.view.rateGroupByArea, function (rateGroup, rateGroupKey) {
//                var prefix = "db.tbRate.";
//                var tips = _.map(rateGroup, rate=>[
//                    rate.country,
//                    $.i18n(prefix + "priceCallOnline") + " : " + Number(rate.priceCallOnline).mul(0.001),
//                    $.i18n(prefix + "priceCallOffline") + " : " + Number(rate.priceCallOffline).mul(0.001),
//                    $.i18n(prefix + "priceNET") + " : " + Number(rate.priceNET).mul(0.001),
//                    $.i18n(prefix + "dayDataPrice") + " : " + Number(rate.dayDataPrice).mul(0.001)
//                ].join("<br>&nbsp;&nbsp;")).join("<br>");
//
//                return {name: rateGroupKey, value: 1, tips: tips};
//            })
//        }]
//    };


    ////////////////////////////////////// 导入导出
    var CSV_HEAD = "prefix,country code,country,price", CSV_HEAD_LEN = 4;

    function checkRateCsvStr(csvStr) {
        var csvRows = csvStr.split(/\r\n|\r|\n/);
        var csvRow1 = csvRows[0] || "";
        if (csvRow1 != CSV_HEAD) {
            layer.msg.error("csv data error, title = " + CSV_HEAD);
            return false;
        }
        for (var i = 1; i < csvRows.length; i++) {
            var csvRow = csvRows[i];
            var row = csvRow.split(",");
            if (row.length != CSV_HEAD_LEN && row.length != 1) {
                layer.msg.error("csv data error, data line:" + (i + 1) + " error :" + csvRow + ",row len" + row.length);
                return false;
            }
        }
        return true;
    }

    function importRateCsv(csvStr) {
        Utils.ajax({
            url: $scope.prefixUrl + "/importRateCsv.ajax",
            data: {csvStr: csvStr},
            success: ()=> $scope.search(1)
        });
    }


    $scope.exportRateCsv = function () {
        var tbHead = _.map(_.filter($scope.viewCfg.fields, f=>f.show), f=>f.name);
        Utils.ajax({
            url: $scope.prefixUrl + "/exportCsvv.ajax",
            data: {tbHead: tbHead.join(",")},
            success: function (res) {
                var dHead = [];
                $(".data-thead th .table-data").each((i, v)=>dHead.push($(v).html()));
                Utils.export_raw('Record' + new Date().format("yyyy-MM-dd_HH_mm_ss") + '.csv', dHead + "\r\n" + res.data);
            }
        });
    };


    $(function () {
        // 导入文件 file change事件
        $("#import-csv").change(function () {
            if (this.files.length) {
                var reader = new FileReader();
                reader.onload = function () {
                    var csvStr = this.result;
                    checkRateCsvStr(csvStr) && importRateCsv(csvStr);
                };
                reader.readAsText(this.files[0]);
            }
        });

    });


};
module.exports = rateBase;
