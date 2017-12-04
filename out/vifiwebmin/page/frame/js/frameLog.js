var appModule = require("appModule");
require("jquery.mousewheel");


appModule.controller("frameLogCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    // 当前日志模块名
    var urlArr = location.href.split("/");
    $scope.logModelName = urlArr[urlArr.length - 1];

    var viewCfg = {
        currentUri: "/syslog/fs/" + $scope.logModelName + "/"
    };

    //call模拟 继承 AngularBaseCtrl父类
    AngularBaseCtrl.call(this, $scope, $rootScope, viewCfg);

    /**
     * 日志归档操作
     * @param fileName
     */
    $scope.logRecycle = function (fileName) {
        var inx = layer.confirm("确认放入回收站?", {
            scrollbar: false,
            shadeClose: true
        }, delYes);

        function delYes() {
            layer.close(inx);
            Utils.ajax({
                url: prefixUrl + "recycle.ajax",
                data: {
                    fileName: fileName
                },
                success: function () {
                    $scope.search();
                }
            });
        }
    };
    /**
     * 日志下载操作
     * @param fileName
     */
    $scope.logDown = function (fileName) {
        alert("1111 "+$scope.prefixUrl)
        if("ViFiWebmin"==fileName){
            alert("--"+fileName);
        }else {
            alert(fileName);
        }

        location.href = $scope.prefixUrl + "download/" + fileName;
    };

    /**
     * 打开实时查询窗口
     */
    $scope.openRealTime = function (fileName) {
        realTimeQuery(fileName, $('#realTimeModal').modal('show'));
    };

    /**
     * 日志实时查询
     */
    function realTimeQuery(fileName, $modal) {
        var url = $scope.prefixUrl + "realTimeQuery.ajax?fileName=" + fileName;
        Utils.ajax({
            url: url,
            success: function (res) {
                $scope.$apply(function () {
                	debugger;
                	var str = res.data;
                	var replaceStr1 = "2016";
                	str.replace(new RegExp(replaceStr1,'gm'),"<span style='color:red;'>2016</span>");
                    $scope.view.realDate = str;
                });

                setTimeout(function () {
                    // 通过窗口是否显示.判断是否该继续实时查询
                    if ($modal.is(":visible")) {
                        realTimeQuery(fileName, $modal);
                    }
                }, 1000);
            }
        });
    }

    //////////////////////////////////////////////////////////////////////////////////
    // 详情操作
    //////////////////////////////////////////////////////////////////////////////////
    $scope.openDetails = function (fileName) {
        $scope.form.fileName = fileName;
        changePageDetails(1);
        $('#logDetModal').modal('show');
    };

    var DET_PAGE_SIZE = 35;
    $scope.searchDetails = function (pageNumber) {
        Utils.ajax({
            url: $scope.prefixUrl + "/details/" + $scope.form.fileName + ".ajax?pageSize=" + DET_PAGE_SIZE + "&page=" + (pageNumber || 1),
            data: {
                'cx_LIKE-|-keyword': $scope.form.keyword
            },
            success: function (res) {
                $scope.view.pageDetails = res.data;
                // 整理行号!!
                var lineNmb = [];
                for (var i = 1; i <= res.data.size; i++) {
                    lineNmb.push(res.data.number * res.data.size + i);
                }
                $scope.view.pageDetails.lineNmb = lineNmb;
                $scope.$apply();
            }
        });
    };
    // 临时不执行滚动翻页事件
    var tmpNotScrollEv = false;
    //日志详情分页事件
    window.changePageDetails = function (pageNumber) {
        $scope.searchDetails(pageNumber);
        tmpNotScrollEv = true;
        $logScroll.scrollTop($scope.DET_HG * (pageNumber - 1));
    };

    ///////////////////////////////////翻页部分/////////////////
    /**
     * 按键 翻页控制
     */
    // 37:left,39:right,38:up,40:down,33:page up,34:page down
    var keyToPageWave = {"37": -1, "39": 1, "38": -1, "40": 1, "33": -1, "34": 1};
    $scope.keyCtrlPage = function ($event) {
        if ($event.target.localName === "input") return;
        // 要去向的页码
        var pageNmb = $scope.view.pageDetails.number + 1 + keyToPageWave[$event.keyCode + ""];
        if (pageNmb > 0 && pageNmb <= $scope.view.pageDetails.totalPages) {
            changePageDetails(pageNmb);
        }
    };
    var $logScroll = null;
    $scope.DET_HG = 615;// 日记详情 div的高度
    /**
     * 初始化滚动翻页!!
     */
    function initScrollPage() {
        $logScroll = $("#log-scroll");
        var oldPageNmb = null;

        // 滚动翻页事件,
        var scrollEvent = Utils.TimeOutOne(200, function () {
            // 根据进度条,推算 当前页数
            var pn = Math.round($logScroll.scrollTop() / $scope.DET_HG) + 1;
            if (oldPageNmb != pn) { // 同一页不操作
                oldPageNmb = pn;
                $scope.searchDetails(pn);
            }
        });
        $logScroll.scroll(function () {
            if (!tmpNotScrollEv) {
                scrollEvent();
            }
            tmpNotScrollEv = false;
        });

        // 滚轮滚动事件,控制翻页!
        $("#log-det-ctt").mousewheel(function (event, fx) {
            var scrollTop = $logScroll.scrollTop() + $scope.DET_HG * (fx == 1 ? -1 : 1);
            $logScroll.scrollTop(scrollTop);
        });
    }

    $(function () {
        initScrollPage();
        // 详情层,打开后禁用 html 的滚动条...
        $('#logDetModal,#realTimeModal').on('hidden.bs.modal', function () {
            $("html").css("overflow-y", "auto");
        }).on('show.bs.modal', function () {
            $("html").css("overflow-y", "hidden");
        });
    });


}]);

