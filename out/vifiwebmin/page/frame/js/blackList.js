var appModule = require("appModule");

appModule.controller("blackListCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbBlackList",
        currentUri: "/frame/blackList/",
        fields:[{name: "ipaddr", pk: true,  vali: {maxlength: 32},disabled:"E",  width:200 ,advQry:['LIKE']},
            {name: "blocked", type: "I", vali: {maxlength: 11},comType:"select",valFormat:"<i class='img-fmt sys-bla-blo-{a}'></i><i class='f-tips'>{b}</i>", advQry:['LIKE'],  width:80},
            {name: "mdfTm", type: "D", hideEdit: "A",width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45},width:140},
            {name: "crtTm", type: "D", hideEdit: "A",width:140},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45},width:140}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);




