<body> 
	   <div class="bs-example">
	    <div class="row">
	      <div class="col-xs-12 col-md-12">
	        <div class="widget no-margin-bottom">
	          <div class="widget-body no-padding">
	            <div id="searchable_wrapper">
		         <div class="tabbable">
	                <ul class="nav nav-tabs">
		                  <li class="flag-tabs-btn active" id="userSuiteBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('userSuiteTab1','')"><i class="fa fa-th font14"></i><spring:message code="label.common.outlineInfo"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="userSuiteBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('userSuiteTab2','userSuiteTool2')"><i class="fa fa-th font14"></i><spring:message code="label.common.outlineInfo"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="userSuiteBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('userSuiteTab3','userSuiteTool3')"><i class="fa fa-th font14"></i><spring:message code="label.common.outlineInfo"/></a> 
		                  </li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="userSuiteTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="userSuiteTool3"></li>
	                 </ul>
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="userSuiteTab1" class="flag-tabs tab-pane  in active" style="border-radius:0;"></div>
							<div id="userSuiteTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="userSuiteTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>  
 
<script>
	g_var.view = ${view};
	try {
	    var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
	} catch (e) {
	    throw new Error("js视图数据,解析错误,请检测!~!");
	}
	var permi = selectPermissionsInfo.permissions;
	if (!permi || permi.length < 4) {
		selectPermissionsInfo.permissions = ['0', '1', '1', '1'];
		permi = ['0', '1', '1', '1'];
	}

	var userSuiteItems = {resetTimes:"1", tableKey:"keyID",i18nPrefix:"db.tbUserSuite.", trs:[
				{name: "keyID", hideEdit: "E", vali: {stringLength: 11,integer:true}},
	           {name: "idxPhoneNumber", vali: {stringLength:20}, advQry:["LIKE"], width:200},
	           {name: "suiteType", vali:{stringLength: 1}, comType:"select", advQry:["LIKE"], width:200},
	           {name: "remainValue",vali:{stringLength:11,integer:true},width:180},
	           {name: "effectDate",vali:{date:true, dateFormat:"YYYY-MM-DD"} ,width:160},//, dateFormat:"YYYY-MM-DD"
	           {name: "invalidDate",vali:{date:true},width:160},
	           {name: "remarks",vali:{stringLength:128,required:false},width:170,tip:true},
	           {name: "mdfTm",vali:{date:true},width:140,hideEdit:"A"},
	           {name: "mdfBy",hideEdit:"A",vali:{stringLength: 45},show:false,width:140},
	           {name: "crtTm",vali:{date:true},hideEdit: "A",show:false, width:140},
	           {name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140}
	]};
	var userSuiteUrl = "/user/userSuite/";
	InitTableMoudle("userSuiteTab2", "userSuiteTool2", userSuiteUrl, userSuiteItems, permi, "1");

</script>
 </body>
 