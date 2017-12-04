/**
 * 模块指令.定义.
 */
var appModule = require("./crtModule");
var jsConst = require("jsConst");


// html 输出,会监视改动...
appModule.directive('ngHtml', function () {
    return function (scope, el, attr) {
        attr.ngHtml && scope.$watch(attr.ngHtml, html=> el.html(html || ''))//更新html内容
    };
});
/**
 * 包装百度报表,echart
 * data-options 传入报表选项参数,例:
 * <echart data-options="realTimeInfoEO" style="height:363px;"></echart>
 */
appModule.directive('echart', function () {
    'use strict';
    return {
        restrict: 'E',
        template: '<div></div>',
        replace: true /* tag will be replaced as div, otherwise echart cannot find a container to stay. */,
        controller: ['$scope', '$element', "$attrs", function ($scope, $element, $attrs) {
            var chart = echarts.init($element[0]);

            $(window).on('resize', chart.resize);
            $scope.$on('$destroy', function () {
                $(window).off('resize', chart.resize);
                chart.dispose();
                chart = null;
            });

            $scope.$watch($attrs.options, function (nData) {
                if (!nData) return;
                chart.clear();
                chart.setOption(nData, /*overwrite=*/true);
            });

        }]
    };
});


/**
 * 包装select2 多选 select
 */
appModule.directive('ngMyMulSelect', function () {
    // 指令,参数
    var model, dataList, inputName, disabled, placeholder;
    return {
        restrict: 'A',
        controller: ["$sce", "$scope", "$element", "$attrs", "$transclude", function ($sce, $scope, $element, $attrs, $transclude) {
            var $sel = $element.find("select");
            $scope.enable = null;
            $scope.$watch(model, function (nData) {
                if (!nData) return $sel.select2("val", []);
                $sel.select2("val", _.map(nData, v=>"string:" + v));
                // 切换验证
                var $errTips = $element.find("input[tabindex=-1]");
                if ($errTips.length) setTimeout(()=>$errTips.valid(), 25);
            });

            $scope.$watch(disabled, function (nData) {
                $sel.select2('enable', $scope.enable = !nData);
            });

            // list
            $scope.$watch(dataList, function (nData) {
                setTimeout(function () {
                    $sel.select2('destroy').select2({allowClear: true}).select2('enable', $scope.enable);
                }, 100);
            });
        }],
        template: function (elem, attr) {
            var param = attr.ngMyMulSelect.split(",");
            model = param[0];
            dataList = param[1];
            inputName = param[2];
            disabled = param[3];
            placeholder = param[4];
            var inputHtml = inputName ? '<input type="text" tabindex="-1" ng-if="enable" style="position:absolute;width:0;border:0;" name="{{' + inputName + '}}" ng-value="' + model + '"/>' : '';
            return `<select style="width:100%;" ng-model="${model}" ng-options="opt[0] as opt[1] for opt in ${dataList}" multiple="multiple" placeholder="{{${placeholder}}}"></select>` + inputHtml;
        }
    }
});


/**
 * 模拟select2,带高亮搜索
 * 使用","分割,
 * [0]:绑定的属性名
 * [1]:slect的数据 1表示选中,2表示展示,例:[[1,'user1',2,'user2']]
 * [2]:input的名称,为了兼容jquery validate的dom配合,可为空,则不生成inpu
 * [3]:是否禁用{boolean} 默认:false
 * [4]:placeholder
 * 例: <div ng-my-select="model,dataList,inputName,disabled"></div>
 */
