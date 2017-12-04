<style>
	.rank-list-div{
		height:21px;line-height:21px;font-size:12px;
	}
	#analysisModalContent_vifiAction.table.tr.td{
		border-top:none !important;
	}
	.analysis-color{
		display:inline-block;width: 15px;height: 15px;border-radius: 3px; margin: 0 5px;
		border:1px solid #999;
		margin-left: 20px;
	}
	.analysis-color-content{
		display: inline-block;
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
		                  <li class="flag-tabs-btn active" id="viFiDeviceNewBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('viFiDeviceNewTab1','')"><i class="fa fa-th font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="viFiDeviceNewBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('viFiDeviceNewTab3','viFiDeviceNewTool3')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="tabname.device.viFiDev"/></span></a> 
		                  </li>
		                 <%-- <li class="flag-tabs-btn tab-blue" id="viFiDeviceNewBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('viFiDeviceNewTab2','viFiDeviceNewTool2')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="tabname.device.viFiDevGrp"/></span></a> 
		                  </li>--%>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="viFiDeviceNewTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="viFiDeviceNewTool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div id="viFiDeviceNewTab1" class="flag-tabs tab-content tabs-flat summary-tab">
						<div class="row" style="margin-top:20px">	
					  			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
			                
			                     <div class="widget radius-bordered">
			                        <div class="widget-header">
			                           <span class="widget-caption"><spring:message code="label.common.outlineInfo"/></span> 
			                        </div> 
			                        <div class="widget-body no-padding table-border-outlineInfo">
			                        	<div class="row" style="padding:0 15px;">
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo1"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.vifidevice.info1"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.vifidevice.info2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
											<span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.vifidevice.info3"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.vifidevice.info4"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.vifidevice.info5"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.vifidevice.info6"/></div>
			                        	</div>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo7"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="label.vifidevice.info7"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo8">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo9">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo10">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo11">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding cursor:pointer;" onclick="initOutlineInfo()">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo12"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.common.refreshTime"/></div>
			                        	</div>
			                        </div>
			                      </div> 
			                     </div> 
			                 <div class="row" >
			                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                         <div class="widget "> 
				                    <div class="widget-body no-padding">
				                    	<div id="chinaMapData" style="width:100%;height:510px;">
				                    	</div>
				                    </div>
			                    </div>
		                     </div>
                 			</div>	                 
	                    </div>
	                    
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						        <div class="widget "> 
						        	<div class="widget-header">
				                        <span class="widget-caption"> <spring:message code="label.vifidevice.info2" /></span>
				                    </div> 
				                    <div class="widget-body no-padding">
				                    	<div id="flow-top-list"></div>
				                    </div>
			                    </div>
						 </div>
	                </div>
				</div>
							<div id="viFiDeviceNewTab2" class="flag-tabs tab-pane" style="border-radius:0;display:none;"></div>
							<div id="viFiDeviceNewTab3" class="flag-tabs tab-pane" style="border-radius:0;display:none;"></div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>  
	  
	  <!-- 分析模态框 -->
<div class="modal fade modal-primary" id="analysisModal_vifiAction"  aria-hidden="true">
  <div class="modal-dialog" style="width:740px;margin:50px auto;">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="closeAnalysisModal()"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title text-success" id="">
          	<span><i class=" fa fa-edit"></i>
          	<span id="analysisVifiId" style="font-size:13px;"></span><span style="font-size:13px;">/</span><span style="font-size:13px;" id="analysisDate"></span>
          	<input id="analysisModal_dateVal" type="hidden" value=""/>
          	<!-- input id="analysisModal_vifiIdVal" type="hidden" value=""/-->
          </h4>
        </div>
        <div class="modal-body bg-white no-padding" style="overflow-y:auto;max-height: 80vh;">
	        <div class="ng-scope" id="analysisModalContent_vifiAction" style="margin: 50px 10px 20px 10px;">
	     	</div>
	     	<div style="margin:0 10px 30px 10px;">
	     		<!-- div class="analysis-color-content"><div class="analysis-color" style="background: #1500ce;"></div><span>Get&nbsp;<spring:message code="success"/>(<span id="getSuccess"></span>)</span></div>
	     		<div class="analysis-color-content"><div class="analysis-color" style="background: #fc000a;"></div><span>Get&nbsp;<spring:message code="failure"/>(<span id="getFailure"></span>)</span></div><br/>
	     		<div class="analysis-color-content"><div class="analysis-color" style="background: #35ebff;"></div><span>Open&nbsp;<spring:message code="success"/>(<span id="openSuccess"></span>)</span></div>
	     		<div class="analysis-color-content"><div class="analysis-color" style="background: #fffa35;"></div><span>Open&nbsp;<spring:message code="failure"/>(<span id="openFailure"></span>)</span></div><br/>
	     		<div class="analysis-color-content"><div class="analysis-color" style="background: #3bd92d;"></div><span>Update(<span id="update"></span>)</span></div><br/>
	     		<div class="analysis-color-content"><div class="analysis-color" style="background: #999;"></div><span>Close(<span id="close"></span>)</span></div-->
	     		<!-- div class="analysis-color-content"><div class="analysis-color" style="background: #f1f1f1;"></div><span><spring:message code="noDate"/></span></div-->
	     		<table width="150px;" class="">
	     		<tbody>
	     		<tr><td width="50px;"><div class="analysis-color" style="background: #1500ce;"></div></td><td><spring:message code="getVifi"/></td>
	     			<td><spring:message code="success"/></td><td><span id="getSuccess"></span></td></tr>
	     		<tr><td><div class="analysis-color" style="background: #fc000a;"></div></td><td><spring:message code="getVifi"/></td>
	     			<td><spring:message code="failure"/></td><td><span id="getFailure"></span></td></tr>
	     		<tr><td><div class="analysis-color" style="background: #35ebff;"></div></td><td><spring:message code="openVifi"/></td>
	     			<td><spring:message code="success"/></td><td><span id="openSuccess"></span></td></tr>
	     		<tr><td><div class="analysis-color" style="background: #fffa35;"></div></td><td><spring:message code="openVifi"/></td>
	     			<td><spring:message code="failure"/></td><td><span id="openFailure"></span></td></tr>
	     		<tr><td><div class="analysis-color" style="background: #3bd92d;"></div></td><td><spring:message code="updateVifi"/></td>
	     			<td>-</td><td><span id="update"></span></td></tr>
	     		<tr><td><div class="analysis-color" style="background: #999;"></div></td><td><spring:message code="closeVifi"/></td>
	     			<td>-</td><td><span id="close"></span></td></tr>
	     		</tbody>
	     		</table>
	     	
	     	</div>
        </div>
        <div class="modal-footer">
        <button style="float:left;" class="btn btn-primary" onclick="analysisModal(-1)" aria-label="Close"><spring:message code="yesterday"/></button>
        <button style="float:left" class="btn btn-primary" onclick="analysisModal(1)" aria-label="Close"><spring:message code="tomorrow"/></button>
        <button class="btn btn-danger" onclick="closeAnalysisModal()" aria-label="Close"><spring:message code="close"/></button></div>
    </div>
  </div>
</div>
  
<script>
	g_var.view = ${view};
	var agentName=g_var.view.agentName;
	try {
	    var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
	} catch (e) {
	    throw new Error("js视图数据,解析错误,请检测!~!");
	}
	var vifiDevNewPermi = selectPermissionsInfo.permissions;
	if (!vifiDevNewPermi || vifiDevNewPermi.length < 4) {
		selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
	}
	
	/******************************************************* 	IeBox列表	begin**********************/
	var vifiDevnew_devstate = function(value){
		var tip = matchComdata2Alias("db.tbViFiDevice.devState.comData", value);
		return "<i class='img-fmt uuw-vifi-sta-"+value+"'></i><i class='f-tips'>"+tip+"</i>";
	}
	var vifiDevnew_online = function(value){
		var tip = matchComdata2Alias("db.tbViFiDevice.online.comData", value);
		return "<i class='img-fmt uuw-vifi-online-"+value+"'></i><i class='f-tips'>"+tip+"</i>";
	}
	var vifiDevNewItems = {tableKey:"keyDevID", i18nPrefix:"db.tbViFiDevice.",trs:[
		{name:"keyDevID",width:100, vali: {stringLength: 64}},
		{name:"idxViFiID",width:180, disabled: "E",vali:{stringLength:[20,24]},advQry: ['LIKE']},
		{name:"alaisName",width:110, disabled: "E",vali:{stringLength:[10,24]},advQry: ['LIKE']},
		{name:"pwd",width:100,show:true, vali: {stringLength: 45}, disabled: "E"},
//		{name:"idxDevGrpID",width:150,show:false, vali: {stringLength: 64}, comType: "select", comData: g_var.view.devGroupSelData},
//		{name:"idxVNSID", vali: {stringLength: 64},width:130, comType: "select", comData: g_var.view.vnsSelData, advQry: ['LIKE'],show:true},
//		{name:"devState", vali: {stringLength: 1}, comType: "select", advQry: ['LIKE']},//设备状态  只显示文字 不显示图标
		//, valFormat:"vifiDevnew_devstate"  状态只显示文字，在线离线显示图标   valFormat:"directionIcon"
		{name:"online",vali:{integer:true,LessThan:10000},advQry:['LIKE'],comType:"select",valFormat:"vifiDevnew_online"},//增加radio选项  IeBox列表
//		{name: "idxUserID",  vali: {stringLength: 64,required:false}},
//		{name: "idxAgentID", vali: {stringLength: 64},width:130, comType: "select", comData: g_var.view.agentSelData, advQry: ['LIKE']},
		{name: "idxAgentID", vali:{stringLength:64}, width: 60, advQry:["LIKE"], comType:"select", comData:g_var.view.agentSelData},
//		{name: "debugIdt", vali: {stringLength: 4}, show: false, comType: "select"},
		{name: "hardwareVer",width:130, hideEdit: "A",disabled: "A", vali: {stringLength: 10,required:false}},
//		{name: "firmwareVer", disabled: "E", vali: {stringLength: 100,required:false}, advQry: ['LIKE'], show: false, comType: "select", comData: g_var.view.firmwareVerSelData},
//		{name: "softwareVer", disabled: "E", vali: {stringLength: 100,required:false}, advQry: ['LIKE'],  comType: "select", comData: g_var.view.softwareVerSelData},
		{name: "softwareVer", hideEdit: "A",disabled: "A", vali: {stringLength: 100,required:false}},
//		{name: "lastUpdateDate", vali:{date:true}, hideEdit: "A", width:125},
		{name: "lastConnectTime", vali:{date:true}, hideEdit: "A", width:125},
		{name: "lastConnectIP", vali: {stringLength: 32}, hideEdit: "A", width:95},
		{name: "remark", vali: {stringLength: 256,required:false}, show: false, hideEdit: "E"},
		{name: "mdfTm", vali:{date:true}, hideEdit: "A", width:125},
		{name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, show: true},
		{name: "crtTm", vali:{date:true}, hideEdit: "A", show: false},
		{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false}
	]}
	var vifiDevNNewUrl = "/vsw/viFiDeviceNew/";
	InitTableMoudle("viFiDeviceNewTab3", "viFiDeviceNewTool3", vifiDevNNewUrl, vifiDevNewItems, vifiDevNewPermi,  "1",true,'','',agentName);//, true);
	
	
	
	/********************************	uuwifi列表	end	************************************/
	
	/********************************	设备组	end	************************************/
	
	var vifiDevGrpNewItems = {tableKey:"keyDevGrpID", i18nPrefix:"db.tbViFiDevGroup.",trs:[
		{name:"keyDevGrpID",width:80, disabled: "E", vali: {stringLength: 64}, advQry: ['LIKE']},
		{name:"name",width:100, vali: {stringLength: 128}, advQry: ['LIKE']},
		{name:"productionDate",vali:{date:true, dateFormat:"YYYY-MM-DD"}},
		{name:"productionNo", vali: {stringLength: 100}, disabled: "E", advQry: ['LIKE']},
		{name:"productionVer", vali: {stringLength: 128}, disabled: "E", advQry: ['LIKE']},
		{name:"hardwareVer", vali: {stringLength: 10}, disabled: "E", advQry: ['LIKE']},
		{name:"firmwareVer", vali: {stringLength: 10}, disabled: "E", advQry: ['LIKE']},
		{name:"softwareVer", vali: {stringLength: 10}, disabled: "E", advQry: ['LIKE']},
		{name: "initNumber", vali: {digits: true,stringLength:11},width:90, disabled:"E"},
		{name: "currentNumber", vali: {digits: true,stringLength:11},width:80},
		{name: "normalNumber", vali: {digits: true,stringLength:11},width:80},
		{name: "repairTimes", vali: {digits: true,lessThan:11},width:80,hideEdit:"A"},
		{name: "remark", vali: {stringLength: 256,required:false}, show: false},
		{name: "mdfTm", vali:{date:true}, hideEdit: "A", width:125},
		{name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, show: false},
		{name: "crtTm", vali:{date:true}, hideEdit: "A", show: false},
		{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false}	
	]}
	var vifiDevGrpNNewUrl = "/vsw/viFiDeviceNew/group";
	InitTableMoudle("viFiDeviceNewTab2", "viFiDeviceNewTool2", vifiDevGrpNNewUrl, vifiDevGrpNewItems, vifiDevNewPermi,  "1");
	
	/********************************	设备组	end	************************************/
	
	
	/************************************ IeBox分析按钮  ***************************/
	/*function anlysisShow(){
		$("#viFiDeviceNewTab3-tools-analysis").show();
	}
	anlysisShow();*/
	
	function analysisModal(type, vifiId){
		  var queryParams = getSearchParams3(type, vifiId);
		  var loadInx = layer.load(2);//打开加载圈图标
     	$.ajax({
    	    url:window.PATH + "/vsw/viFiDeviceNew/queryAnalysisDate.json",
    	    data: queryParams,
    	    type:"post",
    	    dataType: "json",
    	    success:function(req){
    	    	//console.log(req);
    	    	var content = req.data;
    	    		content = content.content;
    	    	if(content && content.length>0){
    	    		var len = content.length,
    	    			html ="<table style='margin-top:50px;width:auto;' class='table table-striped'>",
    	    			trValue = "<tr>",
    	    			trTime = "<tr>",
    	    			colspan = 0;
    	    		for(var i=0;i<len;i++){
    	    			var item = content[i];
    	    			if(item.status==0){
    	    				trValue +="<td style='background:#FAFAFA;width:3px;height:100px;padding:0;'></td>";
    	    			}else if(item.status==1){
    	    				trValue +="<td style='background:" + getActColor(item.act,1) + ";width:3px;height:100px;padding:0;' title='"+
    	    					 item.desc+"'></td>";
    	    			}else if(item.status==2){
    	    				trValue +="<td style='background:" + getActColor(item.act,-1)+ ";width:3px;height:100px;padding:0;' title='"+ 
    	    					 item.desc+"'></td>";
    	    			}else if(item.status==3){
    	    			}else if(item.status==4){
    	    			}
    	    			
    	    			trTime +="<td style='height:30px;padding:0;'>" +item.hms +"</td>";
    	    		}
    	    		html+= trValue +"</tr>"+trTime+"</tr>"+"</table><br/></br>";
    	    		//计数
    	    		var firstItem = content[0];
    	    		$("#getSuccess").html(firstItem.getSuccess);
    	    		$("#getFailure").html(firstItem.getFailure);
    	    		$("#openSuccess").html(firstItem.openSuccess);
    	    		$("#openFailure").html(firstItem.openFailure);
    	    		$("#update").html(firstItem.update);
    	    		$("#close").html(firstItem.close);
    	    	}
    	    	$("#analysisModalContent_vifiAction").html(html);
    	    	$("#analysisModal_vifiAction").modal({backdrop: 'static'});
    	    	layer.close(loadInx);//关闭加载圈图标
    	    }, 
    	    error: function (xhr, type, exception) {
    	    	layer.close(loadInx);//关闭加载圈图标
        	}
    	});
	  }
	
	  function getActColor(act,val) {
		  switch(act) {
		  case "GET": 	return (val>0 ? "#1500ce" : "#fc000a");
		  case "VOPEN": return (val>0 ? "#35ebff" : "#fffa35");
		  case "VUPDATE":return "#3bd92d";
		  case "VCLOSE": return "#999";
		  }
	  }
	  function closeAnalysisModal(){
		  $("#analysisModal_dateVal").val("");
		  $("#analysisModal_vifiIdVal").val("");
		  $("#analysisModal_vifiAction").modal("hide");
	  }
	  
	  function getSearchParams3(type, uuwifiId){
		  var rowNmb = 0;
		 // if(!uuwifiId){
		//	  uuwifiId = $("#analysisModal_vifiIdVal").val();
		//	  if(!uuwifiId){
				  var checkedRows = $("input[name*=viFiDeviceNewTab3-rowItems]:checked");
				  if(checkedRows){
					  rowNmb = checkedRows[0].value.split("-|-"); 
					  rowNmb = rowNmb[1];
				  }
		//	  }
		  //}
		  var queryDate = getLocalStorageModel("viFiDeviceNewTab3", "queryData"),
		  	dateRow = eval("queryDate["+rowNmb+"]"),
		  	uuwifiId = dateRow.idxViFiID,
		  	lastConnectTime = dateRow.lastConnectTime,//连接时间
		  	dateParam = "";
		  /** type: undefined/0 查询当天或指定日期  1查询明天  -1查询前一天 ***/
		  if(type){
			  var dateStr = $("#analysisModal_dateVal").val();
			  var newDate = type>0?new Date(Date.parse(dateStr) + 24*60*60*1000):new Date(Date.parse(dateStr) - 24*60*60*1000);
			  dateParam = newDate.format("yyyy-MM-dd");
		  }else{
			  if(!lastConnectTime){
				  dateParam = new Date().format("yyyy-MM-dd");
			  }else{
				  var newDate = new Date(Date.parse(lastConnectTime));
				  dateParam = newDate.format("yyyy-MM-dd"); 
			  }
		  }
		  $("#analysisModal_dateVal").val(dateParam);
		  $("#analysisModal_vifiIdVal").val(uuwifiId);
		  $("#analysisVifiId").html(uuwifiId);
		  $("#analysisDate").html(dateParam)
		  var dateStart = dateParam +" 00:00:00";
		  var dateEnd = dateParam +" 23:59:59";
		  
	      var params = {};
	      params["cx_LIKE-|-idxViFiID"] = uuwifiId;
	      params["cx_GTE-|-reqDate"] = dateStart;
	      params["cx_LTE-|-reqDate"] = dateEnd;
	      params.cx_ORDER_LIST = "[['reqDate',1]]";
	      return params;
	  }

</script>
<script>
	/************************ 	信息页 	*****************/
	//rank
    var tops = selectPermissionsInfo.recentOnlineDev;
	var topsLen = tops.length;
	for(var i=0; i<topsLen; i++){
		tops[i].keyWord = tops[i].idxViFiID;
		tops[i].keyValue = tops[i].idxUserID;
	}
	function getTopRankHtml_vifiDev(tops, tabId, toolsId, tabBtnId){
    	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
        for(var i = 0; i<tops.length; i++){
        	topDivHtml +="<li class=\"order-item\" onclick='analysisModal(\"\", "+tops[i].keyWord+")'><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">"
        		+ tops[i].keyWord+"</span></div>";
        	topDivHtml += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
        	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
        	topDivHtml +="</span></div></div></div></li>";
        }
        //填充空数据
        for ( var i = tops.length; i < 20; i++) {
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
    //概要信息
    function initOutlineInfo(){
    	Utils_ajax({
     		url:window.PATH + "/vsw/viFiDeviceNew/outlineInfo.ajax",
			dataType:"json",
			async:true,
			data:{},
			type:"POST",
			success:function(res){
				var outlineInfo = res.data;
		    	if(outlineInfo){
			        $("#outLineInfo1").html(outlineInfo.outlineInfo1);
			        $("#outLineInfo2").html(outlineInfo.outlineInfo2);
			        $("#outLineInfo3").html(outlineInfo.outlineInfo3);
			        $("#outLineInfo4").html(outlineInfo.outlineInfo4);
			        $("#outLineInfo5").html(outlineInfo.outlineInfo5);
			        $("#outLineInfo6").html(outlineInfo.outlineInfo6);
			        $("#outLineInfo7").html(outlineInfo.outlineInfo7);
			        $("#outLineInfo12").html((new Date()).format("hh:mm:ss"));
		    	}
			}
    	});
    }
    /** init **/
    initOutlineInfo();
    $("#flow-top-list").html(getTopRankHtml_vifiDev(tops, "viFiDeviceNewTab3", "viFiDeviceNewTool3", "viFiDeviceNewBtn3"));//设置“更多”按钮点击事件
    
    
    /**************************************************	测试中国地图 ********************************************/
    
 var myChart = echarts.init(document.getElementById('chinaMapData'));   
 var latlong = {};
 latlong.AD = {'latitude':42.5, 'longitude':1.5};
 latlong.AE = {'latitude':24, 'longitude':54};
 latlong.AF = {'latitude':33, 'longitude':65};
 latlong.AG = {'latitude':17.05, 'longitude':-61.8};
 latlong.AI = {'latitude':18.25, 'longitude':-63.1667};
 latlong.AL = {'latitude':41, 'longitude':20};
 latlong.AM = {'latitude':40, 'longitude':45};
 latlong.AN = {'latitude':12.25, 'longitude':-68.75};
 latlong.AO = {'latitude':-12.5, 'longitude':18.5};
 latlong.AP = {'latitude':35, 'longitude':105};
 latlong.AQ = {'latitude':-90, 'longitude':0};
 latlong.AR = {'latitude':-34, 'longitude':-64};
 latlong.AS = {'latitude':-14.3333, 'longitude':-170};
 latlong.AT = {'latitude':47.3333, 'longitude':13.3333};
 latlong.AU = {'latitude':-27, 'longitude':133};
 latlong.AW = {'latitude':12.5, 'longitude':-69.9667};
 latlong.AZ = {'latitude':40.5, 'longitude':47.5};
 latlong.BA = {'latitude':44, 'longitude':18};
 latlong.BB = {'latitude':13.1667, 'longitude':-59.5333};
 latlong.BD = {'latitude':24, 'longitude':90};
 latlong.BE = {'latitude':50.8333, 'longitude':4};
 latlong.BF = {'latitude':13, 'longitude':-2};
 latlong.BG = {'latitude':43, 'longitude':25};
 latlong.BH = {'latitude':26, 'longitude':50.55};
 latlong.BI = {'latitude':-3.5, 'longitude':30};
 latlong.BJ = {'latitude':9.5, 'longitude':2.25};
 latlong.BM = {'latitude':32.3333, 'longitude':-64.75};
 latlong.BN = {'latitude':4.5, 'longitude':114.6667};
 latlong.BO = {'latitude':-17, 'longitude':-65};
 latlong.BR = {'latitude':-10, 'longitude':-55};
 latlong.BS = {'latitude':24.25, 'longitude':-76};
 latlong.BT = {'latitude':27.5, 'longitude':90.5};
 latlong.BV = {'latitude':-54.4333, 'longitude':3.4};
 latlong.BW = {'latitude':-22, 'longitude':24};
 latlong.BY = {'latitude':53, 'longitude':28};
 latlong.BZ = {'latitude':17.25, 'longitude':-88.75};
 latlong.CA = {'latitude':54, 'longitude':-100};
 latlong.CC = {'latitude':-12.5, 'longitude':96.8333};
 latlong.CD = {'latitude':0, 'longitude':25};
 latlong.CF = {'latitude':7, 'longitude':21};
 latlong.CG = {'latitude':-1, 'longitude':15};
 latlong.CH = {'latitude':47, 'longitude':8};
 latlong.CI = {'latitude':8, 'longitude':-5};
 latlong.CK = {'latitude':-21.2333, 'longitude':-159.7667};
 latlong.CL = {'latitude':-30, 'longitude':-71};
 latlong.CM = {'latitude':6, 'longitude':12};
 latlong.CN = {'latitude':35, 'longitude':105};
 latlong.CO = {'latitude':4, 'longitude':-72};
 latlong.CR = {'latitude':10, 'longitude':-84};
 latlong.CU = {'latitude':21.5, 'longitude':-80};
 latlong.CV = {'latitude':16, 'longitude':-24};
 latlong.CX = {'latitude':-10.5, 'longitude':105.6667};
 latlong.CY = {'latitude':35, 'longitude':33};
 latlong.CZ = {'latitude':49.75, 'longitude':15.5};
 latlong.DE = {'latitude':51, 'longitude':9};
 latlong.DJ = {'latitude':11.5, 'longitude':43};
 latlong.DK = {'latitude':56, 'longitude':10};
 latlong.DM = {'latitude':15.4167, 'longitude':-61.3333};
 latlong.DO = {'latitude':19, 'longitude':-70.6667};
 latlong.DZ = {'latitude':28, 'longitude':3};
 latlong.EC = {'latitude':-2, 'longitude':-77.5};
 latlong.EE = {'latitude':59, 'longitude':26};
 latlong.EG = {'latitude':27, 'longitude':30};
 latlong.EH = {'latitude':24.5, 'longitude':-13};
 latlong.ER = {'latitude':15, 'longitude':39};
 latlong.ES = {'latitude':40, 'longitude':-4};
 latlong.ET = {'latitude':8, 'longitude':38};
 latlong.EU = {'latitude':47, 'longitude':8};
 latlong.FI = {'latitude':62, 'longitude':26};
 latlong.FJ = {'latitude':-18, 'longitude':175};
 latlong.FK = {'latitude':-51.75, 'longitude':-59};
 latlong.FM = {'latitude':6.9167, 'longitude':158.25};
 latlong.FO = {'latitude':62, 'longitude':-7};
 latlong.FR = {'latitude':46, 'longitude':2};
 latlong.GA = {'latitude':-1, 'longitude':11.75};
 latlong.GB = {'latitude':54, 'longitude':-2};
 latlong.GD = {'latitude':12.1167, 'longitude':-61.6667};
 latlong.GE = {'latitude':42, 'longitude':43.5};
 latlong.GF = {'latitude':4, 'longitude':-53};
 latlong.GH = {'latitude':8, 'longitude':-2};
 latlong.GI = {'latitude':36.1833, 'longitude':-5.3667};
 latlong.GL = {'latitude':72, 'longitude':-40};
 latlong.GM = {'latitude':13.4667, 'longitude':-16.5667};
 latlong.GN = {'latitude':11, 'longitude':-10};
 latlong.GP = {'latitude':16.25, 'longitude':-61.5833};
 latlong.GQ = {'latitude':2, 'longitude':10};
 latlong.GR = {'latitude':39, 'longitude':22};
 latlong.GS = {'latitude':-54.5, 'longitude':-37};
 latlong.GT = {'latitude':15.5, 'longitude':-90.25};
 latlong.GU = {'latitude':13.4667, 'longitude':144.7833};
 latlong.GW = {'latitude':12, 'longitude':-15};
 latlong.GY = {'latitude':5, 'longitude':-59};
 latlong.HK = {'latitude':22.25, 'longitude':114.1667};
 latlong.HM = {'latitude':-53.1, 'longitude':72.5167};
 latlong.HN = {'latitude':15, 'longitude':-86.5};
 latlong.HR = {'latitude':45.1667, 'longitude':15.5};
 latlong.HT = {'latitude':19, 'longitude':-72.4167};
 latlong.HU = {'latitude':47, 'longitude':20};
 latlong.ID = {'latitude':-5, 'longitude':120};
 latlong.IE = {'latitude':53, 'longitude':-8};
 latlong.IL = {'latitude':31.5, 'longitude':34.75};
 latlong.IN = {'latitude':20, 'longitude':77};
 latlong.IO = {'latitude':-6, 'longitude':71.5};
 latlong.IQ = {'latitude':33, 'longitude':44};
 latlong.IR = {'latitude':32, 'longitude':53};
 latlong.IS = {'latitude':65, 'longitude':-18};
 latlong.IT = {'latitude':42.8333, 'longitude':12.8333};
 latlong.JM = {'latitude':18.25, 'longitude':-77.5};
 latlong.JO = {'latitude':31, 'longitude':36};
 latlong.JP = {'latitude':36, 'longitude':138};
 latlong.KE = {'latitude':1, 'longitude':38};
 latlong.KG = {'latitude':41, 'longitude':75};
 latlong.KH = {'latitude':13, 'longitude':105};
 latlong.KI = {'latitude':1.4167, 'longitude':173};
 latlong.KM = {'latitude':-12.1667, 'longitude':44.25};
 latlong.KN = {'latitude':17.3333, 'longitude':-62.75};
 latlong.KP = {'latitude':40, 'longitude':127};
 latlong.KR = {'latitude':37, 'longitude':127.5};
 latlong.KW = {'latitude':29.3375, 'longitude':47.6581};
 latlong.KY = {'latitude':19.5, 'longitude':-80.5};
 latlong.KZ = {'latitude':48, 'longitude':68};
 latlong.LA = {'latitude':18, 'longitude':105};
 latlong.LB = {'latitude':33.8333, 'longitude':35.8333};
 latlong.LC = {'latitude':13.8833, 'longitude':-61.1333};
 latlong.LI = {'latitude':47.1667, 'longitude':9.5333};
 latlong.LK = {'latitude':7, 'longitude':81};
 latlong.LR = {'latitude':6.5, 'longitude':-9.5};
 latlong.LS = {'latitude':-29.5, 'longitude':28.5};
 latlong.LT = {'latitude':55, 'longitude':24};
 latlong.LU = {'latitude':49.75, 'longitude':6};
 latlong.LV = {'latitude':57, 'longitude':25};
 latlong.LY = {'latitude':25, 'longitude':17};
 latlong.MA = {'latitude':32, 'longitude':-5};
 latlong.MC = {'latitude':43.7333, 'longitude':7.4};
 latlong.MD = {'latitude':47, 'longitude':29};
 latlong.ME = {'latitude':42.5, 'longitude':19.4};
 latlong.MG = {'latitude':-20, 'longitude':47};
 latlong.MH = {'latitude':9, 'longitude':168};
 latlong.MK = {'latitude':41.8333, 'longitude':22};
 latlong.ML = {'latitude':17, 'longitude':-4};
 latlong.MM = {'latitude':22, 'longitude':98};
 latlong.MN = {'latitude':46, 'longitude':105};
 latlong.MO = {'latitude':22.1667, 'longitude':113.55};
 latlong.MP = {'latitude':15.2, 'longitude':145.75};
 latlong.MQ = {'latitude':14.6667, 'longitude':-61};
 latlong.MR = {'latitude':20, 'longitude':-12};
 latlong.MS = {'latitude':16.75, 'longitude':-62.2};
 latlong.MT = {'latitude':35.8333, 'longitude':14.5833};
 latlong.MU = {'latitude':-20.2833, 'longitude':57.55};
 latlong.MV = {'latitude':3.25, 'longitude':73};
 latlong.MW = {'latitude':-13.5, 'longitude':34};
 latlong.MX = {'latitude':23, 'longitude':-102};
 latlong.MY = {'latitude':2.5, 'longitude':112.5};
 latlong.MZ = {'latitude':-18.25, 'longitude':35};
 latlong.NA = {'latitude':-22, 'longitude':17};
 latlong.NC = {'latitude':-21.5, 'longitude':165.5};
 latlong.NE = {'latitude':16, 'longitude':8};
 latlong.NF = {'latitude':-29.0333, 'longitude':167.95};
 latlong.NG = {'latitude':10, 'longitude':8};
 latlong.NI = {'latitude':13, 'longitude':-85};
 latlong.NL = {'latitude':52.5, 'longitude':5.75};
 latlong.NO = {'latitude':62, 'longitude':10};
 latlong.NP = {'latitude':28, 'longitude':84};
 latlong.NR = {'latitude':-0.5333, 'longitude':166.9167};
 latlong.NU = {'latitude':-19.0333, 'longitude':-169.8667};
 latlong.NZ = {'latitude':-41, 'longitude':174};
 latlong.OM = {'latitude':21, 'longitude':57};
 latlong.PA = {'latitude':9, 'longitude':-80};
 latlong.PE = {'latitude':-10, 'longitude':-76};
 latlong.PF = {'latitude':-15, 'longitude':-140};
 latlong.PG = {'latitude':-6, 'longitude':147};
 latlong.PH = {'latitude':13, 'longitude':122};
 latlong.PK = {'latitude':30, 'longitude':70};
 latlong.PL = {'latitude':52, 'longitude':20};
 latlong.PM = {'latitude':46.8333, 'longitude':-56.3333};
 latlong.PR = {'latitude':18.25, 'longitude':-66.5};
 latlong.PS = {'latitude':32, 'longitude':35.25};
 latlong.PT = {'latitude':39.5, 'longitude':-8};
 latlong.PW = {'latitude':7.5, 'longitude':134.5};
 latlong.PY = {'latitude':-23, 'longitude':-58};
 latlong.QA = {'latitude':25.5, 'longitude':51.25};
 latlong.RE = {'latitude':-21.1, 'longitude':55.6};
 latlong.RO = {'latitude':46, 'longitude':25};
 latlong.RS = {'latitude':44, 'longitude':21};
 latlong.RU = {'latitude':60, 'longitude':100};
 latlong.RW = {'latitude':-2, 'longitude':30};
 latlong.SA = {'latitude':25, 'longitude':45};
 latlong.SB = {'latitude':-8, 'longitude':159};
 latlong.SC = {'latitude':-4.5833, 'longitude':55.6667};
 latlong.SD = {'latitude':15, 'longitude':30};
 latlong.SE = {'latitude':62, 'longitude':15};
 latlong.SG = {'latitude':1.3667, 'longitude':103.8};
 latlong.SH = {'latitude':-15.9333, 'longitude':-5.7};
 latlong.SI = {'latitude':46, 'longitude':15};
 latlong.SJ = {'latitude':78, 'longitude':20};
 latlong.SK = {'latitude':48.6667, 'longitude':19.5};
 latlong.SL = {'latitude':8.5, 'longitude':-11.5};
 latlong.SM = {'latitude':43.7667, 'longitude':12.4167};
 latlong.SN = {'latitude':14, 'longitude':-14};
 latlong.SO = {'latitude':10, 'longitude':49};
 latlong.SR = {'latitude':4, 'longitude':-56};
 latlong.ST = {'latitude':1, 'longitude':7};
 latlong.SV = {'latitude':13.8333, 'longitude':-88.9167};
 latlong.SY = {'latitude':35, 'longitude':38};
 latlong.SZ = {'latitude':-26.5, 'longitude':31.5};
 latlong.TC = {'latitude':21.75, 'longitude':-71.5833};
 latlong.TD = {'latitude':15, 'longitude':19};
 latlong.TF = {'latitude':-43, 'longitude':67};
 latlong.TG = {'latitude':8, 'longitude':1.1667};
 latlong.TH = {'latitude':15, 'longitude':100};
 latlong.TJ = {'latitude':39, 'longitude':71};
 latlong.TK = {'latitude':-9, 'longitude':-172};
 latlong.TM = {'latitude':40, 'longitude':60};
 latlong.TN = {'latitude':34, 'longitude':9};
 latlong.TO = {'latitude':-20, 'longitude':-175};
 latlong.TR = {'latitude':39, 'longitude':35};
 latlong.TT = {'latitude':11, 'longitude':-61};
 latlong.TV = {'latitude':-8, 'longitude':178};
 latlong.TW = {'latitude':23.5, 'longitude':121};
 latlong.TZ = {'latitude':-6, 'longitude':35};
 latlong.UA = {'latitude':49, 'longitude':32};
 latlong.UG = {'latitude':1, 'longitude':32};
 latlong.UM = {'latitude':19.2833, 'longitude':166.6};
 latlong.US = {'latitude':38, 'longitude':-97};
 latlong.UY = {'latitude':-33, 'longitude':-56};
 latlong.UZ = {'latitude':41, 'longitude':64};
 latlong.VA = {'latitude':41.9, 'longitude':12.45};
 latlong.VC = {'latitude':13.25, 'longitude':-61.2};
 latlong.VE = {'latitude':8, 'longitude':-66};
 latlong.VG = {'latitude':18.5, 'longitude':-64.5};
 latlong.VI = {'latitude':18.3333, 'longitude':-64.8333};
 latlong.VN = {'latitude':16, 'longitude':106};
 latlong.VU = {'latitude':-16, 'longitude':167};
 latlong.WF = {'latitude':-13.3, 'longitude':-176.2};
 latlong.WS = {'latitude':-13.5833, 'longitude':-172.3333};
 latlong.YE = {'latitude':15, 'longitude':48};
 latlong.YT = {'latitude':-12.8333, 'longitude':45.1667};
 latlong.ZA = {'latitude':-29, 'longitude':24};
 latlong.ZM = {'latitude':-15, 'longitude':30};
 latlong.ZW = {'latitude':-20, 'longitude':30};

var mapData = g_var.view.devCount4china;

 var max = -Infinity;
 var min = Infinity;
 mapData.forEach(function (itemOpt) {
     if (itemOpt.value > max) {
         max = itemOpt.value;
     }
     if (itemOpt.value < min) {
         min = itemOpt.value;
     }
 });

 option = {
     backgroundColor: '#404a59',
     //dataZoom:{
     //	 zoomLock: true
     //},
     title : {
         text: $.i18n("label.vifiDevice.deviceScattergram"),
         //subtext: 'From YiYou',
         left: 'left',
         top: 'top',
         textStyle: {
             color: '#fff',
             fontSize: 14,
             fontWeight: "normal"
         }
     },
     tooltip : {
         trigger: 'item',
         formatter : function (params) {
             return params.name + ' : ' + params.value[2];//params.seriesName +
         }
     },
     visualMap: {
         show: false,
         min: 0,
         max: max,
         inRange: {
             symbolSize: [6, 60]
         }
     },
     geo: {
         name: $.i18n("label.vifiDevice.deviceScattergram"),
         type: 'map',
         map: 'world',
         roam: 'move',
         label: {
             emphasis: {
                 show: false
             }
         },
         itemStyle: {
             normal: {
                 areaColor: '#323c48',
                 borderColor: '#111'
             },
             emphasis: {
                 areaColor: '#2a333d'
             }
         }
     },
     series : [
         {
             type: 'scatter',
             coordinateSystem: 'geo',
             data: mapData.map(function (itemOpt) {
                 return {
                     name: itemOpt.name,
                     value: [
                         latlong[itemOpt.code].longitude,
                         latlong[itemOpt.code].latitude,
                         itemOpt.value
                     ],
                     label: {
                         emphasis: {
                             position: 'right',
                             show: true
                         }
                     },
                     itemStyle: {
                         normal: {
                             color: itemOpt.color
                         }
                     }
                 };
             })
         }
     ]
 };
    
	
myChart.setOption(option);
    
</script>


 </body>