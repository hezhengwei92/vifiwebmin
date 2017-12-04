/** **************************** 中英文，验证提示语 begin ************************* */
var validator_zh_CN = {
	"required" : "必选字段",
	"remote" : "请修正该字段",
	"email" : "请输入正确格式的电子邮件",
	"url" : "请输入合法的网址",
	"date" : "请输入合法的日期",
	"dateISO" : "请输入合法的日期 (ISO).",
	"number" : "请输入合法的数字",
	"decimals" : "小数位,不能超过{0}位数",
	"digits" : "只能输入整数",
	"creditcard" : "请输入合法的信用卡号",
	"equalTo" : "请再次输入相同的值",
	"accept" : "请输入拥有合法后缀名的字符串",
	"maxlength" : "请输入一个长度最多是 {0} 的字符串",
	"minlength" : "请输入一个长度最少是 {0} 的字符串",
	"rangelength" : "请输入一个长度介于 {0} 和 {1} 之间的字符串",
	"range" : "请输入一个介于 {0} 和 {1} 之间的值",
	"max" : "请输入一个最大为 {0} 的值",
	"min" : "请输入一个最小为 {0} 的值"
}

var validator_en_US = {
	"required" : "This field is required.",
	"remote" : "Please fix this field.",
	"email" : "Please enter a valid email address.",
	"url" : "Please enter a valid URL.",
	"date" : "Please enter a valid date.",
	"dateISO" : "Please enter a valid date ( ISO ).",
	"number" : "Please enter a valid number.",
	"decimals" : "Decimal places, no more than {0} digits",
	"digits" : "Please enter only digits.",
	"creditcard" : "Please enter a valid credit card number.",
	"equalTo" : "Please enter the same value again.",
	"accept" : "Please enter a string with a legitimate suffix",
	"maxlength" : "Please enter no more than {0} characters.",
	"minlength" : "Please enter at least {0} characters.",
	"rangelength" : "Please enter a value between {0} and {1} characters long.",
	"range" : "Please enter a value between {0} and {1}.",
	"max" : "Please enter a value less than or equal to {0}.",
	"min" : "Please enter a value greater than or equal to {0}."
}

/** **************************** 中英文，验证提示语 end ************************* */

/** **************************** 列表 begin ************************* */

/** ** 列表初始化功能 **** */
function mydelayedInit() {
	// 计算table高度
	var winHeight = document.documentElement.clientHeight;
	var dataTableDivHeight = winHeight - 186 - $(".stati-info").height()
			- $(".page-breadcrumbs").height();
	var $dataTBody = $(".data-tbody"), $dataTHead = $(".data-thead"), $html = $($("html")[0]);
	$dataTBody.css("height", dataTableDivHeight);
	/**  @author gya 概览页面的高度*/
   	$(".summary-tab").css("height", dataTableDivHeight+81);
	// table body 滚动,带动table head平行移动,解决头部固定问题
	$dataTBody.scroll(function(e) {
		return $dataTHead.prop("scrollLeft", e.target.scrollLeft);
	});

	// 展开高级搜索调整table高度
	var $advSearch = $("#adv-search"), $collapseAdvSearch = $("#collapse-adv-search");
	$advSearch.click(function() {
		var isExpanded = !JSON.parse($advSearch.attr("aria-expanded"));
		var height = dataTableDivHeight;
		if (isExpanded) {
			$collapseAdvSearch.show();
			height = (dataTableDivHeight - $collapseAdvSearch.height());
		} else {
			$collapseAdvSearch.hide();
			myclearSearchItems();
		}
		$dataTBody.css({
			"height" : height + "px"
		});
		$advSearch.attr("aria-expanded", isExpanded + "");

	});
}

// 根据权限设置 增删改查按钮的显示
function setpermsion() {
	// 操作许可 0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止
	// 设置详情、新增、编辑、删除按钮的显示与否
	if (permi[0] == 1) {
		$('#my_btn_detail').hide();
	} else {
		$('#my_btn_detail').attr("disabled", "disabled").removeClass("blue").addClass("gray_tableModal");
	}
	if (permi[1] == 1) {
		$('#my_btn_add').hide();
	}
	if (permi[2] == 1) {
		$('#my_btn_edit').hide();
	} else {
		$('#my_btn_edit').attr("disabled", "disabled").removeClass("primary").addClass("gray_tableModal");
	}
	if (permi[3] == 1) {
		$('#my_btn_delete').hide();
	} else {
		$('#my_btn_delete').attr("disabled", "disabled").removeClass("danger").addClass("gray_tableModal");
	}
}

// 设置默认显示的列 和 列选项
function setTrs(selectItems) {
	var storage = window.localStorage;
	var selectItems_a = getTrs();
	if (selectItems_a == "") {
		storage.setItem(itemName, JSON.stringify(selectItems));
	} else {
		if (selectItems.resetTimes == selectItems_a.resetTimes) {
			selectItems = selectItems_a;
		} else {
			storage.removeItem(itemName);
			storage.setItem(itemName, JSON.stringify(selectItems));
		}

	}

	var html = "";
	var selectItesjson = selectItems.trs;
	for ( var i = 0; i < selectItesjson.length; i++) {
		html += "<li onclick=\"event.stopPropagation()\"><label style=\"margin: 0 0 0 20px;\">";
		html += "<input type=\"checkbox\"";
		if (selectItesjson[i].show == "true") {
			html += " checked ";
		}
		html += "name=\"items\" value=\"" + selectItesjson[i].name
				+ "\" onchange=\"changeTrs()\">";
		html += "<span class=\"text\"></span></label>"
				+ ($.i18n(tbI18n + selectItesjson[i].name) == null ? $
						.i18n("db.common." + selectItesjson[i].name) : $
						.i18n(tbI18n + selectItesjson[i].name)) + "</li>";
	}

	$("#selectItems").html(html);

	var chsub = $("input[name='items']").length; // 获取items的个数
	var checkedsub = $("input[name='items']:checked").length; // 获取选中的items的个数
	if (checkedsub == chsub) {
		$("#checkAllTrs").attr("checked", true);
	} else {
		$("#checkAllTrs").attr("checked", false);
	}
}

// 获取本地存储需要显示的列json
function getTrs() {
	var storage = window.localStorage;
	if (storage.getItem(itemName) != null && storage.getItem(itemName) != "") {
		var items = eval('(' + storage.getItem(itemName) + ')');
		return items;
	}
	return "";
}

// 打开窗口层
function myopenModel(modalId, type, other) {
	if (type != "detail") {
		// 重置验证
		$("#registrationForm1").data('bootstrapValidator').resetForm();
		// 清空表单
		myclearForm();

		if (type == 'edit') {
			setEditItems();
			$("#myeditModal-skip2Detail").show();
		}
		if (type == 'new') {
			$("#editAddModel").removeClass("text-primary").addClass(
					"text-success").html(
					"<i class=\"fa fa-plus\"></i> " + $.i18n("new"));
			$("#editAddType").val("new");
			$("#myeditModal-skip2Detail").hide();
			if (other != undefined) {
				setIdxViFiID();
			}
		}
	}

	var $editModal = $('#' + modalId).modal({
		backdrop : 'static'
	});
	setTimeout(function() {
		$editModal.find("span.error").remove();
		$editModal.find("input.error").removeClass("error");
	}, 100);
}

var formChangeFlag2mycommon = false;
function formChange2mycommon(){
	formChangeFlag2mycommon = true;
}
// 关闭窗口层
function mycloseModel(type, other, isSaveBtn) {
	if(!isSaveBtn && formChangeFlag2mycommon){
		layer.confirm($.i18n("frame.from.tips.confirmCancel"),function(idx){
			layer.close(idx);
			formChangeFlag2mycommon = false;//reset
			$('#' + type).modal('hide');
			if (other != undefined) {
				setSelectArr();
			}
		});
	}else{
		formChangeFlag2mycommon = false;//reset
		$('#' + type).modal('hide');
		if (other != undefined) {
			setSelectArr();
		}
	}
}

// 显示隐藏工具栏
function showTools(flag, tabpanle1, tabpanle2, tabpanle3, tabpanle4, tabpanle5,
		tabpanle6, tabpanle7) {
	$('#' + tabpanle1).show();
	$('#' + tabpanle2).hide();
	if (tabpanle3 != undefined) {
		$('#' + tabpanle3).hide();
	}
	if (tabpanle4 != undefined) {
		$('#' + tabpanle4).hide();
	}
	if (tabpanle5 != undefined) {
		$('#' + tabpanle5).hide();
	}
	if (tabpanle6 != undefined) {
		$('#' + tabpanle6).hide();
	}
	if (tabpanle7 != undefined) {
		$('#' + tabpanle7).hide();
	}

	if (flag == "false") {
		$('#tools').hide();
	} else {
		$('#tools').show();
	}
}

/** ** 列表查询、展示、分页 **** */

// 列表查询
var mydata;
function dosearch(page) {
	// alert(JSON.stringify(mygetSearchParams()));
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	var pageSize = storage.getItem(PAGE_SIZE_LS_KEY);
	if (pageSize == null || pageSize == "") {
		pageSize = "25";
	}
	$.ajax({
		url : window.PATH + visit_url + "/list.ajax?pageSize=" + pageSize
				+ "&page=" + page, // 请求的url地址
		data : mygetSearchParams(), // 参数值
		type : "post", // 请求方式
		dataType : "json",
		success : function(req) {
			result = req.data;
			mydata = result.contentList;
			showData();
			var pageInfo = doPagination(result, 'mychangePage');
			var $tablePage = $("#toolsPage");
			if (mydata.length == 0) {
				$("#foot_page_tools").hide();
			} else {
				$("#foot_page_tools").show();
			}
			$tablePage.html(pageInfo);
			disabledDAD();

			// 请求成功时处理
		},
		error : function(xhr, type, exception) {// 获取ajax的错误信息

		}
	});

}

