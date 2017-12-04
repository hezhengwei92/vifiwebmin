/**
 * 模块过滤器.定义.
 */
var appModule = require("./crtModule");

// 时间人性化显示过滤器
var timeEnum = [["年前", 31104000], ["月前", 2592000], ["天前", 86400], ["小时前", 3600], ["分钟前", 60], ["秒前", 1]];
appModule.filter('simpTime', function () {
    return function (input) {
        var time = (new Date().getTime() - input) / 1000;
        for (var i = 0; i < timeEnum.length; i++) {
            var val = parseInt((time / timeEnum[i][1]).toFixed(3));
            if (val) {
                return val + timeEnum[i][0];
            }
        }
        return "刚刚";
    };
});
//html 输出过滤器 使用方式: <div ng-bind-html="value|html"></div>
appModule.filter('html', ['$sce', function ($sce) {
        return (text)=>$sce.trustAsHtml(text)
    }]
);
// 转换为html标签,,,\n等... 带有$sce.trustAsHtml,所以不用一起用html过滤器了
appModule.filter('toHtmlTag', ['$sce', function ($sce) {
    return function (text) {
        if (text) {
            text = text.replace(/\n/g, "<br>");
            text = $sce.trustAsHtml(text);
        }
        return text;
    }
}]);

module.exports = appModule;







