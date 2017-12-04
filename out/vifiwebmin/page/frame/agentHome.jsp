<script>
    g_var.view = ${view};
    
    var switchPageUrl = function(){
    	var url = window.location.href;
    	//url.replace("/home", "/user/userTopupRcd");
    	location.assign(url.replace("/home", "/user/userTopupRcd"));
    };
</script>
<style>
	.rank-list-div{
		height:21px;line-height:21px;font-size:12px;
	}
</style>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure no-padding" style="color:#fff;">
                    	<i class="glyphicon glyphicon-user margin-10" style="font-size: 45px;"></i>
                    </div>
                    <div class="databox-right">
                    	<div class="databox-number" style="color:#2dc3e8 !important;">
                            <div class="col-md-6 col-sm-6 col-xs-6 text-left" style="padding:0 0 5px 0 !important;"><spring:message code="label.homePage.welcome"/></div>
                            <div class="col-md-6 col-sm-6 col-xs-6 text-right" style="padding:0 0 5px 0 !important;"><shiro:principal property="role"/></div>
                        </div>
                        <div class="databox-text darkgray"><shiro:principal property="userName"/></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-success">
                        <div class="databox-piechart">
                            <echart data-options="agentUserOnlinePercent" style="width: 47px; height: 47px; line-height: 47px;"></echart>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#53a93f!important;">{{view.agentUserCount}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.agentUserCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#53a93f!important;">
                            <i class="stat-icon icon-lg fa fa-users"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure">
                        <div class="databox-piechart">
                            <echart data-options="agentDevOnlinePercent" style="width: 47px; height: 47px; line-height: 47px;"></echart>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#2dc3e8 !important;">{{view.agentDeviceCount}}</span>
                        <div class="databox-text darkgray"><spring:message code="lable.homePage.agentDeviceCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#2dc3e8 !important;">
                            <i class="stat-icon icon-lg fa fa-desktop"></i>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-yellow no-padding">
                        <i class="stat-icon icon-lg fa fa-cny margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#ffce55 !important;">{{view.todayTotalConsume}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.todayTotalConsume"/></div>
                        <div class="databox-stat radius-bordered" style="color:#ffce55 !important;">
                            <i class="stat-icon icon-lg fa fa-money"></i>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>
<!--  第二行  -->
<div class="row">
	<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
        <div class="widget">
            <div class="widget-header">
              	<span class="widget-caption"> <spring:message code="label.homePage.recentAddUser" /></span>
          	</div> 
            <div class="widget-body no-padding">
                <div class="task-container">
                    <div class="row">
                        <div class="col-lg-12 chart-container">
                            <echart data-options="recentRegisterUserStatistic" class="chart no-margin" style="height:396px;"></echart>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
		<div class="widget "> 
			<div class="widget-header">
              	<span class="widget-caption"> <spring:message code="label.homePage.chargeRecord" /></span>
          	</div> 
          	<div class="widget-body no-padding">
          		<div id="flow-top-list"></div>
          	</div>
        </div>
	</div>
</div>
<!-- 第三行 -->
<div class="row">
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<div class="widget "> 
            <div class="widget-header">
              	<span class="widget-caption"> <spring:message code="label.homePage.todayTraffic" /></span>
          	</div> 
          	<div class="widget-body" style="height: 300px;padding-top: 20px">
          		<div class=" chart-container">
          			<div id="agenthome-realtime-traffic" class="chart chart-lg"></div>
          		</div>
          	</div>
        </div>
        
	</div>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<div class="widget ">
            <div class="widget-header">
              	<span class="widget-caption"> <spring:message code="label.homePage.todayHUADAN" /></span>
          	</div> 
          	<div class="widget-body" style="height: 300px;padding-top: 20px">
               <div class="row">
                   <div class="col-lg-12 chart-container">
                       <div id="agentTodayHUADAN-chart" class="chart chart-lg no-margin"></div>
                   </div>
               </div>
          	</div>
        </div>
	</div>
</div>