// 列表数据显示展示
function showData() {
	// 取到需要显示的列
	var itemsdata = getTrs();
	var show = [];
	var showLength = [];
	var j = 0;
	for ( var i = 0; i < itemsdata.trs.length; i++) {
		if (itemsdata.trs[i].show == "true") {
			show[j] = (itemsdata.trs[i].name);
			showLength[j] = (itemsdata.trs[i].width);
			j++;
		}
	}
	var html_thead = "";// 表头
	html_thead += "<th>  <label class=\"no-margin-bottom\"><input type=\"checkbox\" id=\"checkAllListTrs\" onclick=\"checkAllListTrs()\"><span class=\"text\"></span></label></th>";
	for ( var m = 0; m < show.length; m++) {
		// 设置排序
		var sort_str = "sorting";
		if (MY_ORDER_LIST.length > 0) {
			for ( var y = 0; y < MY_ORDER_LIST.length; y++) {
				var keyname = MY_ORDER_LIST[y][0];
				var keysort = MY_ORDER_LIST[y][1];
				if (show[m] == keyname) {
					if (keysort == 1) {
						sort_str = "sorting_asc";
					} else if (keysort == 2) {
						sort_str = "sorting_desc";
					}
				}
			}
		}
		if (show[m] == "uuwifiSessId") {
			html_thead += "<th draggable=\"false\" id=\"th_" + show[m]
					+ "\" name=\"th_" + show[m]
					+ "\"  style=\"cursor: default;\" >";
			html_thead += "<div class=\"table-data\"  draggable=\"false\" style=\"width: "
					+ showLength[m]
					+ "px; cursor: default;\" draggable=\"true\">"
					+ ($.i18n(tbI18n + show[m]) == null ? $.i18n("db.common."
							+ show[m]) : $.i18n(tbI18n + show[m]))
					+ "</div></th>";
		} else {
			html_thead += "<th draggable=\"false\" onmousedown=\"thonmousedown('th_"
					+ show[m]
					+ "')\" onmousemove=\"thonmousemove('th_"
					+ show[m]
					+ "')\" onmouseup=\"thonmouseup('th_"
					+ show[m]
					+ "')\" class=\""
					+ sort_str
					+ "\" id=\"th_"
					+ show[m]
					+ "\" name=\"th_"
					+ show[m]
					+ "\"  style=\"cursor: default;\" >";
			html_thead += "<div class=\"table-data\" onClick=\"dosort('th_"
					+ show[m]
					+ "')\" draggable=\"false\" style=\"width: "
					+ showLength[m]
					+ "px; cursor: default;\" draggable=\"true\">"
					+ ($.i18n(tbI18n + show[m]) == null ? $.i18n("db.common."
							+ show[m]) : $.i18n(tbI18n + show[m]))
					+ "</div></th>";
		}
	}

	var html_tdata = "";// 表数据   表中每一行的数据
	for ( var n = 0; n < mydata.length; n++) {
		html_tdata += "<tr onclick=\"checkThisRow('Listitems"
				+ n
				+ "')\" onDblClick=\"viewDetails('"
				+ n
				+ "')\"><td><label style=\"margin-bottom:0;\" onclick=\"event.stopPropagation()\"><input type=\"checkbox\" name=\"Listitems"
				+ n
				+ "\" value=\""
				+ eval('mydata[' + n + '].' + tablekey)
				+ "-|-"
				+ n
				+ "\"   onclick=\"changeListTrs()\"><span class=\"text\"></span></label></td>";
		for ( var k = 0; k < show.length; k++) {
			var tdname = show[k];
			var showLengthData = showLength[k];
			var dataTdValue = eval('mydata[' + n + '].' + tdname);
			if (dataTdValue == undefined) {
				dataTdValue = "";
			}
			// 列表展示数据转换
			var html = changeData(tdname, showLengthData, dataTdValue);
			html_tdata += html;
		}
		html_tdata += "</tr>";
	}
	$("#html_thead").html(html_thead);
	$("#html_tdata").html(html_tdata);
}

/**
 * js生成bootstrap page
 * 
 * @param page
 *            page
 * @param pageFun
 *            页面改变js函数
 * @return 当前用户肤色样式
 */

function doPagination(page, pageFun) {
	page = page || {};
	pageFun = pageFun || "pageFun";
	var sb = "";
	var paginationSize = 5;
	var current = (page.number + 1) || "-";
	var begin = Math.max(1, current - parseInt(paginationSize / 2));
	var end = Math.min(begin + (paginationSize - 1), page.totalPages);
	var size = page.size || "-";
	var totalEle = page.totalElements || "-";
	var totalPages = page.totalPages || "-";

	sb += "<div><ul class=\"pagination\">";

	if (page.hasPreviousPage) {
		sb += "<li><a page=\"1\" href=\"" + getAFunStr(1, size, pageFun)
				+ "\">&lt;&lt;</a></li>";
		sb += "<li><a href=\"" + getAFunStr(current - 1, size, pageFun)
				+ "\">&lt;</a></li>";
	} else {
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;&lt;</a></li>";
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;</a></li>";
	}
	for ( var i = begin; i < (end + 1); i++) {
		if (i == current) {
			sb += "<li class=\"active\"><a page=\"" + i
					+ "\" href=\"javascript:\">" + i + "</a></li>";
		} else {
			sb += "<li><a href=\"" + getAFunStr(i, size, pageFun) + "\">" + i
					+ "</a></li>";
		}
	}
	if (page.hasNextPage) {
		sb += "<li><a href=\"" + getAFunStr(current + 1, size, pageFun)
				+ "\">&gt;</a></li>";
		sb += "<li><a href=\"" + getAFunStr(page.totalPages, size, pageFun)
				+ "\">&gt;&gt;</a></li>";
	} else {
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;</a></li>";
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;&gt;</a></li>"; // event.keyCode==13
																					// &&
																					// "+pageFun+"("+this.value+","+size+")
	}

	var pageNum = "<input style='width:30px;margin:1px 5px;' value='" + current
			+ "' onkeydown='event.keyCode==13&&" + pageFun + "(this.value,"
			+ size + ")'>";
	sb += "<li class=\"disabled\"><a href=\"javascript:\">"
			+ $.i18n("page_tools.tips", totalPages, totalEle) + "</a></li>";
	sb += "<li><span style='padding:3px 12px;'>"
			+ $.i18n("page_tools.goto_page", pageNum) + "</span></li>";
	sb += "<ul></div>";

	return sb;
};

/**
 * 分页回调
 * 
 * @param no
 *            第几页
 * @param size
 *            每页显示多少条
 * @param pageFun
 *            pageFun
 * @return 字符串
 */
function getAFunStr(no, size, pageFun) {
	return "javascript:" + pageFun + "(" + no + "," + size + ");";
}

// 改变分页数量
function changePageSize() {
	var pageSize = $("#pagesizeSelect").val();
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	storage.setItem(PAGE_SIZE_LS_KEY, parseInt(pageSize));
	dosearch('1');
}

// 设置分页数量下拉框的值
function setSelectPageSize() {
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	var selectPagesize = storage.getItem(PAGE_SIZE_LS_KEY);
	if (selectPagesize == null || selectPagesize == "") {
		selectPagesize = "25";
	}
	$("#pagesizeSelect").val(selectPagesize);
}

// 点击分页码数
function mychangePage(page, pageSize) {
	dosearch(page);
}

/** **** 对checkbox的操作 ****** */
// 更改要显示的列
function changeTrs() {
	var chsub = $("input[name='items']").length; // 获取items的个数
	var checkedsub = $("input[name='items']:checked").length; // 获取选中的items的个数
	if (checkedsub == chsub) {
		$("#checkAllTrs").prop("checked", true);
	} else {
		$("#checkAllTrs").prop("checked", false);
	}

	var oldTrs = getTrs();
	var showLength_old = [];

	for ( var j = 0; j < oldTrs.trs.length; j++) {
		showLength_old[j] = oldTrs.trs[j].width;
	}
	var obj = document.getElementsByName('items');
	var s = '{"resetTimes": "' + oldTrs.resetTimes + '","trs": [';
	for ( var i = 0; i < obj.length; i++) {
		if (i < obj.length - 1) {
			s += '{ "name": "' + obj[i].value + '",';
			if (obj[i].checked) {
				s += '"show": "true",';
			} else {
				s += '"show": "false",';
			}
			s += '"width": "' + showLength_old[i] + '"},';
		} else {
			s += '{ "name": "' + obj[i].value + '",';
			if (obj[i].checked) {
				s += '"show": "true",';
			} else {
				s += '"show": "false",';
			}
			s += '"width": "' + showLength_old[i] + '"}';
		}
	}
	s += ']}';
	var storage = window.localStorage;
	storage.setItem(itemName, s);
	showData();

}

// 更改要显示的列 -- 全选反选
function checkAllTrs() {
	var isChecked = $("#checkAllTrs").prop('checked');
	$("input[name='items']").prop("checked", isChecked);
	changeTrs();
}

// 重置
function myResetTrs() {
	var storage = window.localStorage;
	storage.removeItem(itemName);
	setTrs(resetSelectItems);
	dosearch('1');
}

// 列表---更改要显示的列
function changeListTrs() {
	var chsubList = $("input[name*='Listitems']").length; // 获取items的个数
	var checkedsubList = $("input[name*='Listitems']:checked").length; // 获取选中的items的个数
	if (checkedsubList == chsubList) {
		$("#checkAllListTrs").prop("checked", true);
	} else {
		$("#checkAllListTrs").prop("checked", false);
	}
	// 操作许可 0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止

	// 编辑按钮的显示与否	
	if (checkedsubList == 1 && permi[2] == 0) {
		$('#my_btn_edit').removeAttr("disabled");
		$('#my_btn_edit').removeClass("gray_tableModal").addClass("blue");
	} else {
		$('#my_btn_edit').attr("disabled", "disabled");
		$('#my_btn_edit').removeClass("blue").addClass("gray_tableModal");
	}
	// 详情按钮的显示与否
	if (checkedsubList == 1 && permi[0] == 0) {
		$('#my_btn_detail').removeAttr("disabled");
		$('#my_btn_detail').removeClass("gray_tableModal").addClass("primary");
	} else {
		$('#my_btn_detail').attr("disabled", "disabled");
		$('#my_btn_detail').removeClass("primary").addClass("gray_tableModal");
	}
	// 删除按钮的显示与否
	if (checkedsubList > 0 && permi[3] == 0) {
		$('#my_btn_delete').removeAttr("disabled");
		$('#my_btn_delete').removeClass("gray_tableModal").addClass("danger");
	} else {
		$('#my_btn_delete').attr("disabled", "disabled");
		$('#my_btn_delete').removeClass("danger").addClass("gray_tableModal");
	}
	
	changeTrBackgroundcolor();

}

