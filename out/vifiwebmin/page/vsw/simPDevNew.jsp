<style>
	.rank-list-div{
		height:20.9px;line-height:20.9px;font-size:12px;
	}
	.simp-dev-container{
		margin: 0 0 5px 0;
		background-color: #DDD;
    	padding: 10px 15px 12px 15px;
    	border-top: 1px solid gray;
    	border-bottom: 1px solid gray;
    }
	.simp-dev-status0{
		width: 20px;
		height: 5px;
		margin: 4px 3px;
		display: inline-block;
    	background-color: #9AFF9A;
    	border: 1px solid;
	}
	.simp-dev-status1{
		width: 20px;
		height: 5px;
		margin: 4px 3px;
		display: inline-block;
    	background-color: #0000FF;    /*   #008000绿色  #0000FF蓝色  #080808黑色    */
    	border: 1px solid;
	}
	.simp-dev-status2{
		width: 20px;
		height: 5px;
		margin: 4px 3px;
		display: inline-block;
    	background-color: #C2C2C2;
    	border: 1px solid;
	}
	.simp-dev-status3{
		width: 20px;
		height: 5px;
		margin: 4px 3px;
		display: inline-block;
		background-color: #CD0000;
		border: 1px solid;
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
		                  <li class="flag-tabs-btn active" id="simPDevNewBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simPDevNewTab1','')"><i class="fa fa-th font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a>
		                  </li>
		                 <%-- <li class="flag-tabs-btn tab-blue" id="simPDevNewBtn4">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simPDevNewTab4','simPDevNewTool4')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.SimPDev.simpGrpList"/></span></a>
		                  </li>--%>
		                  <li class="flag-tabs-btn tab-blue" id="simPDevNewBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simPDevNewTab2','simPDevNewTool2')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.SimPDev.simpDevList"/></span></a>
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="simPDevNewBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simPDevNewTab3','simPDevNewTool3')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.SimPDev.simpPortList"/></span></a>
		                  </li>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simPDevNewTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simPDevNewTool3"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simPDevNewTool4"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="simPDevNewTab1" class="flag-tabs tab-pane in active summary-tab">
					<div class="row" style="margin-top:20px">
					  	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
	                     <div class="widget">
	                        <div class="widget-header">
	                           <span class="widget-caption"><spring:message code="label.common.outlineInfo"/></span>
	                        </div>
	                        <div class="widget-body no-padding table-border-outlineInfo">
	                        	 <div class="row" style="padding:0 15px;">
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo1"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.simPDev.info1"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.simPDev.info2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
											<span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simPDev.info3"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simPDev.info4"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simPDev.info5"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simPDev.info6"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo7"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simPDev.info7"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo8">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="label.simPDev.info8"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo9">&nbsp;</span>
			                                <div class="databox-text darkgray">&nbsp;</div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo10">&nbsp;</span>
			                                <div class="databox-text darkgray">&nbsp;</div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo11">&nbsp;</span>
			                                <div class="databox-text darkgray">&nbsp;</div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding cursor:pointer;" onclick="initOutlineInfo()">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo12"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.common.refreshTime"/></div>
			                        	</div>
			                        </div>
	                        </div>
	                     </div>
	                   </div>

						 <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <div class="databox databox-xxlg radius-bordered " style="height: 250px;box-shadow:1px 0 10px 1px rgba(0, 0, 0, .3);">
                                        <div class="databox-right bg-blue no-padding" style="width: 100%;height: 100%">
                                            <div class="databox-stat bg-yellow radius-bordered">
                                                <div class="stat-text" id="realtime-chart-value"></div>
                                            </div>
                                            <div class="databox-stat stat-left radius-bordered">
                                                <div class="stat-text white"><spring:message code="label.simPDev.usingCardsCount"/></div>
                                            </div>
                                            <div id="realtime-chart" class="chart chart-lg" style="height: 235px">

                                            </div>
                                        </div>
                                    </div>
                                </div>
	                </div>
	                <div class="row">
	                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						        <div class="widget ">
						        	<div class="widget-header">
				                        <span class="widget-caption"><spring:message code="label.simPDev.simPoolDev" /></span>
				                    </div>
				                    <div  id="simPDev_tab" class="widget-body no-padding">
				                    </div>
			                    </div>
						 </div>
					</div>
							</div>
							<div id="simPDevNewTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="simPDevNewTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="simPDevNewTab4" class="flag-tabs tab-pane" style="border-radius:0;"></div>
	                 </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	<!-- 详情层  simpDev--->
	<div class="modal fade modal-primary" id="mydetailModal8"  role="dialog" aria-hidden="true">
	  <div class="modal-dialog" style="width:80vw;">
	    <div class="modal-content">
	      <!-- 窗口头 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i><spring:message code="details"/></h4>
	      </div>
	      <div class="modal-body bg-white no-padding" style="overflow-y:auto;max-height: 80vh;">
	        <div class="col-sm-6">
	          <table class="table table-bordered table-striped">
				<tbody id="html_viewDetails_dev">
				<!-- 循环体 -->
	            </tbody>
	          </table>
	        </div>
	        <div id="html_expandDetails" class="col-sm-6">

	        </div>
	      </div>
	      <!-- 关闭按钮 -->
	      <div class="modal-footer">
	        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
	      </div>

	    </div>
	  </div>
	</div>
	<!-- 信息页-详情层  simpDev--->
	<div class="modal fade modal-primary" id="mydetailModalSpecal"  role="dialog" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- 窗口头 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i><spring:message code="details"/></h4>
	      </div>
	      <div class="modal-body bg-white no-padding" style="overflow-y:auto;max-height: 80vh;">
	        <div class="col-sm-12">
	          <table class="table table-bordered table-striped">
				<tbody id="mydetailModalSpecal_tbody">
				<!-- 循环体 -->
	            </tbody>
	          </table>
	        </div>
	      </div>
	      <!-- 关闭按钮 -->
	      <div class="modal-footer">
	        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
	      </div>

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

	/*************************	卡池设备列表 begin******** 这里就是停在上面然后显示出 卡池的状态 ****************************/
	var simPDevNew_status_valFormat = function(value){
		var tips = matchComdata2Alias("db.tbSimPDev.status.comData", value);
		return "<i class='img-fmt simp-dev-sta-"+ value+"'></i><i class='f-tips'>" + tips +value+ "</i>"
	}
	var simPDevNew_expandDetail = function(tableId, number){
		var tableParams = getLocalStorageModel(tableId, "tableParams"),
	    	data = getLocalStorageModel(tableId, "queryData"),
	    	dataRow = eval("data["+number+"]"),
	    	keyVal = eval("dataRow."+tableParams.tableKey),
	    	result = {};
		return searchSimpDetailsExpand(keyVal);
	}
	function searchSimpDetailsExpand(keyVal){
		var result={};
		$.ajax({
			url:window.PATH + "/vsw/simPDevNew/single-detail.ajax",
			async: false,
			dataType: "json",
			data: {id:keyVal},
			type:"post",
			success: function(data){
				var dataCon = data.data;
				var detailHtml = "<div class='padding-10'><table class='simp-sta-table'>",
					portList = dataCon.portList, portLen = portList.length,/*portLen=14(y)  x=16*/
					statusCount = dataCon.statusCount;
				for(var i=0; i<portLen; i++){
					detailHtml += "<tr>";
					var portChild = portList[i],portChildLen = portChild.length; /*portChildLen = 16(x) */
					for(var j=0; j<portChildLen; j++){
						var portCC = portChild[j];
						detailHtml += "<td class='f-p-tips'><div class='text-center'>"+ (portCC.idxSlotNum||"") +"</div><div class='img-fmt simp-port-sta-"+portCC.status+"'></div>"+
							"<div class='f-tips'>" + $.i18n("page.cardSlot")+":"+(portCC.idxSlotNum||"")+"<br>" +
							$.i18n("page.simCardNumber") +":" +(portCC.cNumber||"") +"<br>"+ $.i18n("page.simCardState") +":" +(getListKeyValue($.i18n("db.tbSimCard.status.comData"),portCC.cStatus)||"") +"<br>"+
							$.i18n("page.simCardBalance") +":" +(portCC.cBalance||"") +"<br> ------------------<br>"+ $.i18n("page.uuwifiState") +":" +
							(getListKeyValue($.i18n("db.tbViFiDevice.devState.comData"),portCC.vStatus)||"") +"<br>"+
							$.i18n("page.uuwifiCOS") +":" +(getListKeyValue($.i18n("db.tbViFiDevice.debugIdt.comData"),portCC.vCos)||"") +"<br></div></td>";
					}
					detailHtml += "</tr>";
				}
				detailHtml += "</table><div class='margin-top-40'>";
				var count0 = statusCount[0]?statusCount[0].count:0;

				/*var count3 = statusCount[3]?statusCount[3].count:3;*/
				detailHtml += "<div><div class='img-fmt simp-port-sta-0'></div>" +getListKeyValue($.i18n("db.tbSimPPort.status.comData"),"0")
					+": " +count0 +"</div>";

				var count1 = statusCount[1]&&statusCount[1].count?statusCount[1].count:0;
					detailHtml += "<div><div class='img-fmt simp-port-sta-1'></div>" +getListKeyValue($.i18n("db.tbSimPPort.status.comData"),"1")
					+": " +count1 +"</div>";

				/*detailHtml += "<div><div class='img-fmt simp-port-sta-3'></div>" +getListKeyValue($.i18n("db.tbSimPPort.status.comData"),"3")
						+": " +count3 +"</div>";*/

				detailHtml += "</div></div>";
				result.detailHtml = detailHtml;
				result.colWidth = 6;
			},
			error: function(data){
				layer.msg.error("smt is wrong.");
				return undefined;
			}
		});
		return result;
	}

	var simPDevNewItems = {resetTime: "3", tableKey: "keySimPDevID", i18nPrefix:"db.tbSimPDev.", expandDetail:"simPDevNew_expandDetail",trs:[
		{name:"keySimPDevID", width:"90",show:false, advQry:["LIKE"], hideEdit:"E",vali:{stringLength:64}},
		{name:"devName", width:"80", advQry:["LIKE"],vali:{stringLength:128},disabled:"E"},
		{name: "idxAgentID", vali:{stringLength:64}, width: 60, advQry:["LIKE"], comType:"select", comData:g_var.view.agentSelData},
		/*{name:"idxSimPDevGrpID", width:"80",vali:{integer:true,stringLength:64},comType:"select",comData:g_var.view.simpDevGrpData},*/
		/*{name:"typeName", width:"100",vali:{stringLength:64}, advQry:["LIKE"],comType:"select", comData: [["Simpool 128", "Simpool 128"], ["Simpool 224", "Simpool 224"]]},*///, comType:"select"
		{name:"username", width:"100",vali:{stringLength:64},hideEdit:"E"},
		/*{name:"password", width:"70", show:false, vali:{stringLength:64}},*/
		/*{name:"expire", width:"90", vali:{integer:true,stringLength:9}},*///11位数字报错，原因不明
		{name:"lastUpdate", width:"125", hideEdit:"A"},
		{name:"ipaddr", width:"110", advQry:["LIKE"], hideEdit:"A"},
		{name:"port", width:"90", hideEdit:"A", hideEdit:"A"},
		{name:"status", width:"90", advQry:["LIKE"], comType:"select", hideEdit:"A",valFormat:"simPDevNew_status_valFormat"},
		{name:"ports", width:"90", advQry:["LIKE"], vali:{integer:true,stringLength:9},hideEdit:"E"},
		/*{name:"idxVSWID", width:"140",vali:{stringLength:30}, advQry:["LIKE"],comType:"select",comData:g_var.view.vswSelData},*///, comType:"select"
		{name:"remarks", width:"128", show:true, vali:{required:false,stringLength:128}},
		{name:"mdfTm", width:"125", hideEdit:"A"},
		{name:"mdfBy", width:"125", show:false, hideEdit:"A"},
		{name:"crtTm", width:"125", show:true, hideEdit:"A"},
		{name:"crtBy", width:"125", show:true, hideEdit:"A"}

		]}
	var simPDevNewUrl = "/vsw/simPDevNew/";
	var simPDevNewPermi = selectPermissionsInfo.permissions;
	if (!simPDevNewPermi || simPDevNewPermi.length < 4) {
		simPDevNewPermi = selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
	}
	InitTableMoudle("simPDevNewTab2", "simPDevNewTool2", simPDevNewUrl, simPDevNewItems, simPDevNewPermi,  "1","","","",agentName);

	/*****************************	设备列表   	end **********************************************/

	/***************************** 端口列表 begin * 卡池插槽列表 ******************************/

	var simPPortNew_status_valFormat = function(value){
		var tips = matchComdata2Alias("db.tbSimPPort.status.comData", value);
		//鼠标停留在上面就会显示出 卡状态
		return "<i class='img-fmt simp-port-sta-"+ value +"'></i><i class='f-tips'>" + tips +"</i>"
	}
	var simPPortNewItems = {resetTime: "3", tableKey: "keyID", i18nPrefix:"db.tbSimPPort.",trs:[
		{name:"keyID", width:"80"},
		{name:"idxSimPDevID", width:"110",advQry:["LIKE"], comType: "select", comData: g_var.view.simpdevSelData},
		{name:"idxSlotNum", width:"80"},
		{name:"status", width:"80",valFormat:"simPPortNew_status_valFormat",advQry:["LIKE"], comType: "select",},
		{name:"idxIccid", width:"150",advQry:["LIKE"]},
		{name:"idxViFiId", width:"210",advQry:["LIKE"]},
		/*{name:"usage", width:"120"},*/
		{name:"idxAgentID", width:"125", show:true,advQry:["LIKE"] ,comType:"select", comData:g_var.view.agentSelData},
		{name:"duration", width:"95"},
		{name:"remarks", width:"125",show:false},
		{name:"mdfTm", width:"125"},
		{name:"mdfBy", width:"125", show:false},
		{name:"crtTm", width:"125", show:false},
		{name:"crtBy", width:"125", show:false}
	]}
	var simPPortNewUrl = "/vsw/simPDevNew/port";
	var simPPortNewPermi = ['0', '1', '1', '1'];
	InitTableMoudle("simPDevNewTab3", "simPDevNewTool3", simPPortNewUrl, simPPortNewItems, simPPortNewPermi,  "1");
	/***************************** 端口列表	end *******************************/

	/***************************** Simpool卡组 begin *******************************/

	var simPGrpItems = {tableKey: "keyID", i18nPrefix:"db.tbSimPGrp.",trs:[
		{name:"keyID", width:"120",advQry:["LIKE"], disabled:"A"},
		{name:"groupName", width:"120",advQry:["LIKE"], vali:{stringLength:128, required:false}},
		{name:"idxAgentID", width:"120",advQry:["LIKE"], vali:{stringLength:64, required:false}, comType:"select",comData:g_var.view.agentSelData},
		{name:"remarks", width:"125",advQry:["LIKE"], vali:{stringLength:128, required:false}},
		{name:"mdfTm", width:"125", hideEdit:"A"},
		{name:"mdfBy", width:"125", show:false, hideEdit:"A"},
		{name:"crtTm", width:"125", show:false, hideEdit:"A"},
		{name:"crtBy", width:"125", show:false, hideEdit:"A"}
	]}
	var simPGrpUrl = "/vsw/simPDevNew/group";
	var simPGrpPermi = ['0', '0', '0', '0'];
	InitTableMoudle("simPDevNewTab4", "simPDevNewTool4", simPGrpUrl, simPGrpItems, simPGrpPermi,  "1");
	/***************************** Simpool卡组 end *******************************/

	/***************************  测试插件模板  2016.08.05 gya ***********************/




</script>

<!-- 表图simPDev -->
<script>
	  	 //状态数据查询
	     var mydata_dev;
	  	 function showDataSimPDev(graphViews){
	  		if(graphViews == null || graphViews == undefined){
	  		 	graphViews = selectPermissionsInfo.graphView;
	  		}
	  		var viewHtml = "";
	  		if(graphViews !=null && graphViews.length>0){
	  			mydata_dev = graphViews;
	  			var selData = $.i18n("db.tbSimPPort.status.comData");
	  			viewHtml += "<div class=\"text-center\"><div class=\"simp-dev-shelf\" style='max-width:980px;'><div>";
	  			for(var i=0; i<graphViews.length; i++){
	  			    var graphView = graphViews[i];
	  				if(graphView !=null){
		  				viewHtml += "<div class=\"margin-bottom-20 ng-scope\">"
	                    		 +"<div class=\"text-left padding-5\"><a class=\"fa-lg\" href=\"javascript:\" onclick=\"viewDetails_dev('"+i+"')\">"
	                    		 +graphView["devName"]+"</a></div><div class=\"simp-dev-container row\">";

	                    var portInfoArray = graphView["portInfoArray"];
	  					if(portInfoArray !=null && portInfoArray.length>0){
	  						for(var m =0; m < portInfoArray.length;m++){
	  							var protInfo = portInfoArray[m];
	  							viewHtml +="<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12 no-padding'>";

	  							for(var n =0 ;n < protInfo.length;n++){
	  								 var pro = protInfo[n];

									if("0" == pro["state"]){
										viewHtml += "<div class=\"simp-dev-status0 ";
									}else if("1" == pro["state"]) {
										viewHtml += "<div class=\"simp-dev-status1 ";
									}else if("2" == pro["state"]){
										viewHtml += "<div class=\"simp-dev-status2 ";
									}else if("3" == pro["state"]){
										viewHtml += "<div class=\"simp-dev-status3 ";
									}
			                         viewHtml += " f-p-tips\" onclick=\"openSimPPortDtl('"+pro["keyID"]+"')\" style='cursor:pointer;'>"+
			                         		"<div class='f-tips' style='top:13px;'>"+pro["portNum"]+":"+
			                         		getValue(selData,(pro["state"] == null || pro["state"] == undefined ? "0":pro["state"]))+"</div></div>";
			                         //viewHtml += "<i class=\"f-tips ng-binding\" style=\"top:26px;left:12px;\">"+ pro["portNum"]+":"+
			                         //			getValue(selData,(pro["state"] == null || pro["state"] == undefined ? "0":pro["state"]))+"</i>"
			                         //         +"<div class=\"simp-col-split\"></div>";
			                         //viewHtml += "</div>";
	  							}
	  							viewHtml += "</div>";
	  						}
	  					}
	  					viewHtml += "</div></div>";
	  				}
	  	  	    }
  				viewHtml +="</div></div></div>";
	  		}
	  		$("#simPDev_tab").html(viewHtml);
	  	}

	  	function getValue(selData,dataTdValue){
			var html_SelData = dataTdValue;
			   if(selData != null){
	    	     for(var i=0; i<selData.length; i++){
	    		   if(selData[i][0]==dataTdValue){
	    			   html_SelData = selData[i][1];
	    			   break;
	    		   }
	  	         }
			   }
			return html_SelData;
		}

	  	/********** 详情 ************/
		 //查看详情方法
	    function viewDetails_dev(info){
	  	   var tbI18nDev = "db.tbSimPDev.";
	  	   var html_viewDetails = "";
	  	   var key = mydata_dev[info]["keySimPDevID"];
	  	   html_viewDetails += setViewTr($.i18n(tbI18nDev+"keySimPDevID"),mydata_dev[info]["keySimPDevID"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"devName"),mydata_dev[info]["devName"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"typeName"),mydata_dev[info]["typeName"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"username"),mydata_dev[info]["username"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"password"),mydata_dev[info]["password"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"expire"),mydata_dev[info]["expire"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"lastUpdate"),mydata_dev[info]["lastUpdate"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"ipaddr"),mydata_dev[info]["ipaddr"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"port"),mydata_dev[info]["port"]);
//		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"status"),matchComdata2Alias("db.tbSimPDev.status.comData", status));
			html_viewDetails += setViewTr($.i18n(tbI18nDev+"status"),mydata_dev[info]["status"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"ports"),mydata_dev[info]["ports"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"idxVSWID"),mydata_dev[info]["idxVSWID"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"remarks"),mydata_dev[info]["remarks"]);
		   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),mydata_dev[info]["mdfTm"]);
		   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),mydata_dev[info]["mdfBy"]);
		   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),mydata_dev[info]["crtTm"]);
		   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),mydata_dev[info]["crtBy"]);
	 	   $("#html_viewDetails_dev").html(html_viewDetails);
	 	   var result = searchSimpDetailsExpand(key);
	 	   $("#html_expandDetails").html(result.detailHtml);
	 	   myopenModel8('mydetailModal8','detail');
	    }
	    function openSimPPortDtl(keyid){
	    	$.ajax({
	       	    url:window.PATH +"/vsw/simPDevNew/simp-port-info.ajax",    //请求的url地址
	       	 	data: { keyID: keyid },
	       	    type:"post",   //请求方式
	       	    dataType: "json",
	       	    success:function(res){
				 	$("#mydetailModalSpecal_tbody").html(setViewDet(res.data));
				 	var $detailModal = $('#mydetailModalSpecal').modal({ backdrop : 'static' });
			 		setTimeout(function() {
			 			$detailModal.find("span.error").remove();
			 			$detailModal.find("input.error").removeClass("error");
			 		}, 100);
	       	        //请求成功时处理
	       	    },
	       	    error: function (xhr, type, exception) {//获取ajax的错误信息
	           }
	       	});
	    }
		 //设置卡槽上 卡的详细信息
	    function setViewDet(dataView){
	    	   var tbI18nPort = "db.tbSimPPort.";
	    	   var html_viewDetails = "";
	    	   html_viewDetails += setViewTr($.i18n(tbI18nPort+"keyID"),dataView.keyID);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxSimPDevID"),dataView.idxSimPDevID);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxSlotNum"),dataView.idxSlotNum);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"status"),matchComdata2Alias("db.tbSimPPort.status.comData", dataView.status));
