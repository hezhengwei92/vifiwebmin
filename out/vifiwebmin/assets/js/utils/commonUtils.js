window._ = require("../libs/underscore.js");

function Utils() {
}
// ***js下载特定内容
function fake_click(obj) {
    var ev = document.createEvent("MouseEvents");
    ev.initMouseEvent(
        "click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null
    );
    obj.dispatchEvent(ev);
}
//子页面导出
Utils.export_raw = function (name, data) {
    var urlObject = window.URL || window.webkitURL || window;
    var exportBlob = new Blob(["\ufeff" + data], {type: 'text/csv,charset=UTF-8'});
    var saveLink = document.createElementNS("http://www.w3.org/1999/xhtml", "a");
    saveLink.href = urlObject.createObjectURL(exportBlob);
    saveLink.download = name;
    fake_click(saveLink);
};

// 获得字符串在html中的宽度~
Utils.getStrHtmlWidth = function (str, fontSize) {
    var $getStrWidth = $("<span style='display:none;font-size:" + (fontSize || 12) + "px;'>" + str + "</span>");
    $("body").append($getStrWidth);
    var w = $getStrWidth.width();
    $getStrWidth.remove();
    return w;
};

/**
 * 用key获得selData的值
 * @param selData  selData 的二位数组
 * @param key
 */
Utils.getSelVal = function (selData, key) {
    if (!_.isArray(selData)) throw new Error("selData 需要是一个有2个元素的数组!!");
    for (var i = 0; i < selData.length; i++) {
        var obj = selData[i];
        if (obj[0] === key) {
            return obj[1];
        }
    }
    return null;
};
/**
 * 对象属性调用,字符串方式调用对象的属性,     避免使用eval,因为eval速度太慢了.
 * @param obj  对象
 * @param property   属性调用字符串,例: "person.lehman.name"
 */
Utils.objInvoke = function (obj, property) {
    var currentObj = obj;
    var packList = property.split(".");// 名称切割为类似 包名.的层次
    for (var i = 0; i < packList.length; i++) {
        var pack = packList[i];
        try {
            currentObj = currentObj[pack];// 像链表一样,向下走
        } catch (e) {
            console.log("Utils.objInvoke()," + packList[i - 1] + "." + pack + ",属性调用错误");
            return undefined;
        }
    }
    return currentObj;
};

//***********************************cookis **********************************
Utils.setCookie = function (name, value, daysTime) {
    var exp = new Date();
    exp.setTime(exp.getTime() + daysTime * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
};
//读取cookies
Utils.getCookie = function (name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
};
//删除cookies
Utils.delCookie = function (name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
};

//***********************************其他一些插件**********************************
/**
 * ladate 日期插件angular 包装
 * @param options   ladate 参数
 */
Utils.laydate = function (options, $event) {
	var formatStr = (options && options.format)?options.format:'YYYY-MM-DD hh:mm:ss';
    var op = {
        istime: true, //是否开启时间选择
        format:  formatStr//日期格式
    };
    laydate.call(this, $.extend(op, options))
    // laydate();
};

/**
 * @description:在规定时间内,只执行一次代码,避免短时间内重复执行(闭包TimeOut)
 * @return 例: var runTimeOut = Utils.TimeOutOne(500,func);使用 runTimeOut();
 */
Utils.TimeOutOne = function (time, func) {
    var index = null;
    return function () {
        index && clearTimeout(index);
        index = setTimeout(func, time);
    };
};

/**
 * 获取url中的参数,静态页面之间的传值 request.getParameter("dataName");
 */
Utils.request = {
    getParameter: function (val) {
        var uri = window.location.href;
        var re = new RegExp("" + val + "=([^&?]*)", "ig");
        return uri.match(re) ? uri.match(re)[0].substr(val.length + 1) : null;
    }
};

/**
 * js生成bootstrap  page  使用方式：<span ng-html="Utils.pagination(view.userPage,'changePage')"></span>
 * @param page page
 * @param pageFun 页面改变js函数
 * @return 当前用户肤色样式
 */
Utils.pagination = function (page, pageFun) {
    page = page || {};
    pageFun = pageFun || "pageFun";
    var sb = "";
    var paginationSize = 5;
    var current = (page.number || page.number==0 )?(page.number+1):"";//page.number=0时会被判断为false
    var begin = Math.max(1, current - parseInt(paginationSize / 2));
    var end = Math.min(begin + (paginationSize - 1), page.totalPages);
    var size = page.size || "0";
    var totalEle = page.totalElements || "0";
    var totalPages = page.totalPages || "0";

    /**
     * 分页回调
     * @param no 第几页
     * @param size 每页显示多少条
     * @param pageFun pageFun
     * @return 字符串
     */
    function getAFunStr(no, size) {
        return "javascript:" + pageFun + "(" + no + "," + size + ");";
    }

    sb += "<div><ul class=\"pagination\">";

    if (page.hasPreviousPage) {
        sb += "<li><a page=\"1\" href=\"" + getAFunStr(1, size) + "\">&lt;&lt;</a></li>";
        sb += "<li><a href=\"" + getAFunStr(current - 1, size) + "\">&lt;</a></li>";
    } else {
        sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;&lt;</a></li>";
        sb += "<li class=\"disabled\"><a href=\"javascript:\">&lt;</a></li>";
    }
    for (var i = begin; i < (end + 1); i++) {
        if (i == current) {
            sb += "<li class=\"active\"><a page=\"" + i + "\" href=\"javascript:\">" + i + "</a></li>";
        } else {
            sb += "<li><a href=\"" + getAFunStr(i, size) + "\">" + i + "</a></li>";
        }
    }
    if (page.hasNextPage) {
        sb += "<li><a href=\"" + getAFunStr(current + 1, size) + "\">&gt;</a></li>";
        sb += "<li><a href=\"" + getAFunStr(page.totalPages, size) + "\">&gt;&gt;</a></li>";
    } else {
        sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;</a></li>";
        sb += "<li class=\"disabled\"><a href=\"javascript:\">&gt;&gt;</a></li>"; //event.keyCode==13 && "+pageFun+"("+this.value+","+size+")
    }

    var pageNum = "<input style='width:30px;margin:1px 5px;' value='" + current + "' onkeydown='event.keyCode==13&&" + pageFun + "(this.value," + size + ")'>";
    sb += "<li class=\"disabled\"><a href=\"javascript:\">" + $.i18n("page_tools.tips", totalPages, totalEle) + "</a></li>";
    sb += "<li><span style='padding:3px 12px;'>" + $.i18n("page_tools.goto_page", pageNum) + "</span></li>";
    sb += "<ul></div>";

    return sb;
};


/******************************窗口打开 iframe ****************************************/
/**
 * 打开iframe
 * @param url
 * @param title
 * @param width default 400
 * @param height default 600
 */
Utils.openWindow = function (url, title, width, height) {
    width = width || 400;
    height = height || 600;
    layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: [width + 'px', height + 'px'],
        content: url
    });
};

