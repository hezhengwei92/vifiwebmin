var appModule = require("appModule");
appModule.controller("areaCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbArea",
        currentUri: "/rate/area",
        fields:[{name: "keyAreaCode", pk: true, disabled: "E", vali: {maxlength: 16},advQry:['LIKE'],width:80},
            {name: "name", vali: {maxlength: 64},advQry:['LIKE'],width:200,valFormat:"<i class='img-fmt country-icon-{a}'></i>{b}"},
            {name: "localName", vali: {maxlength: 64},advQry:['LIKE'],width:200},
            {name:"countryName",vali:{maxlength: 64},advQry:['LIKE'],width:200,valFormat:"<i class='img-fmt country-icon-{a}'></i>{b}"},
            {name: "timeZone", type: "I", vali: {maxlength: 11},comType:"select",width:100},
            {name: "language", vali: {maxlength: 30},width:100},
            {name: "continent", vali: {maxlength: 2},comType:"select",advQry:['LIKE'],width:150},
            {name: "domain", vali: {maxlength: 64},width:150},
            {name: "currency", vali: {maxlength: 10},width:100},
            //{name: "totalNumber", type: "I", vali: {maxlength: 11}},
            //{name: "support", vali: {maxlength: 10}},
            //{name: "remarks", vali: {maxlength: 128}, show: false},
            {name: "mdfTm", type: "D", hideEdit: "A",show:false},
            {name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false},
            {name: "crtTm", type: "D", hideEdit: "A",show:false},
            {name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 