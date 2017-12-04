var appModule = require("appModule");
appModule.controller("vnsCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var areaSelData = g_var.view.areaSelData;
    var viewCfg = {
        i18nPrefix:"db.tbVNS",
        currentUri: "/sysconfig/vns",
        fields:[{name: "keyVNSID", pk: true, left: true,type:"I", disabled: "E", vali: {maxlength: 64} ,advQry:['LIKE'],width:90},
            {name: "vnsname", left: true, vali: {maxlength: 128},advQry:['LIKE'],width:90},
            {name: "vnsAddrDomin", left: true, vali: {maxlength: 64},advQry:['LIKE'],width:90},
            {name: "vnsProtocol",left:true, vali: {maxlength: 10,required:false}, advQry:["LIKE"], width:90, comType:"select"},
            {name: "vnsAddrIP", left: true, vali: {maxlength: 64},advQry:['LIKE'],width:95},
            {name: "wsPort", type: "I", left: true, vali: {maxlength: 11},width:80},
            //{name: "udpPort", type: "I", left: true, vali: {maxlength: 11},width:90}, 废弃字段
            {name: "vnsAddrPort",type:"I", left: true, vali:{maxlength: 7},width:80},
            {name: "domain", left: true, vali: {maxlength: 32},width:120},
            //{name: "ViFiNumber", type: "I", left: true, vali: {maxlength: 11}},
            //{name: "onlineViFiNum", type: "I", left: true, vali: {maxlength: 11}},
            //{name: "countryCode", left: true, vali: {maxlength: 10},advQry:['LIKE'],comType:"select",comData:areaSelData},
            //{name: "countryName", left: true, vali: {maxlength: 45}},
            {name: "areaName", left: true, width:180,vali: {maxlength: 64},advQry:['LIKE'],comType:"select",comData:areaSelData},
            //{name: "lng", left: true, vali: {maxlength: 16}},
            //{name: "lat", left: false, vali: {maxlength: 16}},
            {name: "lang", left: true, vali: {maxlength: 10},width:80,advQry:['LIKE'],comType:"select"},
            {name: "currency", left: true, vali: {maxlength: 10},advQry:['LIKE'],comType:"select",width:75,show:false},
            //{name: "timezone", type: "I", left: false, vali: {maxlength: 11}},
            {name: "wsAddr", left: false, vali: {maxlength: 128,required:false},width:150},
            {name: "wsUID", left: false, vali: {maxlength: 32,required:false},width:70},
            {name: "wsPwd", left: false, vali: {maxlength:32,required:false},show:false},
            {name: "remark", left: false, vali: {maxlength: 256,required:false},show:false},
            {name: "mdfTm", type: "D", left: false, hideEdit: "A",width:125},
            {name: "mdfBy", left: false, hideEdit: "A", vali: {maxlength: 45},show:false,width:125},
            {name: "crtTm", type: "D", left: false, hideEdit: "A",show:false,width:125},
            {name: "crtBy", left: false, hideEdit: "A", vali: {maxlength: 45},show:false,width:125}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);





}]);
 