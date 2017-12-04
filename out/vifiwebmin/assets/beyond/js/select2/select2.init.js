require("./select2.js");
//cookie 中取出,语言字符串
var arr, reg = new RegExp("(^| )language=([^;]*)(;|$)");
var lang = ( arr = document.cookie.match(reg) ) ? arr[2] :  "zh_CN";

$.fn.select2.locales['zh_CN'] = {
    formatMatches: function (matches) { if (matches === 1) { return "一个结果是可用的,按enter键来选择它."; } return matches + " 结果,使用向上和向下箭头键来浏览."; },
    formatNoMatches: function () { return "没有匹配的搜索结果"; },
    formatAjaxError: function (jqXHR, textStatus, errorThrown) { return "加载失败"; },
    formatInputTooShort: function (input, min) { var n = min - input.length; return "请输入 " + n + " 或多个字符"; },
    formatInputTooLong: function (input, max) { var n = input.length - max; return "请删除 " + n + " 字符"; },
    formatSelectionTooBig: function (limit) { return "你只能选择 " + limit + " 项"; },
    formatLoadMore: function (pageNumber) { return "加载更多的结果…"; },
    formatSearching: function () { return "搜索…"; }
};


$.extend($.fn.select2.defaults, $.fn.select2.locales[lang]);