function ngMySelect(direName) {
    // 指令,参数
    var model, dataList, inputName, disabled, placeholder;
    return {
        restrict: 'A',
        controller: ["$sce", "$scope", "$element", "$attrs", "$transclude", "$timeout", function ($sce, $scope, $element, $attrs, $transclude, $timeout) {
            $scope.dataList = null;
            var $sel = $element.find("select");

            $scope.$watch(model, function (nData) {
                var valType = typeof nData == "undefined" ? "undefined" : "string";
                $sel.select2("val", valType + ":" + nData);
                // 切换验证
                var $errTips = $element.find("input[tabindex=-1]");
                if ($errTips.length) $timeout(()=>$errTips.valid(), 25);
            });

            // list
            $scope.$watch(dataList, function (nData) {
                $scope.dataList = angular.copy(nData);
                if (!nData) return;
                var fData = $scope.dataList[0];
                // 插入选择提示,位置.
                if (($scope.dataList.length == 0) || (typeof fData[0] != "undefined")) {
                    $scope.dataList.unshift([undefined, ""])
                }
                $timeout(function () {
                    $scope.$apply(()=> $scope.dataList[0][1] = $sel.attr("placeholder"));
                    var sel2Opt = {
                        minimumResultsForSearch: $scope.dataList.length < 10 ? -1 : 1
                    };
                    $sel.select2('destroy').select2(sel2Opt);
                }, 200);
            });


        }],
        template: function (elem, attr) {
            var param = attr[direName].split(",");
            model = param[0];
            dataList = param[1];
            inputName = param[2];
            disabled = param[3];
            placeholder = param[4];
            var inputHtml = inputName ? '<input type="text" tabindex="-1" style="position:absolute;width:0;border:0;" name="{{' + inputName + '}}" ng-value="' + model + '"/>' : '';
            return `<select style="width:100%;" ng-model="${model}" ng-options="opt[0] as opt[1] for opt in dataList" placeholder="{{${placeholder}}}"></select>` + inputHtml;
        }
    };
}
// 不知道为什么会出现,指令覆盖bug.angular自身bug,无法解决!.TMD.  只能弄2个一模一样的指令解决一下!!
appModule.directive('ngMySelect', ()=>ngMySelect('ngMySelect')).directive('ngMySelect2', ()=>ngMySelect('ngMySelect2'));


/**
 * 单选框指令
 */
appModule.directive('ngMyRadio', function () {
    return {
        restrict: 'A',
        template: function (elem, attr) {
            var param = attr.ngMyRadio.split(",");
            // 指令,参数
            var model, dataList, inputName, disabled;
            model = param[0];
            dataList = param[1];
            inputName = param[2];
            disabled = param[3];
            return `<div class="radio" ng-repeat="data in ${dataList}" style="display: inline-block" >
                    <label>
                        <input name="{{${inputName} }}" type="radio" ng-disabled="${disabled}" ng-model="${model}" ng-value="data[0]">
                        <span class="text">{{data[1]}}&nbsp;</span>
                    </label>
                </div>`;
        }
    };
});

/**
 * 多选框控件 指令
 */
appModule.directive('ngMyCheckbox', function () {
    // 指令,参数
    var model, dataList, inputName, disabled, placeholder, isMulti;
    return {
        restrict: 'A',
        controller: ["$sce", "$scope", "$element", "$attrs", "$transclude", function ($sce, $scope, $element, $attrs, $transclude) {
            // 是否多个多选...
            var dList = eval("$scope." + dataList);
            var isMulti = dList.length > 1;
            // 勾选,赋值变量动作!!
            $scope.checkClk = function (data, $event) {
                if (!isMulti) {
                    return data[3] ? data[0] : data[1];
                }
            };
            // 初始化选中与否...
            $scope.$watch(model, function (nData) {
                if (!isMulti) {
                    var fData = dList[0];
                    // 判断是否是勾选,初始化
                    fData[3] = nData == fData[0];
                }
            });
        }],
        template: function (elem, attr) {
            var param = attr.ngMyCheckbox.split(",");
            model = param[0];
            dataList = param[1];
            inputName = param[2];
            disabled = param[3];
            placeholder = param[4];
            return `<div class="checkbox">
<label ng-repeat="data in ${dataList}">
    <input type="checkbox" ng-disabled="${disabled}" ng-model="data[3]" ng-click="${model}=checkClk(data,$event)">
    <span class="text">{{data[2]||${placeholder} }}</span>
</label>
</div>`;
        }
    }
});

