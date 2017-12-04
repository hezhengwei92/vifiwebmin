<style>
	.rank-list-div{
		height:21px;line-height:21px;font-size:12px;
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
	                  <li class="flag-tabs-btn active" id="goipNewBtn1">
	                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('goipNewTab1','')"><i class="fa fa-th font14"></i>
	                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
	                  </li>
	                  <li class="flag-tabs-btn tab-blue" id="goipNewBtn4">
	                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('goipNewTab4','goipNewTool4')"><i class="fa fa-list font14"></i>
	                     <span class="tab-title"><spring:message code="menu.goip_goIPGrp"/></span></a> 
	                  </li>
	                  <li class="flag-tabs-btn tab-blue" id="goipNewBtn2">
	                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('goipNewTab2','goipNewTool2')"><i class="fa fa-list font14"></i>
	                     <span class="tab-title"><spring:message code="menu.goip_goIPDev"/></span></a> 
	                  </li>
	                  <li class="flag-tabs-btn tab-blue" id="goipNewBtn3">
	                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('goipNewTab3','goipNewTool3')"><i class="fa fa-list font14"></i>
	                     <span class="tab-title"><spring:message code="menu.goip_goIPPort"/></span></a>
	                  </li>
	                  <!-- tab2-工具按钮组 -->
					  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="goipNewTool2"></li>
					  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="goipNewTool3"></li>
					  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="goipNewTool4"></li>
                 </ul>
                 <!-- tab页面组 -->
                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
						<div id="goipNewTab1" class="flag-tabs tab-pane in active summary-tab">
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
			                                <div class="databox-text darkgray"><spring:message code="label.goipDev.info1"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.goipDev.info2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
											<span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.goipDev.info3"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.goipDev.info4"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.goipDev.info5"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.goipDev.info6"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo7"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.goipDev.info7"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo8">&nbsp;</span>
			                                <div class="databox-text darkgray">&nbsp;</div>
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
                                         <div class="stat-text white"><spring:message code="label.goipDev.activityPorts"/></div>
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
				                        <span class="widget-caption"><spring:message code="label.goipDev.goiPoolDev" /></span>
				                    </div> 
				                    <div class="widget-body no-padding">
				                    	<div id="goIPDev" class="tab-pane" style="border-radius:0;"></div>
				                    </div>
			                    </div>
						 </div>
					</div>
							
						</div>
						<div id="goipNewTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
						<div id="goipNewTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
						<div id="goipNewTab4" class="flag-tabs tab-pane" style="border-radius:0;"></div>
                 </div>
              </div>  
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>  
  
  <!-- 详情层  goiPDev--->
	<div class="modal fade modal-primary" id="mydetailModal8"  role="dialog" aria-hidden="true">
	  <div class="modal-dialog" >
	    <div class="modal-content">
	      <!-- 窗口头 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">×</span>
	        </button>
	        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i><spring:message code="details"/></h4>
	      </div>
	      
	      <div class="modal-body bg-white no-padding">  
	        <div>
	          <table class="table table-bordered table-striped">  
				<tbody id="html_viewDetails8">
	
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
</body>

<script>
	g_var.view = ${view};
	try {
        var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
    } catch (e) {
        throw new Error("js视图数据,解析错误,请检测!~!");
    }
    var goipPermission1 = selectPermissionsInfo.permissions;
    if (!goipPermission1 || goipPermission1.length < 4) {
    	goipPermission1 = ['1', '1', '1', '1'];
    }
    
    /***************************** 设备表格 begin  ********************************************/
    
    var typeNameComdata = [["ACOM504Pro", "ACOM504Pro"], ["ACOM508Pro", "ACOM508Pro"], ["ACOM508SG-32", "ACOM508SG-32"], 
        ["ACOM508C800-32", "ACOM508C800-32"], ["ACOM508C800/1900-32", "ACOM508C800/1900-32"], ["ACOM508W-32", "ACOM508W-32"], 
        ["ACOM516G-16", "ACOM516G-16"], ["ACOM516G-64", "ACOM516G-64"], ["ACOM516G-128", "ACOM516G-128"], 
        ["ACOM532G-32", "ACOM532G-32"], ["ACOM532G-128", "ACOM532G-128"], ["ACOM516C800/1900-16", "ACOM516C800/1900-16"], 
        ["ACOM516C800/1900-64", "ACOM516C800/1900-64"], ["ACOM516C800-16", "ACOM516C800-16"], ["ACOM516C800-64", "ACOM516C800-64"], 
        ["ACOM516W-16", "ACOM516W-16"], ["ACOM516W-64", "ACOM516W-64"]];
    var goipNewDev_statue_valFormat = function(value){
    	var tipsData = $.i18n("db.tbGoIPDev.status.comData"),
			len = tipsData.length,
			tipVal = "";
		for(var i=0;i<len; i++){
			var tipData = tipsData[i];
			if(tipData[0] == value){ 
				tipVal = tipData[1];
				break;
			}
		} 
		return "<i class='img-fmt goip-dev-sta-"+value+"'></i><i class='f-tips'>"+ tipVal+"</i>";
    }
    var goipNewDev_sipOnline = function(value){
		var tips = matchComdata2Alias("db.tbGoIPDev.sipOnline.comData", value);
		return "<i class='img-fmt goip-dev-simpOnline-"+ value+"'></i><i class='f-tips'>" + tips+"</i>"
	}
	var goipNewDevItems = {resetTimes : "2", tableKey :"keyGoIPDevID", i18nPrefix:"db.tbGoIPDev.", 
			trs: [
	           {name: "keyGoIPDevID",show:false, width:"95", vali:{stringLength:64}, hideEdit:"E", advQry: ["LIKE"]},
	           {name: "devName", width:"128", vali:{stringLength:128}, advQry: ["LIKE"]},
	           {name: "idxGoIPDevGrpID", show:false, vali:{required:true},comType:"select", comData:g_var.view.goipDevGrpData},
	           {name: "typeName", width:"145", vali:{stringLength:64}, advQry: ["LIKE"], comType: "select",comData:typeNameComdata},
	           {name: "username", width:"95", vali:{stringLength:64}, advQry: ["LIKE"]},
	           {name: "password", show: false, vali:{stringLength:64}},
	           {name: "expire", vali:{stringLength:11,integer:true}},
	           {name: "lastUpdate", width:"125", hideEdit: "A", vali:{date:true}},
	           {name: "ipaddr", width:"95", vali:{stringLength:30}, hideEdit: "A"},
	           {name: "port", vali:{stringLength:11, integer:true}, hideEdit: "A", advQry: ["LIKE"]},
	           {name: "status", vali:{stringLength:11, integer:true}, hideEdit: "A", advQry: ["LIKE"], comType: "select"},
	           //,valFormat:"goipNewDev_statue_valFormat" 直接显示文件
	           {name:"sipOnline",vali:{integer:true,lessThan:10000,required:false},advQry:["LIKE"],comType:"select",valFormat:"goipNewDev_sipOnline"},
	           {name: "ports", vali:{stringLength:11}, hideEdit: "A"},
	           {name: "idxVSWID", width:"120", vali:{stringLength:32}, comType: "select", comData: g_var.view.vswSelData},
	           {name: "sipPort", vali:{stringLength:11, integer:true}, hideEdit: "A"},
	           {name: "sipRegExp", vali:{stringLength:11, integer:true}, hideEdit: "A"},
	           {name: "sipRegDate", width:"145", vali:{date:true}, hideEdit: "A"},
	           {name: "remarks", show: false, vali:{stringLength:128, required: false}},
	           {name: "mdfTm", vali:{stringLength:125, date:true}, hideEdit: "A", width:"125"},
	           {name: "mdfBy", show: false, vali:{stringLength:45}, hideEdit: "A", width:"125"},
	           {name: "crtTm", show: false, hideEdit: "A", vali:{date:true}, width:"125"},
	           {name: "crtBy", show: false, vali:{stringLength:45}, hideEdit: "A", width:"125"}]
	};
	var goipNewDevUrl = "/vpx/goIPDevNew/";
	InitTableMoudle("goipNewTab2", "goipNewTool2", goipNewDevUrl, goipNewDevItems, goipPermission1,  "1");
	/**************************************** goip设备  end **********************************************/
	
	/****************************************	goip端口 	begin	***************************************/
	var goipNewPort_status_valFormat = function(value){
		var tips = matchComdata2Alias("db.tbGoIPPort.status.comData", value);
		return "<i class='img-fmt goip-port-sta-"+ value+"'></i><i class='f-tips'>" + tips+"</i>"
	}
	var goipNewPortItems = {resetTimes: "3", tableKey: "keyID", i18nPrefix:"db.tbGoIPPort.", 
		trs:[
			{name:"keyID", hideEdit:"A", vali:{stringLength:11}, show:false},
			{name:"idxGoIPDevID", vali:{stringLength:64}, advQry:["LIKE"], comType:"select", comData:g_var.view.goipdevSelData, width:150},
			{name:"idxportNum", vali:{stringLength:11,integer:true}, width:80},
			{name:"status", vali:{stringLength:11, integer:true}, valFormat:"goipNewPort_status_valFormat"},
			{name:"idxViFiID", vali:{stringLength:30},hideEdit:"A",width:200, advQry: ["LIKE"], comType: "select", comData: g_var.view.vifideviceSelData},
			{name: "uuIccid", vali: {stringLength: 30}, hideEdit: "A", width:150},
			{name: "userAct", vali: {stringLength: 64}, hideEdit: "A", advQry: ["LIKE"], width:150},
			{name: "usage", vali: {stringLength: 11, integer:true}, width:115},
			{name: "duration", vali: {stringLength: 11, integer:true},valFormat:"valFormat_int2time"},
			//{name: "remarks", vali: {stringLength: 128}, show: false},
			{name: "mdfTm", vali:{date:true}, hideEdit: "A", width:125},
			{name: "mdfBy", hideEdit: "A", vali:{stringLength: 45}, show: false, width:"125"},
			{name: "crtTm", vali:{date:true}, hideEdit: "A", show: false, width:"125"},
			{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:"125"}
	]};
	var goipPermission2 = ['0', '1', '1', '1'];
	var goipNewPortUrl = "/vpx/goIPDevNew/port";
	InitTableMoudle("goipNewTab3", "goipNewTool3", goipNewPortUrl, goipNewPortItems, goipPermission2,  "1");
	
	
	/**************************************** 	goip端口	end	*******************************************/
	
	/**************************************** goip设备组  begin ********************************************/
	var goipGrpItems = {
			tableKey:"keyGoIPDevGrpID", i18nPrefix:"db.tbGoIPGrp.", trs:[
			{name:"keyGoIPDevGrpID", hideEdit:"E", width:120, advQry:["LIKE"], vali:{stringLength: 64}},
			{name:"groupName", width:120, advQry:["LIKE"], vali:{stringLength: 128}},
			{name:"idxAgentID", width:120, advQry:["LIKE"], vali:{stringLength: 64},comType:"select", comData:g_var.view.agentSelData},
			{name:"remarks", width:180, advQry:["LIKE"], vali:{stringLength: 128, required:false}},
			{name: "mdfTm", vali:{date:true}, hideEdit: "A", width:125},
			{name: "mdfBy", hideEdit: "A", vali:{stringLength: 45}, show: false, width:"125"},
			{name: "crtTm", vali:{date:true}, hideEdit: "A", show: false, width:"125"},
			{name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false, width:"125"}
	]}
	var goipGrpPermi = ['0', '0', '0', '0'];
	var goipGrpUrl = "/vpx/goIPDevNew/group";
	InitTableMoudle("goipNewTab4", "goipNewTool4", goipGrpUrl, goipGrpItems, goipGrpPermi,  "1");
	
	/**************************************** goip卡组  end ********************************************/
	

</script>

	<!-- 表图goIPDev -->
<script>
    function mydelayedInit8() {  
        // 计算table高度 
        var winHeight8 = document.documentElement.clientHeight; 
        var dataTableDivHeight8 = winHeight8 - 198 - $(".stati-info").height() - $(".page-breadcrumbs").height();
        var $dataTBody8 = $(".data-tbody8"), $dataTHead8 = $(".data-thead8"), $html = $($("html")[0]);
        $dataTBody8.css("height", dataTableDivHeight8); 
    }
  	 //状态数据查询
     var mydata8;
  	
  	 function showDatagoIPDev(graphViews){
  		
  		if(graphViews == null || graphViews == undefined){
  		 	graphViews = selectPermissionsInfo.graphView;
  		}
  		var viewHtml = "";
  		if(graphViews !=null && graphViews.length>0){
  			mydata8 = graphViews;
  			var selData = $.i18n("db.tbGoIPPort.status.comData");
  			viewHtml += "<div class=\"text-center\"><div class=\"goip-dev-shelf\"><div>";
  			for(var i=0; i<graphViews.length; i++){
  			    var graphView = graphViews[i];
  				if(graphView !=null){
	  				viewHtml += "<div class=\"margin-bottom-20 ng-scope\" ng-repeat=\"dev in ::view.graphView\">"
                    		 +"<div class=\"text-left padding-5\"><a class=\"fa-lg ng-binding\" href=\"javascript:\" onclick=\"viewDetails8('"+i+"')\">"+graphView["devName"]+"</a></div><div class=\"goip-dev\"><table><tbody>";
                    var portInfoArray = graphView["portInfoArray"];
  					if(portInfoArray !=null && portInfoArray.length>0){
  						for(var m =0; m < portInfoArray.length;m++){
	  						viewHtml += "<tr class=\"simp-row ng-scope\" ng-repeat=\"row in dev.portInfoArray\">";
  							var protInfo = portInfoArray[m];
  							for(var n =0 ;n < protInfo.length;n++){
  								 var pro = protInfo[n];
  								 if(pro != null){//空对象添加空td
  									viewHtml +="<td class=\"ng-scope\" ng-repeat=\"port in row\" onclick=\"openIPPortDtl('"+pro["keyID"]+"')\">"
	                                  +"<div class=\"goip-col-num ng-binding\">"+pro["portNum"]+"</div>";
	                                  var stateVal = pro["state"];
	                                  if(stateVal == null || stateVal == undefined || stateVal == 'undefined'){
	                                	  stateVal = 0;
	                                  }
	                                  viewHtml += "<div class=\"margin-left-10 f-p-tips img-fmt goip-port-sta-"+stateVal+"\">";
	                                  viewHtml += "<i class=\"f-tips ng-binding\" style=\"top:26px;\">";
	                                  viewHtml +=getValue(selData,stateVal);
	                                  viewHtml +="</i></div></td>";
  								 }else{
  									 viewHtml +="<td></td>"
  								 }
  							}
	  						viewHtml += "</tr>";
  						}
  					}
  					viewHtml += "</tbody></table></div></div>";
  				}
  	  	    } 
 				viewHtml +="</div></div></div>"; 
  		}
  		$("#goIPDev").html(viewHtml);
  	}
  	/********** 详情 ************/
	 //查看详情方法
    function viewDetails8(info){  
  	   var tbI18n8 = "db.tbGoIPDev.";
  	   var html_viewDetails = ""; 
  	   html_viewDetails += setViewTr($.i18n(tbI18n8+"keyGoIPDevID"),mydata8[info]["keyGoIPDevID"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"devName"),mydata8[info]["devName"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"idxGoIPDevGrpID"),mydata8[info]["idxGoIPDevGrpID"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"typeName"),mydata8[info]["typeName"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"username"),mydata8[info]["username"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"password"),mydata8[info]["password"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"expire"),mydata8[info]["expire"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"lastUpdate"),mydata8[info]["lastUpdate"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"ipaddr"),mydata8[info]["ipaddr"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"port"),mydata8[info]["port"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"status"),mydata8[info]["status"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"ports"),mydata8[info]["ports"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"idxVSWID"),mydata8[info]["idxVSWID"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"sipPort"),mydata8[info]["sipPort"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"sipRegExp"),mydata8[info]["sipRegExp"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"sipRegDate"),mydata8[info]["sipRegDate"]);
	   html_viewDetails += setViewTr($.i18n(tbI18n8+"remarks"),mydata8[info]["remarks"]);
	   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),mydata8[info]["mdfTm"]);
	   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),mydata8[info]["mdfBy"]);
	   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),mydata8[info]["crtTm"]);
	   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),mydata8[info]["crtBy"]);
 	   $("#html_viewDetails8").html(html_viewDetails);
 	   myopenModel8('mydetailModal8','detail'); 
    }
    function openIPPortDtl(keyid){
    	if(keyid != null && keyid != "undefined" && keyid != undefined){
	    	$.ajax({
	       	    url:window.PATH + "/vpx/goIPDevNew/goip-port-info.ajax",    //请求的url地址 
	       	 	data: { keyID: keyid },
	       	    type:"post",   //请求方式   
	       	    dataType: "json",
	       	    success:function(res){  
				  	   var tbI18n8 = "db.tbGoIPPort.";
				  	   var html_viewDetails = ""; 
				       html_viewDetails += setViewTr($.i18n(tbI18n8+"keyID"),keyid);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"idxGoIPDevID"),res.data.idxGoIPDevID);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"idxportNum"),res.data.idxportNum);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"status"),res.data.status);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"uuIccid"),res.data.usage);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"uuImsi"),res.data.duration);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"userAct"),res.data.duration);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"usage"),res.data.duration);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"duration"),res.data.duration);
					   html_viewDetails += setViewTr($.i18n(tbI18n8+"remarks"),res.data.remarks);
					   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),res.data.mdfTm);
					   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),res.data.mdfBy);
					   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),res.data.crtTm);
					   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),res.data.crtBy);
				 	   $("#html_viewDetails8").html(html_viewDetails);
				 	   myopenModel8('mydetailModal8','detail'); 
	       	        //请求成功时处理
	       	    }, 
	       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
	       	    	//alert(exception);
	           }
	       	}); 
    	}
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
    function getGoIPDevData(){
   	    var storage = window.localStorage; 
        $.ajax({
       	    url:window.PATH + "/vpx/goIPDevNew/queryDev.ajax",    //请求的url地址 
       	    type:"post",   //请求方式   
       	    dataType: "json",
       	    success:function(res){  
       	        //请求成功时处理
       	    	showDatagoIPDev(res.data);
       	    	if(location.href.contains("vsw/goIPDevNew")){//及时关闭
       	        	setTimeout(getGoIPDevData, 100000);
       	        }
       	    }, 
       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
       	    	//alert(exception);
           }
       	}); 
      }
	  showTools("false","goIPDev","status_tab","list");
	  setTimeout(function(){
		  getGoIPDevData();
   }, 300);
	    
	  
	    /*************************************************************   概要信息     *********************************************************/
	     //概要信息
	     function initOutlineInfo(){
	    	 
	    	//Utils.ajax
	     	//$.ajax({
	     	//});
	     	Utils_ajax({
	     		url: window.PATH + "/vpx/goIPDevNew/outlineInfo.ajax",
	     		data: {},
	     		type: "post",
	     		dataType: "json",
	     		success: function(data){
	     			var outlineInfo = data.data;
	     			if(outlineInfo){
	    	 	        $("#outLineInfo1").html(outlineInfo.outlineInfo1);
	    	 	        $("#outLineInfo2").html(outlineInfo.outlineInfo2);
	    	 	        $("#outLineInfo3").html(outlineInfo.outlineInfo3);
	    	 	        $("#outLineInfo4").html("-");//outlineInfo.outlineInfo4);
	    	 	        $("#outLineInfo5").html(outlineInfo.outlineInfo5);
	    	 	        $("#outLineInfo6").html(outlineInfo.outlineInfo6);
	    	 	        $("#outLineInfo7").html("-");//outlineInfo.outlineInfo7);
	    	 	        //$("#outLineInfo8").html("-");//outlineInfo.outlineInfo8);
	    	 	        $("#outLineInfo12").html((new Date()).format("hh:mm:ss"));
	    	     	}
	     		}
	     	});
	     }
	    initOutlineInfo();
	    //var tops = selectPermissionsInfo.recentOnlineDev;
	 	//var topsLen = tops.length;
	 	//for(var i=0; i<topsLen; i++){
	 	//	tops[i].keyWord = tops[i].devName;
	 	//	tops[i].keyValue = tops[i].idxGoIPDevGrpID;
	 	//}
	 	function getTopRankHtml_vifiDev(tops, tabId, toolsId, tabBtnId){
	     	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
	         for(var i = 0; i<tops.length; i++){
	         	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">"
	         		+ tops[i].keyWord+"</span></div>";
	         	topDivHtml += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
	         	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
	         	topDivHtml +="</span></div></div></div></li>";
	         }
	         //填充空数据
	         for ( var i = tops.length; i < 5; i++) {
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
	 	//$("#flow-top-list").html(getTopRankHtml_vifiDev(tops, "goipNewTab2", "goipNewTool2", "goipNewBtn2"));//设置“更多”按钮点击事件
	    
	 	//实时图
    var totalPoints = 100,	updateInterval = 10000,	
    	realTimeCount  = g_var.view.activityPortsNum;
   	var maxVal= realTimeCount ? realTimeCount*2 : 100;
   	var dataCharts = [];
   	dataCharts.push(realTimeCount);
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
                content:  "<span>%y</span> "+$.i18n("label.goipDev.activityPorts")
            }
        });

        function update() {
        	Utils_ajax({
                url: window.PATH + "/vpx/goIPDevNew/goipActivityPortsNum.ajax", //请求的url地址
                data: {}, //参数值
                type: "post", //请求方式 
                dataType: "json",
                success: function success(req) {
                	if(location.href.contains("/vpx/goIPDevNew")){//及时关闭
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
	                    setTimeout(update, updateInterval);
                	}
                },
                error: function error(xhr, type, exception) {//获取ajax的错误信息
                    //alert(exception);
                }
            });
          
        }
        update();//实时图
        
	 	
	 	
	    
   </script>