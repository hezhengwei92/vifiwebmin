var appModule = require("appModule");
appModule.controller("smsNewCtrl", ["$scope", "$rootScope", "Utils", "frameAdminBase", function ($scope, $rootScope, Utils, AngularBaseCtrl) {
    $scope.view = g_var.view;

    $rootScope.childPage = "/user/smsNew";
    var prefixUrl = PATH + $rootScope.childPage;

    var smsCountByTypeInfo = $scope.view.smsCountByType;
    var smsCountByType = {
        series: [{
            type: 'pie', x: 10, center: ["50%", "50%"], radius: ['90%', '33%'],
            itemStyle: {
                normal: {label: {show: false}, labelLine: {show: false}}
            },
            data : [],
            color : []
        }]
    };

    function setSMSCount () {
        var smsCountData = smsCountByType.series[0].data;
        var smsCountColor = smsCountByType.series[0].color;

        var smsCountByTypeDetails = $("#smsCountByTypeDetails");
        var color = [ '#ffce55', '#5db2ff', '#fb6e52', '#e75b8d', '#a0d468' ];

        $.each( smsCountByTypeInfo, function ( index, obj ) {
            smsCountData.push( obj.num );
            smsCountColor.push( color[index] );
            var name = obj.name? obj.name : $.i18n("label.common.unknown"),
            	lang = obj.lang? obj.lang : $.i18n("label.common.unknown");
            var myInsert = $('<div class="databox-row row-2 bordered-bottom bordered-ivory padding-10">'+
                '<span class="badge badge-empty pull-left margin-5" style="background-color: '+color[index]+'"></span>'+
                '<span class="databox-text darkgray pull-left no-margin hidden-xs">'+ name +'('+ lang +')'+'</span>'+
                '<span class="databox-text darkgray pull-right no-margin uppercase">'+ obj.num + '</span>'+
                '</div>');
            smsCountByTypeDetails.append( myInsert );
        });

        $scope.smsCountByType = angular.copy(smsCountByType);
    }
    setSMSCount();

    var smsCountMonthInfoData = $scope.view.smsCountMonthInfo;
    var smsCountMonthInfo = {
        tooltip: {
            trigger: 'axis',
            formatter: function (params,ticket,callback) {
                var res = ``;
                for (var i = 0, l = params.length; i < l; i++) {
                   res = `日期：${params[i].name}
                    总条数：    ${params[i].value}`;
                }
                return res;
            }
        },
        legend: {
            data:[]
        },
        grid: {x: 25, y: 50},
        xAxis: [
            {
                type: 'category',
                data: [],
                splitLine:{
                    show:false
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '',
                min: 0,
                show: false,
                splitLine:{
                    show:true
                }
                //interval: costInterval,
                //axisLabel: {
                //    formatter: '{value} 元'
                //}
            }
        ],
        series: [
            {
                name:'cost',
                type:'bar',
                itemStyle:{
                    normal:{color:'skyBlue'}
                },
                barMaxWidth: 35,
                data:[]
            }
        ]
    };

    function setSMSCountMonthData () {

        let data = smsCountMonthInfo.series[0].data;
        let date = smsCountMonthInfo.xAxis[0].data;

        $.each( smsCountMonthInfoData, function ( index, obj ) {
            date.push( obj.myDate );
            data.push( obj.num );
        });

        $scope.smsCountMonthInfo = angular.copy(smsCountMonthInfo);
    }
    setSMSCountMonthData();

    var queryDetailInfo = $scope.view.queryDetails;
    function queryDetails () {
        let mySMSDetailsTable = $("#myTbody_querySMSDetails");
        $.each( queryDetailInfo, function ( index, obj ) {
            let date = new Date( obj.createdTime ).format("yyyy-MM-dd HH:mm:ss");
            let tr = $("<tr><td>"+obj.keySMSId+"</td><td>"+obj.idxPhoneNumber+"</td><td>"+obj.message+"</td><td>"+obj.state+"</td><td>"+date+"</td></tr>");
            mySMSDetailsTable.append( tr );
        });
    }
    queryDetails();
    

}]);
