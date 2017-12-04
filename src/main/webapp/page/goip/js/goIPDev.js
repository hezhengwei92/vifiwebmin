require("../css/goIPDev.css");
var appModule = require("appModule");
appModule.controller("goIPDevCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbGoIPDev",
        currentUri: "/goip/goIPDev",
        dtlLayout:[3,9],
        fields: [{name: "keyGoIPDevID", pk: true, disabled: "E", vali: {maxlength: 64}, advQry: ["LIKE"], width:95},
            {name: "devName", vali: {maxlength: 128}, advQry: ["LIKE"], width:95},
//            {name: "idxGoIPDevGrID",  vali: {maxlength: 64}},
            {name: "typeName", vali: {maxlength: 64}, advQry: ["LIKE"], width:145, comType: "select",
                comData: [["ACOM504Pro", "ACOM504Pro"], ["ACOM508Pro", "ACOM508Pro"], ["ACOM508SG-32", "ACOM508SG-32"], ["ACOM508C800-32", "ACOM508C800-32"], ["ACOM508C800/1900-32", "ACOM508C800/1900-32"], ["ACOM508W-32", "ACOM508W-32"], ["ACOM516G-16", "ACOM516G-16"], ["ACOM516G-64", "ACOM516G-64"], ["ACOM516G-128", "ACOM516G-128"], ["ACOM532G-32", "ACOM532G-32"], ["ACOM532G-128", "ACOM532G-128"], ["ACOM516C800/1900-16", "ACOM516C800/1900-16"], ["ACOM516C800/1900-64", "ACOM516C800/1900-64"], ["ACOM516C800-16", "ACOM516C800-16"], ["ACOM516C800-64", "ACOM516C800-64"], ["ACOM516W-16", "ACOM516W-16"], ["ACOM516W-64", "ACOM516W-64"]]},
            {name: "username", vali: {maxlength: 64}, advQry: ["LIKE"], width:95},
            {name: "password", vali: {maxlength: 64}, show: false},
            {name: "expire", type: "I", vali: {maxlength: 11}},
            {name: "lastUpdate", type: "D", hideEdit: "A", width:125},
            {name: "ipaddr", vali: {maxlength: 30}, hideEdit: "A", width:95},
            {name: "port", type: "I", vali: {maxlength: 11}, hideEdit: "A"},
            {name: "status", type: "I", vali: {maxlength: 11}, valFormat: "<i class='img-fmt goip-dev-sta-{a}'></i><i class='f-tips'>{b}</i>", hideEdit: "A", comType: "select", advQry: ["LIKE"]},
            {name: "ports", vali: {maxlength: 45}, hideEdit: "A"},
            {name: "idxVSWID", vali: {maxlength: 32},width:120, comType: "select", comData: g_var.view.vswSelData, advQry: ["LIKE"]},
            {name: "sipPort", type: "I", vali: {maxlength: 11}, hideEdit: "A"},
            {name: "sipRegExp", type: "I", vali: {maxlength: 11}, hideEdit: "A"},
            {name: "sipRegDate", type: "D", hideEdit: "A", width:145},
            {name: "remarks", vali: {maxlength: 128, required: false}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    $scope.openGoIPDevDtl = function (dev) {
        $scope.form.selNumber = 1;
        $scope.form.curDatas = [dev];
        $scope.openDetailsModal();
    };

    $scope.openGoIPPortDtl = function (portInfo, dev) {
        if (!portInfo.keyID) return;
        Utils.ajax({
            url: $scope.prefixUrl + "/goip-port-info.ajax",
            data: {keyID: portInfo.keyID},
            success: function (res) {
                res.data.goIPDevName = dev.devName;
                $scope.$apply(()=> $scope.form.goIPPortInfo = res.data);
                $("#goIPPortDtlModal").modal({backdrop: 'static'});
            }
        });
    };

    //************************************************ tb 详情~
    this.openTbDtlCallback = function () {
        _.each($scope.view.tbDetails.devices,dev => dev.status = JSON.parse(dev.status || '[]'));

        console.log( $scope.view.tbDetails.portStatusCount )

    };

    // **************************************** 单个详情
    // 单个操作详情回调
    this.openSgDtlCallback = ()=>true;

    //************************************************ 多选 详情
    // ~暂时和tb详情一致
    this.openMulDtlCallback = function () {
        $scope.view.tbDetails = $scope.view.mulDetails;
        this.openTbDtlCallback();
    };
}]);
 