// 列表---全选反选
function checkAllListTrs() {
	var isChecked = $("#checkAllListTrs").prop('checked');
	$("input[name*='Listitems']").prop("checked", isChecked);
	changeListTrs();
	changeTrBackgroundcolor();
}

/** **** 保存、详情、删除 ****** */

// 保存动作
function dosave() {
	// alert(JSON.stringify(mygetSaveData()));
	if (mygetSaveData() != {}) {
		$.ajax({
			url : window.PATH + visit_url + "/save.ajax", // 请求的url地址
			dataType : "json", // 返回格式为json
			async : true,// 请求是否异步，默认为异步，这也是ajax重要特性
			data : mygetSaveData(), // 参数值
			type : "POST", // 请求方式
			success : function(res) {
				layer.msg.success(res.message);
				dosearch('1');
				changeListTrs();
				mycloseModel("myeditModal", "other",true);
				// 请求成功时处理
			},
			error : function() {
				// 请求出错处理
			}
		});
	}

};

/**
 * 删除
 */
function dodelete() {
	layer.confirm($.i18n("frame.from.tips.confirmDel"), function(idx) {
		$.ajax({
			url : window.PATH + visit_url + "/delete.ajax", // 请求的url地址
			dataType : "json", // 返回格式为json
			async : true,// 请求是否异步，默认为异步，这也是ajax重要特性
			data : {
				idList : mygetSelectIdList()
			},
			type : "POST", // 请求方式
			success : function(res) {
				layer.msg.success(res.message);
				dosearch('1');
				// 请求成功时处理
			},
			error : function() {
				// 请求出错处理
			}
		});
		layer.close(idx);
	});

};

// 获取要删除条目的主键值数组
function mygetSelectIdList() {
	var checkedsubList = $("input[name*='Listitems']:checked");
	var deleteIds = [];
	for ( var i = 0; i < checkedsubList.length; i++) {
		var arr = checkedsubList[i].value.split("-|-");
		deleteIds[i] = arr[0];
	}
	return deleteIds;
}

// 取消编辑
function mycancelEdit() {
	/*
	 * layer.confirm($.i18n("frame.from.tips.confirmCancel"), function (idx) {
	 * return mycloseModel("myeditModal") + layer.close(idx); });
	 */
	return mycloseModel("myeditModal");
};

// 同时隐藏详情、编辑、删除按钮
function disabledDAD() {
	$('#my_btn_edit').removeAttr("disabled");
	$('#my_btn_edit').attr("disabled", "disabled").removeClass("primary").addClass("gray_tableModal");
	$('#my_btn_detail').removeAttr("disabled");
	$('#my_btn_detail').attr("disabled", "disabled").removeClass("blue").addClass("gray_tableModal");
	$('#my_btn_delete').removeAttr("disabled");
	$('#my_btn_delete').attr("disabled", "disabled").removeClass("danger").addClass("gray_tableModal");
}

// 点详情按钮查看详情
function btnViewDetails() {
	var checkedsubList = $("input[name*='Listitems']:checked"); // 获取选中的name中包含Listitems的值
	var arr = checkedsubList[0].value.split("-|-");
	viewDetails(parseInt(arr[1]));
}

// 单击tr选中这一型的checkbox
function checkThisRow(rowName) {
	$("input[name*='Listitems']").prop("checked", false);
	$("input[name='" + rowName + "']").prop("checked", true);
	changeListTrs();
	changeTrBackgroundcolor();
}

// 搜索中清除按钮功能
function myclearSearch() {
	// 清空搜索条件
	myclearSearchItems();
	dosearch('1');
}

/** **** 列表的排序、拖动改变宽度 ****** */

// 点排序显示
function dosort(id) {
	MY_ORDER_LIST = [];
	var th = $("#" + id);
	var c = th.attr("class");
	if (c != null && c.indexOf('sorting') > -1) {
		th.removeClass('sorting').addClass('sorting_asc');
	}
	if (c != null && c.indexOf('sorting_asc') > -1) {
		th.removeClass('sorting_asc').addClass('sorting_desc');
	}
	if (c != null && c.indexOf('sorting_desc') > -1) {
		th.removeClass('sorting_desc').removeClass('sorting_asc').addClass(
				'sorting');
	}

	var html_sort = "";
	var sortingAsc = $(".sorting_asc");
	sortingAsc.each(function() {
		var asc = [];
		var tr_name_asc = $(this).attr("name");
		if (tr_name_asc.indexOf("th_") > -1) {
			asc.push(tr_name_asc.replace("th_", ""));
			asc.push(1);
			MY_ORDER_LIST.push(asc);
		}
	});
	var sortingDesc = $(".sorting_desc");
	sortingDesc.each(function() {
		var desc = [];
		var tr_name_desc = $(this).attr("name");
		if (tr_name_desc.indexOf("th_") > -1) {
			desc.push(tr_name_desc.replace("th_", ""));
			desc.push(2);
			MY_ORDER_LIST.push(desc);
		}
	});
	dosearch('1');
}

// 获取所有是选中状态的checkbox ,更改tr父标签的背景色；获取所有不是选中状态的checkbox ,去掉tr父标签的背景色；
function changeTrBackgroundcolor() {
	var checkedsubList = $("input[name*='Listitems']:checked");
	var unCheckedsubList = $("input[name*='Listitems']").not("input:checked");
	unCheckedsubList.each(function() {
		$(this).parents("tr").removeClass("active_tr");
	});
	checkedsubList.each(function() {
		$(this).parents("tr").addClass("active_tr");
	});
}

// 鼠标按下
var tTD;
var th_mouseDown;
var old_width;
var th_oldX;
var new_width;
var mouseeventid;//记住初始的id
function thonmousedown(id) {
	mouseeventid = id;
	//<div id="mycommon-datagrid-resize" style="display:none;"></div>
	if($("#datagrid-resize-proxy").length==0){
		$("body").append('<div id="datagrid-resize-proxy" style="display:none;"></div>');
	}
	$proxy = $("#datagrid-resize-proxy");
	tTD = $("#" + id);
	if ((event.offsetX > event.target.offsetWidth - 4) && event.target.localName == "th") {
		th_mouseDown = true;
		th_oldX = event.x;
		old_width = event.target.offsetWidth;
		var $table;
		if($("#my-data-table").height()>0){//stupid fly
			$table = $("#my-data-table");
		}else if($("#my-data-table8").height()>0){
			$table = $("#my-data-table8");
		}else{
			$table = $("#my-data-table9");
		}
		var height = $table.height();
		var offsetTop = $table.offset().top;
		$proxy.attr("style","display: block; height: "+height+"px; left: "+th_oldX+"px; top: "+offsetTop+"px;");
	    $("body").css({"-moz-user-select": "none", "-webkit-user-select": "none", "user-select": "none"});
	}
}
function thonmousedown8(id){
	thonmousedown(id);
}
function thonmousedown9(id){
	thonmousedown(id);
}

// 鼠标弹起
function thonmouseup(id) {
	id = mouseeventid;
	var storage = window.localStorage;
	if (!th_mouseDown) {
		return;
	}
	th_mouseDown = false;
	event.target.style.cursor = 'default';
	var allItemsdata = getTrs();
	var itemsdata = allItemsdata.trs;
	var tr_name = id.replace("th_", "");
	if (new_width != 0) {
		if (new_width <= 80) {
			new_width = 80;
		}
		for ( var i = 0; i < itemsdata.length; i++) {
			var cur_itemsdata = itemsdata[i];
			if (cur_itemsdata.name == tr_name) {
				cur_itemsdata.width = new_width;
				storage.setItem(itemName, JSON.stringify(allItemsdata));
				showData();
				new_width = 0;
				break;
			}
		}
	}
	var $drpLine = $("#datagrid-resize-proxy");
    $drpLine.hide();
    $("body").css({"-moz-user-select": "text", "-webkit-user-select": "text", "user-select": "text"});
}
function thonmouseup8(id) {
	id = mouseeventid;
	var storage = window.localStorage;
	if (!th_mouseDown) {
		return;
	}
	th_mouseDown = false;
	event.target.style.cursor = 'default';
	var allItemsdata8 = getTrs8();
	var itemsdata8 = allItemsdata8.trs;
	var tr_name = id.replace("th8_", "");
	if (new_width != 0) {
		if (new_width <= 80) {
			new_width = 80;
		}
		for ( var i = 0; i < itemsdata8.length; i++) {
			var cur_itemsdata = itemsdata8[i];
			if (cur_itemsdata.name == tr_name) {
				cur_itemsdata.width = new_width;
				storage.setItem(itemName8, JSON.stringify(allItemsdata8));
				showData8();
				new_width = 0;
				break;
			}
		}
	}
	var $drpLine = $("#datagrid-resize-proxy");
	$drpLine.hide();
	$("body").css({"-moz-user-select": "text", "-webkit-user-select": "text", "user-select": "text"});
}
function thonmouseup9(id) {
	id = mouseeventid;
	var storage = window.localStorage;
	if (!th_mouseDown) {
		return;
	}
	th_mouseDown = false;
	event.target.style.cursor = 'default';
	var allItemsdata9 = getTrs9();
	var itemsdata9 = allItemsdata9.trs;
	var tr_name = id.replace("th9_", "");
	if (new_width != 0) {
		if (new_width <= 80) {
			new_width = 80;
		}
		for ( var i = 0; i < itemsdata9.length; i++) {
			var cur_itemsdata = itemsdata9[i];
			if (cur_itemsdata.name == tr_name) {
				cur_itemsdata.width = new_width;
				storage.setItem(itemName9, JSON.stringify(allItemsdata9));
				showData9();
				new_width = 0;
				break;
			}
		}
	}
	var $drpLine = $("#datagrid-resize-proxy");
	$drpLine.hide();
	$("body").css({"-moz-user-select": "text", "-webkit-user-select": "text", "user-select": "text"});
}

