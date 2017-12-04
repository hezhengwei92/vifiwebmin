<body>
<div class="row">
    <div class="col-xs-12 col-md-12">
        <div class="widget no-margin-bottom">
            <div class="widget-body no-padding">
                <div id="searchable_wrapper">

                    <div class="tabbable">
                        <ul class="nav nav-tabs">
                            <!-- tab标签页组 
                            <li class="active" id="tab1">
                                <a data-toggle="tab" href="javaScript:void(0)" onclick="smsNewShowTools('hidden','state_tab','smsGatewayList','smsTemplateList','smsList','smsCountDailyList')"><i class="fa fa-th font14"></i><spring:message code="status.cdrNew.info1"/></a>
                            </li>
                            <li class="tab-red" id="tab2">
                                <a data-toggle="tab" href="javaScript:void(0)" onclick="smsNewShowTools('show','smsGatewayList','state_tab','smsTemplateList','smsList','smsCountDailyList')"><i class="fa fa-list font14"></i><spring:message code="db.tbSMSGateway.tbName"/></a>
                            </li>
                            <li class="tab-red" id="tab3">
                                <a data-toggle="tab" href="javaScript:void(0)" onclick="smsNewShowTools('show','smsTemplateList','state_tab','smsGatewayList','smsList','smsCountDailyList')"><i class="fa fa-list font14"></i><spring:message code="db.tbSMSTemplate.tbName"/></a>
                            </li>
                            <li class="tab-red" id="tab4">
                                <a data-toggle="tab" href="javaScript:void(0)" onclick="smsNewShowTools('show','smsList','state_tab','smsGatewayList','smsTemplateList','smsCountDailyList')"><i class="fa fa-list font14"></i><spring:message code="db.tbSMS.tbName"/></a>
                            </li>
                            <li class="tab-red" id="tab5">
                                <a data-toggle="tab" href="javaScript:void(0)" onclick="smsNewShowTools('show','smsCountDailyList','state_tab','smsGatewayList','smsTemplateList','smsList')"><i class="fa fa-list font14"></i><spring:message code="db.tbSMSCountDaily.tbName"/></a>
                            </li>-->
                            <!-- 标签按钮 -->
                            <li class="flag-tabs-btn active" id="tab1">
		                    	<a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('state_tab','')"><i class="fa fa-th font14"></i>
		                    	<span class="tab-title"><spring:message code="status.cdrNew.info1"/></span></a> 
		                  	</li>
		                  	<li class="flag-tabs-btn tab-blue" id="tab2"> 
		                    	<a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('smsNewTab2','smsNewTool2')"><i class="fa fa-list font14"></i>
		                    	<span class="tab-title"><spring:message code="db.tbSMS.tbName"/></span></a> 
		                  	</li>
		                  	<li class="flag-tabs-btn tab-blue" id="tab3"> 
		                    	<a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('smsNewTab3','smsNewTool3')"><i class="fa fa-list font14"></i>
		                    	<span class="tab-title"><spring:message code="menu.sysconfig_sMSTemplate"/></span></a> 
		                  	</li>

							<!-- tab2-工具按钮组——短信记录 -->
				  			<li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="smsNewTool2"></li>  
				  			<li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="smsNewTool3"></li> 
                            <!-- 工具按钮组 -->
                            <li class="head-tools-r navbar-right" style="display:none;"  id="tools">
                                <!-- 详情 -->
                                <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail" onclick="btnViewDetails()">
                                    <i class="fa fa-list-alt"></i>
                                </div>

                                <!-- 设置按钮，设置显示列 -->
                                <div class="viewcfg-dropdown">
                                    <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                                    <ul class="dropdown-menu dropdown-blue" >
                                        <li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
                                            <div class="pull-left">
                                                <label style="margin: 0 0 0 16px;">
                                                    <input type="checkbox" id="checkAllTrs" onchange="checkAllTrs()">
                                                    <span class="text"></span>
                                                </label>
                                                <spring:message code="check_all"/><!-- 全选 -->
                                            </div>
                                            <button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="myResetTrs()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button><!-- 重置 -->
                                        </li>
                                        <div id="selectItems"></div>
                                    </ul>
                                </div>
                                <!-- 搜索按钮 -->
                                <div id="adv-search" class="btn warning padding-right-5" style="font-size: 14px;padding: 4px 12px;" aria-expanded="false">
                                    <i class="fa fa-search-plus"></i><i class="fa fa-search-minus"></i>
                                </div>
                            </li>

                            <!-- 工具按钮组 -->
                            <li class="head-tools-r navbar-right" style="display:none;" id="tools8">

                                <!-- 设置按钮，设置显示列 -->
                                <div class="viewcfg-dropdown">
                                    <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                                    <ul class="dropdown-menu dropdown-blue" >
                                        <li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
                                            <div class="pull-left">
                                                <label style="margin: 0 0 0 16px;">
                                                    <input type="checkbox" id="checkAllTrs8" onchange="checkAllTrs8()">
                                                    <span class="text"></span>
                                                </label>
                                                <spring:message code="check_all"/><!-- 全选 -->
                                            </div>
                                            <button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="myResetTrs8()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button><!-- 重置 -->
                                        </li>
                                        <div id="selectItems8"></div>
                                    </ul>
                                </div>
                                <!-- 搜索按钮 -->
                                <div id="adv-search8" class="btn warning padding-right-5" style="font-size: 14px;padding: 4px 12px;" aria-expanded="false">
                                    <i class="fa fa-search-plus" id="searchICON1"></i><i class="fa fa-search-minus" style="display:none" id="searchICON2"></i>
                                </div>
                            </li>

                            <!-- 工具按钮组 tools9 -->
                            <li class="head-tools-r navbar-right" style="display:none;" id="tools9">

                                <!-- 设置按钮，设置显示列 -->
                                <div class="viewcfg-dropdown">
                                    <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                                    <ul class="dropdown-menu dropdown-blue" >
                                        <li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
                                            <div class="pull-left">
                                                <label style="margin: 0 0 0 16px;">
                                                    <input type="checkbox" id="checkAllTrs9" onchange="checkAllTrs9()">
                                                    <span class="text"></span>
                                                </label>
                                                <spring:message code="check_all"/><!-- 全选 -->
                                            </div>
                                            <button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="myResetTrs9()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button><!-- 重置 -->
                                        </li>
                                        <div id="selectItems9"></div>
                                    </ul>
                                </div>
                                <!-- 搜索按钮 -->
                                <div id="adv-search9" class="btn warning padding-right-5" style="font-size: 14px;padding: 4px 12px;" aria-expanded="false">
                                    <i class="fa fa-search-plus" id="searchICON1"></i><i class="fa fa-search-minus" style="display:none" id="searchICON2"></i>
                                </div>
                            </li>
                        </ul>

                        <!-- tab1标签页 -->
                        <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                            <div id="state_tab" class="flag-tabs tab-pane  in active summary-tab">
                                <%-- 导入这个页面 与当前页面融合成一个页面 --%>
                                <%@include file="smsNew_tab1_status.jsp"%>
                            </div>
                            <!-- tab标签2——短信记录 -->
							<div id="smsNewTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="smsNewTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
                            <div id="smsGatewayList" class="flag-tabs tab-pane" style="border-radius:0;">
                                <%@include file="smsNew_tab2_gatewayList.jsp"%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
	//一些概要信息
	g_var.view = ${view};
    var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
	var permi = selectPermissionsInfo.permissions;
    var smsGatewayInfo = selectPermissionsInfo.smsGatewayInfo;

    $("#smsGatewayCount").html( smsGatewayInfo.smsGatewaySize );  //短信网关总数
    $("#smsGatewayNormarlCount").html( smsGatewayInfo.normalSize );
    $("#emaySMSCount").html( selectPermissionsInfo.emaySMSCount );

    var total = smsGatewayInfo.totalSucc + smsGatewayInfo.totalFail;
    var successPercent = "--";
    var failPercent = "--";
    if ( total != 0 ) {
        successPercent = ( smsGatewayInfo.totalSucc * 100 / total ) + "%";
        failPercent = ( smsGatewayInfo.totalFail * 100 / total ) + "%";
    }
    $("#sendSuccessPercent").html( smsGatewayInfo.totalSucc + " ("+ successPercent +")");
    $("#sendFailPercent").html( smsGatewayInfo.totalFail + " ("+ failPercent +")");

    var smsCountInfo = selectPermissionsInfo.smsCountInfo;

    $("#smsTotal").html( smsCountInfo.smsTotal );
    $("#smsTimeusedAvg").html( smsCountInfo.smsTimeusedAvg );
    $("#smsCountDaily").html( smsCountInfo.smsCountDaily );
    $("#smsCountMonthly").html( smsCountInfo.smsCountMonthly );
    
    
    /*********************** 短信记录页面 ***********************/
    //数据格式转换：状态值
    var getStateIcon = function(value){
    	var tipsData = $.i18n("db.tbSMS.state.comData");//0:外呼；1：入呼；2：双方向
    	var tips = "";
    	if(tipsData[0][0] == value){ 
    		tips = tipsData[0][1];
		}else if(tipsData[1][0] == value){ 
			tips = tipsData[1][1];
		}else if(tipsData[2][0] == value){ 
			tips = tipsData[2][1];
		}else if(tipsData[3][0] == value){
			tips = tipsData[3][1];
		}else{
			return undefined;
		}
    	return "<i class='img-fmt cdr-sms-sta-"+value+"'></i><i class='f-tips'>"+ tips+"</i>";
    }
    
    var tabTwoItems = {resetTimes : "3",  tableKey : "keySMSId", i18nPrefix:"db.tbSMS.",
    		trs: [
			{name: "keySMSId", width:"90", hideEdit: "A", vali: {stringLength: 11}},
			{name: "idxPhoneNumber", width:"150", vali: {stringLength: 20}, advQry: ["LIKE"]},
			{name: "message", width:"650", vali: {stringLength: 256}, advQry: ["LIKE"]},
			{name: "state", width:"150", vali: {stringLength: 1}, advQry: ["LIKE"],comType:"select", valFormat:"getStateIcon"},
			{name: "idxSMSGWID", width:"150", vali: {stringLength: 15}, advQry: ["LIKE"]},
			//{name: "messageId", show: false, vali: {stringLength: 45}, width:"150"},
			//{name: "responseCode", show: false, vali: {stringLength: 10}, width:"150"},
			//{name: "responseMessage", show: false, vali: {stringLength: 45}, width:"150"},
			//{name: "repeatNum", show: false, vali: {stringLength: 2}, width:"150"},
			//{name: "maxRepeatNum", show: false, vali: {stringLength: 2}, width:"150"},
			//{name: "pri", show: false, vali: {stringLength: 1}, width:"150"},
			//{name: "idxExternalID", show: false, vali: {stringLength: 32}, width:"150"},
			//{name: "exValue1", show: false, vali: {stringLength: 64}, width:"150"},
			//{name: "exValue2", show: false, vali: {stringLength: 64}, width:"150"},
			//{name: "exValue3", show: false, vali: {stringLength: 64}, width:"150"},
			{name: "createdBy", show: false, width:"150", vali: {stringLength: 45}, hideEdit: "A"},
			{name: "createdTime", show: false, width:"150", hideEdit: "A"},
			{name: "sendTime", show: false, width:"140"},
			{name: "timeused", show: false, vali: {stringLength: 11}, width:"150"}]
		};
    var tabTwoUrl = "/user/smsNew/";
    var smsNewTabPermi = ["0","1","1","1"];
    InitTableMoudle("smsNewTab2", "smsNewTool2", tabTwoUrl, tabTwoItems, smsNewTabPermi, "1");
    
    /**************************** 短信模板 *******************************************/
    
    var tabSmsTemplateItems = {
    		resetTimes:"2", tableKey:"keySmsTemplateId",i18nPrefix:"db.tbSMSTemplate.",
    		trs:[
    		    {name: "keySmsTemplateId",  hideEdit: "E", vali: {stringLength: 11,numeric: true}, advQry:['LIKE'],width:100},
   	            {name: "name", vali: {stringLength: 15},advQry:['LIKE'],width:150},
   	            {name: "lang", vali: {stringLength: 32},advQry:['LIKE'],comType:"select",width:90},
   	            {name: "msgTmpl", vali: {stringLength: 1024},advQry:['LIKE'],width:700},
   	            {name: "mdfTm", hideEdit: "A",width:125},
   	            {name: "mdfBy", hideEdit: "A", vali: {stringLength: 45}, width:105},
   	            {name: "crtTm", hideEdit: "A", show: false},
   	            {name: "crtBy", hideEdit: "A", vali: {stringLength: 45}, show: false}]
    };
    var smsNewTab3Url = "/user/smsNew/smsTemp";
    InitTableMoudle("smsNewTab3", "smsNewTool3", smsNewTab3Url, tabSmsTemplateItems, permi, "1");

</script>