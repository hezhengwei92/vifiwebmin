var Utils = require("commonUtils");

var HOME_URI = "#/home";
function Helps() {
}
/**
 * javascript 前端 js 国际化处理.
 *
 * $.i18n 或 $scope.i18n 都行
 *
 * 获得国际化值例子:  方式1: $.i18n("language")
 *                  方式2: $.i18n.map.language[""];    // 必须要带[""], 国际化文件转js JSON时,因为有可能有下级属性.所以值不能直接赋值,
 * 格式化输出例子 :  $.i18n("page_tools.tips", totalPages, totalEle)  // {0} {1}参数对应如下格式.
 */
Helps.i18nUtil = function () {
    $.ajax({
        url: PATH + '/assets/bundle/i18n/' + window.LANGUAGE + ".json",
        type: "get", async: false,
        complete: function (res) {
            /*   db.tbGlobalSIM.status.comData =[["0","正常"],["1","禁用"]] */
            $.i18n = function (code) {
                var param = arguments, value = getI18N(code);
                // 格式化字符串 {0} {1} 对应参数2,参数3,
                return (param.length > 1) && value ? value.replace(/\{(.*?)\}/g, (p, num)=>param[num * 1 + 1]) : value;
            };
            $.i18n.map = JSON.parse(res.responseText);

            function getI18N(code) {
                try {
                    return Utils.objInvoke($.i18n.map, code)[""];
                } catch (e) {
                    return null;
                }
            }
        }
    });
};

//$(".class1 .class2") 选择class1元素下class2的元素（中间有空格）
//$(".class1.class2") 选择同时含有class1和class2的元素（中间没有空格）
//$(".class1,.class2") 选择class1或者class2的元素（中间有逗号）
//closest(".aa") class="aa" aa的上一级元素
// 切换页面同步面包 导航标题  以及颜色和下标跟着变
Helps.syncBreadcrumb = function () {
    // 获取
    var $active = $(".submenu .active span");
    var nameL1 = $active.closest(".menu-l1").find("> a span").html();
    var nameL2 = $active.html();
    // *** 写入
    var $breaLi = $(".breadcrumb > li:gt(0)");
    $breaLi.eq(0).find("a").html(nameL1 || $.i18n("menu.home"))
    $breaLi.eq(1)[nameL2 ? 'show' : 'hide']().find("a").html(nameL2);
};

// 侧边栏选择状态
var $menus = null;
Helps.navbarSelState = function () {
    $menus = $menus || $(".sidebar-menu li");
    $menus.removeClass("active");
    var route = /#.*/.exec(location.href)[0];
    if (route == HOME_URI) {
        $menus.eq(0).addClass("active");
    } else {
        var $thisMenuA = $menus.find("a[href='" + route + "']");
        // 选中的样式.
        $thisMenuA.closest("li").addClass("active").closest(".menu-l1").addClass("open");
    }
};


// bootstrap 模态框窗口 移动扩展, 在bootstrap 初始化后 调用
Helps.btModalMoveEx = function () {
    function moveEx($this) {
        var $head = $this.find(".modal-header"), $dialog = $this.find(".modal-dialog");
        var move = {isMove: false, left: 0, top: 0};
        $this.on("mousemove", function (e) {
            if (!move.isMove) return;
            $dialog.offset({top: e.pageY - move.top, left: e.pageX - move.left});
        }).on("mouseup", function () {
            move.isMove = false;
        });
        $head.on("mousedown", function (e) {
            move.isMove = true;
            var offset = $dialog.offset();
            move.left = e.pageX - offset.left;
            move.top = e.pageY - offset.top;
        });
    }

    var old = $.fn.modal;
    $.fn.modal = function (o, _r) {
        var $this = $(this);
        // 标识 是否已经绑定过移动事件了.用于防止重复绑定
        if (!$this.attr("isbindmv")) {
            $this.attr("isbindmv", "1");

            moveEx($this);
        }
        return old.call(this, o, _r);
    };
};


// 其他的一些jquery,初始化
Helps.initIndexAct = function () {
    if (!/#/.test(location.href)) {
        return location.href = HOME_URI;
    }
    // 用这个判断,angular 是否为初始化完成!!!未初始化,继续调用自身
    if ($(".sidebar-menu li").length < 3) {
        return setTimeout(initIndexAct, 200);
    }

    //*** 帮助搜索,帮助提示层的展示控制.
    var $helpTips = $(".searchhelper");
    $(".searchinput").focus(()=>$helpTips.show()).blur(()=>setTimeout(() =>$helpTips.hide(), 150));

    //*** 侧边导航,菜单展开高度控制
    var winHeight = document.documentElement.clientHeight;
    var headHeight = $(".navbar-header").height();

    //  Page Content 最小高度计算,因为侧边栏是跟随,page-content高度的,不设置的话,侧边栏会显示不完全!
    $(".page-content").css("min-height", winHeight - headHeight)
};


module.exports = Helps;
