require("../css/simp.css");

var appModule = require("appModule");
appModule.controller("simPDevCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var _this = this;
    var viewCfg = {
        i18nPrefix: "db.tbSimPDev",
        dtlLayout: [3, 9],
        currentUri: "/simp/simPDev/",
        fields: [{name: "keySimPDevID", pk: true, disabled: "E", vali: {maxlength: 64}, advQry: ["LIKE"], width:90},
            {name: "devName", vali: {maxlength: 128}, advQry: ["LIKE"], width:130},
            // {name: "idxSimPDevGrpID", type: "I",  vali: {maxlength: 64}},
            {name: "typeName", comType: "select", comData: [["Simpool 128", "Simpool 128"], ["Simpool 224", "Simpool 224"]], vali: {maxlength: 64}, advQry: ["LIKE"], width:100},
            {name: "username", vali: {maxlength: 64}, show: true, width:130},
            {name: "password", type: "I", vali: {maxlength: 64}, show: false},
            {name: "expire", type: "I", vali: {maxlength: 11}, show: true},
            {name: "lastUpdate", type: "D", width:125, hideEdit: "A"},
            {name: "ipaddr", vali: {maxlength: 30}, advQry: ["LIKE"], hideEdit: "A", width:90},
            {name: "port", type: "I", vali: {maxlength: 11}, hideEdit: "A"},
            {name: "status", type: "I", comType: "select", valFormat: "<i class='img-fmt simp-dev-sta-{a}'></i><i class='f-tips'>{b}</i>", hideEdit: "A", vali: {maxlength: 11}, advQry: ["LIKE"]},
            {name: "ports", type: "I", vali: {maxlength: 11}, advQry: ["LIKE"]},
            {name: "idxVSWID", vali: {maxlength: 32}, advQry: ["LIKE"], comType: "select", comData: g_var.view.vswSelData, width:140},
            {name: "remarks", vali: {maxlength: 128, required: false}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:125},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A", show: false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);



    //**************
    $scope.openSimPDevDtl = function (dev) {
        $scope.form.selNumber = 1;
        $scope.form.curDatas = [dev];
        $scope.openDetailsModal();
    };

    $scope.openSimPPortDtl = function (portInfo, dev) {
        if (!portInfo.keyID) return;
        Utils.ajax({
            url: $scope.prefixUrl + "/simp-port-info.ajax",
            data: {keyID: portInfo.keyID},
            success: function (res) {
                res.data.simpDevName = dev.devName;
                $scope.$apply(()=> $scope.form.simPPortInfo = res.data);
                $("#simpPortDtlModal").modal({backdrop: 'static'});
            }
        });
    };

    //************************************************ tb 详情~
    this.openTbDtlCallback = function () {
        _.each($scope.view.tbDetails.devices, dev => dev.status = JSON.parse(dev.status || '[]'));
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
 