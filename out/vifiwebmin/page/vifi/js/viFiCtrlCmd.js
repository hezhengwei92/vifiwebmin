var appModule = require("appModule");

appModule.controller("viFiCtrlCmdCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/vifi/ctrlcmd/",
        fields:[{name: "keyCtrlCmdID", pk: true, disabled: "E", vali: {maxlength: 20}},
            {name: "ViFiDomain", vali: {maxlength: 64}},
            {name: "idxViFiID", vali: {maxlength: 45}},
            {name: "cmd", vali: {maxlength: 45}},
            {name: "params", vali: {maxlength: 128}},
            {name: "effectDate", type: "D"},
            {name: "ineffectDate", type: "D"},
            {name: "duration", type: "I", vali: {maxlength: 11}},
            {name: "mdfTm", type: "D", hideEdit: "A"},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}},
            {name: "crtTm", type: "D", hideEdit: "A"},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}}]};

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    var proxySave = $scope.save;
    $scope.save = function () {
        var data = angular.copy($scope.form.copyData);
        if ($scope.form.copyData.parent) {
            data['parent.infoTypeId'] = $scope.form.copyData.parent.infoTypeId;
            delete data.parent;
        }
        delete data.frontShow;
        $scope.form.copyData = data;
        proxySave();
    };

}]);




