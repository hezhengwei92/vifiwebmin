var appModule = require("appModule");
appModule.controller("wifiAreaCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
	$rootScope.childPage = "/sysconfig/wifiArea";
	
	    var viewCfg = {
        i18nPrefix:"db.tbUUWiFiArea",
        currentUri: "/sysconfig/wifiArea",
        fields: [{name: "keyAreaId", pk: true, disable: "A", vali: {maxlength: 128},width:100},
            {name: "idxContinent", vali: {maxlength: 10}, advQry: ['LIKE'],comType:"select",width:200},
            {name: "idxCountry", vali: {maxlength: 64,required:false}, advQry: ['LIKE'],width:80,show:false},
            {name: "mcc", type:"I", vali: {range:[-100000,100000]}, width:80},
            {name: "idxRegion", vali: {maxlength: 64,required:false},width:80, advQry: ['LIKE']},
            {name: "idxCity", vali: {maxlength: 64,required:false},width:80, advQry: ['LIKE']},
            {name: "idxCode", vali: {maxlength: 16},width:80},
            {name: "cos", vali: {maxlength: 10},width:80, comType:"select"},
            {name: "timeZone", type:"I", vali: {range:[-100000,100000]}, advQry: ['LIKE'],comType:"select",width:80},
            {name: "language", vali: {maxlength: 30},width:80, comType:"select"},
            {name: "currency", vali: {maxlength: 10},width:80},
            {name: "totalNumber", type:"I", vali: {range:[-100000,100000], required:false},width:80},
            {name: "remarks", vali: {maxlength: 128,required:false},width:180,show:false},
            {name: "mdfTm", type: "D", hideEdit: "A", width:140},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45},width:140,show:false},
            {name: "crtTm", type: "D", hideEdit: "A",width:140,show:false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45},width:140,show:false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 