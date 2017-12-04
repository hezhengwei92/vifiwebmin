var appModule = require("appModule");


appModule.controller("frameResourceCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        currentUri: "/frame/resource/",
        fields: [
            {name: "name"},
            {name: "keyResourceId"},
            {name: "createdBy"},
            {name: "createdTime", type: "D"}
        ]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    //////////////////////////////////////////////////////////////////
    $scope.dataLs = [];

    var aopSearch = $scope.search;
    $scope.search = function (pageNumber) {
        aopSearch(pageNumber, function (res) {
            $scope.dataLs = res.data.contentList;
        });
    };

    /**
     * 交换2个资源的排序位置
     */
    $scope.swapPosi = function (dataA, dataB) {
        var resources = [
            {
                "keyResourceId": dataA.keyResourceId,
                "menu": dataA.menu
            }, {
                "keyResourceId": dataB.keyResourceId,
                "menu": dataB.menu
            }
        ];

        Utils.ajax({
            url: $scope.prefixUrl + "/swapSortPosi.ajax",
            data: JSON.stringify(resources),
            contentType: 'application/json;charset=utf-8', //设置请求头信息
            success: function () {
                $scope.search();
            }
        });

    };


}]);




