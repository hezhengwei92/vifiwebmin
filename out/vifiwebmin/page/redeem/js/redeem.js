
var appModule = require("appModule");
appModule.controller("redeemCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbRedeem",
        currentUri: "/redeem/redeem/",
        fields: [
            {name: "exchangeId",pk: true,type:"I", vali:{digits:true }, width: 60},
            {name: "integral",type:"I",vali:{digits:true }, width:80},
            {name: "exContent", type:"I",vali:{digits:true },width:80},
            {name: "introduction", width:180},
            {name: "method", width:180},
            {name: "contentType",comType: "select", width:80},
            {name: "effectiveTm",type: "D", vali:{date:true},width:150},//输入有效时间 2009-06-23，1998/01/22 date:true
            {name: "activityTm", type: "D",vali:{date:true},width:150},
            {name: "file", show: 0, comType: "file", comData: {dirKey: "redeem",maxSize:"512MB",
                callback: function (resp) {
                    if (resp.status == 200) {
                        $scope.form.copyData.image = resp.data.data[0];
                    }
                }}
            },
            {name: "image",width:180},
            {name: "file", show: 0, comType: "file", comData: {dirKey: "redeem",maxSize:"512MB",
                callback: function (resp) {
                    if (resp.status == 200) {
                        $scope.form.copyData.bigImage = resp.data.data[0];
                    }
                }}
            },
            {name: "bigImage", width:180},
            {name: "exchangeTimes",type:"I",vali:{digits:true }, width:80},
            {name: "crtTm", type: "D", hideEdit: "A",width:140}
        ]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 