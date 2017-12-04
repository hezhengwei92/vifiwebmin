var appModule = require("appModule");
appModule.controller("frameUserCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    var viewCfg = {
        i18nPrefix:"db.tbCfrmUser",
        currentUri: "/frame/user/",
        fields: [{name: "keyUserId", width:120, pk: true, disabled: "E", vali: {maxlength: 64}, type: "S",  advQry: ["LIKE"]},
            {name: "idxGroupId_tbGroup", width:120, vali: {maxlength: 64}, type: "S", hideEdit: "A",show:false},
            {name: "idxRoleId_tbRole", width:120, vali: {maxlength: 96}, type: "S", comType:"select",comData: g_var.view.roleSelectVals,  advQry: ["LIKE"]},
            {name: "password", width:120, vali: {maxlength: 64},show:false, type: "S",hideEdit:"E"},
            {name: "state", type: "I", vali: {maxlength: 4},  hideEdit: "A", show:false},//等级
            {name: "locked", type: "I", vali: {maxlength: 4}, hideEdit: "A", width:100},//状态  	, comType: "checkbox", comData:[[0,1,"是否正常"]]
            {name: "loginFailTimes", type: "I", vali: {maxlength: 11},show:false, hideEdit: "A"},
            {name: "loginTimes", type: "I", vali: {maxlength: 11}, hideEdit: "A"},
            {name: "lastLoginTime", width:140, type: "D", hideEdit: "A"},
            {name: "lastLoginIP", width:140, vali: {maxlength: 45}, type: "S", hideEdit: "A"},
            {name: "email", width:140, vali: {maxlength: 128}, type: "S",show:false},
            {name: "phoneNumber", width:120, vali: {maxlength: 32}, type: "S",show:false},
            {name: "accessIPs", width:140, vali: {maxlength: 64},show:false, type: "S", hideEdit: "A"},
            {name: "language", vali: {maxlength: 32}, type: "S", comType: "select", width:100},
            {name: "remarks", width:180, vali: {maxlength: 128,required:false}, show:false, type: "S"},
            {name: "createdBy", width:140, hideEdit: "A", vali: {maxlength: 45}, type: "S"},
            {name: "createdTime", width:140, type: "D", hideEdit: "A"},
            {name: "modifiedBy", width:140, hideEdit: "A", vali: {maxlength: 45},show:false, type: "S"},
            {name: "modifiedTime", width:140, type: "D", hideEdit: "A",show:false}]
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);
    
    $scope.savePassword = function(){
//    	var checkedTr = $("#my-data-table").find("tr.active_tr");
//    	if(!checkedTr ||checkedTr.length<1){
//    		return;
//    	}
//    	var index = checkedTr[0].getAttribute("data-index");
//    	var datas = $scope.form.curDatas;
//    	var keyUserIdVal = eval("datas["+index+"].keyUserId");
    	
    	var datas = $scope.form.curDatas;//暂时只修改第一个数据
    	var psw = $("#password").val();
    	var pswConfirm = $("#passwordConfirm").val();
    	if(!(psw && pswConfirm) ||psw.length>64 ||pswConfirm.length>64){
    		layer.msg.error("密码长度不超过64")
    		return;
    	}else if(psw != pswConfirm){
    		layer.msg.error("两次密码输入不一致");
    		return;
    	}
    	var params = {
    			keyUserId:datas[0].keyUserId,
    			password:psw,
    			actionName:$.i18n("edit")
    	}
//    	params = JSON.parse(params);
    	$.ajax({
    		url:window.PATH + "/frame/user/save.ajax" ,
    		dataType: "json",
    		data:params,
    		type:"POST",
    		success:function(data){
    			$scope.closemodal("modifyPassword");
    			layer.msg.success($.i18n("frame.password.update_success"));
    		},
    		error:function(data){
    			//302跳转登录界面
    			layer.msg.error("error");
    		}
    			
    	})
    }
    
    $scope.modifyPassword = function(){
    	//$("#modifyPassword").data('bootstrapValidator').resetForm();
    	//myclearForm();
    	$("#password").val("");
    	$("#passwordConfirm").val("");
    	var $modifyPassword = $('#modifyPassword').modal({ backdrop : 'static' });
    	setTimeout(function() {
    		$modifyPassword.find("span.error").remove();
    		$modifyPassword.find("input.error").removeClass("error");
    	}, 100);
    }
    
    $scope.closemodal = function(id){
    	$("#"+id).modal("hide");
    }

    
}]);




