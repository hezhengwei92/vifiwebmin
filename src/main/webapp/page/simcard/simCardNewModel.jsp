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
		                  <li class="flag-tabs-btn active" id="simCardNewBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('state_tab','')"><i class="fa fa-th font14"></i><spring:message code="tabname.simCart.list1"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="simCardNewBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simCardNewTab2','simCardNewTool2')"><i class="fa fa-list font14"></i><spring:message code="label.common.cardGroup"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="simCardNewBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simCardNewTab3','simCardNewTool3')"><i class="fa fa-list font14"></i><spring:message code="label.common.cardList"/></a> 
		                  </li>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simCardNewTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simCardNewTool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
	                 <div id="state_tab" class="flag-tabs tab-pane in active" style="padding-left:20px;border-radius:0;">
                    <div class="row"  style="margin-top:20px"> 
                    <div class="col-lg-6 col-sm-6 col-xs-12">
                       <div class="widget radius-bordered">
                          <div class="widget-header">
                             <span class="widget-caption"><spring:message code="status.globalSIMNew.info1"/></span> 
                          </div> 
                          <div class="widget-body">
                             <p><spring:message code="status.globalSIMNew.info2"/>   <a href ="javaScript:showTools9('tools8','tab3','list2_tab','list','state_tab')" id="countGlobalSIMGrp"></a>  <spring:message code="status.globalSIMNew.info3"/>，<a href="javaScript:addclub()"><spring:message code="status.globalSIMNew.info4"/></a></p>
                             <p><spring:message code="status.globalSIMNew.info5"/>   <a href ="javaScript:showTools9('tools','tab2','list','list2_tab','state_tab')" id="countGlobalSIM"></a>  <spring:message code="status.globalSIMNew.info6"/>，<a href="javaScript:addcard()"><spring:message code="status.globalSIMNew.info7"/></a></p>
                             <p><spring:message code="status.globalSIMNew.info8"/>   <a id="countOverTimeCard" href="javaScript:void(0)"></a>  <spring:message code="status.globalSIMNew.info9"/>。</p> 
                          </div> 
                       </div> 
                     </div>
                   </div>
                   
                   <div class="row">  
                     <div class="col-lg-6 col-sm-6 col-xs-12" >
                       <div class="widget radius-bordered">
                          <div class="widget-header">
                             <span class="widget-caption"><spring:message code="status.globalSIMNew.info13"/></span> 
                          </div> 
                          <div class="widget-body" style="height:220px">
                            <div style="float:left;width:69%">
                             <span id="countStatus" data-sparkline="pie" data-height="175px" data-width="175px" data-bordercolor="#fafafa"
                                                  data-slicecolors='["#5DB2FF","#d73d32"]'>
                                                  
                             </span> 
                             </div>
                             <div style="float:left;width:30%">
                             <div style="margin-top:40px">
                                <h6 class="row-title before-orange"><spring:message code="status.globalSIMNew.info11"/>：<span id="countStatus0"></span></h6> 
                                <br/>
                                <h6 class="row-title "><spring:message code="status.globalSIMNew.info12"/>：<span id="countStatus1"></span></h6> 
                             </div> 
                             </div>
                          </div> 
                       </div> 
                     </div>
                   </div>  
				 </div> 
							<div id="simCardNewTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="simCardNewTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
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
	var simCardNewPermi = selectPermissionsInfo.permissions;
    if (!simCardNewPermi || simCardNewPermi.length < 4) {
    	selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
    }
	/*******************************	卡组	begin	**************************/
	var comTypeDiy_areaCode = function(tableId, item,dataRow){
		//var data = getLocalStorageModel(tableId, "queryData"),
    	//	dataRow = eval("data["+number+"]"),
    	//	columnVal = dataRow[name],
		var html = "";
		var name = item.name,
			comData = g_var.view.areaSelData,
			disabledHtml = "";
		
		
		//comData = comData?comData:$.i18n(i18nPrefix + name+ ".comData");
		var rowHtml = "",
			selectedAttr = "selected='selected'";
		for(var k=0, comLen = comData.length; k<comLen; k++){
			rowHtml += "<option label='"+ comData[k][1]+"' value='"+ comData[k][0]+"'";
			if(columnVal!=undefined && columnVal==comData[k][0]){
				rowHtml += selectedAttr;
				selectedAttr = "";
			}
			rowHtml +="></option>";
		}
		html += "<select id='edit-"+tableId+"-"+ name+"' name='"+ name+"' style='width:100%;'"+
			disabledHtml + " value='"+columnVal+"'><option " + selectedAttr +">"+ $.i18n(i18nPrefix + name+ ".help") + "</option>"+ rowHtml +"</select>";
		
		
		$("#simCardNewTab2-comContent-"+ name).html(html);
		$("#simCardNewTab2-comContent-"+ name).select2();
	}
	var simCardGroupNewItems = {resetTime: "3", tableKey: "keySCGroupID", i18nPrefix:"db.tbSCGroup.",trs:[			
		{name:"keySCGroupID", width:"125",hideEdit:"E"},		
		{name:"groupName", width:"120",advQry:["LIKE"]},
		{name:"idxSalerId", width:"150"}, 
		{name:"areaCode", width:"220",advQry:["LIKE"], comType:"diy",comTypeFunc:"comTypeDiy_areaCode"},
		//comType:"select", comData:g_var.view.areaSelData
		{name:"ispID", width:"120",advQry:["LIKE"],comType:"select",comData:g_var.view.ispSelData},
		{name:"cardType", width:"100",advQry:["LIKE"],comType:"select"},
		{name:"cardSize", width:"100",show:false,advQry:["LIKE"],comType:"select"},
		{name:"monthlyRental", width:"90" },
		{name:"dataUsage", width:"100",show:false},
		{name:"dataPrice", width:"150"},
		{name:"roamSupport", width:"80"},
		{name:"roamAreaCodes", width:"150",show:false},
		{name:"roamDataPrice", width:"100"},
		{name:"priority", width:"100",advQry:["LIKE"]},//,comType:"select" 增加data，1-9
		{name:"apn", width:"100"},
		{name:"dialnumber", width:"100"},
		{name:"dialuid", width:"100"},
		{name:"dialpwd", width:"100"},
		{name:"number", width:"100",},
		{name:"remarks", width:"125",show:false},
		{name:"mdfTm", width:"125",hideEdit:"A"},
		{name:"mdfBy", width:"125", show:false,hideEdit:"A"},
		{name:"crtTm", width:"125", show:false,hideEdit:"A"},
		{name:"crtBy", width:"125", show:false,hideEdit:"A"}
		]}
	var simCardGroupNewUrl = "/simcard/simCardNew/group";
	//var simCardGroupNewPermi = "";
	InitTableMoudle("simCardNewTab2", "simCardNewTool2", simCardGroupNewUrl, simCardGroupNewItems, simCardNewPermi,  "1");
	/*******************************	卡组	end		*************************/
	
	/*******************************	卡列表	begin	**************************/
	var simCardNewItems = {resetTime: "3", tableKey: "keySimCardID", i18nPrefix:"db.tbSimCard.",trs:[			
		{name:"keySimCardID", width:"180",advQry:["LIKE"],hideEdit:"E"},		
		{name:"idxSCGroupID", width:"120",advQry:["LIKE"], comType:"select",comData:g_var.view.scGroupSelData},
		{name:"imsi", width:"150",show:false}, 
		{name:"imei", width:"150",show:false,vali:{stringLength:[15,15]}},
		{name:"ssId", width:"150",show:false,vali:{digits:true}},
		{name:"status", width:"80"},
		{name:"number", width:"180",advQry:["LIKE"],vali:{required:false}},
		{name:"balance", width:"100",vali:{required:false,decimals:3},ratio:1000},
		{name:"restNetData", width:"125",vali:{required:false,decimals:3},ratio:1000},
		{name:"onlineTime", width:"125",hideEdit:"A"},
		{name:"totalSuccess", width:"100",hideEdit:"A"},
		{name:"totalFailed", width:"100",hideEdit:"A"},
		{name:"totalData", width:"100",hideEdit:"A",vali:{decimals:3},ratio:1000},
		{name:"lastIdleTime", width:"125",hideEdit:"A"},
		{name:"remarks", width:"125",show:false,vali:{required:false}},
		{name:"mdfTm", width:"125",hideEdit:"A"},
		{name:"mdfBy", width:"125", show:false,hideEdit:"A"},
		{name:"crtTm", width:"125", show:false,hideEdit:"A"},
		{name:"crtBy", width:"125", show:false,hideEdit:"A"}
	]}
	var simCardNewUrl = "/simcard/simCardNew/";
	InitTableMoudle("simCardNewTab3", "simCardNewTool3", simCardNewUrl, simCardNewItems, simCardNewPermi,  "1");
	
	/*******************************	卡列表	end		*************************/
	
	</script>
	<script>
		/********************** 信息页	************************/
	</script>
</body>

