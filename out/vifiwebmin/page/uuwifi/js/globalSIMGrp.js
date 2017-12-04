var appModule = require("appModule");
appModule.controller("globalSIMGrpCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var ispSelData = g_var.view.ispSelData, areaSelData = g_var.view.areaSelData;
    var viewCfg = {
        i18nPrefix: "db.tbGlobalSIMGrp",
        currentUri: "/uuwifi/globalSIMGrp",
        fields: [{name: "keyGlobalSIMGrpID", pk: true, advQry: ['LIKE'], disabled: "A", vali: {maxlength: 64}, show: false},
            {name: "groupName", vali: {maxlength: 128}, advQry: ['LIKE'], width:120},
            {name: "idxSalerID", vali: {maxlength: 64}, advQry: ['LIKE'], width:150},
            //{name: "areaName", vali: {maxlength: 32}, left: true, hideEdit:"A"},
            {name: "areaCode", vali: {maxlength: 16}, advQry: ['LIKE'], width:220, comType: "area", comData: areaSelData},
            {name: "ispId", vali: {maxlength: 16}, advQry: ['LIKE'], width:220, comType: "select", comData: ispSelData},
            //{name: "ispName", vali: {maxlength: 64}, left: true, hideEdit:"A"},
            {name: "cardType", type: "I", vali: {maxlength: 11}, advQry: ['LIKE'], comType: "select", width:100},
            {name: "cardSize", type: "I", vali: {maxlength: 11}, advQry: ['LIKE'], comType: "select", width:98},
            {name: "monthlyRental", vali: {range: [0, 10000], decimals: 3}, unitMul: 0.001},
            {name: "dataPrice", unitMul: 0.001, vali: {range: [0, 1000], decimals: 3}},
            {name: "roamDataPrice", unitMul: 0.001, vali: {range: [0, 1000], decimals: 3}},
            {name: "number", type: "I", vali: {maxlength: 11}, hideEdit: "A", width:100},
            //{name: "qryBalanceType", Type: "I", show: false,vali: {maxlength: 32},advQry:['LIKE'], left: false, comType: "select"},
            {name: "remarks", vali: {maxlength: 128,required:false}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}
        ]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);


    // 国家联动运营商
    $scope.$watch("form.copyData.areaCode", function (nData) {
        if (!nData) return;
        var newSelData = _.filter(ispSelData, v => v[2] == nData);
        _.each(viewCfg.fields,function (field, i) {
            if (field.name == "ispId") {
                viewCfg.fields[i].comData = newSelData;
            }
        });
    });

    var proxySave = $scope.save;
    $scope.save = function () {
        try {
            var copyData = $scope.form.copyData;
            var areaName = _.filter(areaSelData, o=>o[0] == copyData.areaCode)[0][1];
            copyData.areaName = areaName.split("-")[1];

            var ispName = _.filter(ispSelData, o=>o[0] == copyData.ispId)[0][1];
            copyData.ispName = ispName.split("-")[1];
        } catch (e) {
        }
        proxySave();
    };

}]);
 