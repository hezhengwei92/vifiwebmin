

/**************************************************		table页面模板：固定版 ***********************************/
/********************    table参数示例  *******************/
var tableItems;
tableItems = {
	resetTime: "n", tableKey: "", i18nPrefix: "db.x.", trs: [
		{
			name: "",
			show: fasle,
			width: "100",
			hideEdit: "E/N/A",
			advQry: ["LIKE"],
			comType: "select",
			comData: 二维数组,
			valFormat: "FunctionName",
			ratio: 1000
		},
		......;
	]}
	var requestUrl = "/.../";//以斜杠结尾
	var permission = ['0','0','0','0'];
	InitTableMoudle("tableId", "tableToolId", requestUrl, tableItems, permission, "1");
	//TIPS:
		1.resetTime目前没有生效
		2.i18nPrefix以点号结束
		3.requestUrl主请求以斜杠结束，其他子页面请求在主请求后面加字符串。之所有这么做，是因为一个ctrl的请求前面部分是固定的，当页面有多个子页面时，可以通过"/a/b/"+"save.ajax","/a/b/dev"+"save.ajax"区分请求

	//其他拓展API
	1.表格的格式化
	var table_valFormat = function(){}	
	2.拓展详情界面
	var tableId_expandDetails = function(){}
				
/***********************	参数说明
	*tableKey	*{S}表格Key字段
	*i18nPrefix	*{S}国际化字段前缀，可配置：
				title：i18+name; help: title+".help"; comData:title+".comdata"
	*trs		*{L}表格列的详细配置
	*expandDetail	*{S}拓展详情界面的方法名
	*order		*{s} 默认排序    order:'[["keyID",2]]'   0？1升序2降序


	//X类型：I:数字,S:字符串,F:浮点小数类型; D:时间;	B:boolean, O:对象, L数组

	*字段名		*{X类型}含义						*default
	*name		*{S}数据库字段名，key键						
	*width		*{I}表格列宽度，单位PX				*120px
	*show		*{B}列表默认是否显示该列			*true
	*required	*{B}该字段是否必填					*true
	*hideEdit	*{S}编辑和新增时是否隐藏，参数:N:新增时隐藏,E:编辑时隐藏,A:全部隐藏			*默认不隐藏
	*disabled	*{S}编辑和新增是否不可更改，参数同上
	*comType	*{S}组件类型，参数：
					1 select：选择框，与comData配合
	*comData	*{二维数组}用来和comType选择框搭配使用，		*默认是配置在国际化文件中的数据，i18nprefix+name+".comData"
	*advQry		*{未定，只有不为空}是否把该字段添加到搜索框
									参数:EQ:等于查询,LIKE:模糊查询,GTE:范围查询 
	*vali		*{O}表格验证，参数：
				*字段名			*对应validator字段		含义
				1 required:true/false			notEmpty		是否是必需字段
				2 emailAddress: true/false		emailAddress	邮箱格式
				3 uri							uri				链接格式
				3 date							date			日期格式
					dateFormat日期格式，默认："YYYY-MM-DD hh:mm:ss"
				4 stringLength					stringLength	字符串长度
					数组：[1,100]，最小长度为1，最大长度为100
					整数：100，表示最小0最大100
				5 between						between			数值的最大值，逻辑与stringLength一致
				6 greaterThan					greaterThan		数值必需大于该值
				7 lessThan						lessThan		数值必需小于该值
				8 numeric						numeric			数值类型
						numeric，between，greaterThan，lessThan都默认会验证numeric数值类型
				
				9 digits						digits			整数（0，正整数，负整数）
				10 integer						integer			自然数（0，正整数）
				11 creditCard					creditCard		信用卡格式
				12 decimals						自定义验证期	小数点后几位
	*valForamt	*{S}目前只支持function，传递的是方法名	
				//valFormat只用于格式化表格样式，comData既用于选择框，次之可格式化表格样式
				//优先用valFormat格式化表格显示，如果没有再用comData格式化表格显示
	*ratio		*{I}数值的倍率，显示除ratio，存储乘以ratio
	*tip		*{B}是否显示提示（特别是文本过长，显示不全时）
				
				
				
/*************************************


/****************************** 控件容器模板 *********************************************
 	 * NOTICE: 
 	 * 		1.TAB页面设置类属性： 用于切换tab页面
 	 * 			tab按钮ID:flag-tabs-btn 工具栏ID: flag-tools； tab页面ID：flag-tabs
		<div class="row" >
	    	<div class="col-lg-12 col-sm-8 col-xs-12">  //这里根据容器大小改变
	    		<div class="widget">
         			<div class="widget-header">
         				<div class="widget-caption">
         					title
         				</div>
         			</div>
         			<div class=" widget-body">
			 			body
					</div>
         		</div>
	    	</div>
	    </div>
 	/*********************************  多Tab页面基本模板 *************************************** 

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
		                  <li class="flag-tabs-btn active" id="【ModelName】Btn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('【ModelName】Tab1','')"><i class="fa fa-th font14"></i><spring:message code="label.common.outlineInfo"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="【ModelName】Btn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('【ModelName】Tab2','【ModelName】Tool2')"><i class="fa fa-list font14"></i><spring:message code="label.common.outlineInfo"/></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="【ModelName】Btn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('【ModelName】Tab3','【ModelName】Tool3')"><i class="fa fa-list font14"></i><spring:message code="label.common.outlineInfo"/></a> 
		                  </li>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="【ModelName】Tool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="【ModelName】Tool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="【ModelName】Tab1" class="flag-tabs tab-pane  in active summary-tab"></div>
							<div id="【ModelName】Tab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="【ModelName】Tab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>  
	  <script>
	  </script>
 </body>
 	 *****************************************************************************/
	
	
	
	
	
	
	/******************************************  含表格的静态页面：根据需求修改	begin @author gya  *********************************/
	
	
	/******************************************  含表格的静态页面：根据需求修改	end @author gya  *********************************/
	
	
	
	
	
	
	
	
	
	
	
	
    
    
    
     