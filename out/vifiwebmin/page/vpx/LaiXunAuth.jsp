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
		                  <li class="flag-tabs-btn active" id="laiXunAuthBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('laiXunAuthTab1','laiXunAuthTool1')"><i class="fa fa-th font14"></i><spring:message code="label.tbAppServer.title"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="laiXunAuthBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('laiXunAuthTab2','laiXunAuthTool2')"><i class="fa fa-list font14"></i><spring:message code="label.tbAppAuth.title"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="laiXunAuthBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('laiXunAuthTab3','laiXunAuthTool3')"><i class="fa fa-list font14"></i><spring:message code="label.tbAppAuthRcd.title"/></a> 
		                  </li>
		                  <!-- tab2-工具按钮组 -->
		                  <li class="head-tools-r navbar-right flag-tools" id="laiXunAuthTool1"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="laiXunAuthTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="laiXunAuthTool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="laiXunAuthTab1" class="flag-tabs tab-pane in active"></div>
							<div id="laiXunAuthTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="laiXunAuthTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
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
	    };
	    var permission1 = selectPermissionsInfo.permissions;
	    if (!permission1 || permission1.length < 4) {
	    	permission1 = ['1', '1', '1', '1'];
	    };
	  
	    /**********************************  tbAPPServer *********************************/
	    var authSumVal = g_var.view.authSum;
	    var authRemainVal = authSumVal - g_var.view.authRemain;
	    var tbAPPServerItems = {tableKey: "keyAppServerID", i18nPrefix: "db.tbAppServer.",
	    	trs:[
	    	     {name: "keyAppServerID", vali:{stringLength:64}, width:100, hideEdit: "E", advQry: ["LIKE"], show:false },
	    	     {name: "idxASCode", vali:{stringLength:64}, width:100, advQry: ["LIKE"]},
	    	     {name: "company", vali:{stringLength:64}, width:140, advQry: ["LIKE"]},
	    	     //{name: "asAddrIP", vali:{stringLength:32}, width:140},
	    	     //{name: "asAddrPort", vali:{stringLength:10, integer:true}, width:140},
	    	     //{name: "asProtocol", vali:{stringLength:10}, width:140, comType:"select", advQry: ["LIKE"]},
	    	     {name: "uRL", vali:{stringLength:128, authUrlFormat:true}, width:180},
	    	     {name: "appName", vali:{stringLength:64, required:false}, width:120, show:false},
	    	     {name: "appVersion", vali:{stringLength:64, required:false}, width:100, show:false},
	    	     {name: "licenseMaxNum", vali:{stringLength:10, integer:true, authNum:[authRemainVal,authSumVal]}, width:80},
	    	     //特殊处理 查询TbAPPServer2,新增编辑TbAPPServer类
	    	     {name: "authNum",hideEdit:"A",width: 80},
	    	     //{name: "authEffectDays", vali:{stringLength:10, integer:true}, width:140, show:false},
	    	     {name: "remarks", vali:{stringLength:128, required: false}, width:140},
	    	     //{name: "devCntDate", width:140, vali:{date:true, required:false}},
	    	     {name: "mdfTm", hideEdit:"A", width:140},
	    	     {name: "mdfBy", hideEdit:"A", width:140},
	    	     {name: "crtTm", hideEdit:"A", width:140},
	    	     {name: "crtBy", hideEdit:"A", width:140}
	    ]};
	    var tbAPPServerUrl = "/vpx/LaiXunAuth/";
		InitTableMoudle("laiXunAuthTab1", "laiXunAuthTool1", tbAPPServerUrl, tbAPPServerItems, permission1,  "1");
		
	  	/********************************　　tbAPPServer  ***************************************/

	    /**********************************  tbAPPAuthRcd *********************************/
	    
	    var tbAPPAuthRcdItems = {tableKey: "keyID", i18nPrefix: "db.tbAPPAuthRcd.",
	    	trs:[
	    	     {name: "keyID", width:80, hideEdit: "E"},
	    	     {name: "idxASCode", width:80, advQry: ["LIKE"]},
	    	     {name: "idxAppId", width:140, show:false },
	    	     {name: "idxPhoneNumber", width:140, advQry: ["LIKE"]},
	    	     //{name: "idxAreaCode", width:100, show:false },
	    	     //{name: "language", width:100, show:false },
	    	     {name: "authState", width:100, advQry: ["LIKE"], comType:"select"},
	    	     {name: "devInfo", width:140},
	    	     {name: "aPPName", width:140},
	    	     {name: "aPPVer", width:140},
	    	     {name: "authPublicIP", width:100},
	    	     {name: "authPublicPort", width:100},
	    	     {name: "crtTm", hideEdit:"A", width:140},
	    	     {name: "crtBy", hideEdit:"A", width:140, show:false }
	    ]};
	  	var permi2 = ["0", "1", "1", "1"];
	    var tbAPPAuthRcdUrl = "/vpx/LaiXunAuth/appAuthRcd";
		InitTableMoudle("laiXunAuthTab3", "laiXunAuthTool3", tbAPPAuthRcdUrl, tbAPPAuthRcdItems, permi2,  "1");
		
	  	/********************************　　tbAPPAuthRcd end  ***************************************/

	    /**********************************  tbAPPAuth *********************************/
	    
	    var tbAPPAuthItems = {tableKey: "keyID", i18nPrefix: "db.tbAppAuth.",
	    	trs:[
	    	     {name: "keyID", width:140, hideEdit: "E"},
	    	     {name: "idxASCode", width:140, advQry: ["LIKE"]},
	    	   	 //表外字段：企业名称
	    	     {name: "company", width:140, hideEdit: "A", advQry: ["LIKE"]},
	    	     //{name: "idxAppId", width:140},
	    	     {name: "idxPhoneNumber", width:140},
	    	     //{name: "idxAreaCode", width:140},
	    	     //{name: "language", width:140, show:false },
	    	     {name: "authState", width:140, advQry: ["LIKE"], comType:"select"},
	    	     {name: "authTimes", width:140, show: false},
	    	     //{name: "authDate", width:140, vali:{date:true}},
	    	     {name: "devInfo", width:140},
	    	     {name: "aPPName", width:140},
	    	     {name: "aPPVer", width:140, show: false},
	    	     {name: "remarks", width:140, show: false},
	    	     {name: "mdfTm", hideEdit:"A", width:140},
	    	     {name: "mdfBy", hideEdit:"A", width:140, show: false},
	    	     {name: "crtTm", hideEdit:"A", width:140, show: false},
	    	     {name: "crtBy", hideEdit:"A", width:140, show: false}
	    ]};
	    var permi3 = ["0", "1", "1", "1"];
	    var tbAPPAuthUrl = "/vpx/LaiXunAuth/appAuth";
		InitTableMoudle("laiXunAuthTab2", "laiXunAuthTool2", tbAPPAuthUrl, tbAPPAuthItems, permi3,  "1");
		
	  	/********************************　　tbAPPAuth end  ***************************************/

	  
	  
	  
	  
	  
	  </script>
 </body>