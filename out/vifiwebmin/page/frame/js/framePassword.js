var appModule = require("appModule");


appModule.controller("framePasswordCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {

    $scope.form = {};
    $scope.form.userName = g_var.userName;
    var title = $("#formTitle").html();
    title = title.replace("{0}", g_var.userName);
    $("#formTitle").html(title);
    //高度
    var winHeight = document.documentElement.clientHeight;
    var dataTableDivHeight = winHeight - 105 - $(".page-breadcrumbs").height();
    $(".tab-content").css("height",dataTableDivHeight);

    // 当前子页面
    $rootScope.childPage = "/frame/password/";
    var prefixUrl = PATH + $rootScope.childPage;

    $scope.updatePassword = function () {
        Utils.ajax({
            url: prefixUrl + "save.ajax",
            data: $scope.form,
            success: function(data){
            	$("#passwordTab1 input").val("");
            }
        });
    };

    $(".form-horizontal").validate({
        rules: {
            old_psw: {
                required: true
            },
            new_psw: {
                required: true
            },
            cfm_psw: {
                required: true,
                equalTo: "[name=new_psw]"
            }
        },
        submitHandler: function () {
            $scope.updatePassword();
        }
    });

}]);




