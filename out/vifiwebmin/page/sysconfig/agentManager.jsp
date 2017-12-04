<body> 
	   <div class="bs-example">
	    <div class="row">
	      <div class="col-xs-12 col-md-12">
	        <div class="widget no-margin-bottom">
	          <div class="widget-body no-padding">
	            <div id="searchable_wrapper">
		         <div class="tabbable">
	                <ul class="nav nav-tabs">
		                  <!-- tab标签组 -->
		                  <li class="flag-tabs-btn active" id="agentManagerBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('agentManagerTab1','agentManagerTool1')"><i class="fa fa-th font14"></i>
		                     <span class="tab-title"><spring:message code="menu.agent_agent"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="agentManagerBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('agentManagerTab2','agentManagerTool2')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="menu.agent_agentAdditionRcd"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="agentManagerBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('agentManagerTab3','agentManagerTool3')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="menu.agent_agentDeductionRcd"/></span></a> 
		                  </li>
		                  <!-- tab2-工具按钮组 -->
		                  <li class="head-tools-r navbar-right flag-tools"  id="agentManagerTool1"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="agentManagerTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="agentManagerTool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="agentManagerTab1" class="flag-tabs tab-pane  in active summary-tab no-padding"></div>
							<div id="agentManagerTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="agentManagerTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
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
        var permissionInfo = JSON.parse('${view}' || '{"permissions":[]}');
    } catch (e) {
        throw new Error("js视图数据,解析错误,请检测!~!");
    }
    var permi = permissionInfo.permissions;
    if (!permi || permi.length < 4) {
    	selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
    	permi = ['1', '1', '1', '1'];
    }
    
    /******************************* @autor gya   agent 代理商列表 	******************************/
    var tableItem_agent = {
    		tableKey : "idxAgentId", i18nPrefix:"db.tbAgent.",trs:[
    		{name:"idxAgentId",disabled:"E",vali:{stringLength:128},width:240},
    		{name: "idxParentsId", vali: {stringLength: 128}, advQry:['LIKE'],width:220, comType: "select", comData: g_var.view.parentsSelData},
    		{name: "idxAgentName", vali: {stringLength: 32}, advQry:['LIKE'],width:100},
    	     {name: "agentLevel", vali: {integer:true,lessThan:10000000}, comType:"select", advQry:['LIKE'], width:100},
    	     {name: "name", vali: {stringLength: 128}, advQry:['LIKE'],width:100},
    	     {name: "phoneNumber", vali: {stringLength: 32},  advQry:['LIKE'],width:110},
    	     {name: "balance", vali: {between: [-10000000, 10000000], decimals: 3},width:80, ratio: 1000},
    	     {name: "credit", vali: {integer:true,lessThan:10000000, decimals: 3},width:100, ratio: 1000},
    	     {name: "discount", show: false,vali: {between:[0,100]}},
    	     {name: "remark", vali: {stringLength: 255,required:false},show: false},
    	     {name: "mdfTm", hideEdit: "A", width:140, vali:{date:true}},
    	     {name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140},
    	     {name: "crtTm", hideEdit: "A", show: false, width:140, vali:{date:true}},
    	     {name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140}
    ]};
    var agentUrl = "/sysconfig/agentManager/";
	InitTableMoudle("agentManagerTab1", "agentManagerTool1", agentUrl, tableItem_agent, permi, "1");
    
	
	/******************************* 增值记录   ***************************************/
	var tableItem_agentAdditionRcd = {
			tableKey:"keyID", i18nPrefix:"db.tbAgentAdditionRcd.", order:'[["keyID",2]]', trs:[
			{name: "keyID", disabled: "A", vali: {integer:true,lessThan: 1000000},width:110},
			{name: "idxUserTopupId", vali: {stringLength: 128},width:210},
			{name: "idxAgentID", vali: {stringLength: 128}, advQry:['LIKE'],comType:"select",comData:g_var.view.agentSelData,width:200},
			{name: "discount", vali: {integer:true,between:[0,100]}, advQry:['LIKE'],width:100},
			{name: "amount", vali: {between: [0, 10000000], decimals: 3},ratio:1000, advQry:['LIKE'],width:100},
			{name: "beforeValue", vali: {between: [-10000000, 10000000], decimals: 3},ratio:1000, advQry:['LIKE'],width:100},
			{name: "afterValue", vali: {between: [-10000000, 10000000], decimals: 3},ratio:1000, advQry:['LIKE'],width:100},
			{name: "remark", vali: {stringLength: 256}, show: false},
			{name: "mdfTm", vali:{date:true}, hideEdit: "A", width:140},
			{name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140},
			{name: "crtTm", vali:{date:true}, hideEdit: "A", show: false, width:140},
			{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140}		                                 
	]}
	var permi_agentAddtionRcd = ["0","1","1","1"];
    var agentAdditionRcdUrl = "/sysconfig/agentManager/agentAdditionRcd";
	InitTableMoudle("agentManagerTab2", "agentManagerTool2", agentAdditionRcdUrl, tableItem_agentAdditionRcd, permi_agentAddtionRcd, "1");
	
	/************************************* 扣费记录   ************************************/
	var tableItem_deductionRcd = {
			tableKey:"keyID", i18nPrefix:"db.tbAgentDeductionRcd.", order:'[["keyID",2]]', trs:[
			{name: "keyID", disabled: "A", vali: {integer:true,lessThan: 10000},width:100},
			{name: "idxAgentID", vali: {stringLength: 128},width:150},
			{name: "idxCDRId", vali: {stringLength: 128},width:90},
			{name: "discount", vali: {integer:true,between: [0,100]},advQry:['LIKE'],width:90},
			{name: "amount", vali: {between: [0, 10000], decimals: 3},ratio:1000,advQry:['LIKE'],width:120},
			{name: "beforeValue", vali: {between: [-10000000, 10000000], decimals: 3},ratio:1000,advQry:['LIKE'],width:120},
			{name: "afterValue", vali: {between: [-10000000, 10000000], decimals: 3},ratio:1000,advQry:['LIKE'],width:120},
			{name: "remark", vali: {stringLength: 256}, show: false},
			{name: "mdfTm",vali:{date:true}, hideEdit: "A",width:140},
			{name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140},
			{name: "crtTm",vali:{date:true}, hideEdit: "A", show: false, width:140},
			{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:140}
	]};
	var permi_deductionRcd = ["0","1","1","1"];
    var deductionRcdUrl = "/sysconfig/agentManager/agentDeductionRcd";
	InitTableMoudle("agentManagerTab3", "agentManagerTool3", deductionRcdUrl, tableItem_deductionRcd, permi_deductionRcd, "1");
    
    
	  
	  
	  </script>
 </body>