//			html_viewDetails += setViewTr($.i18n(tbI18nPort+"status"),dataView.status);

			html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxIccid"),dataView.idxIccid);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxViFiId"),dataView.idxViFiId);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"usage"),dataView.usage);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"duration"),dataView.duration);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"remarks"),dataView.remarks);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),dataView.mdfTm);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),dataView.mdfBy);
			   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),dataView.crtTm);
			   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),dataView.crtBy);
			   return html_viewDetails;
	    }
		function getValue(selData,dataTdValue){
			var html_SelData = dataTdValue;
			   if(selData != null){
	    	     for(var i=0; i<selData.length; i++){
	    		   if(selData[i][0]==dataTdValue){
	    			   html_SelData = selData[i][1];
	    			   break;
	    		   }
	  	         }
			   }
			return html_SelData;
		}
		function setViewTr(leftValue,rightValue){
			return "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+leftValue+": </td><td><div class=\"f-p-tips ng-binding\">"+(rightValue !=undefined ? rightValue:"")+"</div></td></tr>";
		}
		/********** 详情 end************/
	     function getSimpDevData(){
			//alert(JSON.stringify(mygetSearchParams8()));
	        $.ajax({
	       	    url:window.PATH + "/vsw/simPDevNew/queryDev.ajax",    //请求的url地址
	       	    type:"post",   //请求方式
	       	    dataType: "json",
	       	    success:function(req){
	       	    	showDataSimPDev(req.data);
	       	        //if(location.href.contains("vsw/simPDevNew")){//及时关闭
	       	        //	setTimeout(getSimpDevData, 100000);
	       	        //}
	       	    },
	       	    error: function (xhr, type, exception) {//获取ajax的错误信息
	       	    	//alert(exception);
	            }
	       	});
	      }

		/**************************   概要信息     ************************************/
	     //概要信息
	     function initOutlineInfo(){
	     	Utils_ajax({
	     		url:window.PATH + "/vsw/simPDevNew/outlineInfo.ajax",
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
			 	        $("#outLineInfo7").html(outlineInfo.outlineInfo7);//outlineInfo.outlineInfo7);
			 	        $("#outLineInfo8").html(outlineInfo.outlineInfo8);//outlineInfo.outlineInfo8);
			 	        $("#outLineInfo12").html((new Date()).format("hh:mm:ss"));
			     	}
				}
	     	});
	     }
	     /** init **/
	     initOutlineInfo();


	     //实时图
    var totalPoints = 100;
   	var updateInterval = 10000, curTime = new Date().getTime();
   	var count = g_var.view.usingCardsCount;
   	var maxVal= count?count*2:100;
   	var dataCharts = [];
   		dataCharts.push(count);
    function getData(y) {
    	if (dataCharts.length > 0){
        	if(dataCharts.length >= totalPoints){
            	dataCharts = dataCharts.slice(1);
        	}
        	if(y !=undefined){
            	dataCharts.push(y);
        	}
        }
        var res = [];
        for (var i = 0; i < dataCharts.length; ++i) {
            res.push([i, dataCharts[i]]);
        }
        return res;
    }

    var plot = $.plot("#realtime-chart", [getData()], {
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
                content:  "<span>%y</span> "+$.i18n("label.simPDev.usingCardsCount")
            }
        });

        function update() {
        	$.ajax({
                url: window.PATH + "/vsw/simPDevNew/realTime4UsingCards.ajax", //请求的url地址  到net.eoutech.webmin.simp.ctrl.SimPDevNewCtrl.java
                data: {}, //参数值
                type: "post", //请求方式
                dataType: "json",
                success: function success(req) {//req 为224
                	if(location.href.contains("vsw/simPDevNew")){//及时关闭
	                    var dataTras = req.data?req.data:0;
	                    var a = getData(dataTras);
	                    plot.setData([getData(dataTras)]);
	                    if( parseInt(req.data) > maxVal){
		                	maxVal = req.data;
		                	plot.getYAxes()[0].options.max=maxVal+20;
		                	plot.setupGrid();
		                }
	                    $("#realtime-chart-value").html("  "+dataTras+"  ");
	                    plot.draw();
//	                    setTimeout(update, updateInterval);
                	}
                },
                error: function error(xhr, type, exception) {//获取ajax的错误信息
                    //alert(exception);
                }
            });

        }
        update();




	    showTools("false","simPDev_tab","status_tab","list");
//	    setTimeout(function(){
	    	getSimpDevData();
//    	}, 300);

    </script>

</body>