// 鼠标移动
function thonmousemove(id) {
	$proxy = $("#datagrid-resize-proxy");
	// 更改鼠标样式
	if ((event.offsetX > event.target.offsetWidth - 4)
			&& event.target.localName == "th") {
		event.target.style.cursor = 'col-resize';
	} else {
		event.target.style.cursor = 'default';
	}

	if (th_mouseDown != null && th_mouseDown == true) {
		if (old_width + (event.x - th_oldX) > 80) {//最低80px
			new_width = old_width + (event.x - th_oldX) - 7;
			//tTD.children(":first").width(new_width);
			$proxy.css("left",event.x+4);
		}
	}
}
function thonmousemove8(id) {
	thonmousemove(id)
}
function thonmousemove9(id) {
	thonmousemove(id)
}

/** **************************** 列表 end ************************* */

/** **************************** 同一个页面第二个列表 begin ************************* */

/** ** 列表初始化功能 **** */
function mydelayedInit8() {
	// 计算table高度
	var winHeight8 = document.documentElement.clientHeight;
	var dataTableDivHeight8 = winHeight8 - 186 - $(".stati-info").height()
			- $(".page-breadcrumbs").height();
	var $dataTBody8 = $(".data-tbody8"), $dataTHead8 = $(".data-thead8"), $html = $($("html")[0]);
	$dataTBody8.css("height", dataTableDivHeight8);
	/**  @author gya 概览页面的高度*/
   	$(".summary-tab").css("height", dataTableDivHeight8+81);
	// table body 滚动,带动table head平行移动,解决头部固定问题
	$dataTBody8.scroll(function(e) {
		return $dataTHead8.prop("scrollLeft", e.target.scrollLeft);
	});

	// 展开高级搜索调整table高度
	var $advSearch8 = $("#adv-search8"), $collapseAdvSearch8 = $("#collapse-adv-search8");
	$advSearch8.click(function() {
		var isExpanded8 = !JSON.parse($advSearch8.attr("aria-expanded"));
		var height8 = dataTableDivHeight8;
		if (isExpanded8) {
			$collapseAdvSearch8.show();
			$("#searchICON1").hide();
			$("#searchICON2").show();
			height8 = (dataTableDivHeight8 - $collapseAdvSearch8.height());
		} else {
			$collapseAdvSearch8.hide();
			$("#searchICON2").hide();
			$("#searchICON1").show();
			myclearSearchItems8();
		}
		$dataTBody8.css({
			"height" : height8 + "px"
		});
		$advSearch8.attr("aria-expanded", isExpanded8 + "");

	});
}

// 根据权限设置 增删改查按钮的显示
function setpermsion8() {
	// 操作许可 0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止
	// 设置详情、新增、编辑、删除按钮的显示与否
	if (permi[0] == 1) {
		$('#my_btn_detail8').hide();
	} else {
		$('#my_btn_detail8').attr("disabled", "disabled").removeClass("blue").addClass("gray_tableModal");  
	}
	if (permi[1] == 1) {
		$('#my_btn_add8').hide();
	}
	if (permi[2] == 1) {
		$('#my_btn_edit8').hide();
	} else {
		$('#my_btn_edit8').attr("disabled", "disabled").removeClass("primary").addClass("gray_tableModal");
	}
	if (permi[3] == 1) {
		$('#my_btn_delete8').hide();
	} else {
		$('#my_btn_delete8').attr("disabled", "disabled").removeClass("danger").addClass("gray_tableModal");
	}
}

// 设置默认显示的列 和 列选项
function setTrs8(selectItems8) {
	var storage = window.localStorage;

	var selectItems_a = getTrs8();
	if (selectItems_a == "") {
		storage.setItem(itemName8, JSON.stringify(selectItems8));
	} else {
		if (selectItems8.resetTimes == selectItems_a.resetTimes) {
			selectItems8 = selectItems_a;
		} else {
			storage.removeItem(itemName8);
			storage.setItem(itemName8, JSON.stringify(selectItems8));
		}

	}

	var html = "";
	var selectItesjson = selectItems8.trs;
	for ( var i = 0; i < selectItesjson.length; i++) {
		html += "<li onclick=\"event.stopPropagation()\"><label style=\"margin: 0 0 0 20px;\">";
		html += "<input type=\"checkbox\"";
		if (selectItesjson[i].show == "true") {
			html += " checked ";
		}
		html += "name=\"items8\" value=\"" + selectItesjson[i].name
				+ "\" onchange=\"changeTrs8()\">";
		html += "<span class=\"text\"></span></label>"
				+ ($.i18n(tbI18n8 + selectItesjson[i].name) == null ? $
						.i18n("db.common." + selectItesjson[i].name) : $
						.i18n(tbI18n8 + selectItesjson[i].name)) + "</li>";
	}

	$("#selectItems8").html(html);

	var chsub = $("input[name='items8']").length; // 获取items的个数
	var checkedsub = $("input[name='items8']:checked").length; // 获取选中的items的个数
	if (checkedsub == chsub) {
		$("#checkAllTrs8").attr("checked", true);
	} else {
		$("#checkAllTrs8").attr("checked", false);
	}
}

// 获取本地存储需要显示的列json
function getTrs8() {
	var storage = window.localStorage;
	if (storage.getItem(itemName8) != null && storage.getItem(itemName8) != "") {
		var items8 = eval('(' + storage.getItem(itemName8) + ')');
		return items8;
	}
	return "";
}

// 打开窗口层
function myopenModel8(modalId, type) {
	if (type != "detail") {
		// 重置验证
		$("#registrationForm8").data('bootstrapValidator').resetForm();
		// 清空表单
		myclearForm8();

		if (type == 'edit') {
			setEditItems8();
			$("#myeditModal8-skip2Detail").show();
		}
		if (type == 'new') {
			$("#editAddModel8").removeClass("text-primary").addClass(
					"text-success").html(
					"<i class=\"fa fa-plus\"></i> " + $.i18n("new"));
			$("#editAddType8").val("new");
			$("#myeditModal8-skip2Detail").hide();
		}
	}

	var $editModal = $('#' + modalId).modal({
		backdrop : 'static'
	});
	setTimeout(function() {
		$editModal.find("span.error").remove();
		$editModal.find("input.error").removeClass("error");
	}, 100);
}

// 关闭窗口层
function mycloseModel8(type, isSaveBtn) {
	if(!isSaveBtn && formChangeFlag2mycommon){
		layer.confirm($.i18n("frame.from.tips.confirmCancel"),function(idx){
			layer.close(idx);
			formChangeFlag2mycommon = false;//reset
			$('#' + type).modal('hide');
		});
	}else{
		formChangeFlag2mycommon = false;//reset
		$('#' + type).modal('hide');
	}
}

// 显示隐藏工具栏
function showTools8(tool, tabpanle1, tabpanle2, tabpanle3, tabpanle4,
		tabpanle5, tabpanle6, tabpanle7) {
	$('#' + tabpanle1).show();
	$('#' + tabpanle2).hide();
	if (tabpanle3 != undefined) {
		$('#' + tabpanle3).hide();
	}
	if (tabpanle4 != undefined) {
		$('#' + tabpanle4).hide();
	}
	if (tabpanle5 != undefined) {
		$('#' + tabpanle5).hide();
	}
	if (tabpanle6 != undefined) {
		$('#' + tabpanle6).hide();
	}
	if (tabpanle7 != undefined) {
		$('#' + tabpanle7).hide();
	}

	if (tool == "tools") {
		$('#tools').show();
		$('#tools8').hide();
	} else if (tool == "tools8") {
		$('#tools8').show();
		$('#tools').hide();
	} else {
		$('#tools8').hide();
		$('#tools').hide();
	}
}

/** ** 列表查询、展示、分页 **** */

// 列表查询
var mydata8;
function dosearch8(page) {
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	var pageSize = storage.getItem(PAGE_SIZE_LS_KEY);
	if (pageSize == null || pageSize == "") {
		pageSize = "25";
	}
	$.ajax({
		url : window.PATH + visit_url + "/list.ajax1?pageSize=" + pageSize
				+ "&page=" + page, // 请求的url地址
		data : mygetSearchParams8(), // 参数值
		type : "post", // 请求方式
		dataType : "json",
		success : function(req) {
			var newresult = req.data;
			mydata8 = newresult.contentList;
			showData8();
			var pageInfo = doPagination8(newresult, 'mychangePage8');
			var $tablePage = $("#toolsPage8");
			if (mydata8.length == 0) {
				$("#foot_page_tools8").hide();
			} else {
				$("#foot_page_tools8").show();
			}
			$tablePage.html(pageInfo);
			disabledDAD8();

			// 请求成功时处理
		},
		error : function(xhr, type, exception) {// 获取ajax的错误信息
			// alert(exception);
		}
	});

}

