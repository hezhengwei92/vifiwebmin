
<script>
    g_var.view = ${view};
    
    var switchPageUrl = function(){
    	var url = window.location.href;
    	//url.replace("/home", "/user/userTopupRcd");
    	location.assign(url.replace("/home", "/vpx/LaiXunAuth"));
    };
</script>

<body>
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
                    <div class="databox-left label-success no-padding">
                        <!--div class="databox-piechart">
                            <echart data-options="supplierNormalCardPercent" style="width: 47px; height: 47px; line-height: 47px;"></echart>
                        </div-->
                        <i class="stat-icon icon-lg fa fa-sitemap margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#53a93f !important;">{{view.serverCount}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.serverCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#53a93f!important;">
                            <i class="stat-icon icon-lg fa fa-sitemap"></i>
                        </div>
                    </div>
                </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure no-padding">
                        <i class="stat-icon icon-lg fa fa-key margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#2dc3e8 !important;">{{view.licenseAuthSum}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.serverLicenseCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#2dc3e8 !important;">
                            <i class="stat-icon icon-lg fa fa-key"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="databox radius-bordered databox-shadowed databox-graded">
                    <div class="databox-left label-azure no-padding">
                        <i class="stat-icon icon-lg fa fa-group margin-10" style="font-size:45px;color:white;"/>
                    </div>
                    <div class="databox-right">
                        <span class="databox-number" style="color:#2dc3e8 !important;">{{view.licenseAllow}}</span>
                        <div class="databox-text darkgray"><spring:message code="label.homePage.licenseCount"/></div>
                        <div class="databox-stat radius-bordered" style="color:#2dc3e8 !important;">
                            <i class="stat-icon icon-lg fa fa-group"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
        	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	        	<div class="widget "> 
					<div class="widget-header">
		              	<span class="widget-caption"> <spring:message code="label.homePage.recentAuthAccount" /></span>
		          	</div> 
		          	<div class="widget-body no-padding">
		          		<div id="flow-top-list2"></div>
		          	</div>
		        </div>
        	</div>
        </div>
    </div>
</div>
	
	
</body>