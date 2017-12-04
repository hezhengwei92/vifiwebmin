<style>
	.vifi-tab-td{
		padding: 10px 0 10px 10px;
		vertical-align:middle;
	}
	.vifi-font24{
		font-size:24px;
	}
	.rank-list-div{
		height:23.3px;line-height:23.3px;font-size:13px;
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
                  <li class="flag-tabs-btn active" id="tab1">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('main_tab','')"><i class="fa fa-th font14"></i><spring:message code="label.common.outlineInfo"/></a> 
                  </li>
                  <li class="flag-tabs-btn tab-blue" id="tab2"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('rateNewTab2','rateNewTool2')"><i class="fa fa-list font14"></i><spring:message code="menu.rate_rate"/></a> 
                  </li>  
                  <li class="flag-tabs-btn tab-blue" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('rateNewTab3','rateNewTool3')"><i class="fa fa-list font14"></i><spring:message code="menu.rate_data-rate"/></a>
                  </li> 
                           
                  <!-- tab2-工具按钮组——通话费率 -->
				  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="rateNewTool2"></li>
				  				  				  
				  <!--tab3- 工具按钮组——流量费率-->
				  <li class="head-tools-r navbar-right flag-tools" style="display:none;" id="rateNewTool3"></li>
                </ul>            
                
                <!-- tab页面组 -->
                <div class="tab-content no-padding tabs-flat " style="border-radius:0;"> 
                             			
				<!-- tab标签1 --> 
				<div id="main_tab" class="flag-tabs tab-pane in active summary-tab"> 	  	
				  	<div class="row ng-scope">	
					  	<div class="col-lg-9 col-sm-12 col-xs-12">
			                 <div class="row"  style="margin-top:20px"> 
			                  <div class="col=lg-12 col-md-12 col-sm-9 col-xs-9">
			                     <div class="widget radius-bordered">
			                        <div class="widget-header">
			                           <span class="widget-caption"><spring:message code="status.cdrNew.info1"/></span> 
			                        </div> 
			                        <div class="widget-body" style="padding:0 0 0 0">
			                        	 <table style="width: 100%;border: 0;" border="1">
			                        	 	<tr style="height: 30%">
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo1"></span>
			                                            <div class="databox-text darkgray"><spring:message code="tabname.globalSIMNew.list1"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info22"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>
			                                            <div class="databox-text darkgray"> <spring:message code="status.globalSIMNew.info14"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>
			                                            <div class="databox-text darkgray"> <spring:message code="status.globalSIMNew.info15"/></div>
	 		                        	 		</td>
			                        	 	</tr>
			                        	 	<tr style="height: 30%">
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info16"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>
			                                            <div class="databox-text darkgray"> <spring:message code="status.globalSIMNew.info17"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px"  id="outLineInfo7"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info18"/><span id="todayInfo6_suff"></span> </div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo8"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info19"/></div>
	 		                        	 		</td>
			                        	 	</tr>
			                        	 	<tr style="height: 30%">
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo9"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info20"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo10"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info21"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px"></span>
			                                            <div class="databox-text darkgray"><span id="monthInfo6_suff"> </span></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px"></span>
			                                            <div class="databox-text darkgray"></div>
	 		                        	 		</td>
			                        	 	</tr>
			                        	 </table>
			                        </div>        
			                     </div> 
			                   </div>
			                 </div>
			                 <div class="row">
			                 	<div class="col=lg-12 col-md-12 col-sm-9 col-xs-9">
			                 		<div class="widget">
			                 			<div class="widget-header">
			                 				<div class="widget-caption">
			                 					<spring:message code="statue.uuwifi.recentCharge"></spring:message>
			                 				</div>
			                 			</div>
			                 			<div class=" widget-body" style="padding-top:0px;">
			                 				<div id="recent-charge-record"></div>
								 			<div style="padding-top:7px;height:24px;width:100%;text-align:right;">
								 				<button class="btn btn-palegreen btn-sm pull-right" onclick="">
								 				<spring:message code="statue.uuwifi.more"/></button></div>
										</div>
			                 		</div>				                 	
								</div>
			                 </div>            
	                    </div>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="padding-top: 20px;">
						        <div class="widget "> 
						        	<div class="widget-header">
				                        <span class="widget-caption"> <spring:message code="status.cdrNew.info22_1" /></span>
				                    </div> 
				                    <div class="widget-body no-padding">
				                    	<div id="flow-top-list"></div>
				                    </div>
			                    </div>
						</div>
	                </div>
	                
	                <div class="row" >
	                	<div class="col-lg-12 col-sm-8 col-xs-12">
	                		<div class="widget">
	                 			<div class="widget-header">
	                 				<div class="widget-caption"><spring:message code="statue.uuwifi.trafficStatistics1"></spring:message></div>
	                 			</div>
	                 			<div class=" widget-body"><div id="flow-statistics-charts" class="chart chart-lg"></div></div>
			               </div>
	                	</div>
	                </div>
				  </div>

				<!-- tab标签2——  -->
				<div id="rateNewTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
				<!-- tab标签3—— -->
				<div id="rateNewTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
				 				  
                </div>
              </div>  
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>  

<script>
	/****************** 数据设置  **********************************/
	
	//访问路径
    //var visit_url = "/rate/rateNew";
    //国际化开头
    //var tbI18n = "db.tbGlobalSIM.";
    //表的主键
    //var tablekey = "keyGlobalSIMID";
    //获取从后台传过来的参数值
    g_var.view = ${view};
    try {
        var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
    } catch (e) {
        throw new Error("js视图数据,解析错误,请检测!~!");
    }
    var permi = selectPermissionsInfo.permissions;
    if (!permi || permi.length < 4) {
    	selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
    	permi = ['1', '1', '1', '1'];
    }
    
    /********************  tab1信息页——统计数据     ********************************************/
    //概要信息
	function initTab1CardInfo(){
		$.ajax({
			url:window.PATH + "/uuwifi/globalSIMNew/simStatisticInfo.ajax",
			dataType:"json",
			async:true,
			data:{},
			type:"POST",
			success:function(res){
				var data = res.data;
		        $("#outLineInfo1").html(data[0].countGlobalSIMGrp);//卡组
		        $("#outLineInfo2").html(data[0].countGlobalSIM);//卡数量
		        $("#outLineInfo3").html(data[0].countStatus0);//有效设备
		        $("#outLineInfo4").html(data[0].arrearageCard);//欠费
		        $("#outLineInfo5").html(data[0].countStatus1);//待充值
		        $("#outLineInfo6").html("-");//本月使用
		        $("#outLineInfo7").html("-");//充值金额
		        $("#outLineInfo8").html("-");//日均使用
		        $("#outLineInfo9").html(data[0].chinaAreaCard);//中国卡
		        $("#outLineInfo10").html(data[0].internationalCard);//国际卡
			},
			error:function(){
			}
		});
	}
	//表格
	function initRecentChargeRecordTable(){
		$.ajax({
			url:window.PATH +"/uuwifi/globalSIMNew/recentCharge.ajax",
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
				$table = $("#recent-charge-record");
				$table.find("table").attr("style","background-color:#FBFBFB;");
				$table.find("td").attr("style","border-top:none !important;border-bottom: 1px solid #ddd !important;");
				$table.html(tableHtml);
			},
			error:function(){
			}
		});
	}
	//前30天流量统计样式
	var initFlowStatisticsCharts = function () {
	var resultData1 = [];
	//[[3, 10], [4, 13], [5, 12], [6, 16], [7, 19], [8, 19], [9, 24], [10, 19], [11, 18], [12, 21], [13, 17],[14, 14], [15, 12], [16, 14], [17, 15]]
	var data2 = [{
        color: themeprimary,
        label: "traffic:",
        data: resultData1,
        bars: {
            order: 1,
            show: true,
            borderWidth: 0,
            barWidth: 0.4,
            lineWidth: .5,
            fillColor: {
                colors: [{
                    opacity: 0.4
                }, {
                    opacity: 1
                }]
            }
        }
    }];
    var options = {
        legend: {
            show: false
        },
        xaxis: {
            tickDecimals: 0,
            color: '#f3f3f3'
        },
        yaxis: {
            min: 0,
            color: '#f3f3f3',
            tickFormatter: function (val, axis) {
                return "";
            },
        },
        grid: {
            hoverable: true,
            clickable: false,
            borderWidth: 0,
            aboveData: false,
            color: '#fbfbfb'

        },
        tooltip: true,
        tooltipOpts: {
            defaultTheme: false,
            content: " <b>%x May</b> , <b>%s</b> : <span>%y</span>",
        }
    };
    var placeholder = $("#flow-statistics-charts");
    var plot = $.plot(placeholder, data2, options);
	};
	//本月流量top10
    var tops = selectPermissionsInfo.testTop10;//请求数据
	var topsLen = tops.length;
	for(var i=0; i<topsLen; i++){
		tops[i].keyWord = tops[i].idxUserId;
		tops[i].keyValue = tops[i].cntDataSum;
	}
    $("#flow-top-list").html(getTopRankHtml(tops, "rank-list-div", "rateNewTab3", "rateNewTool3", "tab3"));
    initFlowStatisticsCharts();
	initTab1CardInfo();
	initRecentChargeRecordTable();
    
    
    /********************  rateNewTab2/rateNewTool2  话费费率表格 ********************/
    //地区编码转换
    var valFormat_AreaCode = function(value){
		var data = selectPermissionsInfo.areaSelData;//view中包含的数据
		return matchServiceData2Alias(data, value);
	}
    var tabTwoItems = {resetTimes : "3", tableKey : "keyRateID", i18nPrefix:"db.tbRate.",
		trs: [ 
				{name: "keyRateID", show: false, width:"80", disabled: "A"},
				{name: "rateMode", show: true, width:"80", advQry: ["LIKE"], comType: "select", valFormat:"rateModeComdata"},
				{name: "direction", show: true, width:"80", advQry: ["LIKE"], vali:{stringLength:[0,11]}, comType: "select", valFormat:"directionIcon"},
				{name: "idxCallPrefix", show: true, width:"80", advQry: ["LIKE"], vali:{stringLength:[0,16]}},
				{name: "countryCode", show: true, width:"240", advQry: ["LIKE"], vali:{stringLength:[0,16]}, comType: "select", 
					comData: g_var.view.areaSelData, valFormat:"valFormat_AreaCode"},
				//{name: "country", show: false, width:"120", vali:{stringLength:[0,45]}},
				{name: "priceCallOnline", show: true, width:"140", vali:{lessThan:1000,decimals:3}, ratio:1000},
				{name: "priceCallOffline", show: true, width:"140", vali:{between:[0,1000],decimals:3}, ratio:1000},
				{name: "priceCallbackOff", show: true, width:"140", vali:{between:[0,1000],decimals:3}, ratio:1000}, 
				{name: "priceCallGoIP", show: true, width:"140", vali:{between:[0,1000],decimals:3}, ratio:1000},
				{name: "priceCallbackGoIP", show:true, width:"140", vali:{between:[0,1000],decimals:3}, ratio:1000},
				{name: "priceSMS", show: true, width:"120", vali:{between:[0,1000],decimals:3}, ratio:1000},
				//{name: "priceNET", show: true, width:"120", advQry: ["LIKE"], vali:{between:[0,1000]}, hideEdit: "A", ratio:1000},
				//{name: "dayDataPrice", show: true, width:"120", vali:{between:[0,1000]}, hideEdit: "A", ratio:1000},  
				//{name: "dayDataLimit", show: true, width:"120", vali:{between:[0,1000]}, hideEdit: "A", ratio:1000}, 
				{name: "remarks", show:false, width:"140", vali:{stringLength:[0,128],required:false}, tip:true },
				{name: "mdfTm", show: true, width:"140", hideEdit: "A"},
				{name: "mdfBy", show: false, width:"140", hideEdit: "A"},  
				{name: "crtTm", show: false, width:"140", hideEdit: "A"},
				{name: "crtBy", show: false, width:"140", hideEdit: "A"}]
    };
	var tabTwoUrl = "/rate/rateNew/";
	InitTableMoudle("rateNewTab2", "rateNewTool2", tabTwoUrl, tabTwoItems, permi, "1");


    /********************  rateNewTab3/rateNewTool3  流量费率表格 ********************/
    //数据格式转换：呼叫方向
    var directionIcon = function(value){
    	var tipsData = $.i18n("db.tbRate.direction.comData");//0:外呼；1：入呼；2：双方向
    	var tips = "";
    	if(tipsData[0][0] == value){ 
    		tips = tipsData[0][1];
		}else if(tipsData[1][0] == value){ 
			tips = tipsData[1][1];
		}else if(tipsData[2][0] == value){ 
			tips = tipsData[2][1];
		} 
    	return "<i class='img-fmt rate-rate-dir-"+value+"'></i><i class='f-tips'>"+ tips+"</i>";
    }
    var rateModeComdata = function(value){
    	var tipsData = $.i18n("db.tbRate.rateMode.comData"),//0:外呼；1：入呼；2：双方向
    		len = tipsData.length,
    		tipVal = "";
    	for(var i=0;i<len; i++){
    		var tipData = tipsData[i];
    		if(tipData[0] == value){ 
    			tipVal = tipData[1];
    			break;
    		}
    	} 
    	return tipVal;
    }
    
    var tabThreeItems = {resetTimes : "3",  tableKey : "keyRateID", i18nPrefix:"db.tbRate.",
    		trs: [
  				{name: "keyRateID", show: false, width:"80", disabled: "A"},
				{name: "rateMode", show: true, width:"80", advQry: ["LIKE"], comType: "select", valFormat:"rateModeComdata"},
				{name: "direction", show: true, width:"80", advQry: ["LIKE"], vali:{stringLength:[0,11]}, comType: "select", valFormat:"directionIcon"},
				{name: "idxCallPrefix", show: true, width:"80", advQry: ["LIKE"], vali:{stringLength:[0,16]}},
				{name: "countryCode", show: true, width:"240", advQry: ["LIKE"], vali:{stringLength:[0,16]}, comType: "select", 
					comData: g_var.view.areaSelData, valFormat:"valFormat_AreaCode"},
				//{name: "country", show: false, width:"120", vali:{stringLength:[0,45]}},
				//{name: "priceCallOnline", show: true, width:"140", vali:{between:[0,1000]}, ratio:1000},
				//{name: "priceCallOffline", show: true, width:"140", vali:{between:[0,1000]}, ratio:1000},
				//{name: "priceCallbackOff", show: true, width:"140", vali:{between:[0,1000]}, ratio:1000}, 
				//{name: "priceCallGoIP", show: true, width:"140", vali:{between:[0,1000]}, ratio:1000},
				//{name: "priceCallbackGoIP", show:true, width:"140", vali:{between:[0,1000]}, ratio:1000},
				//{name: "priceSMS", show: true, width:"120", vali:{between:[0,1000]}, ratio:1000},
				{name: "priceNET", show: true, width:"120", advQry: ["LIKE"], vali:{between:[0,1000]}, hideEdit: "A", ratio:1000},
				{name: "dayDataPrice", show: true, width:"120", vali:{between:[0,1000]}, hideEdit: "A", ratio:1000},  
				{name: "dayDataLimit", show: true, width:"120", vali:{between:[0,1000]}, hideEdit: "A", ratio:1000}, 
				{name: "remarks", show:false, width:"140", vali:{stringLength:[0,128],required:false}, tip:true},
				{name: "mdfTm", show: true, width:"140", hideEdit: "A"},
				{name: "mdfBy", show: false, width:"140", hideEdit: "A"},  
				{name: "crtTm", show: false, width:"140", hideEdit: "A"},
				{name: "crtBy", show: false, width:"140", hideEdit: "A"}]
    };
	var tabThreeUrl = "/rate/rateNew/";
	InitTableMoudle("rateNewTab3", "rateNewTool3", tabThreeUrl, tabThreeItems, permi,  "1");


</script>
