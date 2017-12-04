var appModule = require("appModule");
appModule.controller("sysSupplierCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
    	i18nPrefix:"db.tbSupplier",
	    currentUri: "/sysconfig/sysSupplier/",
	    fields:[{name: "idxSupplierId", pk: true, disabled: "E", vali: {maxlength: 128}},
	        {name: "name", vali: {maxlength: 128}, width:200},
	        {name: "phoneNumber", vali: {maxlength: 32}, width:200},
	        {name: "supplierLevel", type: "I", vali: {maxlength: 11}},
	        {name: "status", type: "I", vali: {maxlength: 11}, comType:"select", width:140},
	        {name: "mdfTm", type: "D", hideEdit: "A", width:140},
	        {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, width:140},
	        {name: "crtTm", type: "D", hideEdit: "A", width:140},
	        {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, width:140}]};
	//call模拟 继承 AngularBaseCtrl父类
	AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);