// 列表数据显示展示
function showData8() {
	// 取到需要显示的列
	var itemsdata = getTrs8();
	var show = [];
	var showLength = [];
	var j = 0;
	for ( var i = 0; i < itemsdata.trs.length; i++) {
		if (itemsdata.trs[i].show == "true") {
			show[j] = (itemsdata.trs[i].name);
			showLength[j] = (itemsdata.trs[i].width);
			j++;
		}
	}

	var html_thead = "";// 表头
	html_thead += "<th>  <label class=\"no-margin-bottom\"><input type=\"checkbox\" id=\"checkAllListTrs8\" onclick=\"checkAllListTrs8()\"><span class=\"text\"></span></label></th>";
	for ( var m = 0; m < show.length; m++) {
		// 设置排序
		var sort_str = "sorting";
		if (MY_ORDER_LIST8.length > 0) {
			for ( var y = 0; y < MY_ORDER_LIST8.length; y++) {
				var keyname = MY_ORDER_LIST8[y][0];
				var keysort = MY_ORDER_LIST8[y][1];
				if (show[m] == keyname) {
					if (keysort == 1) {
						sort_str = "sorting_asc";
					} else if (keysort == 2) {
						sort_str = "sorting_desc";
					}
				}
			}
		}
		html_thead += "<th draggable=\"false\" onmousedown=\"thonmousedown8('th8_"
				+ show[m]
				+ "')\" onmousemove=\"thonmousemove8('th8_"
				+ show[m]
				+ "')\" onmouseup=\"thonmouseup8('th8_"
				+ show[m]
				+ "')\" class=\""
				+ sort_str
				+ "\"  id=\"th8_"
				+ show[m]
				+ "\" name=\"th8_"
				+ show[m]
				+ "\"  style=\"cursor: default;\" >";
		html_thead += "<div class=\"table-data\" onClick=\"dosort8('th8_"
				+ show[m]
				+ "')\" draggable=\"false\" style=\"width: "
				+ showLength[m]
				+ "px; cursor: default;\">"
				+ ($.i18n(tbI18n8 + show[m]) == null ? $.i18n("db.common."
						+ show[m]) : $.i18n(tbI18n8 + show[m])) + "</div></th>";
	}

	var html_tdata = "";// 表数据
	for ( var n = 0; n < mydata8.length; n++) {
		html_tdata += "<tr onclick=\"checkThisRow8('List8items"
				+ n
				+ "')\" onDblClick=\"viewDetails8('"
				+ n
				+ "')\"><td><label style=\"margin-bottom:0;\" onclick=\"event.stopPropagation()\"><input type=\"checkbox\" name=\"List8items"
				+ n
				+ "\" value=\""
				+ eval('mydata8[' + n + '].' + tablekey8)
				+ "-|-"
				+ n
				+ "\"   onclick=\"changeListTrs8()\"><span class=\"text\"></span></label></td>";
		for ( var k = 0; k < show.length; k++) {
			var tdname = show[k];
			var showLengthData = showLength[k];
			var dataTdValue = eval('mydata8[' + n + '].' + tdname);
			if (dataTdValue == undefined) {
				dataTdValue = "";
			}
			// 列表展示数据转换
			var html = changeData8(tdname, showLengthData, dataTdValue);
			html_tdata += html;
		}
		html_tdata += "</tr>";
	}

	$("#html_thead8").html(html_thead);
	$("#html_tdata8").html(html_tdata);
}

/**
 * js生成bootstrap page
 * 
 * @param page
 *            page
 * @param pageFun
 *            页面改变js函数
 * @return 当前用户肤色样式
 */

function doPagination8(page, pageFun) {
	page = page || {};
	pageFun = pageFun || "pageFun";
	var sb = "";
	var paginationSize = 5;
	var current = (page.number + 1) || "-";
	var begin = Math.max(1, current - parseInt(paginationSize / 2));
	var end = Math.min(begin + (paginationSize - 1), page.totalPages);
	var size = page.size || "-";
	var totalEle = page.totalElements || "-";
	var totalPages = page.totalPages || "-";
	sb += "<div><ul class=\"pagination\">";

	if (page.hasPreviousPage) {
		sb += "<li><a page=\"1\" href=\"" + getAFunStr(1, size, pageFun)
				+ "\">&lt;&lt;</a></li>";
		sb += "<li><a href=\"" + getAFunStr(current - 1, size, pageFun)
				+ "\">&lt;</a></li>";
	} else {
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;&lt;</a></li>";
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;</a></li>";
	}
	for ( var i = begin; i < (end + 1); i++) {
		if (i == current) {
			sb += "<li class=\"active\"><a page=\"" + i
					+ "\" href=\"javascript:\">" + i + "</a></li>";
		} else {
			sb += "<li><a href=\"" + getAFunStr(i, size, pageFun) + "\">" + i
					+ "</a></li>";
		}
	}
	if (page.hasNextPage) {
		sb += "<li><a href=\"" + getAFunStr(current + 1, size, pageFun)
				+ "\">&gt;</a></li>";
		sb += "<li><a href=\"" + getAFunStr(page.totalPages, size, pageFun)
				+ "\">&gt;&gt;</a></li>";
	} else {
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;</a></li>";
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;&gt;</a></li>"; // event.keyCode==13
																					// &&
																					// "+pageFun+"("+this.value+","+size+")
	}

	var pageNum = "<input style='width:30px;margin:1px 5px;' value='" + current
			+ "' onkeydown='event.keyCode==13&&" + pageFun + "(this.value,"
			+ size + ")'>";
	sb += "<li class=\"disabled\"><a href=\"javascript:\">"
			+ $.i18n("page_tools.tips", totalPages, totalEle) + "</a></li>";
	sb += "<li><span style='padding:3px 12px;'>"
			+ $.i18n("page_tools.goto_page", pageNum) + "</span></li>";
	sb += "<ul></div>";

	return sb;
};

// 改变分页数量
function changePageSize8() {
	var pageSize = $("#pagesizeSelect8").val();
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	storage.setItem(PAGE_SIZE_LS_KEY, parseInt(pageSize));
	dosearch8('1');
}

// 设置分页数量下拉框的值
function setSelectPageSize8() {
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	var selectPagesize = storage.getItem(PAGE_SIZE_LS_KEY);
	if (selectPagesize == null || selectPagesize == "") {
		selectPagesize = "25";
	}
	$("#pagesizeSelect8").val(selectPagesize);
}

// 点击分页码数
function mychangePage8(page, pageSize) {
	dosearch8(page);
}

/** **** 对checkbox的操作 ****** */
// 更改要显示的列
function changeTrs8() {
	var chsub = $("input[name='items8']").length; // 获取items的个数
	var checkedsub = $("input[name='items8']:checked").length; // 获取选中的items的个数
	if (checkedsub == chsub) {
		$("#checkAllTrs8").prop("checked", true);
	} else {
		$("#checkAllTrs8").prop("checked", false);
	}

	var oldTrs = getTrs8();
	var showLength_old = [];

	for ( var j = 0; j < oldTrs.trs.length; j++) {
		showLength_old[j] = oldTrs.trs[j].width;
	}
	var obj = document.getElementsByName('items8');
	var s = '{"resetTimes": "' + oldTrs.resetTimes + '","trs": [';
	for ( var i = 0; i < obj.length; i++) {
		if (i < obj.length - 1) {
			s += '{ "name": "' + obj[i].value + '",';
			if (obj[i].checked) {
				s += '"show": "true",';
			} else {
				s += '"show": "false",';
			}
			s += '"width": "' + showLength_old[i] + '"},';
		} else {
			s += '{ "name": "' + obj[i].value + '",';
			if (obj[i].checked) {
				s += '"show": "true",';
			} else {
				s += '"show": "false",';
			}
			s += '"width": "' + showLength_old[i] + '"}';
		}
	}
	s += ']}';
	var storage = window.localStorage;
	storage.setItem(itemName8, s);
	showData8();

}

// 更改要显示的列 -- 全选反选
function checkAllTrs8() {
	var isChecked = $("#checkAllTrs8").prop('checked');
	$("input[name='items8']").prop("checked", isChecked);
	changeTrs8();
}

// 重置
function myResetTrs8() {
	var storage = window.localStorage;
	storage.removeItem(itemName8);
	setTrs8(resetSelectItems8);
	dosearch8('1');
}

// 列表---更改要显示的列
function changeListTrs8() {
	var chsubList = $("input[name*='List8items']").length; // 获取items的个数
	var checkedsubList = $("input[name*='List8items']:checked").length; // 获取选中的items的个数
	if (checkedsubList == chsubList) {
		$("#checkAllListTrs8").prop("checked", true);
	} else {
		$("#checkAllListTrs8").prop("checked", false);
	}
	// 操作许可 0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止

	// 编辑按钮的显示与否
	if (checkedsubList == 1 && permi[2] == 0) {
		$('#my_btn_edit8').removeAttr("disabled");
		$('#my_btn_edit8').removeClass("gray_tableModal").addClass("blue");
	} else {
		$('#my_btn_edit8').attr("disabled", "disabled");
		$('#my_btn_edit8').removeClass("blue").addClass("gray_tableModal");
	}
	// 详情按钮的显示与否
	if (checkedsubList == 1 && permi[0] == 0) {
		$('#my_btn_detail8').removeAttr("disabled");
		$('#my_btn_detail8').removeClass("gray_tableModal").addClass("primary");
	} else {
		$('#my_btn_detail8').attr("disabled", "disabled");
		$('#my_btn_detail8').removeClass("primary").addClass("gray_tableModal");
	}
	// 删除按钮的显示与否
	if (checkedsubList > 0 && permi[3] == 0) {
		$('#my_btn_delete8').removeAttr("disabled");
		$('#my_btn_delete8').removeClass("gray_tableModal").addClass("danger");
	} else {
		$('#my_btn_delete8').attr("disabled", "disabled");
		$('#my_btn_delete8').removeClass("danger").addClass("gray_tableModal");
	}	
	changeTrBackgroundcolor8();

}

// 列表---全选反选
function checkAllListTrs8() {
	var isChecked = $("#checkAllListTrs8").prop('checked');
	$("input[name*='List8items']").prop("checked", isChecked);
	changeListTrs8();
	changeTrBackgroundcolor8();
}

/** **** 保存、详情、删除 ****** */

// 保存动作
function dosave8() {
	// alert(JSON.stringify(mygetSaveData8()));
	if (mygetSaveData8() != {}) {
		$.ajax({
			url : window.PATH + visit_url + "/save.ajax1", // 请求的url地址
			dataType : "json", // 返回格式为json
			async : true,// 请求是否异步，默认为异步，这也是ajax重要特性
			data : mygetSaveData8(), // 参数值
			type : "POST", // 请求方式
			success : function(res) {
				layer.msg.success(res.message);
				dosearch8('1');
				changeListTrs8();
				mycloseModel8("myeditModal8",true);
				// 请求成功时处理
			},
			error : function() {
				// 请求出错处理
			}
		});
	}

};

/**
 * 删除
 */