/**
 * 文件上传
 */
appModule.directive('ngMyFile', function () {
    // 指令,参数
    var inputName, config, placeholder;
    return {
        restrict: 'A',
        controller: ["$sce", "$scope", "$element", "$attrs", "Upload", function ($sce, $scope, $element, $attrs, Upload) {
            var $progMsg = $element.find(".prog-msg"), $vali = $element.find("input[name]"), $bar = $element.find(".progress-bar");
            // 取得配置对象
            var configObj = null;
            $scope.$watch(config, c=>configObj = c);

            function callback(resp) {
                var sta = resp.status;
                if (sta == 200) {
                    layer.msg.success(resp.config.data.file.name + $.i18n("fileUpload.success"));
                } else {
                    layer.msg.error('Error status: ' + sta);
                }
                configObj.callback && configObj.callback(resp);
            }

            // upload on file select or drop
            $scope.upload = function (file) {
                if (!file) return;
                Upload.upload({
                    url: PATH + '/fileUpload/' + configObj.dirKey + '.ajax',
                    data: {file: file, 'username': $scope.username}
                }).then(callback, callback, function (evt) {
                    var prec = parseInt(100.0 * evt.loaded / evt.total);
                    $bar.css("width", prec + "%");// 进度显示
                    $vali.val(prec); // 进度信息,放入验证值,用于做验证.
                    //在上传过程中,禁用上传
                    $scope.progDisa = prec > 0 && prec < 100;
                    // 上传 信息
                    var comp = prec == 100 ? $.i18n("fileUpload.success") : "";
                    var msg = `${evt.config.data.file.name} ${prec}%${comp} <div class="pull-right">${(evt.loaded / 1048576).toFixed(2)}/${(evt.total / 1048576).toFixed(2)}MB</div>`;
                    $progMsg.html(msg);
                });
            };
        }],
        template: function (elem, attr) {
            var param = attr.ngMyFile.split(",");
            inputName = param[0];
            config = param[1];
            return `<div class="progress progress-xlg progress-striped active" style="margin:4px 0 0" ngf-select="upload($file)"
    ng-disabled="progDisa" ngf-accept="${config}.accept" ngf-max-size="${config}.maxSize" >
 <b style="position:absolute;left:16px;color:#858585;top:5px;">${$.i18n("fileUpload.help")}</b>
 <div class="progress-bar progress-bar-info"></div>
</div><div class="prog-msg"></div>
<input type="text" style="position:absolute;width:0;border:0;" tabindex="-1" name="{{${inputName}}}" value="0"/>`;
        }
    }
});


/**
 * 地区选择控件
 */
appModule.directive('ngMyArea', function () {
    // 指令,参数
    var model, dataList, inputName, disabled, placeholder;
    return {
        restrict: 'A',
        controller: ["$sce", "$scope", "$element", "$attrs", "$transclude", function ($sce, $scope, $element, $attrs, $transclude) {
            $scope.conVal = null;
            $scope.conComData = $.i18n("continent.comData");
            $scope.conHelp = $.i18n("continent.help");

            var areaSelData = null;
            $scope.$watch(dataList, n=>!areaSelData && (areaSelData = n));
            // 州联动国家
            $scope.$watch("conVal", function (nData) {
                if (!nData) return setAreaCode(areaSelData);
                var newSelData = _.filter(areaSelData, v => (v[2] == nData));
                setAreaCode(newSelData);
            });

            // 地区属性名.
            var AREA_FIELD = {"areaCode": 1, "countryCode": 1};

            function setAreaCode(newSelData) {
                _.each($scope.viewCfg.fields, function (field, i) {
                    if (field.name in AREA_FIELD) {
                        $scope.viewCfg.fields[i].comData = newSelData
                    }
                });
            }

            // ***
            setTimeout(function () {
                $element.find("select.con").select2();
            }, 100);


        }],
        template: function (elem, attr) {
            var param = attr.ngMyArea.split(",");
            model = param[0];
            dataList = param[1];
            inputName = param[2];
            disabled = param[3];
            placeholder = param[4];
            return `
<div style="display: inline-block;width: 32%;">
    <select class="con" ng-model="conVal" ng-options="d[0] as d[1] for d in conComData" style="width:100%;"></select>
</div>
<div style="display: inline-block;width: 67%;" ng-my-select="${model},${dataList},,${disabled},${placeholder}"></div>
<input type="text" style="position:absolute;width: 0;border: 0;" tabindex="-1" name="{{vc.name}}" ng-value="form.copyData[vc.name]"/>`;
        }
    }
});

