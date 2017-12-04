var appModule = require("appModule");
appModule.controller("versionCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix: "db.tbVersion",
        currentUri: "/sysconfig/version",
        fields: [{name: "keyVerID", pk: true, disabled: "E", vali: {maxlength: 32}, advQry: ['LIKE'], width: 80},
            {name: "svn", width: 70, type: "I", vali: {maxlength: 11}, advQry: ['LIKE']},
            {name: "idxModule", vali: {maxlength: 1}, comType: "select", advQry: ['LIKE'], width: 120},
            {name: "state", vali: {maxlength: 1}, comType: "select", advQry: ['LIKE'], valFormat: "<i class='img-fmt sys-ver-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "nextVer", vali: {maxlength: 32}, advQry: ['LIKE']},
            {
                name: "file", show: 0, comType: "file",
                comData: {
                    dirKey: "VERSION_APP",maxSize:"512MB",
                    callback: function (resp) {
                        if (resp.status == 200) {
                            $scope.form.copyData.downloadURL = DOMAIN + resp.data.data[0];
                        }
                    }
                }
            },
            {name: "downloadURL", vali: {maxlength: 128}, width: 350},
            {name: "releaseDate", type: "D", advQry: ['LIKE'], width: 125},
            {name: "releaseLog", vali: {maxlength: 1024}, width: 275},
            {name: "effectDate", type: "D", width: 125},
            {name: "devCntNum", type: "I", vali: {maxlength: 11}, hideEdit: "A"},
            {name: "devCntDate", type: "D", hideEdit: "A", width: 80},
            {name: "mdfTm", type: "D", hideEdit: "A", width: 125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);


}]);