function dodelete8() {
	layer.confirm($.i18n("frame.from.tips.confirmDel"), function(idx) {
		$.ajax({
			url : window.PATH + visit_url + "/delete.ajax1", // 请求的url地址
			dataType : "json", // 返回格式为json
			async : true,// 请求是否异步，默认为异步，这也是ajax重要特性
			data : {
				idList : mygetSelectIdList8()
			},
			type : "POST", // 请求方式
			success : function(res) {
				layer.msg.success(res.message);
				dosearch8('1');
				// 请求成功时处理
			},
			error : function() {
				// 请求出错处理
			}
		});
		layer.close(idx);
	});

};

// 获取要删除条目的主键值数组
function mygetSelectIdList8() {
	var checkedsubList = $("input[name*='List8items']:checked");
	var deleteIds = [];
	for ( var i = 0; i < checkedsubList.length; i++) {
		var arr = checkedsubList[i].value.split("-|-");
		deleteIds[i] = arr[0];
	}
	return deleteIds;
}

// 取消编辑
function mycancelEdit8() {
	/*
	 * layer.confirm($.i18n("frame.from.tips.confirmCancel"), function (idx) {
	 * return mycloseModel8("myeditModal8") + layer.close(idx); });
	 */
	return mycloseModel8("myeditModal8");
};

// 同时隐藏详情、编辑、删除按钮
function disabledDAD8() {
	$('#my_btn_edit8').removeAttr("disabled");
	$('#my_btn_edit8').attr("disabled", "disabled").removeClass("primary").addClass("gray_tableModal");
	$('#my_btn_detail8').removeAttr("disabled");
	$('#my_btn_detail8').attr("disabled", "disabled").removeClass("blue").addClass("gray_tableModal");
	$('#my_btn_delete8').removeAttr("disabled");
	$('#my_btn_delete8').attr("disabled", "disabled").removeClass("danger").addClass("gray_tableModal");
}

// 点详情按钮查看详情
function btnViewDetails8() {
	var checkedsubList = $("input[name*='List8items']:checked"); // 获取选中的name中包含Listitems的值
	var arr = checkedsubList[0].value.split("-|-");
	viewDetails8(parseInt(arr[1]));
}

// 单击tr选中这一型的checkbox
function checkThisRow8(rowName) {
	$("input[name*='List8items']").prop("checked", false);
	$("input[name='" + rowName + "']").prop("checked", true);
	changeListTrs8();
	changeTrBackgroundcolor8();
}

// 搜索中清除按钮功能
function myclearSearch8() {
	// 清空搜索条件
	myclearSearchItems8();
	dosearch8('1');
}

/** **** 列表的排序、拖动改变宽度 ****** */

// 点排序显示
function dosort8(id) {
	MY_ORDER_LIST8 = [];
	var th = $("#" + id);
	var c = th.attr("class");
	if (c != null && c.indexOf('sorting') > -1) {
		th.removeClass('sorting').addClass('sorting_asc');
	}
	if (c != null && c.indexOf('sorting_asc') > -1) {
		th.removeClass('sorting_asc').addClass('sorting_desc');
	}
	if (c != null && c.indexOf('sorting_desc') > -1) {
		th.removeClass('sorting_desc').removeClass('sorting_asc').addClass(
				'sorting');
	}

	var html_sort = "";
	var sortingAsc = $(".sorting_asc");
	sortingAsc.each(function() {
		var asc = [];
		var tr_name_asc = $(this).attr("name");
		if (tr_name_asc.indexOf("th8_") > -1) {
			asc.push(tr_name_asc.replace("th8_", ""));
			asc.push(1);
			MY_ORDER_LIST8.push(asc);
		}

	});
	var sortingDesc = $(".sorting_desc");
	sortingDesc.each(function() {
		var desc = [];
		var tr_name_desc = $(this).attr("name");
		if (tr_name_desc.indexOf("th8_") > -1) {
			desc.push(tr_name_desc.replace("th8_", ""));
			desc.push(2);
			MY_ORDER_LIST8.push(desc);
		}

	});
	dosearch8('1');
}

// 获取所有是选中状态的checkbox ,更改tr父标签的背景色；获取所有不是选中状态的checkbox ,去掉tr父标签的背景色；
function changeTrBackgroundcolor8() {
	var checkedsubList = $("input[name*='List8items']:checked");
	var unCheckedsubList = $("input[name*='List8items']").not("input:checked");
	unCheckedsubList.each(function() {
		$(this).parents("tr").removeClass("active_tr");
	});
	checkedsubList.each(function() {
		$(this).parents("tr").addClass("active_tr");
	});
}

// 显示隐藏工具栏
function showTools9(tool, tab, tabpanle1, tabpanle2, tabpanle3) {
	$("#tab1").removeClass("active");
	$("#tab2").removeClass("active");
	$("#tab3").removeClass("active");
	$("#" + tab).addClass("active");

	$('#' + tabpanle1).show();
	$('#' + tabpanle2).hide();
	if (tabpanle3 != undefined) {
		$('#' + tabpanle3).hide();
	}

	if (tool == "tools") {
		$('#tools').show();
		$('#tools8').hide();
	} else if (tool == "tools8") {
		$('#tools8').show();
		$('#tools').hide();
	} else {
		$('#tools8').hide();
		$('#tools').hide();
	}
}

/** **************************** 同一个页面第二个列表 end ************************* */

/** **************************** 同一个页面第三个个列表 begin ************************* */

/** ** 列表初始化功能 **** */
function mydelayedInit9() {
	// 计算table高度
	var winHeight9 = document.documentElement.clientHeight;
	var dataTableDivHeight9 = winHeight9 - 186 - $(".stati-info").height()
			- $(".page-breadcrumbs").height();
	var $dataTBody9 = $(".data-tbody8"), $dataTHead9 = $(".data-thead8"), $html = $($("html")[0]);
	$dataTBody9.css("height", dataTableDivHeight9);
	/**  @author gya 概览页面的高度*/
   	$(".summary-tab").css("height", dataTableDivHeight9+81);
	// table body 滚动,带动table head平行移动,解决头部固定问题
	$dataTBody9.scroll(function(e) {
		return $dataTHead9.prop("scrollLeft", e.target.scrollLeft);
	});

	// 展开高级搜索调整table高度
	var $advSearch9 = $("#adv-search9"), $collapseAdvSearch9 = $("#collapse-adv-search9");
	$advSearch9.click(function() {
		var isExpanded9 = !JSON.parse($advSearch9.attr("aria-expanded"));
		var height9 = dataTableDivHeight9;
		if (isExpanded9) {
			$collapseAdvSearch9.show();
			$("#searchICON3").hide();
			$("#searchICON4").show();
			height9 = (dataTableDivHeight9 - $collapseAdvSearch9.height());
		} else {
			$collapseAdvSearch9.hide();
			$("#searchICON4").hide();
			$("#searchICON3").show();
			myclearSearchItems9();
		}
		$dataTBody9.css({
			"height" : height9 + "px"
		});
		$advSearch9.attr("aria-expanded", isExpanded9 + "");

	});
}

// 根据权限设置 增删改查按钮的显示
function setpermsion9() {
	// 操作许可 0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止
	// 设置详情、新增、编辑、删除按钮的显示与否
	if (permi[0] == 1) {
		$('#my_btn_detail9').hide();
	} else {
		$('#my_btn_detail9').attr("disabled", "disabled").removeClass("blue").addClass("gray_tableModal");
	}
	if (permi[1] == 1) {
		$('#my_btn_add9').hide();
	}
	if (permi[2] == 1) {
		$('#my_btn_edit9').hide();
	} else {
		$('#my_btn_edit9').attr("disabled", "disabled").removeClass("primary").addClass("gray_tableModal");
	}
	if (permi[3] == 1) {
		$('#my_btn_delete9').hide();
	} else {
		$('#my_btn_delete9').attr("disabled", "disabled").removeClass("danger").addClass("gray_tableModal");
	}
}

// 设置默认显示的列 和 列选项
function setTrs9(selectItems9) {
	var storage = window.localStorage;
	var selectItems_a = getTrs9();
	if (selectItems_a == "") {
		storage.setItem(itemName9, JSON.stringify(selectItems9));
	} else {
		if (selectItems9.resetTimes == selectItems_a.resetTimes) {
			selectItems9 = selectItems_a;
		} else {
			storage.removeItem(itemName9);
			storage.setItem(itemName9, JSON.stringify(selectItems9));
		}

	}

	var html = "";
	var selectItesjson = selectItems9.trs;
	for ( var i = 0; i < selectItesjson.length; i++) {
		html += "<li onclick=\"event.stopPropagation()\"><label style=\"margin: 0 0 0 20px;\">";
		html += "<input type=\"checkbox\"";
		if (selectItesjson[i].show == "true") {
			html += " checked ";
		}
		html += "name=\"items9\" value=\"" + selectItesjson[i].name
				+ "\" onchange=\"changeTrs9()\">";
		html += "<span class=\"text\"></span></label>"
				+ ($.i18n(tbI18n9 + selectItesjson[i].name) == null ? $
						.i18n("db.common." + selectItesjson[i].name) : $
						.i18n(tbI18n9 + selectItesjson[i].name)) + "</li>";
	}

	$("#selectItems9").html(html);

	var chsub = $("input[name='items9']").length; // 获取items的个数
	var checkedsub = $("input[name='items9']:checked").length; // 获取选中的items的个数
	if (checkedsub == chsub) {
		$("#checkAllTrs9").attr("checked", true);
	} else {
		$("#checkAllTrs9").attr("checked", false);
	}
}

// 获取本地存储需要显示的列json
function getTrs9() {
	var storage = window.localStorage;
	if (storage.getItem(itemName9) != null && storage.getItem(itemName9) != "") {
		var items9 = eval('(' + storage.getItem(itemName9) + ')');
		return items9;
	}
	return "";
}

// 打开窗口层
function myopenModel9(modalId, type) {
	if (type != "detail") {
		// 重置验证
		$("#registrationForm9").data('bootstrapValidator').resetForm();
		// 清空表单
		myclearForm9();

		if (type == 'edit') {
			setEditItems9();
		}
		if (type == 'new') {
			$("#editAddModel9").removeClass("text-primary").addClass(
					"text-success").html(
					"<i class=\"fa fa-plus\"></i> " + $.i18n("new"));
			$("#editAddType9").val("new");
		}
	}

	var $editModal = $('#' + modalId).modal({
		backdrop : 'static'
	});
	setTimeout(function() {
		$editModal.find("span.error").remove();
		$editModal.find("input.error").removeClass("error");
	}, 100);
}

