var bindBase = function ($scope) {
    var Utils = require("commonUtils");
    // 代理装饰包装 搜索方法
    var proxySearch = $scope.search;
    $scope.search = function (pageNumber) {
        proxySearch(pageNumber, function (res) {
            $scope.viewCfg.fields[0].def = res.data.maxKeyId + 1;
        });
    };

    



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

    //子页面导出
    $scope.exportRateCsv = function () {
        var tbHead = _.map(_.filter($scope.viewCfg.fields, f=>f.show), f=>f.name);
        Utils.ajax({
            url: $scope.prefixUrl + "/exportRateC.ajax",
            data: {tbHead: tbHead.join(",")},
            success: function (res) {
                var dHead = [];
                $(".data-thead th .table-data").each((i, v)=>dHead.push($(v).html()));
                Utils.export_raw('2rate' + new Date().format("yyyy-MM-dd_HH_mm_ss") + '.csv', dHead + "\r\n" + res.data);
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
module.exports = bindBase;
