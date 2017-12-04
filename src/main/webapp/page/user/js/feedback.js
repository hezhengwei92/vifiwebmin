var appModule = require("appModule");
appModule.controller("feedbackCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbFeedback",
        currentUri: "/user/feedback",
        fields:[{name: "keyFeedbackId", type: "I", pk: true, disabled: "A", vali: {maxlength: 11},show:false},
            {name: "idxAccountId_tbAccount", vali: {maxlength: 30},advQry:['LIKE'],width:95},
            {name: "type", vali: {maxlength: 10},advQry:['LIKE'],width:105,comType:"select"},
            {name: "verID", vali: {maxlength: 32}},
            {name: "title", vali: {maxlength: 256},advQry:['LIKE'],width:250},
            {name: "content", vali: {maxlength: 2048},advQry:['LIKE'],width:500},
            //{name: "attachFile", vali: {maxlength: 128}},
            {name: "feedbackTime", type: "D",width:125},
            //{name: "ipaddress", vali: {maxlength: 30}, show: false},
            {name: "state", vali: {maxlength: 1,required:false },advQry:['LIKE'],width:70,comType:"select",valFormat:"<i class='img-fmt user-fb-sta-{a}'></i><i class='f-tips'>{b}</i>"},
            {name: "reply", vali: {maxlength: 2048,required:false},advQry:['LIKE'],show:false, width:200},
            {name: "replyTime", type: "D",hideEdit:"A", show: false,required:false},
            {name: "extid", vali: {maxlength: 64,required:false},hideEdit:"A", show: false},
            {name: "extSt", vali: {maxlength: 16,required:false},hideEdit:"A", show: false},
            {name: "remarks", vali: {maxlength: 128,required:false},hideEdit:"A", show: false, width:200}
        ]};
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

}]);
 