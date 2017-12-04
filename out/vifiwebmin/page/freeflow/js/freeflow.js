
var appModule = require("appModule");
appModule.controller("freeFlowCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbFreeFlow",
        currentUri: "/user/freeflow/",
        fields:[
            {name: "idxAppId",  disabled: "E", vali: {maxlength: 32},advQry:['LIKE'],width:170,show:true},
            {name: "idxOrderID" ,pk: true, vali: {maxlength: 20},hideEdit:"A",width:160},
            {name: "nickname" , vali: {maxlength: 20},hideEdit:"A",width:100},
            {name: "idxPhoneNumber",  vali: {maxlength: 20},advQry:['LIKE'],hideEdit:"A",width:100},
            {name: "idxAgentID",  vali: {maxlength: 64,required:false},hideEdit:"A",advQry:['LIKE'],comType:"select",comData: g_var.view.agentSelData},//代理商编号
            {name: "pkgType", vali: {maxlength: 128,required:false}, hideEdit:"A",show: true},
            {name: "flow",type:"I",  vali: {maxlength: 128,required:true}, show: true},
            {name: "effectiveTm",type:"D",  vali: {maxlength: 128,required:true}, show: true,width:170},
            {name: "mdfTm",type:"D",  vali: {maxlength: 128,required:false}, hideEdit:"A",show: true,width:170},
            {name: "mdfBy",vali: {maxlength: 128,required:false}, hideEdit:"A",show: true,width:170},
            {name: "crtTm",type:"D",  vali: {maxlength: 128,required:false},hideEdit:"A", show: true,width:170},
            {name: "crtBy", vali: {maxlength: 128,required:false}, hideEdit:"A",show: true,width:170}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
}]);
 