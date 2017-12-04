var appModule = require("appModule");
appModule.controller("dictionaryCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbDictionary",
        currentUri: "/sysconfig/dictionary",
        fields: [{name: "keyId", type: "I", pk: true, hideEdit: "A", vali: {maxlength: 11},show:true},
            {name: "keyMap", vali: {maxlength: 45},width:120},
            {name: "valueMap", vali: {maxlength: 45}, width:130,show:true}
        ]
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 