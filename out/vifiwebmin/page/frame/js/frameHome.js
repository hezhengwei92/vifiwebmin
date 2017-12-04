require("../css/frameHome.css");
var appModule = require("appModule");

appModule.controller("frameHomeCtrl", ["$scope", "$rootScope", "Utils", "$interval", function ($scope, $rootScope, Utils, $interval) {
    $scope.view = g_var.view;
    $rootScope.childPage = "/home/";
    
    var roleInfo = g_var.view.roleInfo,
    	role = roleInfo.keyRoleId,
    	homePage = roleInfo.homePage;
    $scope.roleName = $.i18n("role."+role)
    
    function initPageByRole(homePage){
    	if(homePage=="agentHome"){
    		initAgentHomePage();
    	}else if(homePage=="supplierHome"){
        	initSupplierHomePage();
    	}else if(homePage=="frameHome"){
    		initFrameHomePage();
    	}else if(homePage=="redirectHome"){
    		initRedirectHome();
    	}
    }
    initPageByRole(homePage);
    
    /*********************************	代理商用户权限	***********************/
    function initAgentHomePage(){
    	//在线设备百分比
    	$scope.agentDevOnlinePercent = getStatusEO($scope.view.agentDevOnlinePercent);
    	//在线用户百分
    	$scope.agentUserOnlinePercent = getStatusEO($scope.view.agentUserOnlinePercent);
    	/******* 充值记录 *********/
        var tops = g_var.view.chargeRecord;
    	var topsLen = tops.length;
    	for(var i=0; i<topsLen; i++){
    		tops[i].keyWord = tops[i].idxUserID;
    		tops[i].keyValue = parseFloat(tops[i].amount)/1000;
    	}
    	function getTopRankHtml(tops){
        	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
            for(var i = 0; i<tops.length; i++){
            	topDivHtml +="<li class=\"order-item\" onclick='analysisModal(\"\", "+tops[i].keyWord+")'><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">"
            		+ tops[i].keyWord+"</span></div>";
            	topDivHtml += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
            	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
            	topDivHtml +="</span></div></div></div></li>";
            }
            //填充空数据
            for ( var i = tops.length; i < 10; i++) {
            	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
            	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
            	topDivHtml +="</span><span class=\"price\"></span></div></div></div></li>";
            }
            topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
        	topDivHtml +="</span><span class=\"price\"><button class=\"btn btn-palegreen btn-sm pull-right\" onclick='switchPageUrl()'>"
        		+$.i18n("status.cdrNew.info29")+"</button></span></div></div></div></li>";
        	topDivHtml +="</ul></div>";
            return topDivHtml;
        }
    	$("#flow-top-list").html(getTopRankHtml(tops));//设置“更多”按钮点击事件
    	/********　　今日话单  *********/
    	var chartToday = echarts.init(document.getElementById('agentTodayHUADAN-chart'));
        var todays = g_var.view.agentTodayHUADAN;
        chartToday.setOption(getOptionVal(todays[0],todays[1],todays[2],todays[3],todays[4],todays[5],todays[6]));
        var flagMonthNum =0;
        var flagYearNum =0;
        function getOptionVal(timeData,callData,costData,maxNum,numInterval,maxCost,costInterval,x2Value){
        	if(x2Value == undefined || x2Value == null){
        		x2Value = 60;
        	}
        	var  option = {
	        	    tooltip: {
	        	        trigger: 'axis',
	        	        formatter: function (params,ticket,callback) {
	        	            var res = params[0].name;
	        	            for (var i = 0, l = params.length; i < l; i++) {
	        	            	if( params[i].value != undefined){
		        	            	if(params[i].seriesName == 'cost'){
			        	                res += '<br/>'+$.i18n("status.cdrNew.info26")+' : ' + params[i].value +' '+$.i18n("status.cdrNew.info24");
			        	            }else{
			        	                res += '<br/>'+$.i18n("status.cdrNew.info27")+' : ' + params[i].value+' '+$.i18n("status.cdrNew.info3");
			        	            }
	        	            	}
	        	            }
	        	            return res;
	        	        }
	        	    },
	        	    legend: {
	        	        data:[]
	        	    },
	        	    grid: {x: 50, y: 5, x2: x2Value, y2: 40},
	        	    xAxis: [
	        	        {
	        	            type: 'category',
	        	            data: timeData,
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
	        	            show: true,  
	        	            max: maxCost,
	        	            splitLine:{ 
	                            show:false 
	                     	},
	        	            interval: costInterval,
	        	            axisLabel: {
	        	                formatter: '{value} '+$.i18n("status.cdrNew.info24")
	        	            }
	        	        },
	        	        {
	        	            type: 'value',
	        	            name: '',
	        	            show: true,  
	        	            min: 0,
	        	            splitLine:{ 
	                            show:false 
	                    	 },
	        	            max: maxNum,
	        	            interval: numInterval,
	        	            axisLabel: {
	        	                formatter: '{value} '+$.i18n("status.cdrNew.info3")
	        	            }
	        	        }
	        	    ],
	        	    series: [
	        	        {
	        	            name:'cost',
	        	            type:'bar',
	        	            itemStyle:{
	        	                  normal:{color:'skyBlue'}
	        	             },
	        	            barMaxWidth: fixWidth(0.02),
	        	            data:costData
	        	        },
	        	        {
	        	            name:'call',
	        	            type:'line',
	        	            itemStyle:{
	        	                  normal:{color:'orange'}
	        	             },
	        	            yAxisIndex: 1,
	        	            data:callData,
	        	            
	        	        }
	        	    ]
	        	};
        	return option;
        }
        function fixWidth(percent){   return document.body.clientWidth * percent ;    };//这里你可以自己做调整 
    	/******** 今日流量/实时流量 **************/
        var dataCharts = g_var.view.agenthomeRealTimeTraffic[1],
        totalPoints = 300;
    	var updateInterval = 5000, curTime = new Date().getTime();
    	 
    	function getData3(y) {
    	
    	    if (dataCharts.length > 0){
    	    	if(dataCharts.length >= totalPoints){
    	        	dataCharts = dataCharts.slice(1);
    	    	}
    	    	if(y !=undefined){
    	        	dataCharts.push(y);
    	    	}
    	    }
    	    var res = [];
    	    for (var i = 0; i < dataCharts.length; ++i) {
    	        res.push([i, dataCharts[i]])
    	    }
    	
    	    return res;
    	}
    	var maxVal=parseInt(g_var.view.agenthomeRealTimeTraffic[2])+100;
    	var plot = $.plot("#agenthome-realtime-traffic", [getData3()], {
    		yaxis: {
    	        color: gridbordercolor,
    	        min: 0,
    	        max: maxVal
    	    },
    	    xaxis: {
    	        color: gridbordercolor,
    	        show: true,  
    	        tickFormatter: function (val, axis) {
    	        	var dataVal = "";
    	        	if(val!=0){
    	        		if(axis.options.data[val]!=undefined){
    	            		dataVal=axis.options.data[val];
    	        		}
    	        	}
    	        	return dataVal;
    	        },
    	        splitLine:{ 
    	            show:true 
    	     	},
    	        // 前 REAL_NUM 秒,到现在的时间段
    	        //data: _.map(_.range(totalPoints), i=>new Date(curTime - (totalPoints*5 - i) * 1000).format("HH:mm:ss"))
    	        data: g_var.view.agenthomeRealTimeTraffic[0]
    	    },
    	    colors: [themeprimary],
    	    series: {
    	        lines: {
    	            lineWidth: 0,
    	            fill: true,
    	            fillColor: {
    	                colors: [{
    	                    opacity: 0.4
    	                }, {
    	                    opacity: 0
    	                }]
    	            },
    	            steps: false
    	        },
    	        type: 'line', symbolSize: 5, animation: false,
    	        //data: _.map(_.range(totalPoints), d=>0),
    	        shadowSize: 0
    	    },
    	    grid: {
    	        hoverable: true,
    	        clickable: false,
    	        borderWidth: 0,
    	        aboveData: false
    	    },
    	    tooltip: true,
    	    tooltipOpts: {
    	        defaultTheme: false,
    	        content:  "<span>%y</span> KB",
    	    }
    	});
    	
    	//最近十天新增的用户
        var recentRegisterUserData = $scope.view.recentRegisterUser;
        var recentRegisterUser = {
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params,ticket,callback) {
                        var res = ``;
                        for (var i = 0, l = params.length; i < l; i++) {
                           res = `日期：${params[i].name}
                            新增用户：    ${params[i].value}`;
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

            function setRecentRegisterUser() {
                let data = recentRegisterUser.series[0].data;
                let date = recentRegisterUser.xAxis[0].data;
                $.each( recentRegisterUserData, function ( index, obj ) {
                    date.push( obj.myDate );
                    data.push( obj.registerUserSum );
                });
                $scope.recentRegisterUserStatistic = angular.copy(recentRegisterUser);
            }
            setRecentRegisterUser();
    	
//    	function updateAgentTraffic() {
//    		$.ajax({
//    	        url: window.PATH + "/home/realTime.ajax", //请求的url地址
//    	        data: {}, //参数值
//    	        type: "post", //请求方式  
//    	        dataType: "json",
//    	        success: function success(req) {
//    	        	if(location.href.contains("/home")){//及时关闭
//    	                plot.setData([getData2(req.data)]);
//    	                if( parseInt(req.data) > maxVal){
//    	                	maxVal = req.data;
//    	                	plot.getYAxes()[0].options.max=maxVal+50;
//    	                }
//    	                var xAxisData = plot.getXAxes()[0].options.data;
//    	                if(xAxisData.length >= totalPoints){
//    		                xAxisData =xAxisData.slice(1);
//    	                }
//    	                xAxisData.push(new Date().format("HH:mm:ss"));
//    	                plot.getXAxes()[0].options.data = xAxisData;
//    	                plot.setupGrid();
//    	                plot.draw();
//    	                setTimeout(update, updateInterval);
//    	            }
//    	            //请求成功时处理
//    	        },
//    	        error: function error(xhr, type, exception) {//获取ajax的错误信息
//    	            //alert(exception);
//    	        }
//    	    });
//    	
//    	}
//    	updateAgentTraffic();
    	
    	
    };	
    /***********************************	供应商权限	****************************/
    	
    function initSupplierHomePage(){
    	//卡数正常状态比例
    	$scope.supplierNormalCardPercent = getStatusEO($scope.view.supplierNormalCardPercent);
    	//最近20天流量统计
    	var cdrTrafficStatisticData = $scope.view.cdrTrafficStatistic;
        var cdrTrafficStatistic = {
            tooltip: {
                trigger: 'axis',
                formatter: function (params,ticket,callback) {
                    var res = ``;
                    for (var i = 0, l = params.length; i < l; i++) {
                       res = `日期：${params[i].name}
                        总流量：    ${params[i].value}`;
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

        function setCdrTrafficStatistic () {
            let data = cdrTrafficStatistic.series[0].data;
            let date = cdrTrafficStatistic.xAxis[0].data;
            $.each( cdrTrafficStatisticData, function ( index, obj ) {
                date.push( obj.myDate );
                data.push( obj.trafficSum );
            });
            $scope.cdrTrafficStatistic = angular.copy(cdrTrafficStatistic);
        }
        setCdrTrafficStatistic();
        
        //最近20天通话
        var recentCalltimeData = $scope.view.recentCalltime;
        var recentCalltime = {
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params,ticket,callback) {
                        var res = ``;
                        for (var i = 0, l = params.length; i < l; i++) {
                           res = `日期：${params[i].name}
                            总通话时长：    ${params[i].value}`;
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

            function setRecentCalltime() {
                let data = recentCalltime.series[0].data;
                let date = recentCalltime.xAxis[0].data;
                $.each( recentCalltimeData, function ( index, obj ) {
                    date.push( obj.myDate );
                    data.push( obj.callDurationSum );
                });
                $scope.recentCalltimeStatistic = angular.copy(recentCalltime);
            }
            setRecentCalltime();
            
         
         //卡状态百分比图
            var simCardByStatusInfo = $scope.view.simCardByStatus;
            var simCardByStatus = {
                series: [{
                    type: 'pie', x: 10, center: ["50%", "50%"], radius: ['90%', '33%'],
                    itemStyle: {
                        normal: {label: {show: false}, labelLine: {show: false}}
                    },
                    data : [],
                    color : []
                }]
            };

            function setSimCardCount () {
                var smsCountData = simCardByStatus.series[0].data;
                var smsCountColor = simCardByStatus.series[0].color;

                var simCardByStatusDetails = $("#simCardByStatusDetails");
                var color = [ '#ffce55', '#5db2ff', '#fb6e52', '#e75b8d', '#a0d468' ];

                $.each( simCardByStatusInfo, function ( index, obj ) {
                    smsCountData.push( obj.sum );
                    smsCountColor.push( color[index] );
                    //var name = obj.name? obj.name : $.i18n("label.common.unknown"),
                    var	name = obj.name=="0"? "正常": "禁用",
                    	lang = obj.lang? obj.lang : $.i18n("label.common.unknown");
                    var myInsert = $('<div class="databox-row row-2 bordered-bottom bordered-ivory padding-10">'+
                        '<span class="badge badge-empty pull-left margin-5" style="background-color: ' +color[index]+
                        '"></span>'+
                        '<span class="databox-text darkgray pull-left no-margin hidden-xs">'+ name +//'('+ lang +')'+
                        '</span>'+
                        '<span class="databox-text darkgray pull-right no-margin uppercase">'+ obj.sum + '</span>'+
                        '</div>');
                    simCardByStatusDetails.append( myInsert );
                });

                $scope.simCardByStatus = angular.copy(simCardByStatus);
            }
            setSimCardCount();
            
          //国内国外通过百分比
            var callTimeByDistanceInfo = $scope.view.callTimeByDistance;
            var callTimeByDistance = {
                series: [{
                    type: 'pie', x: 10, center: ["50%", "50%"], radius: ['90%', '33%'],
                    itemStyle: {
                        normal: {label: {show: false}, labelLine: {show: false}}
                    },
                    data : [],
                    color : []
                }]
            };

            function setCalltimeCount () {
                var smsCountData = callTimeByDistance.series[0].data;
                var smsCountColor = callTimeByDistance.series[0].color;

                var callTimeByDistanceDetails = $("#callTimeByDistanceDetails");
                var color = [ '#ffce55', '#5db2ff', '#fb6e52', '#e75b8d', '#a0d468' ];

                $.each( callTimeByDistanceInfo, function ( index, obj ) {
                    smsCountData.push( obj.sum );
                    smsCountColor.push( color[index] );
                    var	name = obj.name;
                    if(name=="L"){
                    	name = "市话";
                    }else if(name == "I"){
                    	name = "长途";
                    }else{
                    	name = "未知";
                    }
                    var myInsert = $('<div class="databox-row row-2 bordered-bottom bordered-ivory padding-10">'+
                        '<span class="badge badge-empty pull-left margin-5" style="background-color: ' +color[index]+
                        '"></span>'+
                        '<span class="databox-text darkgray pull-left no-margin hidden-xs">'+ name +//'('+ lang +')'+
                        '</span>'+
                        '<span class="databox-text darkgray pull-right no-margin uppercase">'+ obj.sum + '</span>'+
                        '</div>');
                    callTimeByDistanceDetails.append( myInsert );
                });

                $scope.callTimeByDistance = angular.copy(callTimeByDistance);
            }
            setCalltimeCount();
    	
    };	
    	
    
    /*******************************	其他/默认管理员权限	*********************************/
    function initFrameHomePage(){
    	//在线用户百分比
    	$scope.onlineUserPercent = getStatusEO($scope.view.onlineUserPercent);
    	//在线设备百分比
    	$scope.devOnlinePercent = getStatusEO($scope.view.devOnlinePercent);
    	/**** 实时流量 *************/
    	var dataCharts = g_var.view.frmhomeRealTimeTraffic[1],
        totalPoints = 300;
    	var updateInterval = 5000, curTime = new Date().getTime();
    	 
    	function getData2(y) {
    	
    	    if (dataCharts.length > 0){
    	    	if(dataCharts.length >= totalPoints){
    	        	dataCharts = dataCharts.slice(1);
    	    	}
    	    	if(y !=undefined){
    	        	dataCharts.push(y);
    	    	}
    	    }
    	    var res = [];
    	    for (var i = 0; i < dataCharts.length; ++i) {
    	        res.push([i, dataCharts[i]])
    	    }
    	
    	    return res;
    	}
    	var maxVal=parseInt(g_var.view.frmhomeRealTimeTraffic[2])+100;
    	var plot = $.plot("#frmhome-realtime-traffic", [getData2()], {
    		yaxis: {
    	        color: gridbordercolor,
    	        min: 0,
    	        max: maxVal
    	    },
    	    xaxis: {
    	        color: gridbordercolor,
    	        show: true,  
    	        tickFormatter: function (val, axis) {
    	        	var dataVal = "";
    	        	if(val!=0){
    	        		if(axis.options.data[val]!=undefined){
    	            		dataVal=axis.options.data[val];
    	        		}
    	        	}
    	        	return dataVal;
    	        },
    	        splitLine:{ 
    	            show:true 
    	     	},
    	        // 前 REAL_NUM 秒,到现在的时间段
    	        //data: _.map(_.range(totalPoints), i=>new Date(curTime - (totalPoints*5 - i) * 1000).format("HH:mm:ss"))
    	        data: g_var.view.frmhomeRealTimeTraffic[0]
    	    },
    	    colors: [themeprimary],
    	    series: {
    	        lines: {
    	            lineWidth: 0,
    	            fill: true,
    	            fillColor: {
    	                colors: [{
    	                    opacity: 0.4
    	                }, {
    	                    opacity: 0
    	                }]
    	            },
    	            steps: false
    	        },
    	        type: 'line', symbolSize: 5, animation: false,
    	        //data: _.map(_.range(totalPoints), d=>0),
    	        shadowSize: 0
    	    },
    	    grid: {
    	        hoverable: true,
    	        clickable: false,
    	        borderWidth: 0,
    	        aboveData: false
    	    },
    	    tooltip: true,
    	    tooltipOpts: {
    	        defaultTheme: false,
    	        content:  "<span>%y</span> KB",
    	    }
    	});
    	//今日通话  有问题
    	var plot = $.plot("#frmhome-realtime-calltime", [getData2()], {
    		yaxis: {
    	        color: gridbordercolor,
    	        min: 0,
    	        max: maxVal
    	    },
    	    xaxis: {
    	        color: gridbordercolor,
    	        show: true,  
    	        tickFormatter: function (val, axis) {
    	        	var dataVal = "";
    	        	if(val!=0){
    	        		if(axis.options.data[val]!=undefined){
    	            		dataVal=axis.options.data[val];
    	        		}
    	        	}
    	        	return dataVal;
    	        },
    	        splitLine:{ 
    	            show:true 
    	     	},
    	        // 前 REAL_NUM 秒,到现在的时间段
    	        //data: _.map(_.range(totalPoints), i=>new Date(curTime - (totalPoints*5 - i) * 1000).format("HH:mm:ss"))
    	        data: g_var.view.frmhomeRealTimeTraffic[0]
    	    },
    	    colors: [themeprimary],
    	    series: {
    	        lines: {
    	            lineWidth: 0,
    	            fill: true,
    	            fillColor: {
    	                colors: [{
    	                    opacity: 0.4
    	                }, {
    	                    opacity: 0
    	                }]
    	            },
    	            steps: false
    	        },
    	        type: 'line', symbolSize: 5, animation: false,
    	        //data: _.map(_.range(totalPoints), d=>0),
    	        shadowSize: 0
    	    },
    	    grid: {
    	        hoverable: true,
    	        clickable: false,
    	        borderWidth: 0,
    	        aboveData: false
    	    },
    	    tooltip: true,
    	    tooltipOpts: {
    	        defaultTheme: false,
    	        content:  "<span>%y</span> KB",
    	    }
    	});
    	//实时刷新：现在请求无权限
    	/*function update() {
    		$.ajax({
    	        url: window.PATH + "/home/realTime", //请求的url地址
    	        data: {}, //参数值
    	        type: "post", //请求方式  
    	        dataType: "json",
    	        success: function success(req) {
    	        	if(location.href.contains("/home")){//及时关闭
    	                plot.setData([getData2(req.data)]);
    	                if( parseInt(req.data) > maxVal){
    	                	maxVal = req.data;
    	                	plot.getYAxes()[0].options.max=maxVal+50;
    	                }
    	                var xAxisData = plot.getXAxes()[0].options.data;
    	                if(xAxisData.length >= totalPoints){
    		                xAxisData =xAxisData.slice(1);
    	                }
    	                xAxisData.push(new Date().format("HH:mm:ss"));
    	                plot.getXAxes()[0].options.data = xAxisData;
    	                plot.setupGrid();
    	                plot.draw();
    	                setTimeout(update, updateInterval);
    	            }
    	            //请求成功时处理
    	        },
    	        error: function error(xhr, type, exception) {//获取ajax的错误信息
    	            //alert(exception);
    	        }
    	    });
    	
    	}*/
    	/*update();*/
    
    	
    };
    /*******************************	redirectHome	***************************/
    function initRedirectHome(){
    	var tops = g_var.view.recentAuthAccount;
    	var topsLen = tops.length;
    	for(var i=0; i<topsLen; i++){
    		tops[i].keyWord = tops[i].idxAppId? tops[i].idxAppId : tops[i].idxASCode;//并不是真的是idxAppId，只是一个存储公司名称的字段
    		tops[i].keyValue = tops[i].idxPhoneNumber;
    	}
    	function getTopRankHtml(tops){
        	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
            for(var i = 0; i<tops.length; i++){
            	topDivHtml +="<li class=\"order-item\" onclick='analysisModal(\"\", "+tops[i].keyWord+")'><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">"
            		+ tops[i].keyWord+"</span></div>";
            	topDivHtml += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
            	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
            	topDivHtml +="</span></div></div></div></li>";
            }
            //填充空数据
            for ( var i = tops.length; i < 10; i++) {
            	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
            	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
            	topDivHtml +="</span><span class=\"price\"></span></div></div></div></li>";
            }
            topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
        	topDivHtml +="</span><span class=\"price\"><button class=\"btn btn-palegreen btn-sm pull-right\" onclick='switchPageUrl()'>"
        		+$.i18n("status.cdrNew.info29")+"</button></span></div></div></div></li>";
        	topDivHtml +="</ul></div>";
            return topDivHtml;
        }
    	$("#flow-top-list2").html(getTopRankHtml(tops));//设置“更多”按钮点击事件
    }
    
/*************************************  commonUtils		*****************************/
    //百分比方法
    function getStatusEO(sta) {
    	if(!sta){
    		return undefined;
    	}
    	var total = (sta[0] + sta[1]);
    	//当分母为0时，将它设置为1，不影响比值
    	if(sta[0] + sta[1]==0){
    		sta[1] = 1;
    	}
        var normalRatio = (sta[0] /(sta[0] + sta[1]) * 100).toFixed(1);
        return {
            series: [{
                type: 'pie', radius: ['86%', '98%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: true,
                        position: 'center',
                        textStyle: {fontSize: '9', color: "#FFF"}
                    }
                },
                data: [
                    {value: sta[0], name: normalRatio + '%', itemStyle: {normal: {color: "#FFF"}}},
                    {value: sta[1], name: '', itemStyle: {normal: {color: "rgba(255,255,255,0.2)"}}}
                ]
            }]
        };
    }
    
//    // *** SimP 状态
//    $scope.simpStaEO = getStatusEO($scope.view.simPDevState);
//    // *** 启动卡状态
//    $scope.globStaEO = getStatusEO($scope.view.globDevState);
    

//    var REAL_NUM = 180, curTime = new Date().getTime();
//    var realTimeInfoEO = {
//        grid: {x: 30, y: 25, x2: 25, y2: 25},
//        legend: {
//            data: ['up', 'down'],
//            x: 'left'
//        },
//        tooltip: {
//            trigger: 'axis',
//            axisPointer: {animation: false},
//            formatter: function (params) {
//                var icons = ["<i class='fa fa-arrow-up orange margin-left-20'></i>", "<i class='fa fa-arrow-down green'></i>"];
//                return "<i class='fa fa fa-clock-o'></i> " + params[0].name + "<br/>" +
//                    _.map(params, (p, i)=>p.seriesName + icons[i] + ' : ' + p.value + 'KB').join("<br/>");
//            }
//        },
//        xAxis: [{
//            type: 'category', boundaryGap: false,
//            // 前 REAL_NUM 秒,到现在的时间段
//            data: _.map(_.range(REAL_NUM), i=>new Date(curTime - (REAL_NUM - i) * 1000).format("HH:mm:ss"))
//        }],
//        yAxis: [{type: 'value'}],
//        series: [{
//            name: 'up',
//            type: 'line', symbolSize: 5, animation: false,
//            itemStyle: {normal: {color: "orange"}},
//            data: _.map(_.range(REAL_NUM), d=>0)
//        }, {
//            name: 'down',
//            type: 'line', symbolSize: 5, animation: false,
//            itemStyle: {normal: {color: "green"}},
//            data: _.map(_.range(REAL_NUM), d=>0)
//        }]
//    };
//
//    function realTimeInfo() {
//        var xAxisData = realTimeInfoEO.xAxis[0].data;
//        var upData = realTimeInfoEO.series[0].data;
//        var downData = realTimeInfoEO.series[1].data;
//        // 塞入实时数据
//        xAxisData.push(new Date().format("HH:mm:ss"));
//        upData.push(_.random(20, 50));
//        downData.push(_.random(10, 30));
//
//        xAxisData.shift();
//        upData.shift();
//        downData.shift();
//
//        $scope.realTimeInfoEO = angular.copy(realTimeInfoEO);
//    }
//
//    realTimeInfo();
//    $interval(realTimeInfo, 1000);
    
//    // *** 今日 CDR 信息
//    var itemsMap = {
//        callCount: $.i18n("page.home.callCount"),
//        callDuration: $.i18n("page.home.callDuration"),
//        dataTraffic: $.i18n("page.home.dataTraffic")
//    };
//    $scope.todayCDRInfoEOp = {
//        grid: {x: 25, y: 35, x2: 25, y2: 25},
//        tooltip: {padding: 0, formatter: (p)=>`${p.seriesName}<br>${p.name}:${p.value || 0}`},
//        legend: {x: 'left', data: _.toArray(itemsMap)},
//        xAxis: [{type: 'category', boundaryGap: false, data: _.range(1, 25)}],
//        yAxis: [{type: 'value'}],
//        series: _.map(itemsMap, function (v, k) {
//            var seriesItem = {
//                name: v, type: 'line', data: []
//            };
//            _.each($scope.view.todayDuraAndTraf, function (data) {
//                seriesItem.data[data["hour"]] = data[k];
//            });
//            return seriesItem
//        })
//    };

    // **********************************************
//    var cdrYearEO = {
//        grid: {x: 2, y: 2, x2: 2, y2: 2},
//        tooltip: {padding: 0, formatter: (p)=>`${p.name}:${p.value || 0}`},
//        xAxis: [{
//            type: 'category',
//            boundaryGap: false,
//            data: _.range(1, 13)
//        }],
//        yAxis: [{type: 'value'}],
//        series: [{
//            type: 'line',
//            itemStyle: {normal: {areaStyle: {type: 'default'}}},
//            data: [1, 2]
//        }]
//    };
//
//    // *** 年度话单数量
//    $scope.cdrYearNumEOp = angular.copy(cdrYearEO);
//    $scope.cdrYearNumEOp.series[0].data = $scope.view.yearCdrInfo.callCountList;
//
//    // *** 年度通话时长
//    $scope.cdrYearDurEOp = angular.copy(cdrYearEO);
//    $scope.cdrYearDurEOp.series[0].data = $scope.view.yearCdrInfo.callDurList;
//
//    // *** 年度流量
//    $scope.cdrYearDataEOp = angular.copy(cdrYearEO);
//    $scope.cdrYearDataEOp.series[0].data = $scope.view.yearCdrInfo.dataTraList;

    // **********************************************sim 卡 状态
//    var balStati = $scope.view.balanceStati;
//    $scope.simCardEOp = {
//        legend: {
//            formatter: function (inx) {
//                var bal = balStati[Number(inx)];
//                return `${$.i18n("balance")}:${bal.range}        ${bal.count} ${bal.ratio.toFixed(2)}%`;
//            },
//            orient: 'vertical', x: 'right',
//            data: _.map(balStati, (b, i)=>"" + i)
//        },
//        series: [{
//            type: 'pie', x: 10, center: [135, "50%"], radius: ['90%', '33%'],
//            itemStyle: {
//                normal: {label: {show: false}, labelLine: {show: false}}
//            },
//            data: _.map(balStati, (b, i)=>new Object({value: b.count, name: "" + i}))
//        }]
//    };

}]);