/******************************jquery ajax的一点儿小包装****************************************/
var AJAX_TIMEOUT_TM = 20000;

$(document).ajaxError(function () {
    console.error(arguments);
});

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

/**
 * jquery ajax的一点儿小包装
 * @param param jquery 一样的 对象参数, 不设置则包装方法默认的参数
 * @returns {{state: string}|*}
 */
Utils.ajax = function (param) {
    var loadInx = layer.load(2);
    $.ajax({
        url: param.url,
        type: param.type || "post",
        timeout: param.timeout || AJAX_TIMEOUT_TM, //超时时间设置，单位毫秒
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


Utils.jsonp = function (param) {
    var loadInx = layer.load(2);
    $.ajax({
        url: param.url,
        dataType: "jsonp",
        jsonp: "jsonpcallback",
        timeout: param.timeout || AJAX_TIMEOUT_TM, //超时时间设置，单位毫秒
        complete: param.complete || function (XMLHttpRequest, status) { //请求完成后最终执行参数
            ajaxComplete(XMLHttpRequest, status, loadInx);
        },//请求完成后最终执行参数
        data: param.data || {},
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

// 同步的ajax
Utils.syncAjax = function (param) {
    var loadInx = layer.load(2);
    var result;
    $.ajax({
        url: param.url,
        type: param.type || "post",
        async: false,
        timeout: param.timeout || AJAX_TIMEOUT_TM, //超时时间设置，单位毫秒
        complete: param.complete || function (XMLHttpRequest, status) { //请求完成后最终执行参数
            ajaxComplete(XMLHttpRequest, status, loadInx);
        },//请求完成后最终执行参数
        data: param.data || {},
        dataType: param.dataType || "json",
        success: function (res) {
            try {
                if (res.state != 0)
                    return layer.msg.error("error:" + res.message);
            } catch (e) {
            }
            result = res;
            res.message && layer.msg.success(res.message);
        }
    });
    return result;
};
/**
 * 高亮html内容
 */
Utils.hiLiteContent = function (ctt, keyword) {
    if ((keyword = String(keyword)) && (ctt = String(ctt))) {
        var rgeKey = keyword.replace(/([\*\.\?\+\$\^\[\]\(\)\{\}\|\\\/])/g, '\\$1');
        var hlHtml = "<span style='background:#FFE792'>" + keyword + "</span>";
        ctt = ctt.replace(new RegExp(rgeKey, "g"), hlHtml);
    }
    return ctt;
};

module.exports = Utils;
