

	/************************************************
	 解耦
	 1.国际化字段
	 	i18nPrefix + name: 列名称
	 	i18nPrefix + name +".help": 提示信息
	 	i18nPrefix + name +".comData": 一般为下拉框的选项数据，为数组
	 2.本地存储的keyword
	 3.由tableId衍生的各部位ID
	 4.请求url：path + list/delete/add...
	 	请求主体地址：requestUrl (window.path+ requestUrl)
	 	查询：requestUrl+/list.ajax; 删除：requestUrl+ /delete.ajax; 保存：requestUrl+ /
	 	NOTICE: 把固定的部分从“/x.ajax”改成“x.ajax”，这样可以在页面请求时拼接其他字符到x上面
	 		所以自定义请求部分需要带上“/”
	 
	 *****************
	 参数：
	 
	 注意点：
	 1.tableId不能重复，因为所有页面的信息存在一个localStorage
	 2.页面主体，id = datagrid-resize-proxy，调整列宽时显示的悬浮线条
	 
	 ****************************************************/



	/**
	 * @param tableId
	 * @param toolsAreaId
	 * @param requestUrl
	 * @param params
	 * @param permissions
	 * @param page
	 * @param isImportAndExport	是否需要导出导入功能
	 *
	 * InitTableMoudle("simPDevNewTab3", "simPDevNewTool3", simPPortNewUrl, simPPortNewItems, simPPortNewPermi,  "1");
	 * InitTableMoudle("vswExchangeSerTab4", "vswExchangeSerTool4", simBindUrl, tableItem_simBind, permi, "1");
	 */
	function InitTableMoudle(tableId, toolsAreaId, requestUrl, params, permissions, page,isImportAndExport,isAddSearchContent,analysisBtn,agentName){
		//格式化表格参数
		params = initTableItems(tableId, params);
		//本地存储
		initLocalStorage(tableId, requestUrl, params, permissions);
		//table容器
		initTableBaseHtml(tableId, toolsAreaId, requestUrl,isImportAndExport,agentName);
		if(!isAddSearchContent){
			//搜索区域实体
			initSearchWidgetModel(tableId);
		}
		//初始化表格位置
		initTablePositionModel(tableId);
		//初始化表格实体内容 & 初始化表格设置
		initTableContentAndSetting(tableId, page);
	}
	
	/**  !important!!!!!!!!!!!
	 * 初始化所有必要的参数，减少内部的频繁验证，并更新本地存储
	 * 初始化参数有： show:true	required:true	width=100	日期格式
	 * 			key键默认disabled："E"， comType默认text
	 */
	function initTableItems(tableId, tableItems){
		var items = tableItems.trs,
			len = items.length,
			tableKey =tableItems.tableKey,
			newItems = [];	
		for(var i=0; i<len; i++){
			var item = items[i],
				width = item.width,
				vali = item.vali;
			if(!(item.show===false)){
				item.show = true;
			}
			if(!width || isNaN(Number(width))){
				item.width = 100;
			}
//			if(!item.comType){
//				item.comType = "text";
//			}
			if(!(vali && vali.required === false)){
				if(!vali)
					item.vali = {};
				item.vali.required = true;
			}
			if(vali && vali.date && (!vali.dateFormat)){
				item.vali.dateFormat = "YYYY-MM-DD hh:mm:ss";//"YYYY/DD/MM hh:mm:ss";?8.16改动，不确定是否正确
			}
			//disabled="A",适用于表格主键自增长的情况
			if(item.name == tableKey	&&(!item.hideEdit) &&(!item.disabled)){
				item.disabled = "E";
			}
			newItems.push(item);	
		}
		tableItems.trs = newItems;
		return tableItems;
	}
	
	/**
	 * 1.根据一个表格ContentId，构建整个表格需要的html基础样式，之后在该基础样式在填充表格
	 * 	即 创建表格只需要一个div，之后的事情交给模板
	 * 2.由于工具栏的位置特殊，这里需要手动构建，并传入id
	 * PARAM  : table容器id-tableDivId , 
	 * RETURN :
	 * NOTICE :
	 * 	1.id的构成保持一致的规律，之后外部不修改; contentId需要保持特殊性
	 * 	1.区域ID：
	 * 		搜索条件区域 : divId-searchAreaId ;
	 * 		编辑区域： -edit; 
	 * 			表单ID： tableId-edit-form; 表单中的字段：name=字段名，因为需要验证；
	 * 		详情区域： -detail
	 * 
	 * 	2.按钮
	 * 		表容器id ： divId ; 表头thead容器类属性： divId-theadDivClass;  表头thead的id ： divId-thead ; 表body容器类属性:　divId-bodyDivClass;  表body的id : divId-body ; 
	 * 		搜索条件区域id : divId-searchAreaId ; 搜索按钮Id ： divId-searchBtnId ; 搜索+图标id : divId-searchPlusId ; 搜索-图标id : divId-searchMinusId ;
	 * 		工具栏（divId前缀省略）： -tools工具栏容器 ; 	-tools-detail详情按钮 ; -tools-add新增 ; -tools-edit编辑 ; -tools-delete删除 ; -checkAllBtn全选框 ; 
	 * 			-RowPopId显示列下拉框ID ; -searchBtnId搜索按钮  ; 
	 * 		页脚分页控件：divId-foot ; divId-footBody ; divId-footPop;
	 *  2.tabOrTools 识别tab和工具栏的class 
	 *  3.事件
	 *  	viewDetail 查看详情
	 *  	contentId_importCsv	导入
	 *  	contentId_exportCsv	导出
	 *  	contentId_exportTempCsv	导出模板
	 *  4.工具栏相关 字段名：name
	 *  	字段对应的搜索框ID：search-tableId-name
	 *  	表格-表头ID：th-tableId-name
	 *  	编辑框ID： edit-tableId-name //新增和编辑是同一个
	 *  5.表格
	 *  	行checkbox按钮： tableId-rowItems
	 *  	
	 */
	function initTableBaseHtml(contentId, toolsAreaId, requestUrl,isImportAndExport,agentName){
		//搜索工具栏
		var style = ' style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;" ',
			table = '' ;
		var	tableTools = '<div class="btn blue f-p-tips" '+style+' id="'+contentId+'-tools-detail" onclick="viewDetail(\''+contentId+'\')">'
				+'<i class="fa fa-list-alt"></i><div class="f-t-tips">'+$.i18n("details")+'</div></div>'
			+'<div class=" btn success f-p-tips" '+style+' id="'+contentId+ '-tools-add" onclick="viewEditOrAdd(\''+contentId+'\', \'new\',\'\',\''+agentName+'\')" ><i class="fa fa-plus"></i>'
				+'<div class="f-t-tips">'+$.i18n("new")+'</div></div>'
			+'<div  class="btn primary f-p-tips" '+style+' id="'+contentId+'-tools-edit"  onclick="viewEditOrAdd(\''+contentId+'\', \'edit\',\'\',\''+agentName+'\')"><i class="fa fa-edit"></i>'
				+'<div class="f-t-tips">'+$.i18n("edit")+'</div></div>'
			+'<div  class="btn danger f-p-tips" '+style+' id="'+contentId+'-tools-delete" onclick="toolDelete(\''+contentId+'\')" ><i class="fa fa-trash-o"></i><div class="f-t-tips">'
			+$.i18n("delete")+'</div></div>&nbsp;&nbsp;'
		if(isImportAndExport){
			tableTools += '<input type="file" id="'+ contentId +'_importCsv" class="hidden" accept="text/csv" onchange="importCsvModel(\''+ contentId +'\')">'+
				'<div  class="btn darkorange f-p-tips" '+style+' onclick="$(\'#'+ contentId +'_importCsv\').click()"><i class="fa fa-upload"></i>'+
	            '<div class="f-t-tips">'+$.i18n("import")+'</div></div>'+
	            '<div class="btn darkorange f-p-tips" '+style+' onclick="exportCsvModel(\''+ contentId +'\')"><i class="fa fa-download"></i>'+
	            '<div class="f-t-tips">'+$.i18n("export")+'</div></div>'/*+
	            '<div class="btn darkorange f-p-tips" '+style+' onclick="exportTempCsvModel(\''+ contentId +'\')"><i class="fa fa-download"></i>'+
	            '<div class="f-t-tips">'+$.i18n("exportTemplate")+'</div></div>'*/
	            tableTools += '&nbsp;&nbsp;';
		}
		//添加一个隐藏的按钮-分析-需要时显示
		tableTools += '<div class="btn f-p-tips" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;display:none;"  id="'+contentId+'-tools-analysis"'+
		  	' onclick="analysisModal()"><i class="fa fa-film"></i><div class="f-t-tips">'+$.i18n("analysis")+'</div></div>';
		
		tableTools += '<div class="viewcfg-dropdown"><a class="btn purple f-p-tips dropdown-toggle" '+style+' data-toggle="dropdown" href="javascript:" aria-expanded="false">'+
				'<i class="fa fa-gear"></i><div class="f-t-tips">'+$.i18n("setting")+'</div></a>'
				+'<ul class="dropdown-menu dropdown-blue" ><li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">'
		    	+'<div class="pull-left"><label style="margin: 0 0 0 20px;">'
		    	+'<input type="checkbox" id="'+contentId+'-checkAllBtn" onchange="checkAllShowItems(\''+contentId +'\')"><span class="text"></span></label>'+$.i18n("check_all")+'</div>'
		    	+'<button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="resetShowItems(\''+contentId+'\')"><i class="fa fa-refresh"></i>'
		    	+$.i18n("restore")+'</button></li><div id="' +contentId+'-RowPopId"></div></ul></div>' 
		    +'<div id="'+contentId+'-searchBtnId" class="btn f-p-tips warning" '+style+' aria-expanded="false"><i class="fa fa-search-plus" id="'
		    	+contentId+'-searchPlusId"></i><i class="fa fa-search-minus" style="display:none" id="'+contentId+'-searchMinusId"></i><div class="f-t-tips">'+$.i18n("search")+'</div></div>';
		$("#"+toolsAreaId).append(tableTools);
		//是否有内容的标识
		table = '<input type="hidden" id="'+contentId +'-flag" value=1/>';
		//搜索条件区域： 这里仅添加一个区域容器 
		table += '<div class="collapse" id="'+contentId+'-searchArea"></div>';
		//表头table，添加了style  容器添加了高度
		table += '<div class="data-thead '+contentId+'-theadDivClass" style="height:auto;background-color: #F7F7F7;border-top: 1px solid #ddd;border-bottom: 1px solid #00A2E9;"'+
			'onmousemove="thOnMouseMoveModel(\''+contentId+'\')"'+'onmouseup="thOnMouseUpModel(\''+contentId+'\')"'+
			'><table class="table table-bordered table-striped dataTable" style="width:auto;">'
			+'<thead class="flip-content"><tr role="row" id="'+contentId+'-thead"></tr></thead></table></div>';
        //表实体
		table += '<div class="data-tbody '+contentId+'-bodyDivClass"'+
			'onmousemove="thOnMouseMoveModel(\''+contentId+'\')"'+'onmouseup="thOnMouseUpModel(\''+contentId+'\')"'+'>'
			+'<div><table class="table table-bordered table-hover table-striped" style="width:auto;">'
			+'<tbody class="page-data-tbody" id="'+contentId+'-body"></tbody></table></div>'
			//无记录时显示
			+'<div id="'+contentId+'-body-noData" style="width:100%;padding:10px;text-align:center;display:none;">'
			+'<span style="font-size:14px;font-weight:bold;">'+ $.i18n("label.table.noDataRecord") +'</span></div>'		
			+'</div>';
		//表分页控件
		table += '<div class="row foot-tools" id="'+contentId+'-foot" style="height:45px;"><div id="'+contentId+'-footContent" class="pull-right table-page-tools position-relative">'
			+ '<div class="pagetools" id="'+contentId+'-footBody"></div><select id="'+contentId+'-footPop" onchange="changePagesizeModal(\''+contentId+'\')" class="form-control">'
			+ '<option label="25" value="25">25</option><option label="50" value="50">50</option><option label="100" value="100">100</option>'
			+ '</select></div></div>';
		$("#"+contentId).append(table);
//		$("#"+contentId).mousemove(thOnMouseMoveModel(contentId));
//		$("#"+contentId).mouseup(thOnMouseUpModel(contentId));
	}
	
	//搜索区域实体
	function initSearchWidgetModel(tableId){
		var paramsStorage = getLocalStorageModel(tableId, "tableParams"),
			params = paramsStorage.trs,
			i18nPrefix = paramsStorage.i18nPrefix,
			paramsLen = params.length,
			queryList = [];
		for(var i=0; i<paramsLen; i++){//需要加入搜索栏的列
			if(params[i].advQry){
				queryList.push(params[i]);
			}
		}
		var queryLen = queryList.length,
			html = '<div class="panel-body">';
		for(var i=0;i<queryLen;){
			html += '<div class="row ng-scope">';
			for(var j=0; j<3; j++,i++){//每3个搜索框为一行
				if(i>=queryLen)
					break;
				var queryItem = queryList[i],
					name = queryItem.name,
					advQry = queryItem.advQry,
					comType = queryItem.comType,
					comData = queryItem.comData,
					vali = queryItem.vali,
					plaTip = $.i18n(i18nPrefix + name + ".help");
				html += '<div class="col-md-4 margin-bottom-5 ng-scope"><span class="adv-name ng-binding">'
					+ $.i18n(i18nPrefix + name) +':</span><div class="adv-value">';
					if(comType=="select"){
						if(!comData){
							comData = $.i18n(i18nPrefix + name+ ".comData");//二维数组
						}
						html +=  '<div class="input-sm no-border no-padding ng-scope" style="min-width:154px;">' +
							'<select id="search-'+ tableId + "-"+ name+'" style="width: 100%;" placeholder="'+plaTip +'" class="ng-pristine ng-untouched ng-valid">'+
							'<option value="" selected="selected">'+ plaTip+'</option>';
						for(var k=0,len=comData?comData.length:0; k<len; k++){
							//html += '<option label="'+ comData[k][1]+'" value="'+ comData[k][0]+'"></option>';
							html += '<option value="'+ comData[k][0]+'">'+ comData[k][1] +'</option>';//似乎是上面的label方式无法显示
						}
						html += '</select></div>';
					}else if(comType=="area"){
						
					}else{
						
						//日期插件
			    		var laydateHtml = "";
				    	if(vali.date){
				    		//var choose = "laydateCallbackModel&|"+tableId+"&|"+name;
				    		laydateHtml = "onclick='laydate({istime: true, format: \""+ vali.dateFormat +"\"})'";//,choose:\""+choose+"\"
				    	}
						html += '<div class="ng-scope"><input type="text" id="search-'+tableId + "-"+ name +'" class="input-sm ng-pristine ng-valid ng-scope ng-touched"'
						+'placeholder="'+ $.i18n(i18nPrefix + name+ ".help" ) +'" '+ laydateHtml +'></div>';
					}
				html += '</div></div>';
			}
			html += '</div>';
		}
		html += '<div class="row ng-scope"><div class="col-md-12 text-right">'
			+'<button class="btn btn-success" style="height:30px;margin-right:5px;" onClick="queryTableDataModel(\''+tableId +'\')"><i class="fa fa-search"></i>'+ $.i18n("search")+'</button>'
			+'<button class="btn btn-darkorange" style="height:30px;" onClick="resetSearchCondition(\''+tableId +'\')"><i class="fa fa-undo"></i>'+ $.i18n("page.clear_search")+'</button>'
			+'</div></div></div>';
		$("#" +tableId +"-searchArea").append(html);
		//转换原生select元素为select2控件 —— id: 'search-'+ tableId + "-"+ name
		for(var i=0;i<queryLen;i++){
			var queryItem = queryList[i],
				name = queryItem.name,
				advQry = queryItem.advQry,
				comType = queryItem.comType;
			if(advQry && comType== "select"){
				$("#search-"+ tableId + "-" + name).select2({
					minimumResultsForSearch: 8//8个以上显示搜索框
				});
			}
		}
	}
	
	//重置搜索框
	function resetSearchCondition(tableId){
		var columns = getLocalStorageModel(tableId, "tableParams").trs,
			params = columns.trs,
			len = columns.length;
		for(var i=0; i<len; i++){
			$("#search-"+tableId + "-"+ columns[i].name).val("");
			$("#search-"+tableId + "-"+ columns[i].name+"-GTE").val("");
			$("#search-"+tableId + "-"+ columns[i].name+"-LTE").val("");
			//现在已经使用select2控件了,清空方法如下
			if(columns[i].comType=="select"){
				$("#search-"+tableId + "-"+ columns[i].name).select2("val","");
			}
		}
		queryTableDataModel(tableId, "1");
	}
	
	/**
	 * 初始化LOCAL STORAGE ，键值对如下
	 * 		重置：tableReset; 列参数：tableParams; 查询结果：queryData; 排序参数： sortParams;
	 * 		请求主体地址：requestUrl
	 * 			查询：requestUrl+list.ajax; 删除：requestUrl+ delete.ajax; 保存：requestUrl+ save.ajax
	 * @param table
	 * @param params
	 * @notice  初始化时，判断是否更新代码！ 代码处理过程中，都强制更新（代码中需要更新才会用到updateLocalStorageModel）
	 */
	function initLocalStorage(tableId, requestUrl, tableItems, permissions){
  	  	//table列表参数,有数据则不更新
		checkAndSetLocalStorageModel(tableId, "tableParams", tableItems);
  	  	//table列重置参数
  	  	setLocalStorageModel(tableId, "tableReset", tableItems);
  	  	//请求地址主体，每一个表格的各项请求配置一致
  	  	setLocalStorageModel(tableId, "requestUrl", requestUrl);
  	  	//
  	  	//setLocalStorageModel(tableId, "i18nPrefix", i18nPrefix);
  	  	//权限
  	  	setLocalStorageModel(tableId, "permissions", permissions);
  	  	//查询结果
  	  	//setLocalStorageModel(tableId, "queryData", tableItems);
  	  	//排序参数
  	  	//setLocalStorageModel(tableId, "sortParams", tableItems);
	}
	
	/**
	 * 初始化窗体位置
	 * PARAM  ： table容器id-tableId
	 * RETURN : undefined
	 * NOTICE :
	 * 	1.$(".stati-info")和$(".page-breadcrumbs")默认是固定的，在应用该模板时，应注意此处是否需要扩展
	 * 	2.attr("aria-expanded")是否已展开标识
	 *  3.id构成与初始化容器的方式一样
	 */
	 function initTablePositionModel(tableId) {  
           // 计算table高度 
           var winHeight = document.documentElement.clientHeight; 
           //stati-info 含义未知***********************************
           var dataTableDivHeight = winHeight - 186 - $(".stati-info").height() - $(".page-breadcrumbs").height();//窗体高度-198-？的高度-栏目条高度
           var $dataTBody = $("."+tableId+"-bodyDivClass"), 
           		$dataTHead = $("."+tableId+"-theadDivClass");//表格body高度，表格头高度
           	$dataTBody.css("height", dataTableDivHeight);
           	/**  @author gya 概览页面的高度*/
           	$(".summary-tab").css("height", dataTableDivHeight+81);
           // table body 滚动,带动table head平行移动,解决头部固定问题
           $dataTBody.scroll(function (e) {
               return $dataTHead.prop("scrollLeft", e.target.scrollLeft);
           });

           // 展开高级搜索调整table高度
           var $searchBtn = $("#"+tableId+"-searchBtnId"), 
           		$searchArea = $("#"+tableId+"-searchArea");
           $searchBtn.click(function () { 
               var isExpanded8 = !JSON.parse($searchBtn.attr("aria-expanded")); 
               var height8 = dataTableDivHeight;
               if (isExpanded8) {
            	   $searchArea.show();
                   $("#"+tableId+"-searchPlusId").hide();
                   $("#"+tableId+"-searchMinusId").show();
                   height8 = (dataTableDivHeight - $searchArea.height());
               } else {
            	   $searchArea.hide();
                   $("#"+tableId+"-searchMinusId").hide();
                   $("#"+tableId+"-searchPlusId").show();
                   //最小化时，清空搜索框
                   var columns = getLocalStorageModel(tableId, "tableParams").trs,
       			   	   len = columns.length;
		       		for(var i=0; i<len; i++){
		       			$("#search-"+tableId + "-"+ columns[i].name).val("");
		       		}
               }
               $dataTBody.css({"height": height8 + "px"}); 
               $searchBtn.attr("aria-expanded", isExpanded8 + "");
               queryTableDataModel(tableId, '1');//展开/收起搜索框也需要重新搜索一次
           });  
       }
     
    function changeShowItems(tableId){
    	var selectRowsPopId = tableId + "-RowPopId";//显示列下拉框ID
   	  	var allCheckBtnId = tableId + "-checkAllBtn";//全选框ID
   	  	
    	var itemsLen = $("input[name='"+selectRowsPopId+"']").length; //获取items的个数  
    	var checkedItems = $("input[name='"+selectRowsPopId+"']:checked");
        var checkedItemsLen = $("input[name='"+selectRowsPopId+"']:checked").length; //获取选中的items的个数
        if (itemsLen == checkedItemsLen) {  
          $("#" + tableId + "-checkAllBtn").prop("checked", true);  
        }else{
  	       $("#" + tableId + "-checkAllBtn").prop("checked", false); 
  	    }
        
        var localSto = getLocalStorageModel(tableId, "tableParams");
        var tableItems = localSto.trs;
        var tableItemsLen = tableItems.length;
        
        for(var k=0; k<tableItemsLen; k++){
        	tableItems[k].show = false;
        }
        for(var l=0; l<tableItemsLen; l++){
        	for(var m=0; m<checkedItemsLen; m++){
        		var itemName = checkedItems[m].value;
        		if(tableItems[l].name == itemName){
        			tableItems[l].show = true;
        			break;
        		}
        	}
        	//tableItems[l].show = false;每行都是false  bug
        }
        localSto.trs = tableItems;
        setLocalStorageModel(tableId, "tableParams", localSto);
  	  	showDataModel(tableId);
    }
    
    //全选反选
    function checkAllShowItems(tableId){    
 	  var isChecked = $("#" + tableId + "-checkAllBtn").prop('checked'); 
       $("input[name='"+tableId + "-RowPopId']").prop("checked", isChecked);
       changeShowItems(tableId);
    } 
    
  //重置
    function resetShowItems(tableId){  
 	  var tableItems = getLocalStorageModel(tableId, "tableReset");
 	  setLocalStorageModel(tableId, "tableParams", tableItems);//将重置用的初始数据，赋值给使用的数据
 	  showRowsModel(tableId, tableItems);
 	  queryTableDataModel(tableId, '1');
    } 
 	  
 	
 	/************************部分显示效果的实现**********************
 	 * 
 	 */
 	//单击tr选中这一型的checkbox
    function selectThisRow(tableId, number){
 	   $("input[name*='"+ tableId+"-rowItems']").prop("checked", false);
 	   $("input[name='"+ tableId+"-rowItems"+number +"']").prop("checked", true);
 	   changeSelectRows(tableId);
 	   changeTrBackground(tableId);
    }
    
    function changeTrBackground(tableId){
	   var checkedsubList = $("input[name*='"+ tableId+"-rowItems']:checked");
	   var unCheckedsubList = $("input[name*='"+ tableId+"-rowItems']").not("input:checked");
	   unCheckedsubList.each(function(){
		   $(this).parents("tr").removeClass("active_tr");
	   });
	   checkedsubList.each(function(){
		   $(this).parents("tr").addClass("active_tr");
	   });
  	}
    
    //选中行
    function changeSelectRows(tableId){ 
    	var chsubList = $("input[name*='"+ tableId+"-rowItems']").length,
       		checkedsubList = $("input[name*='"+ tableId+"-rowItems']:checked").length,
       		permission = getLocalStorageModel(tableId, "permissions");
    	if (checkedsubList == chsubList) {  
    		$("#"+tableId+"-tableCheckAllBtn").prop("checked", true);  
    	}else{
 	       	$("#"+tableId+"-tableCheckAllBtn").prop("checked", false); 
 	   	}   
    	// 操作许可   0|0|0|0 对应,detail|add|edit|delete ,0=许可,1=禁止  permission[0]==0
    	//详情按钮的显示与否			 gray_tableModal blue success primary danger
    	if(checkedsubList==1 && permission[0]==0){
    		$('#'+tableId + "-tools-detail").removeAttr("disabled");
    		$('#'+tableId + "-tools-detail").removeClass("gray_tableModal").addClass("blue");
    	}else{
    		$('#'+tableId + "-tools-detail").attr("disabled","disabled");
    		$('#'+tableId + "-tools-detail").removeClass("blue").addClass("gray_tableModal");
    	}
    	//编辑按钮的显示与否
    	if(checkedsubList==1 && permission[2]==0){
    		$('#'+tableId + "-tools-edit").removeAttr("disabled");
    		$('#'+tableId + "-tools-edit").removeClass("gray_tableModal").addClass("primary");
    	}else{
    		$('#'+tableId + "-tools-edit").attr("disabled","disabled");
    		$('#'+tableId + "-tools-edit").removeClass("primary").addClass("gray_tableModal");
    	}
    	//删除按钮的显示与否
    	if(checkedsubList>0 && permission[3]==0){
    		$('#'+tableId + "-tools-delete").removeAttr("disabled");
    		$('#'+tableId + "-tools-delete").removeClass("gray_tableModal").addClass("danger");
    	}else{
    		$('#'+tableId + "-tools-delete").attr("disabled","disabled");
    		$('#'+tableId + "-tools-delete").removeClass("danger").addClass("gray_tableModal");
    	}
    	//新增按钮的显示与否
    	if(permission[1]==0){
    		$('#'+tableId + "-tools-add").removeAttr("disabled");
    		$('#'+tableId + "-tools-add").removeClass("gray_tableModal").addClass("success");
    	}else{
    		$('#'+tableId + "-tools-add").attr("disabled","disabled");
    		$('#'+tableId + "-tools-add").removeClass("success").addClass("gray_tableModal");
    	}
    	//新增加的分析按钮
    	if(checkedsubList==1){
    		$('#'+tableId + "-tools-analysis").removeAttr("disabled");
    		$('#'+tableId + "-tools-analysis").removeClass("gray_tableModal").addClass("blue");
    	}else{
    		$('#'+tableId + "-tools-analysis").attr("disabled","disabled");
    		$('#'+tableId + "-tools-analysis").removeClass("blue").addClass("gray_tableModal");
    	}
    	changeTrBackground(tableId);
    }
 	
    //列表---全选反选
    function checkAllRows(tableId){    
    	var isChecked = $("#"+tableId + "-tableCheckAllBtn").prop('checked'); 
        $("input[name*='"+ tableId+"-rowItems']").prop("checked", isChecked);
        changeSelectRows(tableId);
        changeTrBackground(tableId);
    } 
    //排序
    function rowsSort(tableId, columnName){
    	   var rowsSortList = [];
    	   var theadId = "th-"+ tableId+ "-"+columnName;//表头ID：th-tableId-name
       	   var th = $("#"+theadId);
       	   //点击排序的变化如下：sorting 0 ——>sorting_asc 1; 1——> sorting_desc 2; 2——>0; 
       	   //NOTICE: 因为sorting_*是包含sorting的，所有sorting放到最后一个if
       	   var c = th.attr("class");   
       	   if(c && c.indexOf('sorting_asc') > -1){  
       	       th.removeClass('sorting_asc').addClass('sorting_desc'); 
       	   }else if(c && c.indexOf('sorting_desc') > -1){  
       	       th.removeClass('sorting_desc').removeClass('sorting_asc').addClass('sorting'); 
       	   }else if(c && c.indexOf('sorting') > -1){ 
       	       th.removeClass('sorting').addClass('sorting_asc'); 
       	   }
            
           var html_sort="";
           var sortingAsc = $("#"+tableId).find(".sorting_asc");  
           sortingAsc.each(function(){
	           var asc =[];
	           var tr_name_asc = $(this).attr("name");
	           if(tr_name_asc){ 
	           	   asc.push(tr_name_asc);
	           	   asc.push(1);
	           	rowsSortList.push(asc);
	           }
	       	});

           var sortingDesc = $("#"+tableId).find(".sorting_desc");  
	       sortingDesc.each(function(){
	       	   var desc =[]; 
	       	   var tr_name_desc = $(this).attr("name");
	           if(tr_name_desc){
	        	   desc.push(tr_name_desc);
	           	   desc.push(2);
	           	rowsSortList.push(desc);
	           }
	       	});  
              
	       setLocalStorageModel(tableId, "sortParams", rowsSortList);
           queryTableDataModel(tableId);
    }
 	
    /***************************************** 表格实体 ***************************************/
    /**
     * 填充表格实体！
     * 分页数据 + 分页控件
     * @param tableId
     * @param params
     * @param page
     */
    function initTableContentAndSetting(tableId, page){
    	//初始化要显示的列
    	var params = getLocalStorageModel(tableId, "tableParams");
    	showRowsModel(tableId, params);
    	//查询分页
    	queryTableDataModel(tableId, page);
    	setPageSizeModel(tableId);
    	
    }
    /**
     * 工具栏设置显示列按钮——显示列的设置与存储
     * @param	tableId	tab页面的ID
     * @param	tableItems	注意：这里有两种情况，初始化和重置，tableItems不同，不能直接取tableParams的本地数据
     */
    function showRowsModel(tableId, tableItems){
		var selectRowsPopId = tableId + "-RowPopId";//显示列下拉框ID
		var allCheckBtnId = tableId + "-checkAllBtn";//全选框ID
		var i18nPrefix = getLocalStorageModel(tableId, "tableParams").i18nPrefix;
		var html = "";
		var selectItemsjson = tableItems.trs;
		var len = selectItemsjson.length;
		for(var i=0; i<len; i++){  
			html+= "<li onclick='event.stopPropagation()'><label style='margin: 0 0 0 20px;'>"; 
			html+= "<input type='checkbox'";
//			var show = (selectItemsjson[i].show === false)?false: true;
			if(!(selectItemsjson[i].show === false)){//!undefined = true
				html+= " checked ";
			}
			var name = selectItemsjson[i].name;
			var title = $.i18n(i18nPrefix + name)||$.i18n("db.common." + name);
			html+= "name='"+selectRowsPopId+"' value='"+name+"' onchange='changeShowItems(\""+tableId+"\")'>";
			html+= "<span class='text'></span></label>"+title +"</li>"; 
		} 
		$("#"+selectRowsPopId).html(html); 
		//是否勾选全选框
		var chsub = $("input[name='"+selectRowsPopId+"']").length; //获取items的个数  
		var checkedsub = $("input[name='"+selectRowsPopId+"']:checked").length; //获取选中的items的个数  
		if (checkedsub == chsub) {  
			$("#"+allCheckBtnId).attr("checked", true);  
		}else{
			$("#"+allCheckBtnId).attr("checked", false); 
		} 
	}
    /**
     * 查询分页，或更新数据
     * @param tableId
     * @param page
     */
    function queryTableDataModel(tableId, page){
  	    var	pageSize = getLocalStorageModel(tableId, "pageSize");
  	    if(!pageSize){
  	    	pageSize = "25";
  	    }
  	    if(!page){
  	    	page = "1";
  	    }
  	    var queryUrl = getLocalStorageModel(tableId, "requestUrl")+ "list.ajax",
  	    	queryParams = getSearchParams(tableId);
  	  var loadInx = layer.load(2);//打开加载圈图标layer.close(loadInx);//关闭加载圈图标
       $.ajax({
      	    url:window.PATH + queryUrl +"?pageSize="+pageSize+"&page="+page,
      	    data: queryParams,
      	    type:"post",
      	    dataType: "json",
      	    success:function(req){
      	    	var newResult = req.data, 
      	    		data = newResult.contentList, 
      	    		length = data.length;
      	    	setLocalStorageModel(tableId, "queryData", data);//存储结果数据
      	    	showDataModel(tableId);//创建表格
          	    paginationWidget(newResult, tableId, queryParams);//填充页脚
      	    	hideToolBtn(tableId);//初始化工具栏隐藏状态
      	    	layer.close(loadInx);//关闭加载圈图标
      	    }, 
      	    error: function (xhr, type, exception) {
      	    	layer.close(loadInx);//关闭加载圈图标
          }
      	}); 
     }
    
    //查询分页——获取搜索参数
    function getSearchParams(tableId){//,datekey,begintime,endtime
    	var tableItems = getLocalStorageModel(tableId, "tableParams"),
    		order = tableItems.order,
    		columns = tableItems.trs,
    		len = columns.length,
    		params = "{";
    	for(var i=0; i<len; i++){
    		var item = columns[i];
    		if(item.advQry){
    			var val = $("#search-"+ tableId + "-"+ item.name).val();//搜索框ID：search-tableId-name
    			if(val){
    				if(item.ratio){//倍率
    					val = parseFloat(val)*item.ratio;
    					val = parseInt(val);
    				}
    				params +='"cx_LIKE-|-'+ item.name +'":"'+ val +'",';  
    			}
    			var valGte = $("#search-"+ tableId + "-"+ item.name+"-GTE").val();
    			if(valGte){
    				params +='"cx_GTE-|-'+ item.name +'":"'+ valGte +'",';  
    			}
    			var valLte = $("#search-"+ tableId + "-"+ item.name+"-LTE").val();
    			if(valLte){
    				params +='"cx_LTE-|-'+ item.name +'":"'+ valLte +'",';  
    			}
    		}
    	}
//    	if (datekey) {
//    		if (begintime) {
//				params +='"cx_GTE-|-'+ datekey +'":"'+ begintime +'",';  
//    		}
//    		if(endtime) {
//				params +='"cx_LTE-|-'+ datekey +'":"'+ endtime +'",';  
//    		}
//    	}
    	if(params!='{'){  
        	params = params.substr(0,params.length-1);
        } 
        params += '}'; 
        params = JSON.parse(params);
    	//获取排序条件参数
    	var MY_ORDER_LIST = getLocalStorageModel(tableId, "sortParams");
    		orderLen = MY_ORDER_LIST.length;
        if(orderLen>0){  
        	var html='[';
        	for(var i=0;i<orderLen;i++){
        		var html_str='[';
        		html_str += '"' +MY_ORDER_LIST[i][0] +'",' +MY_ORDER_LIST[i][1] +']';
        		if(i!=orderLen-1){
        		    html += html_str +',';
        		}else{
        			html += html_str +']';
        		}  
        	} 
        	params.cx_ORDER_LIST = html;
        } 
        //添加默认的排序参数
        if(!params.cx_ORDER_LIST && order){
        	params.cx_ORDER_LIST = order;
        }
    	return params;
    }

    
    
    
    
    
    
    //页脚分页控件
    function paginationWidget(pageResult, tableId, queryParams) { 
    	var page = pageResult || {},
    		len = pageResult.contentList.length,
        	sb = "",
        	paginationSize = 5,
        	current = (page.number + 1) || "-",
        	begin = Math.max(1, current - parseInt(paginationSize / 2)),
        	end = Math.min(begin + (paginationSize - 1), page.totalPages),
        	size = page.size || "-",
        	totalEle = page.totalElements || "-",
        	totalPages = page.totalPages || "-"; 
        sb += "<div><ul class=\"pagination\">";

        if (page.hasPreviousPage) {
            sb += "<li><a page=\"1\" href=\"" + getJavascriptStrModal(1, size, tableId, queryParams) + "\">&lt;&lt;</a></li>";
            sb += "<li><a href=\"" + getJavascriptStrModal(current - 1, size , tableId, queryParams) + "\">&lt;</a></li>";
        } else {
            sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;&lt;</a></li>";
            sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;</a></li>";
        }
        for (var i = begin; i < (end + 1); i++) {
            if (i == current) {
                sb += "<li class=\"active\"><a page=\"" + i + "\" href=\"javascript:\">" + i + "</a></li>";
            } else {
                sb += "<li><a href=\"" + getJavascriptStrModal(i, size , tableId, queryParams) + "\">" + i + "</a></li>";
            }
        }
        if (page.hasNextPage) {
            sb += "<li><a href=\"" + getJavascriptStrModal(current + 1, size , tableId, queryParams) + "\">&gt;</a></li>";
            sb += "<li><a href=\"" + getJavascriptStrModal(page.totalPages, size , tableId, queryParams) + "\">&gt;&gt;</a></li>";
        } else {
            sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;</a></li>";
            sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;&gt;</a></li>"; //event.keyCode==13 && "+pageFun+"("+this.value+","+size+")
        }

        var pageNum = "<input style='width:30px;margin:1px 5px;' value='" + current + "' onkeydown='event.keyCode==13&&queryTableDataModel(\""+tableId+"\",  this.value)'>";
        sb += "<li class=\"disabled\"><a href=\"javascript:\">" + $.i18n("page_tools.tips", totalPages, totalEle) + "</a></li>";
        sb += "<li><span style='padding:3px 12px;'>" + $.i18n("page_tools.goto_page", pageNum) + "</span></li>";
        sb += "<ul></div>";
        //填充页脚内容
    	$("#"+tableId+"-footBody").html(sb);
    	if(len==0){
    		$("#"+ tableId +"-footContent").hide();
    	}else{
    		$("#"+ tableId +"-footContent").show();
    	}
    }; 
    
    function getJavascriptStrModal(page, pageSize, tableId, queryParams) { 
        return "javascript:queryTableDataModel(\'"+tableId+"\', "+page+")";
    }

	function changePagesizeModal(tableId){
		var pageSize = $("#"+ tableId +"-footPop").val();
		pageSize = pageSize? pageSize :25;
		setLocalStorageModel(tableId, "pageSize", pageSize);
		queryTableDataModel(tableId);
	}
    //设置分页下拉框值
    function setPageSizeModel(tableId){ 
    	var pageSize = getLocalStorageModel(tableId, "pageSize");
    	pageSize = pageSize? pageSize : "25";
 	   $("#"+tableId+"-footPop").val(pageSize);
    }
    
    /**	初始状态设置	1.根据权限，隐藏不可用的工具按钮	2.初始时，需要disabled详情、编辑、删除三个按钮	3.应在每次刷新table时初始化工具栏状态，所有放到queryTableDataModel中
     *  操作许可   0|0|0|0 对应,detail|add|edit|delete ,0=许可,1=禁止  permission[0]==1
     */
    function hideToolBtn(tableId){
		$("#"+ tableId + "-tools-detail").removeAttr("disabled").attr("disabled","disabled").removeClass("blue").addClass("gray_tableModal");  
		$("#"+ tableId + "-tools-edit").removeAttr("disabled").attr("disabled","disabled").removeClass("primary").addClass("gray_tableModal");  
		$("#"+ tableId + "-tools-delete").removeAttr("disabled").attr("disabled","disabled").removeClass("danger").addClass("gray_tableModal");
		$("#"+ tableId + "-tools-analysis").removeAttr("disabled").attr("disabled","disabled").removeClass("blue").addClass("gray_tableModal"); //新增的分析按钮
		var permission = getLocalStorageModel(tableId, "permissions");
		if(permission[0]==1){
			$("#"+ tableId + "-tools-detail").hide();
		}
		if(permission[1]==1){
			$("#"+ tableId + "-tools-add").hide();
		}
		if(permission[2]==1){
			$("#"+ tableId + "-tools-edit").hide();
		}
		if(permission[3]==1){
			$("#"+ tableId + "-tools-delete").hide();
		}
    }
    
    
    /**
     * 创建表格实体:更新表格数据（刷新）
     * @param tableId表格ID, resultList结果集, 表的主键
     * @param resultList
     * NOTICE 创建表格规范如下
     * 		表格全选按钮ID tableId-tableCheckAllBtn，表格全选按钮事件 checkAllRows(tableId)；
     * 		表头的mouse事件-更改背景色
     * 		行元素checkbox name属性  tableId-rowItems-X； 选中行事件 selectItems(tableId); 点击排序doSort
     * 		2.td的宽度可能大于设定：在整行没有填满的情况下
     */
    function showDataModel(tableId){
    	   //取到需要显示的列
    	var itemsdata = getLocalStorageModel(tableId, "tableParams"),
    		resultList = getLocalStorageModel(tableId, "queryData"),
    		i18nPrefix = itemsdata.i18nPrefix,
    		itemsArr = itemsdata.trs,
    		tableKey = itemsdata.tableKey,
    		trsLength = itemsArr.length,
    		columnArr = [];
    	   	for(var i=0; i<trsLength; i++){  
              if(!(itemsArr[i].show === false)){
            	  columnArr.push(itemsArr[i]);
    	      }
    	   }  
    	   var html_thead="";//表头  
    	   html_thead+= "<th><label class='no-margin-bottom'><input type='checkbox' id='"+ tableId+"-tableCheckAllBtn' onclick='checkAllRows(\""+ tableId+"\")'><span class='text'></span></label></th>";
    	   for(var m=0;m<columnArr.length;m++){  
    		   //设置排序 
    		   var sort_str = "sorting";
    		   var mySortParam = getLocalStorageModel(tableId, "sortParams");
    		   if(mySortParam.length>0){
    			   for(var y=0;y<mySortParam.length;y++){
    				   var keyname = mySortParam[y][0];
    				   var keysort = mySortParam[y][1];
    				   if(columnArr[m].name==keyname){
    					   if(keysort==1){
    						   sort_str = "sorting_asc";
    					   }else if(keysort==2){
    						   sort_str = "sorting_desc";
    					   }
    				   }
    			   }
    		   }
    		   var columnName = columnArr[m].name; 
    		   var theadId="th-"+tableId+ "-"+columnName;
    		   var columnWidth = (columnArr[m].width)?(columnArr[m].width):80;
    		   //var columnI18n = m;
    		   var columnI18n = $.i18n(i18nPrefix + columnName)||$.i18n("db.common." + columnName);
    		    html_thead += "<th draggable='false' class='"+sort_str+"'  id='"+ theadId+"' name='" +columnName+//name属性改成简单的字段名；click方法写在th标签上，点击范围更准确
    		    	"'onmousedown=\"thOnMouseDownModel('"+tableId+"','"+columnName+"')\""+" style='cursor: default;' >";
    		    	//" onmouseup=\"thOnMouseUpModel('"+tableId+"')\"  onmousemove=\"thOnMouseMoveModel('"+tableId+"')\" " up和move方法移动到thread和body上去了
    		    html_thead += "<div class='table-data' draggable='false' style='width: "+columnWidth+"px; cursor: default;' onClick='rowsSort(\""+tableId+"\",\""+columnName+"\")'> "
        			+ columnI18n +"</div></th>";
    	   }   
    	   var html_tdata="",//表数据 
    	   	   resultLen = resultList.length;
           for(var n=0; n<resultLen; n++){
        	   var tableKeyValue = eval("resultList["+n+"]."+tableKey);
    	       html_tdata +=  "<tr onclick='selectThisRow(\""+tableId+"\",\""+n+"\")' onDblClick='viewDetail(\""+tableId+"\",\""+n+"\")'>" +
    	       		"<td><label style='margin-bottom:0;' onclick='event.stopPropagation()'>" +
    	       		"<input type='checkbox' name='"+tableId+"-rowItems"+n+"' value='"+tableKeyValue + "-|-" + n +
    	       		"' onclick='changeSelectRows(\""+tableId+"\")'><span class='text'></span></label></td>";
    	       for(var k=0;k<columnArr.length;k++){
    	    	   var isFirstRow = n==0?true:false, 
    	    		   tipContent="",
    	    		   columnData = columnArr[k],
    	    		   isTip = columnData.tip, name = columnData.name, width= columnData.width,
	 			   	   rowData = eval('resultList['+n+']')||""; 
	 			   var rowContent= formatData2Html(i18nPrefix, columnArr[k], rowData,isFirstRow);
	 			   if(isTip && rowContent){
	 			    	tipContent = '<div class="'+ isFirstRow?"f-tips":"f-t-tips" +'">'+ rowContent +'</div>';
	 			    }
	 			  html_tdata += '<td><div class="f-p-tips" name="'+name+'"><div style="width:'+width+'px;overflow: hidden;' +
	 					'word-break: keep-all;text-overflow: ellipsis;height: 20px;line-height: 22px;">'+rowContent+'</div>'+ tipContent +'</div></td>'; 
    		   } 
    		   html_tdata +=  "</tr>"; 					
           }  
    	   $("#" +tableId +"-thead").html(html_thead);
    	   $("#" +tableId +"-body").html(html_tdata);
    	   if(resultLen==0){//数据为0条时,与分页控件一起
    		   $("#"+ tableId +"-body-noData").show();
    	   }else{
    		   $("#"+ tableId +"-body-noData").hide();
    	   }
       }

    /**
     * 列表展示数据转换 ，应用于表格和详情
     * @param i18nPrefix 国际化字段前缀
     * @param i18nPrefix 字段的参数
     * @param rowData	一条数据
     * @param isFirstRow 第一行tips向下方显示
     * 	原意参数valFormat: function或 htmlCode;但是localStorage只能存储字符串，这里传递function似乎会丢失。这里暂时就只支持function，且传递function的方法名
     */
    function formatData2Html(i18nPrefix, columnParam, rowData){
    	var	name = columnParam.name,
    		width = (columnParam.width)?(columnParam.width):80,
    		comType = columnParam.comType,
    		rowContent = rowData[name],
    		valFormat = columnParam.valFormat,
    		ratio = columnParam.ratio,
    		tip = columnParam.tip,
	    	tdHtml = "",
    		tipContent = "",
    		newContent = "";
    	rowContent = rowContent===undefined?"":rowContent;
    	if(ratio){
    		rowContent = rowContent/ratio;
    	}
    	
	    if(valFormat){
	    	newContent = eval(valFormat+"(\""+rowContent+"\")");
	    }else if(comType){
	    	var comData = columnParam.comData?columnParam.comData:$.i18n(i18nPrefix+ name+ ".comData");
	    	if(comData){
	    		for(var i=0; i<comData.length; i++){
		    		if(comData[i][0]==rowContent){
		    			newContent = comData[i][1];
		    			break;
		    		}
		    	}
	    	}
	    }
    	rowContent = newContent?newContent:rowContent;
	    return rowContent;
    }
    
   /**
    * 工具栏——弹出框
    * 
    * @param tableId
    * @param number
    * @param type
    * @Notice 
    * 		
    * @returns
    * 	1. $("body").append(totalHtml)
    */
    function viewModal(tableId, type, number){//尚未使用
 	   if(number==undefined || number==""){
		   var checkedRows = $("input[name*="+ tableId+"-rowItems]:checked");
		   if(checkedRows){
			   number = checkedRows[0].value.split("-|-"); 
			   number = number[1];
		   }else{
			   number = "0";
		   }
	   }
 	   if(type && type=="detail"){
 		   createDetailDialog(tableId, number);
 		   showDialogModel(tableId, "detail");
 	   }else{
 		   createEditDialog(tableId, type, number);
 		   showDialogModel(tableId, type);
 	   }
    }
    
   function viewDetail(tableId, number){
	   if(number==undefined || number==""){
		   var checkedRows = $("input[name*="+ tableId+"-rowItems]:checked");
		   if(checkedRows){
			   number = checkedRows[0].value.split("-|-"); 
			   number = number[1];
		   }else{
			   number = "0";
		   }
	   }
	   createDetailDialog(tableId, number);
	   showDialogModel(tableId, "detail");
   }

   //edit和new的modal ID都是 tableID+"-edit",之后需要调整这个id名称，有歧义
   function viewEditOrAdd(tableId, type, number,agentName){
	   if(tableId=="simCardNewGrp"){//特殊情况
		   viewEditOrAdd_simCardNewGrp('simCardNewGrp', type);
		   return;
	   }
	   if(number==undefined || number==""){
		   var checkedRows = $("input[name*="+ tableId+"-rowItems]:checked");
		   if(checkedRows && checkedRows.length>0){
			   number = checkedRows[0].value.split("-|-"); 
			   number = number[1];
		   }else{
			   number = "0";
		   }
	   }
	   createEditDialog(tableId, type, number,agentName);
	   showDialogModel(tableId, type);
   }
   //详情
   function createDetailDialog(tableId, number){
	   	var tableParams = getLocalStorageModel(tableId, "tableParams"),
	    	tableItems = tableParams.trs,
	    	i18nPrefix = tableParams.i18nPrefix,
	    	queryData = getLocalStorageModel(tableId, "queryData"),
	    	permissions = getLocalStorageModel(tableId, "permissions");
	    	dataRow = eval("queryData["+number+"]"),
	    	itemsLen = tableItems.length,
	   		html = "";
	   	for(var i=0; i<itemsLen; i++){
	   		var name = tableItems[i].name,
	   			i18nKey = $.i18n(i18nPrefix + name)||$.i18n("db.common." + name),
	   			content = formatData2Html(i18nPrefix, tableItems[i], dataRow,false);
	   		html += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" width='32%'> "+i18nKey+
	   			": </td><td class='right-border-none'><div style='word-wrap:break-word;word-break: break-all;' class=\"f-p-tips ng-binding\">"+content+"</div></td></tr>";
	   	}
	   
	   	var  modalStyle = tableParams.expandDetail?'style="width:60vw;"':'';
	   var totalHtml = '<div class="modal fade modal-primary" id="'+tableId+'-detail"  role="dialog" aria-hidden="true">'+
	   		'<div class="modal-dialog" '+modalStyle+'><div class="modal-content"><div class="modal-header">'+
	        '<button type="button" class="close" onclick="removeModal(\''+tableId+'\',\'detail\')" aria-label="Close"><span aria-hidden="false">×</span></button>'+
	        '<h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i>'+$.i18n("details")+'</h4></div>'+
	        '<div class="modal-body bg-white no-padding" style="overflow-y:auto;max-height: 80vh;">';//overflow,这个容器即使浮动也具有高度
	   //详情页面的外部拓展
	   if(tableParams.expandDetail){
		   var result = eval(tableParams.expandDetail + '("'+tableId+'","'+number+'")');
		   var colWidth = result.colWidth;
		   var detailHtml = result.detailHtml;
		   totalHtml += '<div class="col-sm-'+colWidth+'"><div><table class="table table-bordered table-striped  detailTable"><tbody>'+ html +
		   		'</tbody></table></div></div><div class="col-sm-'+(12-colWidth)+'">'+detailHtml +'</div>';
	   }else{
		   totalHtml += '<div><table class="table table-bordered table-striped  detailTable"><tbody>'+ html +'</tbody></table></div>';
	   }
	   
	   var style = ' style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;" ';
	   totalHtml += '</div><div class="modal-footer">';
	   if(permissions[2]==0){
		   totalHtml += '<div class="btn blue f-p-tips" '+style+' id="'+ tableId +'-skip2EditModal" onclick="skip2EditModalG(\''+tableId+'\')">'
			+'<i class="fa fa-edit"></i><div class="f-t-tips">'+$.i18n("edit")+'</div></div>';
	   }    
	   totalHtml += '<button class="btn btn-danger" onclick="removeModal(\''+tableId+'\',\'detail\')" aria-label="Close">'+$.i18n("close")+'</button>'+
	        '</div></div></div></div>';
	   $("body").append(totalHtml);
   }
   
   
   //编辑/新增弹出窗
   function createEditDialog(tableId, type, number,agentName){
	    var tableLocal = getLocalStorageModel(tableId, "tableParams");
	    	tableItems = tableLocal.trs,
	    	tableKey = tableLocal.tableKey,
	    	i18nPrefix = tableLocal.i18nPrefix,
	    	itemsLen = tableItems.length,
	    	data = getLocalStorageModel(tableId, "queryData"),
	    	permissions = getLocalStorageModel(tableId, "permissions");
	    	tableKeyHtml = "",
	    	dataRow = eval("data["+number+"]"),
			itemHtmlArr = [];//list保存每一个itemhtml
		for(var i=0; i<itemsLen; i++){
	    	var item = tableItems[i], 
	    		name = item.name, 
	    		hideEdit = item.hideEdit,
	    		disabled = item.disabled,
	    		vali = item.vali,
	    		comType = item.comType, 
	    		comData = item.comData,
	    		columnVal = dataRow?dataRow[name]:undefined,
	    		html = "";
			//参数设置
	    	var disabledFlag = disabled && (disabled=="A"||(disabled=="E" && type=="edit")||(disabled=="N" && type=="new"));
			var hideEditFlag = hideEdit && (hideEdit=="A"||(hideEdit=="E" && type=="edit")||(hideEdit=="N" && type=="new"));
			var disabledHtml = disabledFlag? 'disabled="disabled"':"";
			var requiredHtml = item.vali.required?'<b class="ng-scope">*</b>':"";
			columnVal = (columnVal!=undefined && type=="edit")?columnVal:"";//编辑则有值，新增则无,0值正常
			columnVal = (columnVal && item.ratio)?(columnVal/item.ratio):columnVal;//倍率
			if(hideEditFlag){
				if(name == tableKey)
					tableKeyHtml = '<input type="hidden" id="'+tableId+'-tableKey-'+name+'" name="'+name+'" value="'+ dataRow[name] +'">';
		   		continue;
		   	}
			html += '<div class="form-group ng-scope"><div data-input="">'+
		    	'<label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">'+$.i18n(i18nPrefix +name)+ ':' +
		    	'<span class="required" style="color:red;width:8px;display:inline-block;margin:0 5px 0 10px;">'+
				requiredHtml +'</span></label><div class="col-sm-8" style="padding-left:0;padding-right:0;"><div class="ng-scope" id="'+tableId+'-comContent-'+name+'">';
			if(comType=="select"){
				comData = comData?comData:$.i18n(i18nPrefix + name+ ".comData");
				var rowHtml = "",
					selectedAttr = 'selected="selected"';
				for(var k=0, comLen = comData.length; k<comLen; k++){
					rowHtml += '<option value="'+ comData[k][0]+'"';//使用select2的时候好像不能用label=“text”方式表示问题，而是直接写在option标签中间
					if(columnVal!=undefined && columnVal==comData[k][0]){
						rowHtml += selectedAttr;
						selectedAttr = "";
					}
					rowHtml +='>'+ comData[k][1]+'</option>';
				}
				if("new"==type){
					if("admin"==agentName){
						html += '<select id="edit-'+tableId+'-'+ name+'" name="'+ name+'" style="width:100%;"'+
							disabledHtml + ' value="'+columnVal+'"><option value=""' + selectedAttr +'>'+ $.i18n(i18nPrefix + name+ ".help") + '</option>'+ rowHtml +'</select>';
					}else if("admin"!=agentName && "idxAgentID"==name){
						html += '<select id="edit-'+tableId+'-'+ name+'" name="'+ name+'" style="width:100%;"'+
							disabledHtml + ' value="'+columnVal+'"><option value=""' + selectedAttr +'>'+ "请选择代理商" + '</option>'+'<option value="' + agentName +'">'+ agentName + '</option>' +'</select>';
					}else if("admin"!=agentName && "idxAgentID"!=name){
						html += '<select id="edit-'+tableId+'-'+ name+'" name="'+ name+'" style="width:100%;"'+
							disabledHtml + ' value="'+columnVal+'"><option value=""' + selectedAttr +'>'+ $.i18n(i18nPrefix + name+ ".help") + '</option>'+ rowHtml +'</select>';
					}
				}else if("edit"==type){
					if("idxAgentID"==name && "admin"!=agentName){
						html += '<select id="edit-'+tableId+'-'+ name+'" name="'+ name+'" style="width:100%;"'+
							disabledHtml + ' value="'+columnVal+'"><option value=""' + selectedAttr +'>'+ "请选择代理商" + '</option>'+'<option value="' + agentName +'">'+ agentName + '</option>' +'</select>';
					}else if("idxAgentID"==name && "admin"==agentName){
						html += '<select id="edit-'+tableId+'-'+ name+'" name="'+ name+'" style="width:100%;"'+
							disabledHtml + ' value="'+columnVal+'"><option value=""' + selectedAttr +'>'+ $.i18n(i18nPrefix + name+ ".help") + '</option>'+ rowHtml +'</select>';
					}else{
						html += '<select id="edit-'+tableId+'-'+ name+'" name="'+ name+'" style="width:100%;"'+
							disabledHtml + ' value="'+columnVal+'"><option value=""' + selectedAttr +'>'+ $.i18n(i18nPrefix + name+ ".help") + '</option>'+ rowHtml +'</select>';
					}
				}
			}else if(comType=="diy"){
				
			}else{
				//日期插件
	    		var laydateHtml = "";
		    	if(vali.date){
		    		var choose = "laydateCallbackModel&|"+tableId+"&|"+name;
		    		laydateHtml = "onclick='laydate({istime: true, format: \""+ vali.dateFormat +
		    			"\",choose:\""+choose+"\"})'";
		    	}
				html += '<input type="text" id="edit-'+tableId+'-'+ name+'" name="'+ name+ '"'+disabledHtml +' value="'+columnVal+		'" placeholder="'+ $.i18n(i18nPrefix + name+ ".help")+
						'" class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched"'+ laydateHtml +'>';	
			}
			html += '</div></div></div></div>';
			itemHtmlArr.push(html);
		}
		//分左右栏
		var itemHtmlArrLen = itemHtmlArr.length;
		var halfFlag = itemHtmlArr&&itemHtmlArrLen>12?true: false,
			bigger = halfFlag?"modal-lg":"",
			halfLen = halfFlag? Math.ceil(itemHtmlArrLen/2): 0,
			totalHtml = "", itemHtmlArrTotal = "";
		itemHtmlArrTotal += halfFlag?'<div class="col-sm-6">':"";
		for(var i=0; i<itemHtmlArrLen;i++){
			itemHtmlArrTotal += itemHtmlArr[i];
			if(halfFlag && (i+1)==halfLen){
				itemHtmlArrTotal += '</div><div class="col-sm-6">';
			}
		}
		itemHtmlArrTotal += halfFlag?'</div>':"";	
		var style = ' style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;" ';
		totalHtml += '<div class="modal fade modal-primary" id="'+tableId +'-edit"  aria-hidden="true"><div class="modal-dialog '+    bigger+'">'+
	   		'<div class="modal-content"><form id="'+tableId +'-edit-form" class="form-horizontal ng-pristine ng-valid" onchange="formChangeModal()">'+
	        '<div class="modal-header"><button type="button" class="close" onclick="removeModal(\''+tableId+'\',\'edit\')"><span aria-hidden="true">&times;</span></button>'+
	        '<input type="hidden" id="'+tableId +'-editAddType" value="'+type+'" /><h4 class="modal-title" ng-class="text-success" id="'+ tableId +'-edit-header"></h4></div>'+
	        '<div class="ng-scope" style="padding-top:15px;">'+ tableKeyHtml + itemHtmlArrTotal + 
	    	'</div><div class="modal-footer " style="background-color:#FFFFFF;">';
		if(type=="edit"&& permissions[0]==0){
			totalHtml += '<div  class="btn primary f-p-tips" '+style+' onclick="skip2DetailModalG(\''+tableId+
	        	'\')"><i class="fa fa-list-alt"></i>'+'<div class="f-t-tips">'+$.i18n("details")+'</div></div>';
		}
	    totalHtml += '<button type="submit" class="btn btn-primary">'+ $.i18n("save")+'</button>'
	    	+'<a class="btn btn-danger" onclick="removeModal(\''+tableId+'\',\'edit\')">'+ $.i18n("cancel")+'</a></div>';
		$("body").append(totalHtml);
//		//对diy的处理
//		for(var i=0; i<itemsLen; i++){
//	    	var item = tableItems[i];
//	    	if(item.comType && item.comType=="diy" && item.comTypeFunc){
//	    		eval(item.comTypeFunc+"('"+ tableId +"',"+ item +","+dataRow+")");
//	    	}else if(item.comType && item.comType=="select"){
//	    		$("#"+ tableId +"-comContent-"+ item.name).select2();
//	    	}
////	    	var result = 
////	    	$("#"+tableId+ '-comContent-'+item.name).html(result);
//		}
		
		//转换原生select元素为select2控件
		for(var i=0;i<itemsLen;i++){
			var queryItem = tableItems[i],
				name = queryItem.name,
				comType = queryItem.comType;
			//modal只需要判断comType，而搜索框还需要判断advQry
			if(comType== "select"){
				$("#edit-"+ tableId +"-"+ name).select2({
					minimumResultsForSearch: 8
				});
			}
		}
   }
   
   //展示弹出框：详情/编辑/新增
   	function showDialogModel(tableId, type) {
		if(type != "detail"){
			var editModal = $("#"+ tableId+ "-edit-header");
			if(type=='edit'){
				editModal.removeClass("text-success").addClass("text-primary").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit")).val("edit");
				initEditFormValidator(tableId, "edit");
			}else if(type=='new'){
				editModal.removeClass("text-primary").addClass("text-success").html("<i class=\"fa fa-plus\"></i> "+ $.i18n("new")).val("new");
				initEditFormValidator(tableId, "new");
			}
			var $editModal = $('#'+tableId + "-edit").modal({backdrop: 'static'});
		}else{
			var $editModal = $('#'+tableId + "-detail").modal({backdrop: 'static'});
		}
		setTimeout(function () {
			$editModal.find("span.error").remove();
			$editModal.find("input.error").removeClass("error");
	  	}, 200);
   	}
   
  	//关闭窗口层——直接移除还是修改？
  	function removeModal(tableId, type, isSave) {
  		var closeModal = function(){
  			$("#"+tableId+"-"+type).modal('hide');
  	  		setTimeout(function(){
  	  			//移除的话，调用更方便些，不用再写一个修改数据的方法
  	  			$("#"+tableId+"-"+type).remove();
  	  			//似乎是一定延迟后自动移除  约500毫秒，这里最后强制移除（详情/编辑切换有可能生成几个）
  	  			$(".modal-backdrop").remove();
  	  		}, 500);
  		}
  		if(type!="detail" && !isSave && formChangeFlag){//取消按钮验证，是否改动验证？
  			layer.confirm($.i18n("frame.from.tips.confirmCancel"),function(idx){
  	  			layer.close(idx);
  	  			closeModal();
  	  		formChangeFlag = false;//reset flag
  	  		});
  		}else{
  			closeModal();
  			formChangeFlag = false;//reset flag
  		}
    }
  	//详情和编辑切换时，移除modal
  	function removeModalBetweenSkip(tableId, type){
  		$("#"+tableId+"-"+type).modal('hide');
  		setTimeout(function(){
  			$("#"+tableId+"-"+type).remove();
  		}, 500);
  	}
  	
  	//从详情到编辑
  	function skip2EditModalG(tableId){
  		removeModalBetweenSkip(tableId, "detail");
  		viewEditOrAdd(tableId, "edit");
  	}
  	//从编辑到详情
  	function skip2DetailModalG(tableId){
  		removeModalBetweenSkip(tableId, "edit");
  		viewDetail(tableId);
  	}
  	
  	var formChangeFlag = false;
  	function formChangeModal(){
  		formChangeFlag = true;
  	}
  	
  	/******************** Ajax请求 begin	@author gaoyouan ************************************
  	 * 1.删除；保存；获取提交数据；获取删除主键值；
  	 */
  	//删除请求
    function toolDelete(tableId){
    	var tableItems =  getLocalStorageModel(tableId, "tableParams");
    	var requestUrl = getLocalStorageModel(tableId, "requestUrl");
    	var params = {};
    	params.idList = deleteRowsList(tableId);
 	    layer.confirm($.i18n("frame.from.tips.confirmDel"), function (idx) {
 	    	var loadInx = layer.load(2);//打开加载圈图标
 		   $.ajax({
 		   	    url:window.PATH + requestUrl+ "delete.ajax",
 		   	    dataType:"json",
 		   	    async:true,
 		   	    data: params,
 		   	    type:"POST",
 		   	    success:function(res){
 		   	    	layer.msg.success(res.message);//message success
 		   	    	queryTableDataModel(tableId);
 		   	    	layer.close(loadInx);//关闭加载圈图标
 		   	    }, 
 		   	    error:function(){ 
 		   	    	layer.close(loadInx);
 		   	    }
 		   }); 
            layer.close(idx);//关闭弹窗
        });  
    };
    //保存请求-编辑或新增
    function toolSave(tableId, type) { 
    	var params = getSubmitData(tableId, type);
    	var requestUrl = getLocalStorageModel(tableId, "requestUrl");
    	if(params){ 
    		var loadInx = layer.load(2);//打开加载圈图标layer.close(loadInx);//关闭加载圈图标
	        $.ajax({
	    	    url: window.PATH+ requestUrl +"save.ajax",    //请求的url地址
	    	    dataType: "json",   //返回格式为json
	    	    async: true,//请求是否异步，默认为异步，这也是ajax重要特性
	    	    data: params,    //参数值
	    	    type:"POST",   //请求方式 
	    	    success:function(res){ 
	    	    	layer.msg.success(res.message);
	    	    	queryTableDataModel(tableId);
//	    	    	changeSelectRows(tableId);
	    	    	removeModal(tableId, "edit", true);
	    	    	layer.close(loadInx);//关闭加载圈图标
	    	    }, 
	    	    error:function(){  
	    	    	layer.close(loadInx);//关闭加载圈图标
	    	    }
	     	});
    	}
    }
    //获取提交数据
    function getSubmitData(tableId){
    	var param = "{";
    	var tableLocal = getLocalStorageModel(tableId, "tableParams");
    		tableItems = tableLocal.trs,
	    	itemsLen = tableItems.length,
	    	tableKey = tableLocal.tableKey,
	    	type = $("#"+tableId+"-editAddType").val(),
	    	tableKeyVal = "";
    	for(var i=0; i<itemsLen; i++){
    		var item = tableItems[i],
    			name = item.name,
    			hideEdit = item.hideEdit,
    			ratio = parseInt(item.ratio),
    			//inputVal = $("#edit-"+tableId +"-"+name).val();
    		inputVal = $("#"+ tableId+"-edit").find("[name="+name+"]").val();
    		if(name==tableKey){
    			tableKeyVal = inputVal;
    		}
			//隐藏
    		if(hideEdit && (hideEdit=="A"||(hideEdit=="E" && type=="edit")||(hideEdit=="N" && type=="new")))
    			continue;
    		//倍率
    		if(ratio && !isNaN(ratio)){
    			inputVal = inputVal*ratio;
    		}
    		param += "\""+name+"\":"+"\""+ inputVal +"\",";
    		
    	}
    	if(param !="{"){
    		if(type=="edit"){
    			//确保编辑时添加主键，重复添加也没关系，parse时会去重
    			if(!tableKeyVal){
    				tableKeyVal = $("#"+ tableId+ "-edit").find("#"+ tableId +"-tableKey-"+ tableKey).val();
    			}
    			param += "\""+ tableKey +"\":"+ "\"" +tableKeyVal+ "\",";
    			param += "\"actionName\":"+"\""+$.i18n("edit")+"\"}"; 
    		}else{

    			param += "\"actionName\":"+"\""+$.i18n("new")+"\"}";
    		}
    		param = JSON.parse(param);
    		return param;
    	}else{
    		return undefined;
    	}
    }
    //获取要删除条目的主键值
    function deleteRowsList(tableId){
 	   var checkedsubList = $("input[name*='"+tableId+"-rowItems']:checked");
 	   var deleteIds = [];
 	   for(var i=0;i<checkedsubList.length;i++){
 		   var arr = checkedsubList[i].value.split("-|-"); 
 		   deleteIds[i]= arr[0]; 
 	   }  
 	   return deleteIds;
    }
	/*******************************	Ajax请求	@author gaoyouan	end	*******************************************/	
    
   
    /****************************** 中英文，验证提示语 模仿mycommen.js begin @author gaoyouan @date 2016.6.16**************************/
    var tableValidator_zh_CN ={
    	    "notEmpty": "必选字段",
    	    "remote": "请修正该字段",
    	    "emailAddress": "请输入正确格式的电子邮件",
    	    "uri": "请输入合法的网址",
    	    "date": "请输入合法的日期",
//    	    "dateISO": "请输入合法的日期 (ISO).",
    	    "numeric": "请输入合法的数字",
    	    "integer":"只能输入整数（包括0，正整数和负整数）",
    	    "decimals": "小数位不能超过{0}位数",
    	    "authNum": "鉴权数量过载：剩余{0}，可鉴权总数{1}",
    	    "authUrlFormat" : "URL格式：协议(仅支持http和https)+地址+端口号(可省略)，英文冒号分隔",
    	    "digits": "只能输入整数(0和正整数)",
    	    "creditcard": "请输入合法的信用卡号",
//    	    "equalTo": "请再次输入相同的值",
//    	    "accept": "请输入拥有合法后缀名的字符串",
//    	    "maxlength": "请输入一个长度最多是 {0} 的字符串",
//    	    "minlength": "请输入一个长度最少是 {0} 的字符串",
    	    "stringLength": "请输入一个长度介于 {0} 和 {1} 之间的字符串",
    	    "between": "请输入一个介于 {0} 和 {1} 之间的值",
    	    "lessThan": "请输入一个最大为 {0} 的值",
    	    "greaterThan": "请输入一个最小为 {0} 的值",
    	    "regexp":"输入值不符合正则表达式"
    }

    var tableValidator_en_US ={
    	    "notEmpty": "This field is required.",
    	    "remote": "Please fix this field.",
    	    "emailAddress": "Please enter a valid email address.",
    	    "uri": "Please enter a valid URL.",
    	    "date": "Please enter a valid date.",
//    	    "dateISO": "Please enter a valid date ( ISO ).",
    	    "numeric": "Please enter a valid number.",
    	    "integer":"Please enter only integer.",
    	    "decimals": "Decimal places, no more than {0} digits",
    	    "authNum": "鉴权数量过载：剩余{0}，可鉴权总数{1}",
    	    "authUrlFormat" : "URL格式：协议(仅支持http和https)+地址+端口号(可省略)，英文冒号分隔",
    	    "digits": "Please enter only digits.",
    	    "creditcard": "Please enter a valid credit card number.",
//    	    "equalTo": "Please enter the same value again.",
//    	    "accept": "Please enter a string with a legitimate suffix",
//    	    "maxlength":  "Please enter no more than {0} characters." ,
//    	    "minlength":  "Please enter at least {0} characters." ,
    	    "stringLength":  "Please enter a value between {0} and {1} characters long." ,
    	    "between":  "Please enter a value between {0} and {1}." ,
    	    "lessThan": "Please enter a value less than or equal to {0}." ,
    	    "greaterThan":  "Please enter a value greater than or equal to {0}.",
    	    "regexp": "The value you enter donesn't match the regexp. "
    }

    /****************************** 中英文，验证提示语 end **************************/


     
    /**********************************	表格commonUtils公共方法	begin	@author gaoyouan	**********************************************/
    /**
 	 * 本地存储
 	 * @param tableId
 	 * @param keyWord
 	 * @param data
 	 * @type isUpdate 0/undefined: update; 1: stay
 	 * 			即：当数据存在，并且isUpdate=1时，不更新
 	 */
 	function setLocalStorageModel(tableId, keyWord, data){
 		var storage = window.localStorage; 
 		var KEY_WORD = "config."+ keyWord +"."+tableId;
 		if(typeof data == "string"){
 	 		 storage.removeItem(KEY_WORD);
 	 		 storage.setItem(KEY_WORD, data); 
	 	}else if(typeof data == "object"){
	 		 storage.removeItem(KEY_WORD);
	 		 storage.setItem(KEY_WORD, JSON.stringify(data)); 
	 	}
 	}
    
    function checkAndSetLocalStorageModel(tableId, keyWord, data){
    	var oddLoc = getLocalStorageModel(tableId, keyWord).trs;
    	if(oddLoc){
    		var newLoc = data.trs,
	    		oddLen = oddLoc.length,
	    		newLen = newLoc.length,
	    		finalTrs = newLoc;
    		for(var i=0;i<oddLen;i++){
    			var oddItemName = oddLoc[i].name; 
    			for(var j=0;j<newLen;j++){
    				if(oddItemName == newLoc[j].name && newLoc[j].comData){
    					//仅更新data
    					oddLoc[i].comData = newLoc[j].comData;
    					break;
    				}
    			}
    		}
    		data.trs = oddLoc;
 		}
    	setLocalStorageModel(tableId, keyWord, data);
    }
 	
 	function getLocalStorageModel(tableId, keyWord){
 		var KEY_WORD = "config."+ keyWord +"."+tableId;
		var storage = window.localStorage; 
		var data = storage.getItem(KEY_WORD);
		if(data!=null && data!=""){
			if(data.indexOf("{")!=-1 || data.indexOf("[") !=-1 ){//偏方:数组和对象就解析，字符串不解析
				data = JSON.parse(data);
			}
			return data;
		} 
		return "";//有时需要返回空的数组[]，需要另外处理
 	}
    
    /**
     * tab页面/工具栏的显示/隐藏
     * @param	tabId:	tab页面的容器ID
     * @param	toolsId：	工具栏容器ID
     * @param	tabBtnId:	tab页面标签按钮的ID
     * @return undefined
     * @author Administrator
     * @NOTICE 各jQuery元素的ID：
     * 		tab按钮ID:flag-tabs-btn； 工具栏ID: flag-tools； tab页面ID：flag-tabs；
     */
	/* switchTabAndTools('simPDevNewTab1','')
	 * "vswExchangeSerTab2", "vswExchangeSerTool2", "vswExchangeSerBtn2" */
	function switchTabAndTools(tabId, toolsId, tabBtnId){
		$(".flag-tools").hide();
		$(".flag-tabs").hide();
		if(tabId)
			$("#"+tabId).show();
		if(toolsId)
			$("#"+toolsId).show();
		if(tabBtnId){//适配“更多”按钮
			$(".flag-tabs-btn").removeClass("active");
			$("#"+tabBtnId).addClass("active");
		}
//		var flag = $("#"+tabId+"-flag");
//		if(!flag && flag.length=0){
//		}
	}
     
    /**
     * TOP排名
     * @param tops 结果集，需要转换结果集，固定键值对为：keyWord keyValue
     * @param styleClass css样式类，主要设置每行的高度
     * @param tabId/toolsId/tabBtnId:	switchTabAndTools方法的三个参数，用于更多按钮点击时切换tab页面。
     * @returns {String}
     */
 	function getTopRankHtml(tops, styleClass, tabId, toolsId, tabBtnId){
    	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
        for(var i = 0; i<tops.length; i++){
        	topDivHtml +="<li class=\"order-item\"><div class=\"row "+ styleClass +"\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
        	topDivHtml +=tops[i].keyWord+"</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
        	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
        	topDivHtml +="</span></div></div></div></li>";
        }
        for ( var i = tops.length; i < 10; i++) {
        	topDivHtml +="<li class=\"order-item\"><div class=\"row "+ styleClass +"\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
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
 	
 	/**
 	 * 查找comdata中value值的别名，转换显示格式
 	 * @param i18nComdataKey	国际化字段comdata的key值
 	 * @param value	匹配comdata的value
 	 * @returns
 	 * 		matchComdata2Alias：数据来源于国际化字段comdata，返回别名值
 	 * 		matchServiceData2Alias：数据来源于service，返回别名值
 	 */
 	var matchComdata2Alias = function(i18nComdataKey,value){
 		var tipsData = $.i18n(i18nComdataKey),
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
 	var matchServiceData2Alias = function(data, value){
		var len = data.length,
			tipVal = "";
		for(var i=0;i<len; i++){
			var tipData = data[i];
			if(tipData[0] == value){ 
				tipVal = tipData[1];
				break;
			}
		} 
		return tipVal;
 	}
 	var comData2SelectHtml = function(data){
 		if(!data) 
 			return "";
 		var len = data.length,
 			html = "";
 		for(var i=0;i<len;i++){
 			html += "<option value=\""+data[i][0]+"\">"+data[i][1]+"</option>";
 		}
 		return html;
 	}
 	var valFormat_int2time = function(value){
 		var formatTime = function(time){
 			if(time<10)
 				time = "0"+time;
 			return time;
 		}
 		value = parseInt(value);
 		if(value || value==0){
 			if(value<60){
 				value = "00:00:" +formatTime(value);
 			}else if(value<3600){
 				var min = parseInt(value/60);
 				var sec = value%60;
 				value = "00:"+ formatTime(min) +":" +formatTime(sec);
 			}else{
 				var hour = parseInt(value/3600),
 					hourN = value%3600,
 					min = parseInt(hourN/60),
 					sec = hourN%60;
 				value = formatTime(hour)+":"+formatTime(min) +":"+formatTime(sec);
 			}
 		}
 		return value;
 	}
 	
    /**
     * jQuery判断空对象的方法
     * @param e object
     * @returns {Number} 
     */
    function isEmptyObject(e) {  
 	    var t;  
 	    for (t in e)  
 	        return !1;  
 	    return !0  
 	}
    
    /**
     * 上传下载
     * 导出csv文件的方法，来源于../../assets/js/utils/commonUtils
     * @param name
     * @param data
     * @returns
     */
    function importCsvModel(tableId){
    	var $this = $("#"+ tableId +"_importCsv");
    	$this = $this? $this[0] : undefined;
		if ($this.files.length) {
			var reader = new FileReader();
			reader.onload = function () {
				var csvStr = this.result;
				checkDevCsvFile(csvStr, tableId) && importCsvRequest(csvStr, tableId);
			};
			reader.readAsText($this.files[0]);
		}
		//重置change事件
		$("#"+ tableId +"_importCsv").replaceWith($("#"+ tableId +"_importCsv").clone(true));
    }
    function importCsvRequest(csvStr, tableId) {
    	var requestUrl = getLocalStorageModel(tableId, "requestUrl");
		$.ajax({
			url: window.PATH + requestUrl + "/importCsv.ajax",
			type:"post",
			data: { csvStr: csvStr },
			success: function() {
				//return dosearch8('1'); //查询列表  
			},error: function(){
				
			}
		});
	}
	//vifidevicenew 单独用的方法，还需要抽象出来
	function checkDevCsvFile(csvStr, tableId) {
		var tbI18n = getLocalStorageModel(tableId, "tableParams").i18nPrefix;
		var CVS_HEAD = "keyDevID,idxViFiID,alaisName,idxAgentID,remark", //需要导入的字段
		CVS_HEAD_LEN = 5;
		var csvRows = csvStr.split(/\r\n|\r|\n/);

		var csvRow1 = csvRows[0] || "";
		if (csvRow1 != CVS_HEAD) {
			layer.msg.error("csv data error, title = " + CVS_HEAD);
			return false;
		}
		for (var i = 1; i < csvRows.length; i++) {
			var csvRow = csvRows[i];
			var row = csvRow.split(",");
			if(",,,,,,,,,," == row || row ==""){
				continue;
			}
			if (row.length != CVS_HEAD_LEN && row.length != 1) {
							layer.msg.error("csv data error, data line:" + (i + 1) + " error :" + csvRow + ",row len" + row.length);
							return false;
			}
			//VNS 服务器
			//var vnsSelData = selectPermissionsInfo.vnsSelData;
			//if (isRowBoolean(vnsSelData, row[4])) {
			//				layer.msg.error("csv data error, data line:" + (i + 1) + " error : idxVNSID");
			//				return false;
			//}
			//状态
			var i18nTextQryType = $.i18n(tbI18n + "devState.comData");
			//if (isRowBoolean(i18nTextQryType, row[5])) {
			//				layer.msg.error("csv data error, data line:" + (i + 1) + " error : devState");
			//				return false;
			//}
			//代理商
			//var agentSelData = selectPermissionsInfo.agentSelData;
			//if (isRowBoolean(agentSelData, row[6])) {
			//				layer.msg.error("csv data error, data line:" + (i + 1) + " error : idxAgentID");
			//				return false;
			//}
			//硬件版本
			//var hardwareVerSelData = selectPermissionsInfo.hardwareVerSelData;
			//if (isRowBoolean(hardwareVerSelData, row[8])) {
			//				layer.msg.error("csv data error, data line:" + (i + 1) + " error : hardwareVer");
			//				return false;
			//}
			//固件版本
			//var firmwareVerSelData = selectPermissionsInfo.firmwareVerSelData;
			//if (isRowBoolean(firmwareVerSelData, row[9])) {
			//				layer.msg.error("csv data error, data line:" + (i + 1) + " error : firmwareVer");
			//				return false;
			//}
			//系统版本
			//var softwareVerSelData = selectPermissionsInfo.softwareVerSelData;
			//if (isRowBoolean(softwareVerSelData, row[10])) {
			//				layer.msg.error("csv data error, data line:" + (i + 1) + " error : softwareVer");
			//				return false;
			//}
		}
		return true;
	}
	/* setData[i][0] 代表这个数组 第i个数组中的第一个字母 */
	function isRowBoolean(setData, rowVal) {
		var flag = true;
		try {
			if (setData != null) {
				for (var i = 0; i < setData.length; i++) {
					if (setData[i][0] == rowVal) {
						flag = false;
						break;
					}
				}
			}
		} catch (e) {}
		return flag;
	}
    function exportTempCsvModel(tableId){
		var requestUrl = getLocalStorageModel(tableId, "requestUrl");
		$.ajax({
			url: window.PATH +requestUrl + "exportTempCsv.ajax",
			type:"post",
			success: function(res) {
				return exportRowModel('uuwifiDev' + new Date().format("yyyy-MM-dd_HH_mm_ss") + '.csv', res.data);
			}
		});	
	}
	function exportCsvModel(tableId){
		var requestUrl = getLocalStorageModel(tableId, "requestUrl");
		$.ajax({
			url: window.PATH +requestUrl + "exportCsv.ajax",
			type:"post",
			success: function success(res) {
				return exportRowModel('uuwifiDev' + new Date().format("yyyy-MM-dd_HH_mm_ss") + '.csv', res.data);
			}
		});
	}
	var exportRowModel = function (name, data) {
	    var urlObject = window.URL || window.webkitURL || window;
	    var exportBlob = new Blob(["\ufeff" + data], {type: 'text/csv,charset=UTF-8'});
	    var saveLink = document.createElementNS("http://www.w3.org/1999/xhtml", "a");
	    saveLink.href = urlObject.createObjectURL(exportBlob);
	    saveLink.download = name;
	    fakeClickModel(saveLink);
	};
	function fakeClickModel(obj) {
	    var ev = document.createEvent("MouseEvents");
	    ev.initMouseEvent(
	        "click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null
	    );
	    obj.dispatchEvent(ev);
	}
	
	 /**
	 * laydate日期控件回调
	 * @param 
	 */
   function laydateCallbackModel(tableId, fieldName){
	   $("#"+ tableId+"-edit-form").data("bootstrapValidator").resetForm().validateField(fieldName);
   }
   
   /**
    * 用key获得selData的值
    * @param selData  selData 的二位数组
    * @param key   [["0",""],["1","使用中"],["2","无卡"],["3","SIM卡故障"]]
    */
   var getListKeyValue = function (selData, key) {
       //if (!_.isArray(selData)) throw new Error("selData 需要是一个有2个元素的数组!!");
       for (var i = 0; i < selData.length; i++) {
           var obj = selData[i];
           if (obj[0] === key) {
               return obj[1];
           }
       }
       return null;
   };
   

   /**
    * 调整列宽，有待优化
    * 这里有几个全局变量
    */
   var tableIsDown = false;
   var tableIsDraggle  = false;
   var tableStartLeft = 9999;
   var tableResizeWidth = 0;
   var tableStartColumnName = "";
   function thOnMouseDownModel(tableId,columnName){
   	if(!tableIsDraggle)return;
   	var $table = $("#"+tableId), 
   		$body = $("body"),
   		$drpLine = $("#datagrid-resize-proxy");
   	var top = $table.offset().top,
   		left = event.clientX,
   		height = $table.height();
   	tableStartLeft = left;
   	tableStartColumnName = columnName;
   	tableIsDown = true;
   	$drpLine.attr("style","display: block; height: "+height+"px; left: "+left+"px; top: "+top+"px;");//show().css()
   	// 按下 禁止选择文本
       $body.css({"-moz-user-select": "none", "-webkit-user-select": "none", "user-select": "none"});
   }
   
   function thOnMouseMoveModel(tableId){
   	
   	tableIsDraggle = event.offsetX > event.target.offsetWidth - 4 && event.target.localName == "th";
       event.target.style.cursor = tableIsDraggle ? 'col-resize' : 'default';
   	if (tableIsDown) {
   		var $drpLine = $("#datagrid-resize-proxy");
       	var th_width = $("#th-"+tableId+ "-" +tableStartColumnName).width() - 7;
   		tableResizeWidth = event.clientX - tableStartLeft + th_width;
           if (tableResizeWidth > 80) {
               $drpLine.css("left", event.clientX + 4);//避免挡住
           }
       }
   }
   
   function thOnMouseUpModel(tableId){
   	if(!tableIsDown ) return;
       if(tableResizeWidth<80){
       	tableResizeWidth = 80
       }
       var tableItems = getLocalStorageModel(tableId, "tableParams"),
       	items = tableItems.trs,
       	len = items.length;
       for(var i=0;i<len; i++){
       	var name = items[i].name;
       	if(name==tableStartColumnName){
       		items[i].width = tableResizeWidth;
       		tableItems.trs = items;
       		setLocalStorageModel(tableId, "tableParams",tableItems);
       		showDataModel(tableId);
       	}
       }
       var $body = $("body");
   	var $drpLine = $("#datagrid-resize-proxy");
       $drpLine.hide();
       // 抬起 恢复选择文本
       $body.css({"-moz-user-select": "text", "-webkit-user-select": "text", "user-select": "text"});
       tableIsDown = false;
   	tableIsDraggle = false;
       tableStartLeft = 9999;
       tableResizeWidth = 0;
       tableStartColumnName = "";
   }
   
   /**
    * bootstrapvalidator 创建校验工具方法
    *  NOTICE: validators 而不是validator 
    *  @param	tableId
    *  @param	type
    *  @param submitFunction 静态页面的校验，额外传递一个提交的方法
    */
   //模板构建校验的方法
   function initEditFormValidator(tableId, type,submitFunction){
	   //初始化验证表单之后 var a = $(form).data("bootstrapValidator"); a.resetForm(); 或 $(form).bootstrapValidator(methodName, parameters);
	   var tableItems = getLocalStorageModel(tableId, "tableParams").trs,
	   	   itemLen = tableItems.length,
	   	   fieldObj = createValidator(tableId, type);
	   //初始化编辑框验证表单
	   $('#'+ tableId+ "-edit-form").bootstrapValidator({ 
           excluded: [':disabled'],
           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
           },
           submitHandler: function (validator, form, submitButton) {
        	   toolSave(tableId, type); 
           },   
           fields: fieldObj
	   });
   }
   //创建验证器的fields部分
   function createValidator(tableId, type){
	   var tableItems = getLocalStorageModel(tableId, "tableParams").trs,
	   	   itemLen =  tableItems.length,
	   	   fields = {},
	   	   //validator_language = (window.LANGUAGE && window.LANGUAGE == "zh_CN")?"zh_CN" :"en_US";
	   	   languageObj = (window.LANGUAGE && window.LANGUAGE == "zh_CN")? tableValidator_zh_CN: tableValidator_en_US;
	   for(var i=0; i<itemLen; i++){
		   var item = tableItems[i],
		       name = item.name,
		       vali = item.vali,
		       hideEdit = item.hideEdit;
		   if(hideEdit && (hideEdit=="A"||(hideEdit=="E" && type=="edit")||(hideEdit=="N" && type=="new"))){
			   continue;
		   }
		   var validator = {};
		   if(!(vali && vali.required===false)){
			   validator.notEmpty = {};
			   validator.notEmpty.message = languageObj.notEmpty;//eval('tableValidator_'+validator_language+'.notEmpty');
		   }
		   if(vali){
			   if(vali.emailAddress){
				   validator.emailAddress = {};
				   validator.emailAddress.message = languageObj.emailAddress;
			   }
			   if(vali.uri){
				   validator.uri = {};
				   validator.uri.message = languageObj.uri;
			   }
			   if(vali.date){
				   var dateFormat = vali.dateFormat?vali.dateFormat:"YYYY-MM-DD hh:mm:ss";
				   validator.date = {};
				   validator.date.message = languageObj.date;
				   validator.date.format = dateFormat;
			   }
			   if(vali.stringLength){
				   //如果只有一个值，则当做最大值
				   var min = vali.stringLength[0]?vali.stringLength[0]:0,	max = vali.stringLength[1]?vali.stringLength[1]:vali.stringLength;
				   if(min || max){
					   var stringLength = {};
					   stringLength.max = max;
					   stringLength.min = min;
					   stringLength.message = languageObj.stringLength.replace("{0}",min).replace("{1}",max);
					   validator.stringLength = stringLength;
				   }
			   }
			   if(vali.between){
				   var min = vali.between[0]?vali.between[0]:0,	max = vali.between[1]?vali.between[1]:vali.between;
				   if(min || max){
					   var between = {};
					   between.max = max;
					   between.min = min;
					   between.message = languageObj.between.replace("{0}",min).replace("{1}",max);
					   validator.between = between;
				   }
			   }
			   if(vali.greaterThan){
				   var greaterThan = {};
				   greaterThan.value = vali.greaterThan;
				   greaterThan.inclusive = true;
				   greaterThan.message = languageObj.greaterThan.replace("{0}",vali.greaterThan);
				   validator.greaterThan = greater;
			   }
			   if(vali.lessThan){
				   var lessThan = {};
				   lessThan.value = vali.lessThan;
				   lessThan.inclusive = true;
				   lessThan.message = languageObj.lessThan.replace("{0}",vali.lessThan);
				   validator.lessThan = lessThan;
			   }
			   if(vali.between || vali.numeric || vali.greaterThan ||vali.lessThan){
				   validator.numeric = {};
				   validator.numeric.message = languageObj.numeric;
			   }
			   if(vali.digits){
				   validator.digits = {};
				   validator.digits.message = languageObj.digits;
			   }
			   if(vali.integer){
				   validator.integer = {};
				   validator.integer.message = languageObj.integer;
			   }
			   if(vali.creditCard){
				   validator.creditCard = {};
				   validator.creditCard.message = languageObj.creditCard;
			   }
			   if(vali.remote){
			   }
			   if(vali.regexp){
				   validator.regexp = {};
				   validator.regexp.regexp = vali.regexp;
				   validator.regexp.message = languageObj.regexp;
			   }
			   if(vali.decimals){
				   validator.decimals = {};
				   validator.decimals.message = languageObj.decimals.replace("{0}", vali.decimals);
				   validator.decimals.digits = vali.decimals;
			   }
			   if(vali.authNum){
				   validator.authNum = {};
				   var remain = vali.authNum[0]? vali.authNum[0] : 0;
				   var total = vali.authNum[1]? vali.authNum[1] : 0;
				   validator.authNum.message = languageObj.authNum.replace("{0}", remain).replace("{1}", total);
				   validator.authNum.remain = remain;
				   validator.authNum.sum = total;
			   }
			   if(vali.authUrlFormat){
				   validator.authUrlFormat = {};
				   validator.authUrlFormat.message = languageObj.authUrlFormat;
			   }

		   }
		   if(validator && !isEmptyObject(validator)){
			   var field = {};
			   //单个的表单元素除了validator还有其他一些可用成员。例如：enabled: true,message: 'This value is not valid',container: null,selector: null,trigger: null,
			   field.message = "default error message.";
			   field.validators = validator;
			   fields[name] = field;
		   }
	   }
	   return fields;
   }
   

	/**
	 * jquery ajax的一点儿小包装:来源于commonUtils
	 * @param param jquery 一样的 对象参数, 不设置则包装方法默认的参数
	 * @returns {{state: string}|*}
	 */
	function Utils_ajax(param) {
	    var loadInx = layer.load(2);
	    $.ajax({
	        url: param.url,
	        type: param.type || "post",
	        timeout: param.timeout || 20000, //超时时间设置，单位毫秒
	        complete: param.complete || function (XMLHttpRequest, status) { //请求完成后最终执行参数
	            ajaxComplete(XMLHttpRequest, status, loadInx);
	        },//请求完成后最终执行参数
	        data: param.data || {},
	        contentType: param.contentType, //设置请求头信息
	        dataType: param.dataType || "json",
	        success: function (res) {
	            try {
	                if (res.state != 0)
	                    return layer.msg.error("error:" + res.message);
	            } catch (e) {
	            }
	            if (param.success) param.success(res);
	            res.message && layer.msg.success(res.message);
	        }
	    });
	};
	function ajaxComplete(XMLHttpRequest, status, loadInx) {
	    layer.close(loadInx);
	    if (status != 'success') {
	        status = status == 'timeout' ? '网络超时...' : status;
	        layer.msg.error(status);
	        var isIntoLoginPage = status == "parsererror" && XMLHttpRequest.responseText.indexOf("login-container");
	        if (isIntoLoginPage) {
	            location.href = window.PATH + "/login"
	        }
	        console.error(arguments)
	    }
	}

 	
 	/**********************************	表格commonUtils公共方法	end	@author gaoyouan	**********************************************/
