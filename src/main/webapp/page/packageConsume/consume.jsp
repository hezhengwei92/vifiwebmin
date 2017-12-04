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
		                  <li class="flag-tabs-btn active" id="consumerPkgBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('consumerPkgTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.packageConsume_consume"/></a>
		                  </li>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" id="consumerPkgTool1"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="consumerPkgTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>
							
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
	  var agentName=g_var.view.agentName;
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
	  
	  /***************************************   资费说明          ******************/

	var tableItem_consumerPkg = {
			tableKey: "keyPackageID", i18nPrefix: "db.tbConsumerPkg.", trs: [
			{name: "keyPackageID", disabled: "E", vali:{stringLength:64}, width: 60, advQry:["LIKE"]},
			{name: "idxAgentID", vali:{stringLength:64}, width: 60, advQry:["LIKE"], comType:"select", comData:g_var.view.agentSelData},
			/*{name: "idxCountryCode", vali:{stringLength:16}, width: 50},*/
			{name: "pkgName",width: 80},
			{name: "pkgType", width:80, comType:"select", advQry:["LIKE"]},
			{name: "pkgDesc", vali:{stringLength:512, required:false}, width: 240},
			{name: "price", vali:{ decimals: 3}, width: 80},//, advQry:["LIKE"]
			{name: "flow", vali:{stringLength:128}, width: 60},
			{name: "validPeriod", vali:{between: [0, 30],stringLength:128}, width: 60},
			{name: "validType", vali:{stringLength:128}, width: 75, comType:"select"},
			{name: "duration", vali:{between: [0, 12],stringLength:128}, width: 75},
			{name: "activity", vali:{stringLength:128}, width: 60,comType:"select"},
			{name: "currency", vali:{stringLength:12}, width: 80, comType:"select"},//, advQry:["LIKE"]
			{name: "remarks", vali:{stringLength:128, required:false}, width: 100},
			{name: "mdfTm", hideEdit: "A", width: 130},	
			{name: "mdfBy", hideEdit: "A", width: 130, show:false},	
			{name: "crtTm", hideEdit: "A", width: 130, show:false},	
			{name: "crtBy", hideEdit: "A", width: 130, show:false}
	]};
    var consumerPkgUrl = "/packageConsume/consume/";
	InitTableMoudle("consumerPkgTab1", "consumerPkgTool1", consumerPkgUrl, tableItem_consumerPkg, permi, "1","","","",agentName);
	  
	  
	  </script>
 </body>