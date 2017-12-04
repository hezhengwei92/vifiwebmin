var appModule = require("appModule");

appModule.controller("vpxAccountCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {

    var viewCfg = {
        currentUri: "/vpx/account/",
        fields: [
            {name: "username"},
            {name: "pubAddr"},
            {name: "lastUpdate"},
            {name: "expires"},
            {name: "domain"}
        ]
    };

    var prefixUrl = "http://ecstst.eoutech.net:9090/as/account/";
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg, null, prefixUrl);

    /**
     * 重写 搜索方法
     */
    $scope.search = function (pageNumber) {

        $scope.params["cx_ORDER_LIST"] = null;
        Utils.jsonp({
                url: prefixUrl + 'list?page=' + (pageNumber || 1),
                success: function (res) {
                    $scope.view.page = res.data;
                    $scope.refreshTBodyData();
                    console.log($scope.view.page);
                }
            }
        );
    };

}]);