// 编辑层多功能 input 指令动作,根据属性类型显示不同控件
appModule.directive('ngDataInput', function () {
    return {
        restrict: 'EA',
        template: `<label class="control-label" ng-class="{'col-sm-4':viewCfg.isSplit,'col-sm-3':!viewCfg.isSplit}" >{{vc.title || vc.name }}:<span class="required"><b ng-if="vc.vali.required">*</b></span></label>
<div class="col-sm-8">
 <div ng-if="!form.isMultiEdit" ng-switch="vc.comType">
   <div ng-switch-when="select" class="no-padding no-border">
        <div ng-my-select="form.copyData[vc.name],vc.comData,vc.name,isDisabledEdit(vc),vc.help||vc.title||vc.name"></div>
   </div>
   <div ng-switch-when="mulSelect" class="no-padding no-border">
        <div ng-my-mul-select="form.copyData[vc.name],vc.comData,vc.name,isDisabledEdit(vc),vc.help||vc.title||vc.name"></div>
   </div>
   <div ng-switch-when="radio" class="input-sm no-padding no-border"
         ng-my-radio="form.copyData[vc.name],vc.comData,vc.name,isDisabledEdit(vc)">
   </div>
   <div ng-switch-when="checkbox" class="input-sm no-padding no-border"
         ng-my-checkbox="form.copyData[vc.name],vc.comData,vc.name,isDisabledEdit(vc),vc.help||vc.title||vc.name">
   </div>
   <div ng-switch-when="area" class="no-padding no-border"
         ng-my-area="form.copyData[vc.name],vc.comData,vc.name,isDisabledEdit(vc),vc.help||vc.title||vc.name">
   </div>
   <div ng-switch-when="file" class="no-padding no-border"
        ng-my-file="vc.name,vc.comData">
   </div>
   <input type="text" ng-switch-default class="form-control input-sm layer-date"  name="{{vc.name}}" placeholder="{{vc.help || vc.title || vc.name}}"
          ng-click="vc.type=='D'&&laydate(form.copyData,vc.name,$event)"
          ng-disabled="isDisabledEdit(vc)" ng-model="form.copyData[vc.name]" >
 </div>
  <ng-smarty-input ng-if="form.isMultiEdit && vc.mulEdit"/>
</div>`
    };
});

// 多行编辑控件...指令
appModule.directive('ngSmartyInput', function () {
    return {
        restrict: 'EA',
        link: function (scope, elem, attrs) {
            // 控制显示提示层..
            scope.showCtrl = {};
            // 选中提示的...
            scope.selSmarty = function (value) {
                scope.form.copyData[scope.vc.name] = value;
            };
            // 亮度提示
            scope.hiLiteTips = function (ctt) {
                var value = scope.form.copyData[scope.vc.name];
                return "&nbsp;&nbsp;&nbsp;" + scope.Utils.hiLiteContent(ctt, value);
            };

        },
        template: '<input class="form-control" type="text" ng-model="form.copyData[vc.name]"' +
        '  ng-focus="showCtrl[vc.name]=true" ng-blur="showCtrl[vc.name]=false" />' +
        '<div class="smarty" ng-if="showCtrl[vc.name]">' +
        '    <div ng-repeat="v in form.smDatas[vc.name] | filter:form.copyData[vc.name]  track by $index" ng-mousedown="selSmarty(v)" ng-bind-html="hiLiteTips(v)|html"></div>' +
        '</div>'
    };
});

module.exports = appModule;







