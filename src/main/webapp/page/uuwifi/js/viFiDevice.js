var appModule = require("appModule");
appModule.controller("viFiDeviceCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbViFiDevice",
        currentUri: "/uuwifi/viFiDevice",
        fields: [{name: "keyDevID", pk: true, disabled: "E", vali: {maxlength: 64}, advQry: ['LIKE']},
            {name: "idxViFiID", vali: {rangelength: ["24", "24"]}, disabled: "E", width:210, advQry: ['LIKE']},
            {name: "pwd", vali: {maxlength: 45}, disabled: "E", show: false},
            {name: "idxDevGrpID", vali: {maxlength: 64},width:130, comType: "select", comData: g_var.view.devGroupSelData},
            {name: "idxVNSID", vali: {maxlength: 64},width:130, comType: "select", comData: g_var.view.vnsSelData, advQry: ['LIKE']},
            {name: "devState", vali: {maxlength: 1}, comType: "select", advQry: ['LIKE'],valFormat:"<i class='img-fmt uuw-vifi-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            //{name: "cos",  vali: {maxlength: 26}, show: false},
            {name: "idxUserID",  vali: {maxlength: 64,required:false}},
            {name: "idxAgentID", vali: {maxlength: 64},width:130, comType: "select", comData: g_var.view.agentSelData, advQry: ['LIKE']},
            //{name: "redirectTimes", type: "I",  vali: {maxlength: 11},hideEdit:"A", show: false},
            //{name: "lastRedirectDate", type: "D",  show: false, hideEdit:"A"},
            //{name: "expire", type: "I",  vali: {maxlength: 11}, show: false, hideEdit:"A"},
            //{name: "lastDomain",  vali: {maxlength: 64}, show: false, hideEdit:"A"},
            {name: "debugIdt", type: "I", vali: {maxlength: 4}, show: false, comType: "select"},
            //{name: "updateIdt", type: "I",  vali: {maxlength: 4}, show: false, hideEdit:"A"},
            {name: "hardwareVer",width:130, disabled: "E", vali: {maxlength: 10}, advQry: ['LIKE'], comType: "select", comData: g_var.view.hardwareVerSelData},
            {name: "firmwareVer", disabled: "E", vali: {maxlength: 10}, advQry: ['LIKE'], show: false, comType: "select", comData: g_var.view.firmwareVerSelData},
            {name: "softwareVer", disabled: "E", vali: {maxlength: 10}, advQry: ['LIKE'], show: false, comType: "select", comData: g_var.view.softwareVerSelData},
            {name: "lastUpdateDate", type: "D", hideEdit: "A", width:125},
            {name: "lastConnectTime", type: "D", hideEdit: "A", width:125},
            {name: "lastConnectIP", vali: {maxlength: 32}, hideEdit: "A", width:95},
            {name: "remark", vali: {maxlength: 256,required:false}, show: false, hideEdit: "E"},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);


    //********************导入,导出
    var CVS_HEAD = "devID,uuwifiID,dev_pwd,vnsID,agent,hardwareVer,firmwareVer,softwareVer", CVS_HEAD_LEN = 8;

    function checkDevCsvFile(csvStr) {
        var csvRows = csvStr.split(/\r\n|\r|\n/);
        var csvRow1 = csvRows[0] || "";
        if (csvRow1 != CVS_HEAD) {
            layer.msg.error("csv data error, title = " + CVS_HEAD);
            return false;
        }

        for (var i = 1; i < csvRows.length; i++) {
            var csvRow = csvRows[i];
            var row = csvRow.split(",");
            if (row.length != CVS_HEAD_LEN && row.length != 1) {
                layer.msg.error("csv data error, data line:" + (i + 1) + " error :" + csvRow + ",row len" + row.length);
                return false;
            }
        }
        return true;
    }

    function importCsv(csvStr) {
        Utils.ajax({
            url: $scope.prefixUrl + "/importCsv.ajax",
            data: {csvStr: csvStr},
            success:()=>$scope.search(1)
        });
    }


    $scope.exportCsv = function () {
        Utils.ajax({
            url: $scope.prefixUrl + "/exportCsv.ajax",
            success: res =>Utils.export_raw('uuwifiDev' + new Date().format("yyyy-MM-dd_HH_mm_ss") + '.csv', res.data)
        });
    };

    // 导入文件 file change事件
    $("#import-csv").change(function () {
        if (this.files.length) {
            var reader = new FileReader();
            reader.onload = function () {
                var csvStr = this.result;
                checkDevCsvFile(csvStr) && importCsv(csvStr);
            };
            reader.readAsText(this.files[0]);
        }
    });

    //*********** 单个详情
    this.openSgDtlCallback = function () {};

}]);
