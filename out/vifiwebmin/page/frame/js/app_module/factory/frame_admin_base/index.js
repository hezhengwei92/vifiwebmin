/**
 * 管理框架 ,公共基类!标准 的 增,删,查询
 */
var Utils = require("commonUtils");
var appModule = require("../../crtModule");


/**
 * 控制器管理页面基类    管理页面的主要数据那块
 * @param $scope $scope
 * @param $rootScope $rootScope
 * @param viewCfg {Object}视图字段的配置,可为null
 * @param pkName 表的主键名,用于删除标识,可为null ,默认: viewCfg.fields 标示pk中找
 * @param prefixUrl 各操作的url 前缀,可为null, 默认:PATH + viewCfg.currentUri
 * @constructor
 */
var AngularBaseCtrl = function ($scope, $rootScope, viewCfg, pkName, prefixUrl) {
    var _this = this;
    // 当前子页面
    $rootScope.childPage = viewCfg.currentUri;
    // 各操作的url 前缀
    $scope.prefixUrl = prefixUrl || PATH + $rootScope.childPage;// 对应的操作url前缀
    /////////// html5 localStorage 存储 的各个key
    var PAGE_SIZE_LS_KEY = "config.table.pageSize";

    $scope.view = g_var.view || {};// 全局变量中的视图数据
    $scope.form = {}; // 一些提交型数据
    $scope.params = {}; // 搜索的参数

    $scope.pkName = pkName;
    // 是否全选
    $scope.form.allCheckbox = false;

    // ******  apply     组合设计模式.....
    require("./crtViewCfg").apply(this, arguments);// 创建 视图配置..
    require("./refreshTBodyData").apply(this, arguments); // 刷新table数据
    require("./tableHeadConfig").apply(this, arguments); // table 头 配置, 排序,宽度,显示

    // 保证数据不缺少page.contenList,不错乱
    $scope.view.page = $scope.view.page || {contentList: []};

    // table每页显示条数,试图从 localStorage取    parseIntz转成int
    $scope.view.pageSize = parseInt(localStorage.getItem(PAGE_SIZE_LS_KEY) || "25");

    // 修改分页大小,保存分页大小设置到localStorage   $watch $scope级别的函数 监听值"view.pageSize"是否发生变化
    $scope.$watch("view.pageSize", function (vNew, vOld) {
        vNew != vOld && $scope.search();
        localStorage.setItem(PAGE_SIZE_LS_KEY, vNew);
    });

    // 全选操作
    $scope.allCheckbox = function () {
        $scope.view.page.contentList.setBatch('checkbok', $scope.form.allCheckbox);
        var $trs = $(".data-tbody tr");
        var $ceks = $trs.find("input[type=checkbox]");
        $scope.form.allCheckbox ? $trs.addClass("active_tr") : $trs.removeClass("active_tr");
        $ceks.prop("checked", $scope.form.allCheckbox);
    };

    //

    // 是否禁用,统计按钮.
    $scope.isDsbStatisticsBtn = function () {
        var selNum = $scope.form.selNumber;
        return !((selNum == 0 && _this.openTbDtlCallback) || ( selNum > 1 && _this.openMulDtlCallback));
    };
    // 是否显示,统计按钮
    $scope.isShowStatisticsBtn = function () {
        return _this.openTbDtlCallback || _this.openMulDtlCallback;
    };

    // 是否禁用,详情按钮.
    $scope.isDsbDtlBtn = function () {
        var datas = getSelectDatas();
        $scope.form.allCheckbox = (datas.length == $scope.view.page.contentList.length) && datas.length > 0;
        return datas.length != 1;
    };

    // 是否禁用,编辑按钮.
    $scope.isDsbEditBtn = function () {
        var selNum = $scope.form.selNumber;
        return selNum != 1 || (selNum > 1 && !$scope.viewCfg.isMulEdit)
    };

    // 是否是编辑操作
    $scope.isEditAct = ()=> ($scope.form.copyData || {}).actionName == $.i18n("edit");

    //region 编辑层的 样式控制,

    // 编辑层中,属性是否显示
    $scope.isShowEdit = function (vc) {
        if (!$scope.form.copyData) return false;
        // 多行编辑时的显示逻辑
        if ($scope.form.isMultiEdit) {
            return vc.mulEdit;
        }
       if($scope.view.agentName !="admin" &&  vc.name =="idxAgentID"){
            return false;
        }
        return !(vc.hideEdit == "A" || (!$scope.isEditAct() && vc.hideEdit == "N") || ($scope.isEditAct() && vc.hideEdit == "E"));
    };


    // 是否禁用编辑
    $scope.isDisabledEdit = function (vc) {
        if (!$scope.form.copyData) return false;
        return vc.disabled == "A" || (!$scope.isEditAct() && vc.disabled == "N") || ($scope.isEditAct() && vc.disabled == "E");
    };

    //endregion


    //region 打开编辑层的动作操作
    // 窗口层操作
    function openModel() {
        var $editModal = $('#editModal').modal({backdrop: 'static'});
        setTimeout(function () {
            $editModal.find("span.error").remove();
            $editModal.find("input.error").removeClass("error");
        }, 100);
    }

    function closeModel() {
        $('#editModal').modal('hide');
    }

    /**
     * 获得当前选择的数据,并赋值到 $scope.form.curDatas
     * @returns {Array} 当前选择的数据集合
     */
    function getSelectDatas() {
        var checkList = _.filter($scope.view.page.contentList, curObj=>curObj.checkbok);
        $scope.form.selNumber = checkList.length;
        return $scope.form.curDatas = checkList;
    }

    // 单击tr 勾选和添加active class 的选中效果
    $scope.clickAddActive = function (data) {
        _.each($scope.view.page.contentList, content=>content.checkbok = false);
        data.checkbok = true;
    };

    // 打开表概要层
    function openTbDetailModal() {
        $('#detailModal').modal({backdrop: 'static'});
    }

    // 抽象方法...待扩充
    // tb 详情查看回调方法     , 结果赋值到 $scope.view.tbDetails = res.data
    _this.openTbDtlCallback = null;
    // 单个数据详情查看回调方法 , 结果赋值到 $scope.view.sgDetails = res.data
    _this.openSgDtlCallback = null;
    // 多个数据详情查看回调方法 , 结果赋值到 $scope.view.mulDetails= res.data
    _this.openMulDtlCallback = null;

    // 用空tr 填充table,数据 空白处
    function fillDtlTableBlank() {
        $scope.viewCfg.fillDtlTr = null;
        setTimeout(function () {
            // 取2节高度,
            var $area = $("#sg-dtl > div");
            var area1w = $area.eq(0).height(), area2w = $area.eq(1).height();
            // 如果第二节高度比第一节高
            if (area2w > area1w) {
                // 追加tr数量=((第二节高度-第一节高度,) / tr高度)
                var size = parseInt((area2w - area1w) / $area.find("tr:eq(0)").height()) + 1;
                $scope.$apply(()=>$scope.viewCfg.fillDtlTr = _.range(size));
            }
        }, 200);
    }

    // 打开详细窗口
    $scope.openDetailsModal = function () {
        var selNum = $scope.form.selNumber;
        $scope.form.curData = $scope.form.curDatas[0];
        // 那种 详情窗要显示
        var dtlShow = $scope.form.dtlShow = {};
        dtlShow[selNum == 0 ? 'tb' : (selNum == 1 ? 'sg' : 'mul')] = true;

        if (dtlShow.tb) {
            Utils.ajax({url: $scope.prefixUrl + "/table-detail.ajax", success: res => ($scope.view.tbDetails = res.data) && $scope.$apply(()=>_this.openTbDtlCallback(res.data))});
        } else if (dtlShow.sg) { // 选中单个详情
            // 用空tr 填充table,数据 空白处
            fillDtlTableBlank();
            if (_this.openSgDtlCallback) {
                Utils.ajax({
                    url: $scope.prefixUrl + "/single-detail.ajax", data: {id: $scope.form.curData[$scope.pkName || 'id']},
                    success: function (res) {
                        $scope.view.sgDetails = res.data;
                        $scope.$apply(()=>_this.openSgDtlCallback(res.data));  /* ()=>_this.openSgDtlCallback(res.data) 等价于 function=_this.openSgDtlCallback(res.data) */
                    }
                });
            }
        } else { // 选中多个详情
            Utils.ajax({
                url: $scope.prefixUrl + "/multi-detail.ajax", data: {idList: getSelectIdList()},
                success: res =>($scope.view.mulDetails = res.data) && $scope.$apply(()=>_this.openMulDtlCallback(res.data))
            });
        }
        openTbDetailModal();
        return selNum;
    };

    // 打开新增窗口
    $scope.openAddModal = function () {
        var defData = {};
        _.each($scope.viewCfg.fields, vc=>defData[vc.name] = vc.def);
        $scope.form.curData = defData; // 当前编辑的数据,用于对比是否变动..关闭窗口时是否确认.
        $scope.form.copyData = angular.copy(defData);
        $scope.form.copyData.actionName = $.i18n("new");
        openModel();
    };
    // 编辑单个
    function openEditOne(data) {
        $scope.form.curData = data;// 当前编辑的数据,用于比较提取修改了的数据和修改后同步dom数据,
        $scope.form.copyData = angular.copy(data);// 副本用于编辑时数据展示

        // 去除不编辑的字段
        _.each($scope.viewCfg.fields, function (vc) {
            if (/A|E/.test(vc.hideEdit) && vc.name != $scope.pkName) delete $scope.form.copyData[vc.name];
        });
    }

    // 收集多行编辑的字段
    var mulEditFields = _.map(_.filter($scope.viewCfg.fields, vc=>vc && vc.mulEdit), vc=>vc.name);
    $scope.viewCfg.isMulEdit = !!mulEditFields.length;
    // 获得当前选择的 主键集.
    var getSelectIdList = ()=>_.map(_.filter($scope.view.page.contentList, o=>o.checkbok), o=>o[$scope.pkName || 'id']);

    // 编辑多个
    function openEditMulti() {
        // 要提交的数据.
        var smtData = {idList: []};
        // 收集多行编辑的多个属性到 $scope.form.smDatas
        var dataTmp = {};
        _.each($scope.form.curDatas, function (curData) {
            // 多行编辑时收集主键
            smtData.idList.push(curData[$scope.pkName]);
            // 收集输入提示
            _.each(mulEditFields, function (field) {
                dataTmp[field] = dataTmp[field] || [];
                if (!dataTmp[field].contains(curData[field])) {
                    dataTmp[field].push(curData[field]);
                }
            });
        });

        // 用完后 干掉~
        delete $scope.form.curDatas;
        // 把只有一个提示的展示出来..
        _.each(dataTmp, (dataArr, key)=>(dataArr.length == 1) && (smtData[key] = dataArr[0]));

        $scope.form.copyData = smtData;
        $scope.form.smDatas = dataTmp;
    }

    // 打开编辑窗口
    $scope.openEditModal = function () {
        var datas = $scope.form.curDatas;
        // 是否是多行编辑
        $scope.form.isMultiEdit = datas.length != 1;
        if ($scope.form.isMultiEdit) {
            openEditMulti();
        } else {
            openEditOne(datas[0]);
        }
        $scope.form.copyData.actionName = $.i18n("edit");
        openModel();
    };
    //从详情到编辑
    $scope.skip2EditModal = function(){
    	$('#detailModal').modal('hide');
    	//编辑
    	$scope.openEditModal();
    }
    //从编辑到详情
    $scope.skip2DetailsModal = function(){
    	var isChange = false, curData = $scope.form.curData, copyData = $scope.form.copyData;
        for (var k in copyData) {
            if (!(k in curData)) continue;
            var nVal = JSON.stringify(copyData[k]), oVal = JSON.stringify(curData[k]); // 确保数组等.复杂数据类型比较
            isChange = nVal != oVal && (nVal || oVal); // 如果只发生改变,标示修改状态
            if (isChange) break;
        }
        if (!isChange){
        	closeModel();
        	$scope.openDetailsModal();
        }else{
        	layer.confirm($.i18n("frame.from.tips.confirmCancel"), function(idx){
        		layer.close(idx);
        		closeModel();
        		$scope.openDetailsModal();
        	});//(idx)=> closeModel() + layer.close(idx));
        }
    }
    // 取消编辑
    $scope.cancelEdit = function () {
        var isChange = false, curData = $scope.form.curData, copyData = $scope.form.copyData;
        for (var k in copyData) {
            if (!(k in curData)) continue;
            var nVal = JSON.stringify(copyData[k]), oVal = JSON.stringify(curData[k]); // 确保数组等.复杂数据类型比较
            isChange = nVal != oVal && (nVal || oVal); // 如果只发生改变,标示修改状态
            if (isChange) break;
        }
        if (!isChange) return closeModel();
        layer.confirm($.i18n("frame.from.tips.confirmCancel"), (idx)=> closeModel() + layer.close(idx));
    };
    //endregion

    //region 查询,删除,新增, 修改

    // 切换排序状态,,0:不排序,1:升序,2:降序
    $scope.changeSort = function (vc) {
        vc.sort = ((vc.sort || 0) + 1) % 3; // 算出排序数字
        $scope.search();// 刷新一下
    };

    //获得排序参数
    function getSortParamsJSON() {
        var sortParams = _.map(_.filter($scope.viewCfg.fields, vc => vc.sort), vc => [vc.name, vc.sort]);
        return sortParams.length ? JSON.stringify(sortParams) : null;
    }

    // 清除搜索条件
    $scope.clearSearch = function () {
        $scope.params = {};
        $scope.search();
    };


    /**
     * 展示数据转换
     * @param key
     * @param val
     * @param direction 转换方向,参数:'S'转换到服务端,'C':转换到客户端,,默认转换到客户端
     * @returns {*}
     */
    function displayDataConver(key, val, direction) {
        var fCfg = $scope.viewCfgMap[key] || {};
        var is2Server = direction == "S";
        // 单位转换
        if (fCfg.unitMul && val) {
            if (is2Server) {
                val = Number(val).div(fCfg.unitMul);
            } else {
                val = Number(val).mul(fCfg.unitMul)
            }
        }
        // 单选select,的值默认要string类型.
        if (fCfg.comType == "select" && !is2Server) {
            val = val + "";
        }
        // 多选select
        if (fCfg.comType == "mulSelect") {
            if (is2Server) {
                val && (val = val.join(","));
            } else {
                val = ((val || "") + "").split(",");
            }
        }
        return val;
    }


    var curPageSearchCount = 0; // 当前页面搜索次数
    function getSearchParams() {
        var params = {}, sortParams = getSortParamsJSON();
        // 加入约定好的排序参数,如果有的话
        if (sortParams) params.cx_ORDER_LIST = sortParams;
        // 如果jumpQryParam 中有搜索参数且是第一次搜索,添加到搜索参数中,搜索数据
        if (curPageSearchCount++ == 0) {
            var jumpQryParam = _this.jumpPageQryParam();
            if (jumpQryParam) {
                $.extend(params, jumpQryParam)
                _this.jumpPageQryParam(null);
            }
        }
        // 是否打开高级搜索,用于决定是否添加高级搜索参数
        var isOpenAdvQry = !!$("#adv-search[aria-expanded=true]").length;
        _.each($scope.params, function (v, k) {
            //删除空的,搜索属性
            if (!v) {
                return delete $scope.params[k];
            }
            if (v && isOpenAdvQry) {
                params[k] = v;
                /******** @author gya	如果有倍率，乘以倍率  **********/
                var filed = k.split("-|-");
                if(filed && filed.length==2){
                	filed = filed[1];
                	//查看unitMul字段
                	var fileds = $scope.viewCfg.fields;
                	for(var i=0, len=fileds.length; i<len; i++){
                		var vc = fileds[i];
                		if(vc.name==filed){
                        	if(vc.unitMul && vc.unitMul==0.001){
                        		params[k] = v*1000;
                        	}
                        	break;
                        }
                	}
                }
            }
        });
        return params;
    }

    // pageNumber : 页码, sucCallback : 成功后的回调
    $scope.search = function (pageNum, callback) {
        // 跳转页码处理
        var totalPages = ($scope.view.page && $scope.view.page.totalPages) || 1;
        pageNum = pageNum > totalPages ? totalPages : pageNum;
        Utils.ajax({
            url: $scope.prefixUrl + "/list.ajax?pageSize=" + $scope.view.pageSize + "&page=" + (pageNum || 1),
            data: getSearchParams(),
            success: function (res) {
                $scope.view.page = res.data; /* data:224 */

                // 展示数据转换
                _.each(res.data.contentList, data=>_.each(data, function (v, k) {
                    data[k] = displayDataConver(k, v);
                }));

                callback && callback(res);
                $scope.refreshTBodyData();
                $scope.$apply();
            }
        });
    };

    /**
     * 页面之间跳转时,初始查询参数, 操作
     * @param param {Object}=设置参数, //参数格式,看查询功能和后台的约定格式
     *    无参数=获得参数
     *    {null}=清除参数
     */
    _this.jumpPageQryParam = function (param) {
        var QRY_PARMA_LS_KEY = "JUMP_PAGE_QRY_PARAM";
        if (param === undefined) {
            return JSON.parse(localStorage.getItem(QRY_PARMA_LS_KEY))
        } else if (param === null) {
            localStorage.removeItem(QRY_PARMA_LS_KEY)
        } else if (typeof param === "object") {
            localStorage.setItem(QRY_PARMA_LS_KEY, JSON.stringify(param))
        }
    };

    $scope.delete = function () {
        var inx = layer.confirm($.i18n("frame.from.tips.confirmDel"), {scrollbar: false, shadeClose: true}, delYes);

        function delYes() {
            layer.close(inx);
            Utils.ajax({
                url: $scope.prefixUrl + "/delete.ajax",
                data: {idList: getSelectIdList()},
                success: res=>$scope.search()
            });
        }
    };


    /**
     * 获得保存时要提交的数据
     * @returns {{}} 保存时要提交的数据
     */
    function getSaveData() {
        var data = {}, curData = $scope.form.curData, copyData = $scope.form.copyData;
        if (!$scope.isEditAct() || !curData) {
            data = angular.copy(copyData);
        } else {
            // 收集改动了的数据
            _.each($.extend({}, curData, copyData), function (v, k) {
                if (curData && curData[k] !== copyData[k] || k === $scope.pkName) {  // 是否收集.
                    data[k] = copyData[k];
                }
            });
        }

        // 展示数据转换
        _.each(data, function (v, k) {
            data[k] = displayDataConver(k, v, "S");
        });

        return data;
    }

    /**
     * 保存动作
     */
    $scope.save = function () {
        Utils.ajax({
            url: $scope.prefixUrl + "/save.ajax",
            data: getSaveData(),
            success: function (res) {
                $scope.search();
                closeModel()
            }
        });
    };
    //endregio


    //region 其他一些控制,表单验证, 分页,点击一行选中效果啥的
    //分页事件
    window.changePage = function (pageNumber) {
        $scope.search(parseInt(pageNumber) || 1);
    };

    /**
     * 日期插件
     * @param obj 修改时间后通知的对象
     * @param key 修改时间后通知的对象属性名
     */
    $scope.laydate = function (obj, key, $event) {
        window.event = $event;
        var options = {
            elem: $event.target,
            choose: function (date) { //选择好日期的回调
                $scope.$apply(()=>obj[key] = date);
                $($event.target).valid();
            }
        };
        Utils.laydate(options);
    };


    //endregion


    //region *********表单验证
    function initValidate() {
        var rules = {};
        _.each($scope.viewCfg.fields, vc=>rules[vc.name] = vc.vali);
        $(".form-horizontal").validate({
            rules: rules,
            submitHandler: form=>$scope.save()
        });
    }

    //endregion


    function delayedInit() {
        // 计算table高度
        var winHeight = document.documentElement.clientHeight;
        var dataTableDivHeight = winHeight - 182 - $(".stati-info").height() - $(".page-breadcrumbs").height();
        var $dataTBody = $(".data-tbody-height"), $dataTHead = $(".data-thead"), $html = $($("html")[0]);
        var $dataBody2Logpage=$(".data-tbody-logPage"), $dataTBody2Role = $(".data-tbody-rolepage");
        $dataTBody.css("height", dataTableDivHeight);
        //兼容日志页面 & 角色权限页面 的高度@autor gya
        $dataTBody2Role.css("height",dataTableDivHeight +36);
        $dataBody2Logpage.css("height", dataTableDivHeight+70);

        // table body 滚动,带动table head平行移动,解决头部固定问题
        $dataTBody.scroll(e=>$dataTHead.prop("scrollLeft", e.target.scrollLeft));

        // 表格头设置,自动保存到 localStorage
        $('.viewcfg-dropdown').on("hidden.bs.dropdown", _this.saveViewCfgToLS);

        // 展开高级搜索调整table高度
        var $advSearch = $("#adv-search"), $collapseAdvSearch = $("#collapse-adv-search");
        $advSearch.click(function () {
            var isExpanded = !JSON.parse($advSearch.attr("aria-expanded"));
            var height = dataTableDivHeight;
            if (isExpanded) {
                $collapseAdvSearch.show();
                height = (dataTableDivHeight - $collapseAdvSearch.height());
            } else {
                $collapseAdvSearch.hide();
            }
            $dataTBody.css({"height": height + "px"});
            $advSearch.attr("aria-expanded", isExpanded + "");
        });


        $scope.search();
        initValidate();// 初始化表单验证
    }

    // 延时初始化,一些jquery动作...让其他初始化设置,在前
    $(()=>setTimeout(delayedInit, 100));

};

// 放入工厂service
appModule.factory('frameAdminBase', ()=>AngularBaseCtrl);
