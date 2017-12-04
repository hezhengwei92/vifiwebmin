var appModule = require("appModule");


appModule.controller("frameRoleCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {

    var viewCfg = {
        currentUri: "/frame/role/"
    };
    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg, "keyRoleId");
    
    // 权限的类型
    $scope.authTypesOpera = [$.i18n("details"), $.i18n("new"), $.i18n("edit"), $.i18n("delete")];
    $scope.authTypes = ["all",$.i18n("details"), $.i18n("new"), $.i18n("edit"), $.i18n("delete")];
    //主页设置
    var roles = $scope.view.roleHomePage,
    	homePagesObj = {},
    	homePagesObjI18n = {};
    for(var i=0,len=roles.length; i<len; i++){
    	var roleId = roles[i].keyRoleId,
    		homePage = (roles[i].homePage? roles[i].homePage: "frameHome"),
    		homePageName = ($.i18n(homePage)? $.i18n(homePage): $.i18n("frameHome"));
    	homePagesObj[roleId] = homePage;
    	homePagesObjI18n[roleId] = homePageName;
    }
    $scope.homePagesObj = homePagesObj;
    $scope.homePagesObjI18n = homePagesObjI18n;
    var roleOptions = $scope.view.homePageOptions,
    	homePageList = [];
    for(var i=0,len=roleOptions.length;i<len;i++){
    	var homeKV = [],
    		role = roleOptions[i],
    		roleName = ($.i18n(role)? $.i18n(role): $.i18n("frameHome"));
    	homeKV.push(role);
    	homeKV.push(roleName);
    	homePageList.push(homeKV);
    }
    $scope.homePageList = homePageList;

    // 转换权限数据
    function adcAuthData(data) {
        data.auths = {};
        // 转换,和视图约定好的格式
        for (var i = 0; i < $scope.view.resources.length; i++) {
            var resource = $scope.view.resources[i];
            if (resource.parent) continue;
            // 判断是否有这个用户后,处理视图数据
            for (var j = 0; j < data.tbCfrmAuthorizations.length; j++) {
                var auth = data.tbCfrmAuthorizations[j];
                if (auth.resourceName == resource.name) {
                    data.auths[resource.name] = {};
                    data.auths[resource.name][$.i18n("details")] = !auth.banDetails;
                    data.auths[resource.name][$.i18n("new")] = !auth.banAdd;
                    data.auths[resource.name][$.i18n("edit")] = !auth.banEdit;
                    data.auths[resource.name][$.i18n("delete")] = !auth.banDel;
                    if(!auth.banDetails && !auth.banAdd && !auth.banEdit &&　!auth.banDel){
                        data.auths[resource.name]["all"] = true;
                    }else  {
                    	data.auths[resource.name]["half"] = true;
                    }
                }
            }
        }
        delete data.cfrmAuthorizations;
    }

    // 代理切面扩展 Search方法, ,   转换权限数据
    var proxySearch = $scope.search;
    $scope.search = function (pageNumber, callback) {
        proxySearch(pageNumber, function (res) {
            for (var i = 0; i < res.data.contentList.length; i++) {
                adcAuthData(res.data.contentList[i]);
            }
            callback && callback(pageNumber, callback);
        });
    };


    // 代理切面扩展 save方法,  参数处理
    var proxySave = $scope.save;
    $scope.save = function () {
        var auths = $scope.form.copyData.auths;
        delete $scope.form.copyData.auths;
        delete $scope.form.copyData.tbCfrmAuthorizations;
        var inx = 0;
        // 角色的权限
        _.each(auths, function (auth, key) {
            // 权限标示
            var remarks = (auth[$.i18n("details")] ? "0|" : "1|") + (auth[$.i18n("new")] ? "0|" : "1|") +
                (auth[$.i18n("edit")] ? "0|" : "1|") + (auth[$.i18n("delete")] ? "0" : "1");
            // 全部没有权限的话不添加.
            if (remarks != "1|1|1|1") {
                $scope.form.copyData["tbCfrmAuthorizations[" + inx + "].resourceName"] = key;
                $scope.form.copyData["tbCfrmAuthorizations[" + (inx++) + "].remarks"] = remarks;
            }
        });
        //主页设置 	
        var roleId = $scope.form.copyData.keyRoleId,
        	homePage = $("#homePage option:selected").val(),
        	originHP = homePagesObj[roleId];
        if(!homePage || !originHP || homePage!=originHP){
        	$scope.form.copyData.homePage = homePage;
        }
        proxySave(true);
    };

    // 同步全选..
    function syncCheck(target) {
        $(target).each(function () {
            var $checks = $(this).find("input[type=checkbox]");
            $checks.eq(0).prop("checked", $checks.filter(":checked").length >= ( $checks.length - 1));
        });
    }


    // 代理切面扩展 openDetailsModal方法, 打开编辑层,同步勾选处理
    var proxyOpenEdiModal = $scope.openEditModal;
    $scope.openEditModal = function () {
        proxyOpenEdiModal();
        setTimeout(function () {
            syncCheck(".hover-child-show");
            syncCheck(".menu-tr");
        }, 100);
    };


    // 操作全选操作
    $scope.authGroupAllCheck = function ($event, reChildName, at) {
        var ALL_CHECK = $scope.authTypes[0];
        var auths = $scope.form.copyData.auths = $scope.form.copyData.auths || {};
        var auth = auths[reChildName] = auths[reChildName] || {};
        // 权限ALL 勾选
        if (ALL_CHECK == at) {
            for (var i = 1; i < $scope.authTypes.length; i++) {
                var authType = $scope.authTypes[i];
                auth[authType] = auth[ALL_CHECK];
            }
        } else { // 非 All 勾选
            auth[ALL_CHECK] = (function () {
                for (var j = 1; j < $scope.authTypes.length; j++) {
                    var authType = $scope.authTypes[j];
                    if (!auth[authType])
                        return false;
                }
                return true;
            })();
        }
        // 数据过于复杂,,菜单全选的勾选同步,使用jquery方式控制实现. 要等angular同步所以用下setTimeout
        setTimeout(function () {
            syncCheck($($event.target).closest(".menu-tr"));
        }, 50);
    };

    // 菜单全选操作
    $scope.parentGroupAllCheck = function (rsParent) {
        var auths = $scope.form.copyData.auths = $scope.form.copyData.auths || {};
        _.each($scope.view.resources, function (rsChild) {
            if (!rsChild.parent && rsParent.topMenu == rsChild.topMenu) {
                var auth = auths[rsChild.name] = auths[rsChild.name] || {};
                _.each($scope.authTypes, function (authType) {
                    auth[authType] = rsParent.isAllCheck;
                    var a = $scope.form.copyData.auths[rsChild.name]['all'];
                });
            }
        });
    };
    
    
}]);




