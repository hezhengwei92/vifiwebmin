require("./validate.css");
require("./jquery.validate");
$.extend($.validator.defaults, {
    errorElement: "span"
});

// 时间, 源码里的date,firefox 不能用!
$.validator.addMethod("date", function (value, element) {
    return this.optional(element) || /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/g.test(value);
});

//验证小数点后的位数
$.validator.addMethod("decimals", function (value, element, num) {
    var decInx = (value.indexOf(".") + 1) || value.length;
    return this.optional(element) || (value.length - decInx) <= num;
});


// 按需加载特定国际化消息文件
require.ensure([], function (require) {
    require("./messages/" + window.LANGUAGE);
});