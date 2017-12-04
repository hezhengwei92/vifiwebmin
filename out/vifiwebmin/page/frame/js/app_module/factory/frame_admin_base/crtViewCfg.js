/*
 * 视图 字段配置 说明
 * {配置类型}: {S} string字符串,{N} number数字,{B} boolean真假,{O} object对象,{A} array数组,{X} x任意类型
 *
 * @i18nPrefix  {S} 页面字段国家化 key 的前缀,用于组合字段名取国际化显示
 * @isSplit     {B} <自动配置>是否分割布局
 * @currentUri  {S} 当前页面uri
 * @dtlLayout   {A} 详情层,详情布局,[左边比例,右边比例,层宽度 默认90] 比例以12为单位 默认:[6,6]
 *
 * @fields 字段属性配置说明:
 *
 * 1.type      : {S} 字段属性类型, 参数:I:数字,S:字符串,F:浮点小数类型; D:时间2005-11-11 11:11:11,默认 S 字符串类型. (如有unitMul属性默认:F)
 * 2.name      : {S} 字段名
 * 3.title     : {S} <自动配置>字段标题
 * 4.width     : {N} 字段宽度 例:width=150
 * 5.show      : {X} 列表上显示字段,3钟配置 true:列表显示,false:列表隐藏,0:列表隐藏,且不能配置再次显示. 默认:true
 * 6.left      : {B} 分割布局时在左边还是右边,默认:false
 * 7.def       : {X} 默认值,给与新增时的默认值
 * 8.hideEdit  : {S} 编辑层控件隐藏 参数:N:新增时隐藏,E:编辑时隐藏,A:全部隐藏
 * 9.disabled  : {S} 编辑层控件禁用 参数:N:新增时禁用,E:编辑时禁用,A:全部禁用
 * 10.help     : {S} <自动配置>输入的提示,input的placeholder显示的内容,
 * 11.pk       : {B} 主键字段标识,用于删除动作时
 * 12.comType  : {S} 组件类型   默认:text   参数:
 *                   1  text:文本
 *                   2  select:   选择框     comData=二位数组,[0]:选中的值,[1]:展示的值
 *                                             例:["1","真"]
 *                   3  redio:
 *                   4  checkbox: 单选框     comData=二位数组,[0]:勾选的[1]非勾选的[2]展示的说明
 *                                             例:["1","0","是否同意?"]
 *                   5  file:     上传文件框  comData=对象,{dirKey:和后端约定的保存的路径KEY, maxSize:最大文件,callback:上传完的回调}
 *                                             例:{dirKey: "VERSION_APP",maxSize:"512MB",callback:resp=>alert(resp.data.data[0])}
 * 13.comData  : {A} 组件所需的数据,  comType中有说明
 * 14.advQry   : {A} 高级搜索      参数:EQ:等于查询,LIKE:模糊查询,GTE:范围查询 例:advQry:['LIKE']
 * 15.vali     : {O} 属性验证配置   参数:默认:{required:true}, 根据字段类型,会默认一些验证:digits,date,ngSelRequire
 *                   1    required:true        必须输入的字段。
 *                   2    remote:"check.php"   使用 ajax 方法调用 check.php 验证输入值。
 *                   3    email:true           必须输入正确格式的电子邮件。
 *                   4    url:true             必须输入正确格式的网址。
 *                   5    date:true            必须输入正确格式的日期。日期校验 ie6 出错，慎用。
 *                   6    dateISO:true         必须输入正确格式的日期（ISO），例如：2009-06-23，1998/01/22。只验证格式，不验证有效性。
 *                   7    number:true          必须输入合法的数字（负数，小数）。
 *                   8    digits:true          必须输入整数。
 *                   9    creditcard:          必须输入合法的信用卡号。
 *                   10   equalTo:"#field"     输入值必须和 #field 相同。
 *                   11   accept:              输入拥有合法后缀名的字符串（上传文件的后缀）。
 *                   12   maxlength:5          输入长度最多是 5 的字符串（汉字算一个字符）。
 *                   13   minlength:10         输入长度最小是 10 的字符串（汉字算一个字符）。
 *                   14   rangelength:[5,10]   输入长度必须介于 5 和 10 之间的字符串（汉字算一个字符）。
 *                   15   range:[5,10]         输入值必须介于 5 和 10 之间。
 *                   16   max:5                输入值不能大于 5。
 *                   17   min:10               输入值不能小于 10。
 *                   // ***扩展***
 *                   18   decimals:2           小数位,不能超过2位数
 * 16.mulEdit  : {B} 多行编辑标识
 * 17.valAs    : {O} 值别名映射. 例:{"1":"是","0":"否"}
 * 18.unitMul  : {N} 数值单位换算倍数.数据库到前端的倍数.  例:厘->元: 倍数:0.001
 * 19.valFormat: {S} 值显示的格式化字符串. 参数:{a}=原始值,{b}=别名值
 *                   例: <div class='fa fa-circle simp-dev-sta-{a}'></div>{b}
 */
var jsConst = require("jsConst");
var Utils = require("commonUtils");


