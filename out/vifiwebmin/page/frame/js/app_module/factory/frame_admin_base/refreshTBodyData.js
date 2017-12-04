/**
 * 刷新table 数据,  因为angular 双向绑定,数据太多,性能极度下降~,
 * 所以用jquery 方式刷新table数据!
 */
module.exports = function ($scope) {
    // 获得表格数据展示的值
    $scope.getTbDataVal = function (data, fCfg) {
        if (!data) return "";
        var value = data[fCfg.name], valueProto = value;
        // 别名处理
        value = fCfg.valAs ? (fCfg.valAs[value]?fCfg.valAs[value]:value) : value; // 如果有别名的话...取值的别名显示
        value = typeof(value) == 'undefined' ? '' : value;
        // 值格式化,处理
        var valFmt = fCfg.valFormat, valFmtMap = {a: valueProto, b: value};
        return valFmt ? valFmt.replace(/\{(.)\}/g, (o, n)=>valFmtMap[n]) : value + "";
    };

    // 获得气泡提示 父元素class,如果有气泡的话.
    function getTipsClassName(fCfg) {
        return (fCfg.valFormat && fCfg.valFormat.contains("f-tips")) ? "f-p-tips" : "";
    }


    var $pageDataTbody = null, $tablePage = null;
    $scope.refreshTBodyData = function () {
        $tablePage = $tablePage || $(".table-page-tools > div");
        $pageDataTbody = $pageDataTbody || $(".page-data-tbody");
        var contentList = $scope.view.page.contentList;
        if (!contentList || !contentList.length) {
            return $pageDataTbody.html("");
        }
        var html = $.map(contentList, function (data, inx) {
            var showFields = _.filter($scope.viewCfg.fields, field=>field.show);
            var thHtml = _.map(showFields, field=>`<td><div class="table-data ${getTipsClassName(field)}" style="width:${field.width}px;">${$scope.getTbDataVal(data, field)}</div></td>`).join('');
            return `<tr role="row" class="odd" data-index="${inx}"><td><label style="margin-bottom:0;" onclick="event.stopPropagation()"><input type="checkbox"><span class="text"></span></label></td>${thHtml}</tr>`;
        }).join('');

        var $trs = $(html);
        var $ceks = $trs.find("input");
        var $allCek = $("thead input[type=checkbox]");
        // 双击打开详情动作
        $trs.dblclick(() => $scope.$apply(() => $scope.openDetailsModal()));
        // 勾选,多选动作
        $ceks.click(function () {
            var $cek = $(this);
            var $tr = $cek.closest("tr");
            var inx = $tr.attr("data-index");
            var data = contentList[inx];

            data.checkbok = $cek.prop("checked");
            $scope.$apply();

            syncTrStyle();
        });
        // 单击动 作
        $trs.click(function () {
            var inx = $(this).attr("data-index");
            var data = contentList[inx];
            $scope.clickAddActive(data);
            $scope.$apply();
            syncTrStyle();
        });
        // 同步tr选中的样式
        function syncTrStyle() {
            $trs.removeClass("active_tr");
            $ceks.prop("checked", false);
            _.each(contentList, function (data, inx) {
                if (data.checkbok) {
                    var $tr = $trs.eq(inx).addClass("active_tr");
                    $tr.find("input").prop("checked", true);
                }
            });
            // 全选判定
            var isAllCek = $ceks.filter(":checked").length == contentList.length;
            $allCek.prop("checked", isAllCek);
        }

        $pageDataTbody.html($trs);
        // 刷新分页的html
        $tablePage.html($scope.Utils.pagination($scope.view.page, 'changePage'));
    }
};