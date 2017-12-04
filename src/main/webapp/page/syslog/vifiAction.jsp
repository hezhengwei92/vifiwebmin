<body> 
<style>
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


	   <div class="bs-example">
	    <div class="row">
	      <div class="col-xs-12 col-md-12">
	        <div class="widget no-margin-bottom">
	          <div class="widget-body no-padding">
	            <div id="searchable_wrapper">
		         <div class="tabbable">
	                <ul class="nav nav-tabs">
		                  <!-- tab标签组 -->
		                  <li class="flag-tabs-btn tab-blue active" id="vifiActionBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('vifiActionTab2','vifiActionTool2')"><i class="fa fa-list font14"></i><spring:message code="menu.syslog_vifiAction"/></a> 
		                  </li>
		                  <!-- tab2-工具按钮组hhhhhhhhhhhhhhhhhhhhhh-->
						  <li class="head-tools-r navbar-right flag-tools"  id="vifiActionTool2">

						  <div class="btn f-p-tips" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;"  id="vifiActionTab2-tools-analysis"
						  	 onclick="analysisModal()"><i class="fa fa-film"></i><div class="f-t-tips"><spring:message code="analysis"/></div>
						  </div>
						  <div class="btn f-p-tips" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;"  id="vifiActionTab3-tools-analysis" ng-click="exportRateCsv()">
							  <a>
								  <i class="fa fa-download"></i>
								  <div class="f-t-tips"><spring:message code="export"/></div>
							  </a>
						  </div>
						  </li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="vifiActionTool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="vifiActionTab2" class="flag-tabs tab-pane in active" style="border-radius:0;">
	<div class="collapse" id="vifiActionTab2-searchArea" style=""><div class="panel-body">
		<div class="row ng-scope">
			<div class="col-md-2 margin-bottom-5 ng-scope">
				<span class="ng-binding" style="margin: 6px 6px 0 20px; display: inline-block;">类型:</span>
				<div style="display: inline-block;"><div class="input-sm no-border no-padding ng-scope" style="min-width:154px;">
				<select id="search-vifiActionTab2-actionType" style="width: 100%;" placeholder="请选择类型" class="ng-pristine ng-untouched ng-valid">
				<option value="">请选择类型</option><option label="APP" value="1"></option>
				<option label="UUWIFI" value="2"  selected="selected"></option></select></div></div></div>
			<div class="col-md-2 margin-bottom-5 ng-scope no-padding">
				<span class="ng-binding"  style="margin: 6px 6px 0 0; display: inline-block;">设备ID:</span>
				<div  style="display: inline-block;"><div class="ng-scope">
				<input style="width:200px;" type="text" id="search-vifiActionTab2-idxViFiID" class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="请输入设备 ID">
				</div></div></div>
			<div class="col-md-2 margin-bottom-5 ng-scope">
				<span class="ng-binding"  style="margin: 6px 6px 0 20px; display: inline-block;">用户账号:</span>
				<div  style="display: inline-block;"><div class="ng-scope">
				<input type="text" id="search-vifiActionTab2-idxUserId" class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="请输入用户账号">
				</div></div></div>
			<div class="col-md-4 margin-bottom-5 ng-scope">
				<span class="ng-binding" style="margin: 6px 6px 0 20px;">请求时间:</span>
				<div style="display: inline-block;"><div class="ng-scope">
				<input type="text" id="search-vifiActionTab2-reqDate-GTE" class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="请输入开始时间" 
				onclick="laydate({istime: true, format: &quot;YYYY-MM-DD hh:mm:ss&quot;})"/>
				<span>-</span>
				<input type="text" id="search-vifiActionTab2-reqDate-LTE" class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="请输入结束时间" 
				onclick="laydate({istime: true, format: &quot;YYYY-MM-DD hh:mm:ss&quot;,defaultHms:'23:59:59'})"/>
			</div></div></div>
			<div class="col-md-2 text-right">
			<button class="btn btn-success" style="height:30px;margin-right:5px;" onclick="queryTableDataModel_vifiAction('vifiActionTab2')">
			<i class="fa fa-search"></i>搜索</button>
			<button class="btn btn-darkorange" style="height:30px;" onclick="resetSearchCondition_vifiAction()">
			<i class="fa fa-undo"></i>重置</button>
			</div>
		</div>
		</div></div>
		</div>
		<div id="vifiActionTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>  

	  <!-- 分析模态框ggggggggggggggggggggg -->
