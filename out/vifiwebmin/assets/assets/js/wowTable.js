

/* copyright @gya
 * 基础表格插件
 * 1.基础功能
 * 	表格数据/ 数据转换/ 列头点击排序/ 分页/
 *
 * 2.扩展功能
 *  设置按钮（）
 * 
 *  默认详情按钮和界面/ 
 *  默认新增
 *  默认编辑
 *  默认删除
 *  
 * 
 * 	//支持默认展示方式，和自定义拓展
 * 
 * 3.tips
 * 
 * 4.测试，待定
 * 		1.勾选一行或者多行：回调函数，
 * 		2.数据
 * 		数据存储的方式模仿 bootstrapvalidator插件
 * 		初始化返回WowTable实例
 * 		instance存储在$.元素的data属性上，instance包括需要的数据
 * 		3.WOWTABLE instance
 * 		
 * 		
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * */

!(function($){
	//严格模式，函数内的this不指向外部
	//"use strict";
	//var that = this;
	
	//面向对象
	var WowTable = function(element, options){
		this.$element = $(element);
		//为什么使用{}空对象作为第一个元素，因为不影响DEFAULT_OPTIONS的值
		//由于options函数层次结构深，需要深度拷贝
		//options = $.extend(true ,{}, WowTable.DEFAULT_OPTIONS, options);
		//options参数: 初始化 & 备份
		
		this.options = this.optionsBackup = this._extendDefaults(options);
		
		
		this._init();
	}
	
	WowTable.DEFAULT_OPTIONS = {
		tableKey: 	"",
		i18nPrefix: "",
		requestUrl: "",
 		//仅default 
		columnsDefaults: {
 			name: 		"default",
 			width: 		120,
 			show: 		true,
 			vali: {
 				required:		true,
 				dateFormat:		"YYYY/DD/MM hh:mm:ss"
 			},
 			comType: "text"
 		}
	}
	
	WowTable.log = function(position, message, type){
		if(type && type=="warn"){
			console.warn("WOWTABLE | Function Name: "+ position +" | Message: "+ message);
		}else if(type && type=="error"){
			console.error("WOWTABLE | Function Name: "+ position +" | Message: "+ message);
		}else{
			console.log("WOWTABLE | Function Name: "+ position +" | Message: "+ message);
		}
	}
	
//	var simPDevNewItems = {tableKey: "keySimPDevID", i18nPrefix:"db.tbSimPDev.", expandDetail:"simPDevNew_expandDetail",trs:[
// 		{name:"keySimPDevID", width:"90",show:false, advQry:["LIKE"], hideEdit:"E",vali:{stringLength:64}},			
// 		{name:"devName", width:"130", advQry:["LIKE"],vali:{stringLength:128}},
// 		{name:"idxSimPDevGrpID", width:"130",vali:{integer:true,stringLength:64},comType:"select",comData:g_var.view.simpDevGrpData},
// 		{name:"typeName", width:"100",vali:{stringLength:64}, advQry:["LIKE"],comType:"select", comData: [["Simpool 128", "Simpool 128"], ["Simpool 256", "Simpool 256"]]},//, comType:"select"
// 		{name:"username", width:"130",vali:{stringLength:64}},
// 		{name:"password", width:"70", show:false, vali:{stringLength:64}},
// 		{name:"expire", width:"90", vali:{integer:true,stringLength:9}},//11位数字报错，原因不明
// 		{name:"lastUpdate", width:"125", hideEdit:"A"},
// 		{name:"ipaddr", width:"90", advQry:["LIKE"], hideEdit:"A"},
// 		{name:"port", width:"90", hideEdit:"A", hideEdit:"A"},
// 		{name:"status", width:"90", advQry:["LIKE"], comType:"select", hideEdit:"A",valFormat:"simPDevNew_status_valFormat"},
// 		{name:"ports", width:"90", advQry:["LIKE"], vali:{integer:true,stringLength:9}},
// 		{name:"idxVSWID", width:"140",vali:{stringLength:30}, advQry:["LIKE"],comType:"select",comData:g_var.view.vswSelData},//, comType:"select"
// 		{name:"remarks", width:"128", show:false, vali:{required:false,stringLength:128}},
// 		{name:"mdfTm", width:"125", hideEdit:"A", hideEdit:"A"},
// 		{name:"mdfBy", width:"125", show:false, hideEdit:"A"},
// 		{name:"crtTm", width:"125", show:false, hideEdit:"A"},
// 		{name:"crtBy", width:"125", show:false, hideEdit:"A"}
// 		
// 	]}
//	//新
//	var items = {
//		tableKey: "",
//		i18nPrefix: "",
//		requestUrl: ""
//		columns: {
//			{name: "", .....},
//			...
//		}
//	}

	
	
	
	/*
	 * 1."_"下划线开头的方法约定为私有方法，其他为public方法
	 * 
	 */
	WowTable.prototype = {
		/****************************	"_"开头,私有方法	***********************************/
		_init: function(){
			//table容器
			//initTableBaseHtml(tableId, toolsAreaId, requestUrl,isImportAndExport);
			//初始化表格位置
			//initTablePositionModel(tableId);
			//初始化表格实体内容 & 初始化表格设置
			//initTableContentAndSetting(tableId, page);
			console.log("success:" + this.options);
		},
		
		//似乎没法直接用$.extend方法合并，因为字段列数量不确定,无法用深度copy
		_extendDefaults: function(options){
			
			if(!options || !options.columns || options.columns.length==0){
				WowTable.log("_extendDefaults", "options or options.columns is undefined/invalid !", "error");
			}
			var columns = 			options.columns,
				defaults = 			WowTable.DEFAULT_OPTIONS,
				columnsDefaults = 	defaults.columnsDefaults,
				newColumns = 		[];
			
			options.tableKey = options.tableKey?options.tableKey:defaults.tableKey;
			
			for(var i=0,len=columns.length; i<len; i++){
				var column = columns[i],
					vali = column.vali,
					width = column.width;
				column.show = !(column.show===false)? true: false;
				column.width = !width || isNaN(Number(width)) ? columnsDefaults.width : width;
				column.comType = column.comType ? column.comType : columnsDefaults.comType;
				//校验
				column.vali = vali ? vali : {};
				column.vali.required = vali.required===false ? false : true;
				column.vali.dateFormat  = vali.date && (!vali.dateFormat) ? columnsDefaults.vali.dateFormat : vali.dateFormat;
				//disabled="A",适用于表格主键自增长的情况
//				if(item.name == tableKey	&&(!item.hideEdit) &&(!item.disabled)){
//					item.disabled = "E";
//				}
				newColumns.push(column);								
			}
			options.columns = newColumns;
			return options;
		},
		
		_initBaseContainer:	function(){
			var contentId = "";
			var table = "";
			//是否有内容的标识
			//var table = '<input type="hidden" id="'+contentId +'-flag" value=1/>';
			//搜索条件区域： 这里仅添加一个区域容器 
			//table += '<div class="collapse" id="'+contentId+'-searchArea"></div>';
			//表头table，添加了style  容器添加了高度
			
			
			
			table += '<div class="data-thead wowtable-cols-container-' +
				//'style="height:36px;background-color: #F7F7F7;border-top: 1px solid #ddd;border-bottom: 1px solid #00A2E9;"' +
				//'onmousemove="thOnMouseMoveModel(\''+contentId+'\')"'+'onmouseup="thOnMouseUpModel(\''+contentId+'\')"'+ 
				'>'+ '<table class="table table-bordered" style="width:auto;">' +
				'<thead class="flip-content"><tr class="wowtable-thead-tr"></tr></thead></table></div>';
	        //表实体
			table += '<div class="data-tbody'+
				'onmousemove="thOnMouseMoveModel(\''+contentId+'\')"'+'onmouseup="thOnMouseUpModel(\''+contentId+'\')"'+'>'
				+'<div><table class="table table-bordered table-hover table-striped" style="width:auto;">'
				+'<tbody class="page-data-tbody" id="'+contentId+'-body"></tbody></table></div></div>';
			//表分页控件
			table += '<div class="row foot-tools" id="'+contentId+'-foot" style="height:45px;"><div class="pull-right table-page-tools position-relative">'
				+ '<div class="pagetools" id="'+contentId+'-footBody"></div><select id="'+contentId+'-footPop" onchange="changePagesizeModal(\''+contentId+'\')" class="form-control">'
				+ '<option label="25" value="25">25</option><option label="50" value="50">50</option><option label="100" value="100">100</option>'
				+ '</select></div></div>';
			$("#"+contentId).append(table);
		},
		
		
		/************************************ API *********************************/
		getSelectedRows: {
			
		}
	}
	
	//function InitTableMoudle(tableId, toolsAreaId, requestUrl, params, permissions, page,isImportAndExport,isAddSearchContent){ }
	
	
	
	/*********************************************  API ***********************************************/
	
	/**	extend的2种用法	
	 * 1.拓展函数，只有一个参数
	 * $.fn.extend({ name =function(){} });
	 * 等同于：$.fn.name = function(){};
	 * 
	 * 2.合并参数，合并对象，有多个参数
	 * var a = $.extend({}, defaults, options);
	 * $.extend会将多个
	 
	 	$.fn.extend(
		{
			wowtable = function(options, undefined){
				
			}
		}
		);
	 */	
	$.fn.wowtable = function(options, undefined){
		//目前仅支持一个元素
		if(this && this.length>1){
			WowTable.log("$.fn.wowtable", "element length != 1", "error");
			return undefined;
		}
		//each函数返回的是原集合
		return this.each(function() {
			var $this = $(this),
				data = $this.data("wowtable");
				options = typeof options == "object" && options
			if(!data){
				data = new WowTable(this, options);
				$this.data("wowtable", data);
			}
		});
	};
	
	//可以将默认值暴露给用户
	//是否可行
	//$.fn.wowtable.defaults = {};
//	$.fn.wowtable.searchWidget = function(element, options){
//	}
//	$.fn.wowtable.publicWidget = function(){
//	}
	
})(jQuery);
 	
 	
 	
 	
 		