<script>
    g_var.view = ${view};
</script>

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
        	<!-- div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox bg-white radius-bordered">
                    <div class="databox-left no-padding">
                        <i class="glyphicon glyphicon-user margin-10" style="font-size: 45px;"></i>
                    </div>
                    <div class="databox-right padding-top-20">
                        <div class="databox-stat palegreen">
                            <i class="stat-icon"><spring:message code="label.homePage.welcome"/>
                            	&nbsp;{{roleName}}&nbsp;<shiro:principal property="userName"/></i>
                        </div>
                        <div class="databox-text darkgray red">
                            <div class="col-md-6 col-sm-6 col-xs-6 no-padding text-right"><spring:message code="page.index.role"/>&nbsp;:&nbsp;</div>
                            <div class="col-md-6 col-sm-6 col-xs-6 no-padding text-left"><shiro:principal property="role"/></div>
                        </div>
                        <div class="databox-text darkgray">
                            <div class="col-md-6 col-sm-6 col-xs-6 no-padding text-right"><spring:message code="page.index.acount"/>&nbsp;:&nbsp;</div>
                            <div class="col-md-6 col-sm-6 col-xs-6 no-padding text-left"><shiro:principal property="userName"/></div>
                        </div>
                    </div>
                </div>
			</div-->
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-success">
                        <div class="databox-piechart">
                            <echart data-options="onlineUserPercent" style="width: 47px; height: 47px; line-height: 47px;"></echart>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#53a93f!important;">{{view.userCount}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.userCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#53a93f!important;">
                            <i class="stat-icon icon-lg fa fa-users"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure">
                        <div class="databox-piechart">
                            <echart data-options="devOnlinePercent" style="width: 47px; height: 47px; line-height: 47px;"></echart>
                        </div>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#2dc3e8 !important;">{{view.UUWiFiCount}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.deviceCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#2dc3e8 !important;">
                            <i class="stat-icon icon-lg fa fa-desktop"></i>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-yellow no-padding">
                        <i class="stat-icon icon-lg fa fa-exclamation-triangle margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#ffce55 !important;">0</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.warning"/></div>
                        <div class="databox-stat radius-bordered" style="color:#ffce55 !important;">
                            <i class="stat-icon icon-lg fa fa-exclamation-circle"></i>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="row">
             <div class="col-xs-12 col-md-12 col-lg-12">
                 <div class="widget">
                     <div class="widget-header ">
                         <span class="widget-caption"><spring:message code="status.cdrTariffe.info4_1"/><spring:message code="page.home.dataTraffic"/></span>
                     </div>
                     <div class="widget-body">
                         <div id="frmhome-realtime-traffic" class="chart chart-lg"></div>
                     </div>
                 </div>
             </div>
         </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="row">
             <div class="col-xs-12 col-md-12 col-lg-12">
                 <div class="widget">
                     <div class="widget-header ">
                         <span class="widget-caption"><spring:message code="label.homePage.realtimeHUADAN"/></span>
                     </div>
                     <div class="widget-body">
                         <div id="frmhome-realtime-calltime" class="chart chart-lg"></div>
                     </div>
                 </div>
             </div>
         </div>
    </div>
    
</div>
<!-- 第三行  -->
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="widget">
            <div class="widget-header ">
              <span class="widget-caption"><spring:message code="label.homePage.systemStatus"/></span>
          </div>
            <div class="widget-body no-padding" style="height:300px;"></div>
        </div>
    </div>
</div>