// 关闭窗口层
function mycloseModel9(type, isSaveBtn) {
	if(!isSaveBtn && formChangeFlag2mycommon){
		layer.confirm($.i18n("frame.from.tips.confirmCancel"),function(idx){
			layer.close(idx);
			formChangeFlag2mycommon = false;//reset
			$('#' + type).modal('hide');
		});
	}else{
		formChangeFlag2mycommon = false;//reset
		$('#' + type).modal('hide');
	}
}

// 显示隐藏工具栏
function showTools99(tool, tabpanle1, tabpanle2, tabpanle3, tabpanle4,
		tabpanle5, tabpanle6, tabpanle7) {
	$('#' + tabpanle1).show();
	$('#' + tabpanle2).hide();
	if (tabpanle3 != undefined) {
		$('#' + tabpanle3).hide();
	}
	if (tabpanle4 != undefined) {
		$('#' + tabpanle4).hide();
	}
	if (tabpanle5 != undefined) {
		$('#' + tabpanle5).hide();
	}
	if (tabpanle6 != undefined) {
		$('#' + tabpanle6).hide();
	}
	if (tabpanle7 != undefined) {
		$('#' + tabpanle7).hide();
	}

	if (tool == "tools") {
		$('#tools').show();
		$('#tools8').hide();
		$('#tools9').hide();
	} else if (tool == "tools8") {
		$('#tools8').show();
		$('#tools').hide();
		$('#tools9').hide();
	} else if (tool == "tools9") {
		$('#tools9').show();
		$('#tools').hide();
		$('#tools8').hide();
	} else {
		$('#tools8').hide();
		$('#tools').hide();
		$('#tools9').hide();
	}
}

/** ** 列表查询、展示、分页 **** */

// 列表查询
var mydata9;
function dosearch9(page) {
	// alert(JSON.stringify(mygetSearchParams9()));
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	var pageSize = storage.getItem(PAGE_SIZE_LS_KEY);
	if (pageSize == null || pageSize == "") {
		pageSize = "25";
	}
	$.ajax({
		url : window.PATH + visit_url + "/list.ajax3?pageSize=" + pageSize
				+ "&page=" + page, // 请求的url地址
		data : mygetSearchParams9(), // 参数值
		type : "post", // 请求方式
		dataType : "json",
		success : function(req) {
			var newresult = req.data;
			mydata9 = newresult.contentList;
			showData9();
			var pageInfo = doPagination9(newresult, 'mychangePage9');
			var $tablePage = $("#toolsPage9");
			if (mydata9.length == 0) {
				$("#foot_page_tools9").hide();
			} else {
				$("#foot_page_tools9").show();
			}
			$tablePage.html(pageInfo);
			disabledDAD9();

			// 请求成功时处理
		},
		error : function(xhr, type, exception) {// 获取ajax的错误信息
			// alert(exception);
		}
	});

}

// 列表数据显示展示
function showData9() {
	// 取到需要显示的列
	var itemsdata = getTrs9();
	var show = [];
	var showLength = [];
	var j = 0;
	for ( var i = 0; i < itemsdata.trs.length; i++) {
		if (itemsdata.trs[i].show == "true") {
			show[j] = (itemsdata.trs[i].name);
			showLength[j] = (itemsdata.trs[i].width);
			j++;
		}
	}

	var html_thead = "";// 表头
	html_thead += "<th>  <label class=\"no-margin-bottom\"><input type=\"checkbox\" id=\"checkAllListTrs9\" onclick=\"checkAllListTrs9()\"><span class=\"text\"></span></label></th>";
	for ( var m = 0; m < show.length; m++) {
		// 设置排序
		var sort_str = "sorting";
		if (MY_ORDER_LIST9.length > 0) {
			for ( var y = 0; y < MY_ORDER_LIST9.length; y++) {
				var keyname = MY_ORDER_LIST9[y][0];
				var keysort = MY_ORDER_LIST9[y][1];
				if (show[m] == keyname) {
					if (keysort == 1) {
						sort_str = "sorting_asc";
					} else if (keysort == 2) {
						sort_str = "sorting_desc";
					}
				}
			}
		}
		html_thead += "<th draggable=\"false\" onmousedown=\"thonmousedown9('th9_"
				+ show[m]
				+ "')\" onmousemove=\"thonmousemove9('th9_"
				+ show[m]
				+ "')\" onmouseup=\"thonmouseup9('th9_"
				+ show[m]
				+ "')\" class=\""
				+ sort_str
				+ "\"  id=\"th9_"
				+ show[m]
				+ "\" name=\"th9_"
				+ show[m]
				+ "\"  style=\"cursor: default;\" >";
		html_thead += "<div class=\"table-data\" onClick=\"dosort9('th9_"
				+ show[m]
				+ "')\" draggable=\"false\" style=\"width: "
				+ showLength[m]
				+ "px; cursor: default;\">"
				+ ($.i18n(tbI18n9 + show[m]) == null ? $.i18n("db.common."
						+ show[m]) : $.i18n(tbI18n9 + show[m])) + "</div></th>";
	}

	var html_tdata = "";// 表数据
	for ( var n = 0; n < mydata9.length; n++) {
		html_tdata += "<tr onclick=\"checkThisRow9('List9items"
				+ n
				+ "')\" onDblClick=\"viewDetails9('"
				+ n
				+ "')\"><td><label style=\"margin-bottom:0;\" onclick=\"event.stopPropagation()\"><input type=\"checkbox\" name=\"List9items"
				+ n
				+ "\" value=\""
				+ eval('mydata9[' + n + '].' + tablekey9)
				+ "-|-"
				+ n
				+ "\"   onclick=\"changeListTrs9()\"><span class=\"text\"></span></label></td>";
		for ( var k = 0; k < show.length; k++) {
			var tdname = show[k];
			var showLengthData = showLength[k];
			var dataTdValue = eval('mydata9[' + n + '].' + tdname);
			if (dataTdValue == undefined) {
				dataTdValue = "";
			}
			// 列表展示数据转换
			var html = changeData9(tdname, showLengthData, dataTdValue);
			html_tdata += html;
		}
		html_tdata += "</tr>";
	}

	$("#html_thead9").html(html_thead);
	$("#html_tdata9").html(html_tdata);
}

/**
 * js生成bootstrap page
 * 
 * @param page
 *            page
 * @param pageFun
 *            页面改变js函数
 * @return 当前用户肤色样式
 */

function doPagination9(page, pageFun) {
	page = page || {};
	pageFun = pageFun || "pageFun";
	var sb = "";
	var paginationSize = 5;
	var current = (page.number + 1) || "-";
	var begin = Math.max(1, current - parseInt(paginationSize / 2));
	var end = Math.min(begin + (paginationSize - 1), page.totalPages);
	var size = page.size || "-";
	var totalEle = page.totalElements || "-";
	var totalPages = page.totalPages || "-";
	sb += "<div><ul class=\"pagination\">";

	if (page.hasPreviousPage) {
		sb += "<li><a page=\"1\" href=\"" + getAFunStr(1, size, pageFun)
				+ "\">&lt;&lt;</a></li>";
		sb += "<li><a href=\"" + getAFunStr(current - 1, size, pageFun)
				+ "\">&lt;</a></li>";
	} else {
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;&lt;</a></li>";
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;</a></li>";
	}
	for ( var i = begin; i < (end + 1); i++) {
		if (i == current) {
			sb += "<li class=\"active\"><a page=\"" + i
					+ "\" href=\"javascript:\">" + i + "</a></li>";
		} else {
			sb += "<li><a href=\"" + getAFunStr(i, size, pageFun) + "\">" + i
					+ "</a></li>";
		}
	}
	if (page.hasNextPage) {
		sb += "<li><a href=\"" + getAFunStr(current + 1, size, pageFun)
				+ "\">&gt;</a></li>";
		sb += "<li><a href=\"" + getAFunStr(page.totalPages, size, pageFun)
				+ "\">&gt;&gt;</a></li>";
	} else {
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;</a></li>";
		sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;&gt;</a></li>"; // event.keyCode==13
																					// &&
																					// "+pageFun+"("+this.value+","+size+")
	}

	var pageNum = "<input style='width:30px;margin:1px 5px;' value='" + current
			+ "' onkeydown='event.keyCode==13&&" + pageFun + "(this.value,"
			+ size + ")'>";
	sb += "<li class=\"disabled\"><a href=\"javascript:\">"
			+ $.i18n("page_tools.tips", totalPages, totalEle) + "</a></li>";
	sb += "<li><span style='padding:3px 12px;'>"
			+ $.i18n("page_tools.goto_page", pageNum) + "</span></li>";
	sb += "<ul></div>";

	return sb;
};

// 改变分页数量
function changePageSize9() {
	var pageSize = $("#pagesizeSelect9").val();
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	storage.setItem(PAGE_SIZE_LS_KEY, parseInt(pageSize));
	dosearch9('1');
}

// 设置分页数量下拉框的值
function setSelectPageSize9() {
	var storage = window.localStorage;
	var PAGE_SIZE_LS_KEY = "config.table.pageSize";
	var selectPagesize = storage.getItem(PAGE_SIZE_LS_KEY);
	if (selectPagesize == null || selectPagesize == "") {
		selectPagesize = "25";
	}
	$("#pagesizeSelect9").val(selectPagesize);
}

// 点击分页码数
function mychangePage9(page, pageSize) {
	dosearch9(page);
}

