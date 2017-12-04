/**
 * table 头 配置, 排序,显示
 */
module.exports = function ($scope) {
    var _this = this;
    // **************************** 字段显示控制
    // 恢复默认表头显示配置
    $scope.reDefHeadShowCfg = function () {
        $scope.viewCfg.fields = angular.copy($scope.viewCfgBackup.fields);
        localStorage.removeItem($scope.VIEW_CFG_LS_KEY);
        $scope.refreshTBodyData();
    };

    // 显示配置,是否全部显示.
    $scope.tbIsAllShow = function () {
        var isAll = true;
        _.each($scope.viewCfg.fields, function (vc) {
            isAll = vc.show ? isAll : false;
        });
        $scope.viewCfg && ($scope.viewCfg.allShow = isAll);
        return isAll;
    };
    _this.saveViewCfgToLS = function () {
        // 记录当前fields顺序,和显示与否,宽度
        var viewCfgLS = {};
        _.each($scope.viewCfg.fields, function (field, i) {
            viewCfgLS[field.name] = {show: field.show, width: field.width, inx: i};
        });
        localStorage.setItem($scope.VIEW_CFG_LS_KEY, JSON.stringify(viewCfgLS));
    };

    // **************************** 拖拽排序表头
    // 拽起..记录拽起的位置
    g_var.theadDragstart = function (event) {
        // 火狐的方式,,必须要调用这个,否则不让拽起....(什么玩意儿!)
        try {
            event.dataTransfer && event.dataTransfer.setData("i", 0);
        } catch (e) {
        }
        g_var.theadSortInx = $(event.target).closest("th").attr("data-repe-inx");
    };
    // 放下交换排序位置
    g_var.theadDrop = function (event) {
        var inxOld = g_var.theadSortInx;
        var inxNew = $(event.target).closest("th").attr("data-repe-inx");
        if (undefined != inxNew && undefined != inxOld && inxOld != inxNew) {
            var vcFields = $scope.viewCfg.fields;
            $scope.$apply(()=>vcFields.splice(inxNew, 0, vcFields.splice(inxOld, 1)[0]));
            $scope.refreshTBodyData();
            _this.saveViewCfgToLS();
        }
    };

    // **************************** 调整宽度
    var $table = $("#my-data-table"), $body = $("body");
    var $drpLine = $("#datagrid-resize-proxy");

    var curFieldCfg = null, resizeWidth, isDown = false, rect, isDrp;

    // 调整过程中,移动.
    g_var.resizeTbMove = function (event) {
        event.stopPropagation();
        var target = event.target;
        // 调整状态提示. 变更鼠标图标
        isDrp = event.offsetX > target.offsetWidth - 4 && target.localName == "th";
        target.style.cursor = isDrp ? 'col-resize' : 'default';
        if (isDown) {
            resizeWidth = event.clientX - rect.left;
            if (resizeWidth > 0) {
                $drpLine.css("left", event.clientX);
            }
        }
    };

    // 调整开始,按下.
    $scope.resizeTbBegin = function ($event, fCfg) {
        if (!isDrp) return;
        var event = $event, target = $($event.target).closest("th")[0];
        event.stopPropagation();
        curFieldCfg = fCfg;
        rect = target.getBoundingClientRect();
        $drpLine.show().css({height: $table.height(), left: event.clientX, top: $table.offset().top});
        isDown = true;
        // 按下 禁止选择文本
        $body.css({"-moz-user-select": "none", "-webkit-user-select": "none", "user-select": "none"});
    };

    // 调整结束,清理.
    window.onmouseup = function () {
        if (!isDown) return;
        // 修改了宽度才保存
        if (resizeWidth && curFieldCfg) {
            $scope.$apply(function () {
                curFieldCfg.width = resizeWidth;
                $scope.refreshTBodyData();
                resizeWidth = curFieldCfg = null;
            });
            _this.saveViewCfgToLS();
        }

        $drpLine.hide();
        isDown = false;
        // 抬起 恢复选择文本
        $body.css({"-moz-user-select": "text", "-webkit-user-select": "text", "user-select": "text"});
    };


};