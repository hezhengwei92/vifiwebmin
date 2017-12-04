<style>
	.rank-list-div{
		height:24.2px;line-height:24.2px;font-size:13px;
	}
	.img-rank-exchange{
		   margin: 2px 10px;
		   height: 22px;
		   width: 22px;
		   display: inline-block;
		   background-size: 100% 100% !important;
	}
</style>
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
		                  <li class="flag-tabs-btn active" id="vswExchangeSerBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('vswExchangeSerTab1','')"><i class="fa fa-th font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="vswExchangeSerBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('vswExchangeSerTab2','vswExchangeSerTool2')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="tab.vswExchangeService.session"/></span></a> 
		                  </li>
		                  <%--<li class="flag-tabs-btn tab-blue" id="vswExchangeSerBtn3">--%>
		                     <%--<a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('vswExchangeSerTab3','vswExchangeSerTool3')"><i class="fa fa-list font14"></i>--%>
		                     <%--<span class="tab-title"><spring:message code="tab.vswExchangeService.vswList"/></span></a> --%>
		                  <%--</li>--%>
		                  <%--<li class="flag-tabs-btn tab-blue" id="vswExchangeSerBtn4">--%>
		                     <%--<a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('vswExchangeSerTab4','vswExchangeSerTool4')"><i class="fa fa-list font14"></i>--%>
		                     <%--<span class="tab-title"><spring:message code="tab.vswExchangeService.simBind"/></span></a> --%>
		                  <%--</li>--%>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="vswExchangeSerTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="vswExchangeSerTool3"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="vswExchangeSerTool4"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="vswExchangeSerTab1" class="flag-tabs tab-pane  in active summary-tab">
					<div class="row" style="margin-top:20px">	
					  	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
	                     <div class="widget radius-bordered">
	                        <div class="widget-header">
	                           <span class="widget-caption"><spring:message code="status.cdrNew.info1"/></span> 
	                        </div> 
	                        <div class="widget-body no-padding table-border-outlineInfo">
	                        	 <div class="row" style="padding:0 15px;">
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo1"></span>
			                                <div class="databox-text darkgray"><spring:message code="info.vsw.exchangeQueueCount"/></div>
			                        	</div>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>--%>
			                                <%--<div class="databox-text darkgray"><spring:message code="info.vsw.serviceCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
											<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="info.vsw.exchangeMethodCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="info.vsw.todayDeviceCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="info.vsw.todayUsedCard"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="info.vsw.monthDeviceCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo7"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="info.vsw.monthUsedCard"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo8">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray"><spring:message code="info.vsw.recentMinExchangeCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo9">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray"><spring:message code="info.vsw.recentHourExchangeCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo10">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray"><spring:message code="info.vsw.todayExchangeCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo11">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray"><spring:message code="info.vsw.monthExchangeCount"/></div>--%>
			                        	<%--</div>--%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding cursor:pointer;" onclick="initTabCardInfo()">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo12"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.common.refreshTime"/></div>
			                        	</div>
			                        </div>
	                        </div> 
	                     </div> 
			                 <div class="row" >
			                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="databox databox-xxlg radius-bordered " style="height: 185px">
                                        <div class="databox-right bordered-thick bordered-whitesmoke bg-blue no-padding" style="width: 100%;height: 100%">
                                            <div class="databox-stat bg-yellow radius-bordered">
                                                <div class="stat-text" id="realtime-chart-vswEx-value"></div>
                                            </div>
                                            <div class="databox-stat stat-left radius-bordered">
                                                <div class="stat-text white"><spring:message code="info.vsw.exchangeQueueCount"/></div>
                                            </div>
                                            <div id="realtime-chart-vswEx" class="chart chart-lg" style="height: 170px">

                                            </div>
                                        </div>
                                    </div>
                                </div>
		                 </div>
			                 
			                 
	                    </div>
	                    
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						        <div class="widget "> 
						        	<div class="widget-header">
				                        <span class="widget-caption"> <spring:message code="tab.vswExchangeService.session" /></span>
				                    </div> 
				                    <div class="widget-body no-padding">
				                    	<div id="flow-top-list"></div>
				                    </div>
			                    </div>
						 </div>
	                </div>
							</div>
							<div id="vswExchangeSerTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="vswExchangeSerTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="vswExchangeSerTab4" class="flag-tabs tab-pane" style="border-radius:0;"></div>
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
    	selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
    }
  
	  /************************ vswExchangeSerBtn3 ******3   vsw服务节点列表  ***********************************/
	  var tableItem_vswlist = {
			tableKey:"keyVSWID", i18nPrefix:"db.tbVSW.", trs:[                                         
			{name: "keyVSWID", disabled: "E", vali: {stringLength: 32}, advQry: ['LIKE'], width:125},
			{name: "hostname", vali: {stringLength: 64}, advQry: ['LIKE']},
			{name: "vswpwd", vali: {stringLength: 20}, show: false},
			
			{name: "idxUUWiFiAreaId",vali: {stringLength:64,required:false},width:170},
			{name: "location", vali: {stringLength: 256}, advQry: ['LIKE']},
			{name: "state", vali: {maxlength: 1}, comType: "select", advQry: ['LIKE']},//, valFormat: "<i class='img-fmt vsw-vsw-sta-{a}'></i><i class='f-tips'>{b}</i>"
			{name: "publicIP", vali: {stringLength: 128}, width:95, show: false},
			{name: "publicPort", vali: {integer:true,lessThan: 10000000}},
			{name: "expire", vali: {integer:true,lessThan: 1000000}},
			{name: "lastHBTime", vali:{date:true}, hideEdit: "A", width:125},
			{name: "countryCode", width:220,vali: {stringLength: 32}, show: false, comType: "select", comData: g_var.view.areaSelData},
			{name: "ISPName", vali: {stringLength: 32}, advQry: ['LIKE'], width:210, show: false, comType: "select", comData: g_var.view.ispSelData},
			{name: "bandwidth", vali: {integer:true,lessThan: 1000000, required:false}, show: false},
			{name: "star", vali: {stringLength: 11}, advQry: ['LIKE'], comType: "select", comData: [["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"], ["5", "5"]], show: false},
			{name: "esxiHost", vali: {stringLength: 32,required:false}, show: false, advQry: ['LIKE']},
			{name: "CPU", vali: {stringLength: 128, required:false}, show: false},
			{name: "MEM", vali: {integer:true,lessThan: 1000000, required:false}, show: false},
			{name: "HARDDISK",  vali: {integer:true,lessThan: 1000000, required:false}, show: false},
			//{name: "diskUsage", type: "I", left: false, vali: {maxlength: 11, range: [0, 100]}, show: false, hideEdit: "A"},
			{name: "powerDate",vali:{date:true}, width:125, hideEdit: "A", show: false},
			{name: "remarks", vali: {stringLength: 128,required:false}, show: false},
			{name: "mdfTm",vali:{date:true}, hideEdit: "A", width:140},
			{name: "mdfBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140},
			{name: "crtTm", hideEdit: "A", vali: {date:true}, width:140},
			{name: "crtBy", hideEdit: "A", vali: {maxlength: 45}, show: false, width:140}                                
	  ]}
	  var vswlistUrl = "/vsw/vswExchangeSer/";
	  InitTableMoudle("vswExchangeSerTab3", "vswExchangeSerTool3", vswlistUrl, tableItem_vswlist, permi, "1");
	  
	  /***********************vswExchangeSerBtn4    卡交换策略   **********************************/
	/*
	  var tableItem_simBind = {
			tableKey:"keySUBindID", i18nPrefix:"db.tbSUStaticBind.", trs:[
	  		{name:"keySUBindID", disabled:"E", width:100, advQry: ['LIKE']},
	  		//{name: "idxSimCardID", show: false,width:200},
            //{name: "idxViFiID", show: false,width:200},
            {name:"idxDevGrpID",width:200, advQry: ['LIKE'], comType:"select", comData:g_var.view.viFiDevGrpSelData},
            //{name:"idxDevGrpNameDIY", hideEdit:"A",width:140},
            //{name:"idxDevGrpCountDIY", hideEdit:"A",width:140},
            {name:"status",width:100,comType:"select"},
	  		{name:"idxSCGroupID",width:200, advQry: ['LIKE'], comType:"select", comData:g_var.view.sCGroupSelData},
	  		//{name:"idxSCGroupNameDIY", hideEdit:"A",width:140},
	  		//{name:"idxSCGroupCountDIY", hideEdit:"A",width:140},
	  		{name:"useTimes", vali:{integer:true, stringLength:8}, width:200, show:false},
	  		{name:"lastBindDate",width:200, vali: {date:true}, show:false},
	  		{name:"remarks", vali:{required:false,stringLength:128}, width:220},
	  		{name:"mdfTm", hideEdit:"A", width:140},
	  		{name:"mdfBy", hideEdit:"A", width:140, show:false},
	  		{name:"crtTm", hideEdit:"A", width:140, show:false},
	  		{name:"crtBy", hideEdit:"A", width:140, show:false},
	  ]};
	  var simBindUrl = "/vsw/vswExchangeSer/simBind";

	  InitTableMoudle("vswExchangeSerTab4", "vswExchangeSerTool4", simBindUrl, tableItem_simBind, permi, "1");
	  */

	  /******************************************** vswExchangeSerBtn2 卡交换队列 *************************************/
	  //需求：状态和类型有默认值，在搜索时加入默认值
	  var vsw_status_valFormat = function(value){
		var tips = matchComdata2Alias("db.tbUUWiFiSession.status.comData", value);
		return "<i class='img-fmt vsw-session-sta-"+ value+"'></i><i class='f-tips'>" + tips+"</i>"
	}
	  var tableItem_session = {
			tableKey:"keySessID" , i18nPrefix:"db.tbUUWiFiSession.", trs:[
			{name: "keySessID", disabled: "E", vali: {stringLength: 24}, width:60},
			{name: "idxVifiID", vali: {stringLength: 64}, advQry: ["LIKE"], width:170},
//			{name: "sessType", vali: {stringLength: 1}, comType: "select", width:80},//, advQry: ["LIKE"]
//			{name: "idxSUBindID", vali:{stringLength:128}, width:80},
//			{name: "idxUUWiFiAreaID", vali: {stringLength: 128}, width:135},
			{name: "pwd", vali: {stringLength: 64}, show:true},
			{name: "alaisName", vali: {stringLength: 64},width:110, advQry: ["LIKE"]},
//			{name: "online", vali: {stringLength: 64}},
			{name: "status", vali: {integer:true, lessThan:1000000},width:70, advQry:['LIKE'],comType:"select",valFormat:"vsw_status_valFormat"},//, advQry: ["LIKE"], comType: "select", valFormat:"<i class='img-fmt vsw-session-sta-{a}'></i><i class='f-tips'>{b}</i>"
			{name: "userAct", vali:{stringLength:64}, width:100},
			{name: "idxSimCIccId", vali: {stringLength: 64},  width:160, comType: "select", comData: g_var.view.keysimcardIDSelData},
//			{name: "idxVSWID", vali: {stringLength: 64},  advQry: ["LIKE"],comType: "select", comData: g_var.view.keyvswidSelData, width:100},
//			{name:"online",vali:{integer:true,LessThan:10000},advQry:['LIKE'],comType:"select",valFormat:"vifiDevnew_online"}
//			{name: "expire", vali: {integer:true, lessThan:1000000}, width:85},
//			{name: "lastUpdate", vali:{date:true}, width:125},
			{name: "idxSimPDevID", vali: {stringLength: 64}, advQry: ["LIKE"], comType: "select", comData: g_var.view.keySimPDevIDSelData, show:true},
			{name: "idxSimPPortId", vali: {stringLength: 64}, show:true},
//			{name: "bindType", vali: {stringLength: 1}, width:110, comType: "select", show:false },
//			{name: "idxGoipDevID", vali: {stringLength: 64}, width:195, show:false},//, advQry: ["LIKE"], comType: "select", comData: g_var.view.keygoipdevSelData
//			{name: "idxGoipPortID", vali: {integer:true, lessThan:1000000}, show:false},
//			{name: "remarks", vali: {maxlength: 128}, show: false},
			{name: "lastConnectTime", vali: {stringLength: 120}, width:120,show:true},
			{name: "lastConnectIP", vali: {stringLength: 64}, comType: "select", comData: g_var.view.keyvswidSelData, width:100},
//			{name: "mdfTm", vali:{date:true}, hideEdit: "A", width:125, show:true},
//			{name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:125},
			{name: "crtTm", vali:{date:true}, hideEdit: "A", show: false, width:125},
			{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: true, width:125}
	  ]}
	  var sessionPermi = ["0","1","1","1"];
	  var sessionUrl = "/vsw/vswExchangeSer/session";
	  var isImportAndExport=true;
	  InitTableMoudle("vswExchangeSerTab2", "vswExchangeSerTool2", sessionUrl, tableItem_session, sessionPermi, "1");
	  
	  /*************************************** vswExchangeSerBtn1 	概要信息   ***********************************/
	  
	  function initTabCardInfo(){
		Utils_ajax({
			url:window.PATH + "/vsw/vswExchangeSer/vswStatisticInfo.ajax",
			dataType:"json",
			async:true,
			data:{},
			type:"POST",
			success:function(res){
				var data = res.data;
				if(data){
					$("#outLineInfo1").html(data.exchangeQueueCount);
			      /*  $("#outLineInfo2").html(data.serviceCount);
			        $("#outLineInfo3").html(data.exchangeMethodCount);*/
			      /*  $("#outLineInfo4").html(data.todayDeviceCount);
			        $("#outLineInfo5").html(data.todayUsedCard);
			        $("#outLineInfo6").html(data.monthDeviceCount);
			        $("#outLineInfo7").html(data.monthUsedCard);
			        $("#outLineInfo8").html(data.recentMinExchangeCount);
			        $("#outLineInfo9").html(data.recentHourExchangeCount);
			        $("#outLineInfo10").html(data.todayExchangeCount);
			        $("#outLineInfo11").html(data.monthExchangeCount);*/
			        $("#outLineInfo12").html((new Date()).format("hh:mm:ss"));
				}
			}
		});
	}
	
	function initRecentChargeRecordTable(){
		$.ajax({
			url:window.PATH + "/vsw/vswExchangeSer/recentCharge.ajax",
			dataType:"json",
			async:true,
			data:{},
			type:"POST",
			success:function(res){
				var data = res.data;
				var len = data.length;
				var tableHtml = "<table  class='table'>";
				for(var i=0; i<3; i++){
					if(i < len){
						tableHtml += "<tr><td>"+data[i].createDate+"</td><td>"+data[i].idxICCID+"</td><td>"+data[i].tbSIMOprRecord+"</td></tr>";
					}else{
						tableHtml += "<tr><td>-</td><td>-</td><td>-</td></tr>";
					}
				}
				tableHtml += "</table>";
				$("#recent-charge-record").html(tableHtml);
			},
			error:function(){
				
			}
		});
	}

	//10条记录
    var tops = selectPermissionsInfo.uuwifiSessionRecord;
	var topsLen = tops.length;
	for(var i=0; i<topsLen; i++){
		tops[i].keyWord = tops[i].idxVifiID;
		tops[i].keyValue = tops[i].idxSimPDevID;
	}
	function getTopRankHtml_vsw(tops, tabId, toolsId, tabBtnId){
    	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
        for(var i = 0; i<tops.length; i++){
        	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-left\"><span class=\"item-booker\">"
        		+ tops[i].keyWord+"</span></div>";
        	topDivHtml += "<div class=\"col-lg-2 col-md-2 col-sm-2 col-xs-2\" ><i class='img-rank-exchange uuwifi-exchange-data'></i></div>";
        	topDivHtml += "<div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-6 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
        	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
        	topDivHtml +="</span></div></div></div></li>";
        }
        //填充空数据
        for ( var i = tops.length; i < 10; i++) {
        	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
        	topDivHtml +="</span><span class=\"price\"></span></div></div></div></li>";
        }
        topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
    	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
    	topDivHtml +="</span><span class=\"price\"><button class=\"btn btn-palegreen btn-sm pull-right\" onclick='switchTabAndTools(\""+tabId+"\",\""+toolsId+"\",\""+tabBtnId+"\")'>"
    		+$.i18n("status.cdrNew.info29")+"</button></span></div></div></div></li>";
    	topDivHtml +="</ul></div>";
        return topDivHtml;
    }
    $("#flow-top-list").html(getTopRankHtml_vsw(tops, "vswExchangeSerTab2", "vswExchangeSerTool2", "vswExchangeSerBtn2"));//设置“更多”按钮点击事件
  	//统计
	initTabCardInfo();
    
    //实时图
    var totalPoints = 100;
   	var updateInterval = 60000, curTime = new Date().getTime();
   	var maxVal= g_var.view.sessionCount*2;
   	var dataCharts = [];
   	dataCharts.push(g_var.view.sessionCount);
    function getData(y) {
    	if (dataCharts.length > 0){
        	if(dataCharts.length >= totalPoints){
				//从第2个开始 组成新的数组
            	dataCharts = dataCharts.slice(1);
        	}
        	if(y !=undefined){
				//把值添加到数组的末尾
            	dataCharts.push(y);
        	}
        }
        var res = [];
        for (var i = 0; i < dataCharts.length; ++i) {
            res.push([i, dataCharts[i]]);
        }
        return res;
    }
    
    var plot1 = $.plot("#realtime-chart-vswEx", [getData()], {
            yaxis: {
                color: '#f3f3f3',
                min: 0,
                max: maxVal,
                tickFormatter: function (val, axis) {
                    return "";
                }
            },
            xaxis: {
                color: '#f3f3f3',
                min: 0,
                max: 100,
                tickFormatter: function (val, axis) {
                    return "";
                }
            },
            colors: ['#fff'],
            series: {
                lines: {
                    lineWidth: 2,
                    fill: false,
                    fillColor: {
                        colors: [{
                            opacity: 0.5
                        }, {
                            opacity: 0
                        }]
                    },
                    steps: false
                },
                shadowSize: 0
            },
            grid: {
                show: false,
                hoverable: true,
                clickable: false,
                borderWidth: 0,
                aboveData: false
            },
            tooltip: true,
            tooltipOpts: {
                defaultTheme: false,
                content:  "<span>%y</span> "+$.i18n("info.vsw.exchangeQueueCount")
            }
        });

        function update() {
        	$.ajax({
                url: window.PATH + "/vsw/vswExchangeSer/realTime.ajax", //请求的url地址
                data: {}, //参数值
                type: "post", //请求方式 
                dataType: "json",
                success: function success(req) {
                	if(location.href.contains("vsw/vswExchangeSer")){//及时关闭
	                    var dataTras = req.data?req.data:0;
	                    var a = getData(dataTras);
	                    plot1.setData([getData(dataTras)]);
	                    if( parseInt(req.data) > maxVal){
		                	maxVal = req.data;
		                	plot1.getYAxes()[0].options.max=maxVal+20;
		                	plot1.setupGrid();
		                }
	                    $("#realtime-chart-vswEx-value").html("  "+dataTras+"  ");
	                    plot1.draw();
	                 /*   setTimeout(update, updateInterval);*/
                	}
                },
                error: function error(xhr, type, exception) {//获取ajax的错误信息
                    //alert(exception);
                }
            });
          
        }
        update();
      	  
	  
	  </script>
 </body>