/** **** 对checkbox的操作 ****** */
// 更改要显示的列
function changeTrs9() {
	var chsub = $("input[name='items9']").length; // 获取items的个数
	var checkedsub = $("input[name='items9']:checked").length; // 获取选中的items的个数
	if (checkedsub == chsub) {
		$("#checkAllTrs9").prop("checked", true);
	} else {
		$("#checkAllTrs9").prop("checked", false);
	}

	var oldTrs = getTrs9();
	var showLength_old = [];

	for ( var j = 0; j < oldTrs.trs.length; j++) {
		showLength_old[j] = oldTrs.trs[j].width;
	}
	var obj = document.getElementsByName('items9');
	var s = '{"resetTimes": "' + oldTrs.resetTimes + '","trs": [';
	for ( var i = 0; i < obj.length; i++) {
		if (i < obj.length - 1) {
			s += '{ "name": "' + obj[i].value + '",';
			if (obj[i].checked) {
				s += '"show": "true",';
			} else {
				s += '"show": "false",';
			}
			s += '"width": "' + showLength_old[i] + '"},';
		} else {
			s += '{ "name": "' + obj[i].value + '",';
			if (obj[i].checked) {
				s += '"show": "true",';
			} else {
				s += '"show": "false",';
			}
			s += '"width": "' + showLength_old[i] + '"}';
		}
	}
	s += ']}';
	var storage = window.localStorage;
	storage.setItem(itemName9, s);
	showData9();

}

// 更改要显示的列 -- 全选反选
function checkAllTrs9() {
	var isChecked = $("#checkAllTrs9").prop('checked');
	$("input[name='items9']").prop("checked", isChecked);
	changeTrs9();
}

// 重置
function myResetTrs9() {
	var storage = window.localStorage;
	storage.removeItem(itemName9);
	setTrs9(resetSelectItems9);
	dosearch9('1');
}

// 列表---更改要显示的列
function changeListTrs9() {
	var chsubList = $("input[name*='List9items']").length; // 获取items的个数
	var checkedsubList = $("input[name*='List9items']:checked").length; // 获取选中的items的个数
	if (checkedsubList == chsubList) {
		$("#checkAllListTrs9").prop("checked", true);
	} else {
		$("#checkAllListTrs9").prop("checked", false);
	}
	// 操作许可 0|0|0|0 对应,details|add|edit|delete ,0=许可,1=禁止	
	if (checkedsubList == 1 && permi[2] == 0) {
		$('#my_btn_edit9').removeAttr("disabled");
		$('#my_btn_edit9').removeClass("gray_tableModal").addClass("blue");
	} else {
		$('#my_btn_edit9').attr("disabled", "disabled");
		$('#my_btn_edit9').removeClass("blue").addClass("gray_tableModal");
	}
	// 详情按钮的显示与否
	if (checkedsubList == 1 && permi[0] == 0) {
		$('#my_btn_detail9').removeAttr("disabled");
		$('#my_btn_detail9').removeClass("gray_tableModal").addClass("primary");
	} else {
		$('#my_btn_detail9').attr("disabled", "disabled");
		$('#my_btn_detail9').removeClass("primary").addClass("gray_tableModal");
	}
	// 删除按钮的显示与否
	if (checkedsubList > 0 && permi[3] == 0) {
		$('#my_btn_delete8').removeAttr("disabled");
		$('#my_btn_delete8').removeClass("gray_tableModal").addClass("danger");
	} else {
		$('#my_btn_delete8').attr("disabled", "disabled");
		$('#my_btn_delete8').removeClass("danger").addClass("gray_tableModal");
	}
	changeTrBackgroundcolor9();

}

// 列表---全选反选
function checkAllListTrs9() {
	var isChecked = $("#checkAllListTrs9").prop('checked');
	$("input[name*='List9items']").prop("checked", isChecked);
	changeListTrs9();
	changeTrBackgroundcolor9();
}

/** **** 保存、详情、删除 ****** */

// 保存动作
function dosave9() {
	// alert(JSON.stringify(mygetSaveData9()));
	if (mygetSaveData9() != {}) {
		$.ajax({
			url : window.PATH + visit_url + "/save.ajax1", // 请求的url地址
			dataType : "json", // 返回格式为json
			async : true,// 请求是否异步，默认为异步，这也是ajax重要特性
			data : mygetSaveData9(), // 参数值
			type : "POST", // 请求方式
			success : function(res) {
				layer.msg.success(res.message);
				dosearch9('1');
				changeListTrs9();
				mycloseModel9("myeditModal9",true);
				// 请求成功时处理
			},
			error : function() {
				// 请求出错处理
			}
		});
	}

};

/**
 * 删除
 */
function dodelete9() {
	layer.confirm($.i18n("frame.from.tips.confirmDel"), function(idx) {
		$.ajax({
			url : window.PATH + visit_url + "/delete.ajax1", // 请求的url地址
			dataType : "json", // 返回格式为json
			async : true,// 请求是否异步，默认为异步，这也是ajax重要特性
			data : {
				idList : mygetSelectIdList9()
			},
			type : "POST", // 请求方式
			success : function(res) {
				layer.msg.success(res.message);
				dosearch9('1');
				// 请求成功时处理
			},
			error : function() {
				// 请求出错处理
			}
		});
		layer.close(idx);
	});

};

// 获取要删除条目的主键值数组
function mygetSelectIdList9() {
	var checkedsubList = $("input[name*='List9items']:checked");
	var deleteIds = [];
	for ( var i = 0; i < checkedsubList.length; i++) {
		var arr = checkedsubList[i].value.split("-|-");
		deleteIds[i] = arr[0];
	}
	return deleteIds;
}

// 取消编辑
function mycancelEdit9() {
	/*
	 * layer.confirm($.i18n("frame.from.tips.confirmCancel"), function (idx) {
	 * return mycloseModel9("myeditModal9") + layer.close(idx); });
	 */
	return mycloseModel9("myeditModal9");
};

// 同时隐藏详情、编辑、删除按钮
function disabledDAD9() {
	$('#my_btn_edit9').removeAttr("disabled");
	$('#my_btn_edit9').attr("disabled", "disabled").removeClass("primary").addClass("gray_tableModal");
	$('#my_btn_detail9').removeAttr("disabled");
	$('#my_btn_detail9').attr("disabled", "disabled").removeClass("blue").addClass("gray_tableModal");
	$('#my_btn_delete9').removeAttr("disabled");
	$('#my_btn_delete9').attr("disabled", "disabled").removeClass("danger").addClass("gray_tableModal");
}

// 点详情按钮查看详情
function btnViewDetails9() {
	var checkedsubList = $("input[name*='List9items']:checked"); // 获取选中的name中包含Listitems的值
	var arr = checkedsubList[0].value.split("-|-");
	viewDetails9(parseInt(arr[1]));
}

// 单击tr选中这一型的checkbox
function checkThisRow9(rowName) {
	$("input[name*='List9items']").prop("checked", false);
	$("input[name='" + rowName + "']").prop("checked", true);
	changeListTrs9();
	changeTrBackgroundcolor9();
}

// 搜索中清除按钮功能
function myclearSearch9() {
	// 清空搜索条件
	myclearSearchItems9();
	dosearch9('1');
}

/** **** 列表的排序、拖动改变宽度 ****** */

// 点排序显示
function dosort9(id) {
	MY_ORDER_LIST9 = [];
	var th = $("#" + id);
	var c = th.attr("class");
	if (c != null && c.indexOf('sorting') > -1) {
		th.removeClass('sorting').addClass('sorting_asc');
	}
	if (c != null && c.indexOf('sorting_asc') > -1) {
		th.removeClass('sorting_asc').addClass('sorting_desc');
	}
	if (c != null && c.indexOf('sorting_desc') > -1) {
		th.removeClass('sorting_desc').removeClass('sorting_asc').addClass(
				'sorting');
	}

	var html_sort = "";
	var sortingAsc = $(".sorting_asc");
	sortingAsc.each(function() {
		var asc = [];
		var tr_name_asc = $(this).attr("name");
		if (tr_name_asc.indexOf("th9_") > -1) {
			asc.push(tr_name_asc.replace("th9_", ""));
			asc.push(1);
			MY_ORDER_LIST9.push(asc);
		}

	});
	var sortingDesc = $(".sorting_desc");
	sortingDesc.each(function() {
		var desc = [];
		var tr_name_desc = $(this).attr("name");
		if (tr_name_desc.indexOf("th9_") > -1) {
			desc.push(tr_name_desc.replace("th9_", ""));
			desc.push(2);
			MY_ORDER_LIST9.push(desc);
		}

	});
	dosearch9('1');
}

// 获取所有是选中状态的checkbox ,更改tr父标签的背景色；获取所有不是选中状态的checkbox ,去掉tr父标签的背景色；
function changeTrBackgroundcolor9() {
	var checkedsubList = $("input[name*='List9items']:checked");
	var unCheckedsubList = $("input[name*='List9items']").not("input:checked");
	unCheckedsubList.each(function() {
		$(this).parents("tr").removeClass("active_tr");
	});
	checkedsubList.each(function() {
		$(this).parents("tr").addClass("active_tr");
	});
}

/** ******************************************************** */

function toDecimal(x, y) {
	var f = parseFloat(x);
	if (isNaN(f)) {
		return x;
	}
	var f = Math.round(x * 10) / 10;
	if (y == 2) {
		f = Math.round(x * 100) / 100;
	}
	var s = f.toString();
	var rs = s.indexOf('.');
	if (rs < 0) {
		rs = s.length;
		s += '.';
	}
	while (s.length <= rs + y) {
		s += '0';
	}
	return s;
}

function setToday(isFullTime) {
	var myDate = new Date();
	var month = parseInt(myDate.getMonth()) + 1;
	if (month < 10) {
		month = "0" + month;
	}
	var dateVal = myDate.getDate();
	if (dateVal < 10) {
		dateVal = "0" + dateVal;
	}
	var result = myDate.getFullYear() + "-" + month + "-" + dateVal;
	if (isFullTime) {
		var hour = myDate.getHours(); // 获取当前小时数(0-23)
		if (hour < 10) {
			hour = "0" + hour;
		}
		var minute = myDate.getMinutes(); // 获取当前分钟数(0-59)
		if (minute < 10) {
			minute = "0" + minute;
		}
		var second = myDate.getSeconds();
		if (second < 10) {
			second = "0" + second;
		}
		result += " " + hour + ":" + minute + ":" + second;
	}
	return result;
}
