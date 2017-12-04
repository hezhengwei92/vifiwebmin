<script>
    g_var.view = ${view};
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
                            <echart data-options="supplierNormalCardPercent" style="width: 47px; height: 47px; line-height: 47px;"></echart>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#53a93f !important;">{{view.supplierCardNum}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.cardCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#53a93f!important;">
                            <i class="stat-icon icon-lg fa fa-turkish-lira"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure no-padding">
                        <i class="stat-icon icon-lg fa fa-bar-chart-o margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#2dc3e8 !important;">{{view.todayTrafficData}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.todayTrafficData"/></div>
                        <div class="databox-stat radius-bordered" style="color:#2dc3e8 !important;">
                            <i class="stat-icon icon-lg fa fa-bar-chart-o"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure no-padding">
                        <i class="stat-icon icon-lg fa fa-phone margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#2dc3e8 !important;">{{view.todayCallTime}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.todayCallTime"/></div>
                        <div class="databox-stat radius-bordered" style="color:#2dc3e8 !important;">
                            <i class="stat-icon icon-lg fa fa-phone-square"></i>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>

<!--  第二行  -->
<div class="row">
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
        <div class="widget radius-bordered">
            <div class="widget-header">
                <span class="widget-caption"><spring:message code="label.homePage.recentTrafficChart"/></span>
            </div>
            <div class="widget-body no-padding">
                <div class="task-container">
                    <div class="row">
                        <div class="col-lg-12 chart-container">
                            <%--<div id="dashboard-chart-visits-smsCount_month" class="chart chart-lg no-margin"></div>--%>
                            <echart data-options="cdrTrafficStatistic" class="chart chart-lg no-margin"></echart>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="widget radius-bordered">
            <div class="widget-header">
                <span class="widget-caption"> <spring:message code="label.homePage.cardStatusChart"/></span>
            </div>
            <div class="widget-body no-padding">
                <div class="databox databox-vertical databox-shadowed bg-white radius-bordered" style="height:250px;margin-bottom:0px;">
                    <div class="databox-bottom" style="height:250px;">
                        <div class="databox-row row-10">
                            <div class="databox-cell cell-7 text-center  padding-5">
                                <echart data-options=simCardByStatus class="chart"></echart>
                            </div>
                            <div id="simCardByStatusDetails"
                                 class="databox-cell cell-5 text-center no-padding-left padding-bottom-30">
                                <div class="databox-row row-2 bordered-bottom bordered-ivory padding-10">
                                    <span class="databox-text sonic-silver pull-left no-margin"><spring:message
                                            code="status.smsNew.info.sendType"/></span>
                                    <span class="databox-text sonic-silver pull-right no-margin uppercase"><spring:message
                                            code="status.smsNew.info.number"/></span><!-- status.smsNew.info.percent 百分比 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
<!-- 第三行 -->
<div class="row">
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
        
        <div class="widget radius-bordered">
            <div class="widget-header">
                <span class="widget-caption"><spring:message code="label.homePage.recentCalltimeChart"/></span>
            </div>
            <div class="widget-body no-padding">
                <div class="task-container">
                    <div class="row">
                        <div class="col-lg-12 chart-container">
                            <%--<div id="dashboard-chart-visits-smsCount_month" class="chart chart-lg no-margin"></div>--%>
                            <echart data-options="recentCalltimeStatistic" class="chart chart-lg no-margin"></echart>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        
        <div class="widget radius-bordered">
            <div class="widget-header">
                <span class="widget-caption"> <spring:message code="label.homePage.callPercentChart"/></span>
            </div>
            <div class="widget-body no-padding">
                <div class="databox databox-vertical databox-shadowed bg-white radius-bordered" style="height:250px;margin-bottom:0px;">
                    <div class="databox-bottom" style="height:250px;">
                        <div class="databox-row row-10">
                            <div class="databox-cell cell-7 text-center  padding-5">
                                <echart data-options=callTimeByDistance class="chart"></echart>
                            </div>
                            <div id="callTimeByDistanceDetails"
                                 class="databox-cell cell-5 text-center no-padding-left padding-bottom-30">
                                <div class="databox-row row-2 bordered-bottom bordered-ivory padding-10">
                                    <span class="databox-text sonic-silver pull-left no-margin"><spring:message
                                            code="status.smsNew.info.sendType"/></span>
                                    <span class="databox-text sonic-silver pull-right no-margin uppercase"><spring:message
                                            code="status.smsNew.info.number"/></span><!-- status.smsNew.info.percent 百分比 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

<!-- 第4行  -->
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="widget">
            <div class="widget-header">
                <span class="widget-caption"> <spring:message code="supplierHome"/></span>
            </div>
            <div class="widget-body no-padding" style="height:300px;"></div>
        </div>
    </div>
</div>






