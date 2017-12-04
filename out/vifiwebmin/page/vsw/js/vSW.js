/*
var appModule = require("appModule");
appModule.controller("vswCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix: "db.tbVSW",
        currentUri: "/vsw/vsw",
        //字段已修改，增加了vswProtocol;——尚未添加
        fields: [{name: "keyVSWID", pk: true, left: true, disabled: "E", vali: {maxlength: 32}, advQry: ['LIKE'], width:125},
            {name: "hostname", left: true, vali: {maxlength: 64}, show: false, advQry: ['LIKE']},
            {name: "vswpwd", left: true, vali: {maxlength: 20}, show: false},
            {name: "expire", type: "I", left: true, vali: {maxlength: 11}},
            {name: "lastHBTime", type: "D", left: true, hideEdit: "A", width:125},
            {name: "state", left: true, vali: {maxlength: 1}, comType: "select", advQry: ['LIKE'], valFormat: "<i class='img-fmt vsw-vsw-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "publicIP", left: true, vali: {maxlength: 128}, width:95},
            {name: "publicPort", type: "I", left: true, vali: {maxlength: 11}},
            {name: "location", left: true, vali: {maxlength: 256}, show: false, advQry: ['LIKE']},
            {name: "countryCode", left: true,width:220,vali: {maxlength: 32}, comType: "area", comData: g_var.view.areaSelData},
            {name: "ISPName", left: true, vali: {maxlength: 32}, advQry: ['LIKE'], comType: "select", comData: g_var.view.ispSelData, width:210},
            {name: "bandwidth", type: "I", left: true, vali: {maxlength: 11}, show: true},
            {name: "star", type: "I", left: false, vali: {maxlength: 11}, advQry: ['LIKE'], comType: "select", comData: [["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"], ["5", "5"]]},
            {name: "esxiHost", left: false, vali: {maxlength: 32,required:false}, show: false, advQry: ['LIKE']},
            {name: "CPU", left: false, vali: {maxlength: 128}, show: false},
            {name: "MEM", type: "I", left: false, vali: {maxlength: 11}, show: false},
            {name: "HARDDISK", type: "I", left: false, vali: {maxlength: 11}, show: false},
            //{name: "diskUsage", type: "I", left: false, vali: {maxlength: 11, range: [0, 100]}, show: false, hideEdit: "A"},
            {name: "powerDate", type: "D", left: false, width:125, hideEdit: "A"},
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
        var newSelData = _.filter(g_var.view.ispSelData, v =>v[2] == nData);
        _.each(viewCfg.fields,function (field, i) {
            if (field.name == "ISPName") {
                viewCfg.fields[i].comData = newSelData
            }
        });
    });

}]);
 */
