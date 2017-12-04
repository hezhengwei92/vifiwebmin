/* $scope.form.copyData.imgUrl = DOMAIN+resp.data.data[0]; */
var appModule = require("appModule");
appModule.controller("bannerCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
    i18nPrefix:"db.tbBanner",
        currentUri: "/banner/banner/",
        fields:[
            {name: "keyId", pk: true,vali:{digits:true}, width: 60},
            {name: "title", vali: {maxlength: 32,required:false},width:80},
            {name: "description", vali: {maxlength: 32,required:false},width:150},
            {name: "file", show: 0, comType: "file", comData: {dirKey: "banner",maxSize:"512MB",
                    callback: function (resp) {
                        if (resp.status == 200) {
                            $scope.form.copyData.imgUrl = resp.data.data[0];
                        }
                    }}
            },
            {name: "imgUrl", vali: {required:false}, width: 350},
            {name: "linkUrl",vali: {required:false},width:220},
            {name: "status",vali: {required:false},comType: "select", width:80},
            {name: "type",comType: "select", width:70},
            {name: "crtTm", type: "D", hideEdit: "A",width:140}]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 