function crtViewCfg($scope, $rootScope, viewCfg, pkName, prefixUrl) {
    var _this = this;
    $scope.VIEW_CFG_LS_KEY = "config.table.viewCfg." + $scope.prefixUrl;


    viewCfg.fields = viewCfg.fields || [];
    var isAdvQry = null;//是否,高级搜索
    var isSltLayout = null; // 是否编辑层分割左右布局
    _.each(viewCfg.fields, function (field) {
        // 字段的 国际化信息,title  , help ,comData ,valAs
        var i18nFiledObj = Utils.objInvoke($.i18n.map, viewCfg.i18nPrefix + "." + field.name);
        // 如果没找到尝试从,db.common 取
        i18nFiledObj = i18nFiledObj || Utils.objInvoke($.i18n.map, "db.common." + field.name);

        if (i18nFiledObj) {
            field.title = i18nFiledObj[""] || field.name;
            if (i18nFiledObj["help"]) field.help = i18nFiledObj["help"][""];
            if (i18nFiledObj["comData"]) field.comData = i18nFiledObj["comData"][""];
            if (i18nFiledObj["valAs"]) field.valAs = i18nFiledObj["valAs"][""];
        } else {
            field.title = field.name;
        }

        // 主键名获取
        if (field.pk && !pkName) {
            $scope.pkName = field.name;
        }
        // 属性的一些默认值
        field.type = field.type || (field.unitMul ? "F" : "S");
        field.width = field.width || (field.title || field.name).length * 13 + 27;
        field.show = "show" in field ? field.show : true;

        // *** 属性值别名处理,用于显示值别名
        // 如果是select,area 控件自动用 控件数据,创建 别名映射
        if (/select|area/.test(field.comType) && !field.valAs) {
            if (!(field.comData instanceof Array)) throw new Error(field.name + "的select/area comData错误,不是数组.");
            field.valAs = {};
            _.each(field.comData, d => field.valAs[d[0]] = d[1]);
        }
        /**/
        // 创建 反转的别名映射..
        if (field.valAs) {
            field.valAsOp = {};
            _.each(field.valAs, (v, k)=>field.valAsOp[v] = k);
        }

        // *** 默认验证信息
        var rule = {required: true};
        if (field.type == "I") {
            rule.digits = true
        } else if (field.type == "F") {
            rule.number = true
        } else if (field.type == "D") {
            rule.date = true
        }
        if (field.comType == "checkbox") {
            rule.required = false;
        }

        field.vali = $.extend(rule, field.vali || {});

        // *** 是否,高级搜索,是否编辑层左右布局
        isAdvQry = 'advQry' in field || isAdvQry;
        isSltLayout = 'left' in field || isSltLayout;

    });

    // 是否,高级搜索,是否编辑层左右布局
    isAdvQry && (viewCfg.isAdvQry = isAdvQry);
    isSltLayout && (viewCfg.isSplit = isSltLayout);
    // 详情层的布局
    setTimeout(() =>$scope.$apply(function () {
        viewCfg.dtlLayout = viewCfg.dtlLayout || (_this.openSgDtlCallback ? [6, 6] : [12, 0, 40] );
    }), 50);

    // 收集视图配置中的高级搜索项,按 LINE_NUMBER 长度分组
    var advQryList = [], aqInx = 0, INE_NUMBER = parseInt(3);

    _.each(viewCfg.fields, function (field, i) {
        if (field && field.advQry) {
            _.each(field.advQry, function (operator, k) {
                var inx = Math.floor(aqInx++ / INE_NUMBER);
                advQryList[inx] = advQryList[inx] || [];
                advQryList[inx].push({vc: field, operator: operator});
            });
        }
    });
    viewCfg.advQryList = advQryList;

    // 用于备份原始默认 view配置
    $scope.viewCfgBackup = angular.copy(viewCfg);

    ////////////////// html5 localStorage读取view 表头配置(排序,显示与否)
    var viewCfgLS = JSON.parse(localStorage.getItem($scope.VIEW_CFG_LS_KEY)) || {};
    if (viewCfgLS) {
        var fieldsTmp = new Array(viewCfg.fields.length);
        try { // 容错,异常则使用默认配置
            // 是否需要排序,字段数量不一致时异常 不做读取配置操作!!
            if (_.size(viewCfgLS) != viewCfg.fields.length) throw new Error("数据长度,和存储的长度不一致")
            // 调整顺序,与字段显示与否
            _.each(viewCfg.fields, function (field) {
                var vcLS = viewCfgLS[field.name];
                field.show = vcLS.show;
                field.width = vcLS.width || field.width;

                fieldsTmp.splice(vcLS.inx, 1, field); // 编排顺序
            });
            viewCfg.fields = fieldsTmp;
        } catch (e) {
        }
    }

    $scope.viewCfg = viewCfg;
    // 映射...方便用 属性名查找属性设置.
    $scope.viewCfgMap = {};
    _.each(viewCfg.fields, f=>$scope.viewCfgMap[f.name] = f);
}
module.exports = crtViewCfg;