<div class="modal fade modal-primary" id="analysisModal_vifiAction"  aria-hidden="true">
  <div class="modal-dialog" style="width:740px;margin:50px auto;">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" onclick="closeAnalysisModal()"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title text-success" id="">
          	<span><i class=" fa fa-edit"></i>
          	<span id="analysisVifiId" style="font-size:13px;"></span><span style="font-size:13px;">/</span><span style="font-size:13px;" id="analysisDate"></span>
          	<input id="analysisModal_dateVal" type="hidden" value=""/>
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
	  var allPermissions = g_var.view.permissions;
	  if(!allPermissions){
		  allPermissions = ["0","1","1","1"];
	  }
	  /************************************** 活动记录 *******************************/
	  
	  var vifiAction_respCode_color = function(value){
		  if(value==0 || value==200){
			  return "<span style='color:green;'>"+ value +"</span>"
		  }else if(value){
			  return "<span style='color:red;'>"+ value +"</span>"
		  }else{
			  return "<span style='color:gray;'>"+ value +"</span>"
		  }
	  }
	  var vifiActionItems = {tableKey:"keyActionID", i18nPrefix:"db.vifiAction.",trs:[
	      {name:"keyActionID",disabled:"A"},
	      {name:"actionType",advQry:["LIKE"],comType:"select"},
	      {name:"idxViFiID",width:190,advQry:["LIKE"]},
	      //{name:"idxAppId"},
	      {name:"idxUserId",width:120,advQry:["LIKE"]},
	      {name:"reqAct"},
	      {name:"reqIP"},
	      {name:"respCode",valFormat:"vifiAction_respCode_color"},
	      {name:"respReason"},
	      {name:"sessionId",width:190,},
	      {name:"version"},
	      {name:"reqDate",width:140,advQry:["LIKE"],vali:{date:true,required:false,dateFormat:"YYYY-MM-DD"}},
	      {name:"handTime"}
	  ]}
	  var vifiActionPermi = ["0","1","1","1"];
	  var vifiActionUrl = "/syslog/vifiAction/";
	  InitTableMoudle("vifiActionTab2", "vifiActionTool2", vifiActionUrl, vifiActionItems, vifiActionPermi, "1", undefined,true);
	  
	  
	  function queryTableDataModel_vifiAction(){
	  	    var	pageSize = getLocalStorageModel("vifiActionTab2", "pageSize");
	  	    if(!pageSize){
	  	    	pageSize = "25";
	  	    }
	  	    var	page = "1";
	  	    var queryUrl = "/syslog/vifiAction/list.ajax",
	  	    	queryParams = getSearchParams("vifiActionTab2");
	  	  var loadInx = layer.load(2);//打开加载圈图标
	       $.ajax({
	      	    url:window.PATH + queryUrl +"?pageSize="+pageSize+"&page="+page,
	      	    data: queryParams,
	      	    type:"post",
	      	    dataType: "json",
	      	    success:function(req){
	      	    	console.log(req);
	      	    	var newResult = req.data, 
	      	    		data = newResult.contentList, 
	      	    		length = data.length;
	      	    	setLocalStorageModel("vifiActionTab2", "queryData", data);//存储结果数据
	      	    	showDataModel("vifiActionTab2");//创建表格
	      	    	paginationWidget(newResult, "vifiActionTab2", queryParams);//填充页脚
	      	    	hideToolBtn("vifiActionTab2");//初始化工具栏隐藏状态
	      	    	layer.close(loadInx);//关闭加载圈图标
	      	    }, 
	      	    error: function (xhr, type, exception) {
	      	    	layer.close(loadInx);//关闭加载圈图标
	          }
	      	}); 
	  	    //分析按钮可用
	  	    //$("#vifiActionTab2-tools-analysis").removeAttr("disabled").removeClass("gray_tableModal").addClass("blue");
	     }

	  function analysisModal(type){
		  //var uuwifiId = $("#search-vifiActionTab2-idxViFiID").val();
		 // if(!uuwifiId){
		//	  layer.msg.error($.i18n("db.vifiAction.idxViFiID.help"));
		//	  return
		 // }
		  var queryParams = getSearchParams3(type);
		  var loadInx = layer.load(2);//打开加载圈图标
     	$.ajax({
    	    url:window.PATH + "/syslog/vifiAction/queryAnalysisDate.json",
    	    data: queryParams,
    	    type:"post",
    	    dataType: "json",
    	    success:function(req){
    	    	console.log(req);
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
	  
	//重置搜索框
		function resetSearchCondition_vifiAction(tableId){
			var tableId = "vifiActionTab2";
			var columns = getLocalStorageModel(tableId, "tableParams").trs,
				len = columns.length;
			for(var i=0; i<len; i++){
				$("#search-"+tableId + "-"+ columns[i].name).val("");
				$("#search-"+tableId + "-"+ columns[i].name+"-GTE").val("");
				$("#search-"+tableId + "-"+ columns[i].name+"-LTE").val("");
			}
			queryTableDataModel(tableId, "1");
			//分析按钮不可用
	  	    $("#vifiActionTab2-tools-analysis").attr("disabled","disabled").removeClass("blue").addClass("gray_tableModal");
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
		  $("#analysisModal_vifiAction").modal("hide");
	  }
	  
	  function getSearchParams3(type){
		   var rowNmb = 0;
		   var checkedRows = $("input[name*=vifiActionTab2-rowItems]:checked");
		   if(checkedRows){
			   rowNmb = checkedRows[0].value.split("-|-"); 
			   rowNmb = rowNmb[1];
		   }
		  var queryDate = getLocalStorageModel("vifiActionTab2", "queryData");
		  var dateRow = eval("queryDate["+rowNmb+"]")
		  var uuwifiId = dateRow.idxViFiID;
		  /** type: undefined/0 查询当天或指定日期  1查询明天  -1查询前一天
		  	* $("#analysisModal_date").val();前一天后一天时参数；$("#search-vifiActionTab2-reqDate-GTE").val();搜索框参数
		  ***/
		  var dateParam = "";
		  if(type){
			  var dateStr = $("#analysisModal_dateVal").val();
			  var newDate = type>0?new Date(Date.parse(dateStr) + 24*60*60*1000):new Date(Date.parse(dateStr) - 24*60*60*1000);
			  dateParam = newDate.format("yyyy-MM-dd");
		  }else{
			  var reqDate = dateRow.reqDate;
			  //var reqDate = $("#search-vifiActionTab2-reqDate-GTE").val();
			  if(!reqDate){
				  dateParam = new Date().format("yyyy-MM-dd");
			  }else{
				  var newDate = new Date(Date.parse(reqDate));
				  dateParam = newDate.format("yyyy-MM-dd"); 
			  }
		  }
		  $("#analysisModal_dateVal").val(dateParam);
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
	  //vifiActionTool2,没有填充搜索区域，之后修改插件方式
	  //修改搜索按钮的onclick方法，添加搜索区域
	  /*************************************** 活动记录 **************************************************/
	  </script>

 </body>





 
 
 
 
 
 
 
 
 
 
 
 