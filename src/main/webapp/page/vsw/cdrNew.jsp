<script>
    g_var.view = ${view};
</script>
<style>
<!--
.orders-container .orders-list .order-item:hover {
    background-color: #FFFFFF
}
.widget-body .tdColor {
   background-color: #FBFBFB;
}
.widget-body .tdColor:hover {
    background-color: #FFFFFF
}
-->
</style>
 <body>
  <div class="bs-example">
    <div class="row">
      <div class="col-xs-12 col-md-12">
        <div class="widget no-margin-bottom">
          <div class="widget-body no-padding">
            <div id="searchable_wrapper">

              <div class="tabbable">  
                <ul class="nav nav-tabs">
                  <!-- tab标签页组 -->
                  <%--<li class="active" id="tab1">--%>
                     <%--<a data-toggle="tab" href="javaScript:void(0)" onclick="showTools99('','state_tab','list','list2_tab','list3_tab')"><i class="fa fa-th font14"></i>--%>
                     <%--<span class="tab-title"><spring:message code="status.cdrNew.info1"/></span></a>--%>
                  <%--</li>--%>
                  <li class="tab-red" id="tab2">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools99('tools','list','list2_tab','state_tab','list3_tab')"><i class="fa fa-list font14"></i>
                     <span class="tab-title"><spring:message code="menu.cdr_data-cdr"/></span></a>
                  </li> 
                  <li class="tab-red" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools99('tools8','list2_tab','list','state_tab','list3_tab')"><i class="fa fa-list font14"></i>
                     <span class="tab-title"><spring:message code="menu.cdr_count"/></span></a> 
                  </li>  
                  <%--<li class="tab-red" id="tab4">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools99('tools9','list3_tab','list2_tab','list','state_tab')"><i class="fa fa-list font14"></i>
                     <span class="tab-title"><spring:message code="menu.cdr_UUWiFicount"/></span></a>
                  </li>  --%>
                 
                  <!--
                  <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools('false','tabpanle3','list2_tab','list')">图表 </a>
                  </li>  -->
                  
                  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right" style="display:block;float:right !important;"  id="tools">
				    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail" onclick="btnViewDetails()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    
                    <!-- 设置按钮，设置显示列 -->
                    <div class="viewcfg-dropdown">
                      <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                      <ul class="dropdown-menu dropdown-blue" >
                        <li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
                          <div class="pull-left">
                            <label style="margin: 0 0 0 16px;">
							  <input type="checkbox" id="checkAllTrs" onchange="checkAllTrs()">
							  <span class="text"></span>
							</label>
							<spring:message code="check_all"/><!-- 全选 -->
                          </div>
                          <button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="myResetTrs()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button><!-- 重置 -->
                         </li>
                         <div id="selectItems"></div> 
                       </ul>
                    </div>
                    <!-- 搜索按钮 -->
                    <div id="adv-search" class="btn warning padding-right-5" style="font-size: 14px;padding: 4px 12px;" aria-expanded="false">
                      <i class="fa fa-search-plus"></i><i class="fa fa-search-minus"></i> 
                    </div> 
                    
				  </li>  
				  
				  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right" style="display:none;float:right !important;" id="tools8">
                    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail8" onclick="btnViewDetails8()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    <!-- 设置按钮，设置显示列 -->
                    <div class="viewcfg-dropdown">
                      <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                      <ul class="dropdown-menu dropdown-blue" >
                        <li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
                          <div class="pull-left">
                            <label style="margin: 0 0 0 16px;">
							  <input type="checkbox" id="checkAllTrs8" onchange="checkAllTrs8()">
							  <span class="text"></span>
							</label>
							<spring:message code="check_all"/><!-- 全选 -->
                          </div>
                          <button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="myResetTrs8()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button><!-- 重置 -->
                         </li>
                         <div id="selectItems8"></div> 
                       </ul>
                    </div>
                    <!-- 搜索按钮 -->
                    <div id="adv-search8" class="btn warning padding-right-5" style="font-size: 14px;padding: 4px 12px;" aria-expanded="false">
                      <i class="fa fa-search-plus" id="searchICON1"></i><i class="fa fa-search-minus" style="display:none" id="searchICON2"></i> 
                    </div> 
				  </li> 
				  
				  <!-- 工具按钮组 tools9 -->
				  <li class="head-tools-r navbar-right" style="display:none;float:right !important;" id="tools9">
                    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail9" onclick="btnViewDetails9()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    <!-- 设置按钮，设置显示列 -->
                    <div class="viewcfg-dropdown">
                      <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                      <ul class="dropdown-menu dropdown-blue" >
                        <li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
                          <div class="pull-left">
                            <label style="margin: 0 0 0 16px;">
							  <input type="checkbox" id="checkAllTrs9" onchange="checkAllTrs9()">
							  <span class="text"></span>
							</label>
							<spring:message code="check_all"/><!-- 全选 -->
                          </div>
                          <button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="myResetTrs9()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button><!-- 重置 -->
                         </li>
                         <div id="selectItems9"></div> 
                       </ul>
                    </div>
                    <!-- 搜索按钮 -->
                    <div id="adv-search9" class="btn warning padding-right-5" style="font-size: 14px;padding: 4px 12px;" aria-expanded="false">
                      <i class="fa fa-search-plus" id="searchICON3"></i><i class="fa fa-search-minus" style="display:none" id="searchICON4"></i> 
                    </div> 
				  </li> 
				  
				      
                </ul>
                
                
                <!-- tab1标签页 -->
                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                  <div id="state_tab" class="tab-pane  in active summary-tab"> 
				  <div class="row" style="margin-top:20px">	
				  <%--	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
		                     <div class="widget radius-bordered">
		                        <div class="widget-header">
		                           <span class="widget-caption"><spring:message code="status.cdrNew.info1"/></span> 
		                        </div> 
		                        <div class="widget-body" style="padding:0 0 0 0">
		                        	 <div class="row" style="padding:0 15px;">
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo11"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info11"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo12"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info12"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
											<span class="databox-number sky" style="font-size: 24px" id="outLineInfo13"></span>
			                                <div class="databox-text darkgray"> <spring:message code="status.cdrNew.info13"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo14"></span>
			                                <div class="databox-text darkgray"> <spring:message code="status.cdrNew.info14"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo2"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrNew.info2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo4"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrNew.info4"/></div>
			                        	</div>
			                        	&lt;%&ndash;<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo6"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrNew.info6"/><span id="todayInfo6_suff"></span></div>
			                        	</div>&ndash;%&gt;
			                        	&lt;%&ndash;<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo7">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrNew.info7"/>(<spring:message code="status.cdrNew.info24"/>)</div>
			                        	</div>&ndash;%&gt;
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo2">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrNew.info2"/></div>
			                        	</div>
			                        	&lt;%&ndash;<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">&ndash;%&gt;
			                        		&lt;%&ndash;<span class="databox-number sky" style="font-size: 24px" id="monthInfo4">&nbsp;</span>&ndash;%&gt;
			                                &lt;%&ndash;<div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrNew.info4"/></div>&ndash;%&gt;
			                        	&lt;%&ndash;</div>&ndash;%&gt;
			                        	&lt;%&ndash;<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo6">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrNew.info6"/><span id="monthInfo6_suff"/></div>
			                        	</div>&ndash;%&gt;
			                        	&lt;%&ndash;<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo7"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrNew.info7"/>(<spring:message code="status.cdrNew.info24"/>)</div>
			                        	</div>&ndash;%&gt;
			                        </div>
		                        </div> 
		                     </div> 
		                 &lt;%&ndash; <div class="row">
		                          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <div class="databox databox-lg databox-inverted radius-bordered databox-shadowed databox-graded databox-vertical">
                                        <div class="databox-top bg-palegreen no-padding">
                                            <div class="horizontal-space space-lg"></div>
                                            <div class="databox-sparkline no-margin">
                                                <span id="databox_today" data-sparkline="compositebar" data-height="82px" data-width="100%"
                                                      data-barcolor="#b0dc81"
                                                      data-barwidth="9px" data-barspacing="5px" data-prefix="" data-lineprefix="" data-linesuffix=" " data-suffix=" M" 
                                                      data-fillcolor="false" data-linecolor="#fff" data-spotradius="3" data-linewidth="2"
                                                      data-spotcolor="#fafafa" data-minspotcolor="#fafafa" data-maxspotcolor="#fff"
                                                      data-highlightspotcolor="#fff" data-highlightlinecolor="#fff"
                                                      data-composite="">
                                                </span>
                                            </div>
                                        </div>
                                        &lt;%&ndash;<div class="databox-bottom no-padding">&ndash;%&gt;
                                            &lt;%&ndash;<div class="databox-row">&ndash;%&gt;
                                                &lt;%&ndash;<div class="databox-cell cell-12 text-align-left">&ndash;%&gt;
                                                    &lt;%&ndash;<span class="databox-text"><spring:message code="status.cdrNew.info16"/></span>&ndash;%&gt;
                                                &lt;%&ndash;</div>&ndash;%&gt;
                                            &lt;%&ndash;</div>&ndash;%&gt;
                                            &lt;%&ndash;<div class="databox-row">&ndash;%&gt;
                                                &lt;%&ndash;<div class="databox-cell cell-6 text-align-left">&ndash;%&gt;
                                                    &lt;%&ndash;<span class="databox-text"><spring:message code="status.cdrNew.info19"/>:&nbsp;&nbsp;<pan id="maxUserHours"/></span> </span>&ndash;%&gt;
                                                &lt;%&ndash;</div>&ndash;%&gt;
                                                &lt;%&ndash;<div class="databox-cell cell-6 text-align-right">&ndash;%&gt;
                                                    &lt;%&ndash;<span class="databox-text"><spring:message code="status.cdrNew.info20"/>:&nbsp;&nbsp;<span id="maxDataHours"></span></span>&ndash;%&gt;
                                                &lt;%&ndash;</div>&ndash;%&gt;
                                            &lt;%&ndash;</div>&ndash;%&gt;
                                        &lt;%&ndash;</div>&ndash;%&gt;
                                    </div>
                            </div>
                             <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="databox databox-lg databox-inverted radius-bordered databox-shadowed databox-graded databox-vertical" >
                                        <div class="databox-top bg-orange no-padding">
                                            <div class="databox-stat white bg-orange font-120">
                                            </div>
                                            <div class="horizontal-space space-lg"></div>
                                            <div class="databox-sparkline no-margin">
                                                <span id="databox_month" data-sparkline="compositebar" data-height="82px" data-width="100%"
                                                      data-barcolor="#fb7d64"
                                                      data-barwidth="9px" data-barspacing="5px" data-prefix="" data-lineprefix="" data-linesuffix="" data-suffix=" M" 
                                                      data-fillcolor="false" data-linecolor="#fff" data-spotradius="3" data-linewidth="2"
                                                      data-spotcolor="#fafafa" data-minspotcolor="#fafafa" data-maxspotcolor="#fff"
                                                      data-highlightspotcolor="#fff" data-highlightlinecolor="#fff"
                                                      data-composite="">
                                                    
                                                </span>
                                            </div>
                                        </div>
                                        <div class="databox-bottom no-padding">
                                            <div class="databox-row">
                                                <div class="databox-cell cell-12 text-align-left">
                                                    <span class="databox-text"><spring:message code="status.cdrNew.info17"/></span>
                                                </div>
                                            </div>
                                            <div class="databox-row">
                                                <div class="databox-cell cell-6 text-align-left">
                                                    <span class="databox-text"><spring:message code="status.cdrNew.info19"/>:&nbsp;&nbsp;<span id="maxUserMonths"></span> </span>
                                                </div>
                                                <div class="databox-cell cell-6 text-align-right">
                                                    <span class="databox-text"><spring:message code="status.cdrNew.info20"/>:&nbsp;&nbsp;<span id="maxDataMonths"></span></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <div class="databox databox-lg databox-inverted radius-bordered databox-shadowed databox-graded databox-vertical">
                                        <div class="databox-top bg-azure no-padding">
                                            <div class="databox-stat white bg-azure font-120">
                                            </div>
                                            <div class="horizontal-space space-lg"></div>
                                            <div class="databox-sparkline no-margin">
                                                <span id="databox_year"  data-sparkline="compositebar" data-height="82px" data-width="100%"
                                                      data-barcolor="#3bcbef"
                                                      data-barwidth="9px" data-barspacing="5px" data-prefix="" data-lineprefix="" data-linesuffix="" data-suffix=" M"
                                                      data-fillcolor="false" data-linecolor="#fff" data-spotradius="3" data-linewidth="2"
                                                      data-spotcolor="#fafafa" data-minspotcolor="#fafafa" data-maxspotcolor="#fff"
                                                      data-highlightspotcolor="#fff" data-highlightlinecolor="#fff"
                                                      data-composite="">
                                                     
                                                </span>
                                            </div>
                                        </div>
                                        <div class="databox-bottom no-padding">
                                            <div class="databox-row">
                                                <div class="databox-cell cell-12 text-align-left">
                                                    <span class="databox-text"><spring:message code="status.cdrNew.info18"/></span>
                                                </div>
                                            </div>
                                            <div class="databox-row">
                                                <div class="databox-cell cell-5 text-align-left">
                                                    <span class="databox-text"><spring:message code="status.cdrNew.info19"/>: &nbsp;&nbsp; <pan id="maxUserYears"/></span> </span>
                                                </div>
                                                <div class="databox-cell cell-7 text-align-right">
                                                    <span class="databox-text"><spring:message code="status.cdrNew.info20"/>:&nbsp;&nbsp;<span id="maxDataYears"></span></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>&ndash;%&gt;
                          </div>--%>
						<%--<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					        <div class="widget "> 
					        	<div class="widget-header">
			                        <span class="widget-caption"> <spring:message code="status.cdrNew.info22_1" /></span>
			                    </div> 
			                    <div class="widget-body no-padding">
			                    	 <div class="orders-container">
		                                <ul class="orders-list" id="topDiv" style="background-color: #FBFBFB">
		                                </ul>
		                            </div>
			                    </div>
		                    </div>
					    </div>--%>
                   </div>
			        <%--<div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption"><spring:message code="status.cdrTariffe.info4_1"/><spring:message code="page.home.dataTraffic"/></span>
                                </div>
                                <div class="widget-body">

                                    <div id="realtime-chart" class="chart chart-lg"></div>

                                </div>
                            </div>
                        </div>
                    </div>--%>
				  </div> 
						
                  <!-- 列表页签  tab -->
                  <div id="list" class="tab-pane" style="border-radius:0;"> 
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxUserId"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxUserId"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCDR.idxUserId.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                         <%-- <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxSupplierId"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSupplierId"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCDR.idxSupplierId.help"/>" > 
                               </div>
                             </div>           
                          </div> --%>
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxSimCardID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSimCardID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCDR.idxSimCardID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxSimPID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSimPID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCDR.idxSimPID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                           </div>
                           <div class="row ng-scope">
                           <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.beginTime"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               		<input  type="text" id="beginTime_cdr" name="beginTime"  placeholder="<spring:message code="db.tbCDR.beginTime.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',start: laydate.now(0, 'YYYY-MM-DD hh:mm:ss')})">
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.endTime"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               		<input  type="text" id="endTime_cdr" name="endTime"  placeholder="<spring:message code="db.tbCDR.endTime.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD  hh:mm:ss',start: laydate.now(0, 'YYYY-MM-DD hh:mm:ss')})">
                               </div>
                             </div>           
                          </div> 
                           <div class="col-md-6 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"></span>
                             <div class="adv-value">
                               <div class="ng-scope text-right">
                                  <button class="btn btn-success" onclick="dosearch('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                                  <button class="btn btn-darkorange" onclick="myclearSearch()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                               </div>
                             </div>           
                          </div> 
                           
                        </div> 
 
                      </div>
                    </div>

                    <!-- 列表表头 -->
                    <div id="my-data-table">
                      <div class="data-thead">
                          <table class="table table-bordered table-striped dataTable">
                            <thead class="flip-content">
                              <tr role="row" id="html_thead">
                              
                               <!-- 循环体 --> 
                               
                              </tr>
                            </thead> 
                          </table>
                      </div>
                      
                      <!-- 列表内容 -->
                      <div class="data-tbody">
                        <div>
                          <table class="table table-bordered table-hover table-striped">
                            <tbody class="page-data-tbody" id="html_tdata"> 

                              <!-- 循环体 --> 

                            </tbody>
                          </table>
                        </div>
                       </div>
                    </div>
                    
                    <!-- 分页 -->              
                    <div class="row foot-tools" id="foot_page_tools" style="height:45px;">
                      <div class="pull-right table-page-tools position-relative">
                      <div class="pagetools" id="toolsPage">
                         <!-- 分页内容 --> 
					   </div>
					   
                      
                      <select id="pagesizeSelect" onchange="changePageSize()" class="form-control">
                        <option label="25" value="25">25</option>
                        <option label="50" value="50">50</option>
                        <option label="100" value="100">100</option>
                      </select>
                      </div>  
                    </div>

                  </div>
                  
                  <!-- 状态页签  tab -->
                  <div id="list2_tab" class="tab-pane" style="border-radius:0;">
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search8">
                      <div class="panel-body">
                       
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding" ><spring:message code="db.tbCountDaily3.idxUserId"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxUserId2" style="width: 700px"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCountDaily3.idxUserId.help"/>" > 
                               </div>
                             </div>           
                          </div>
                          </div>
                          <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.beginTime"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               		<input  type="text" id="beginTime" name="beginTime"  placeholder="<spring:message code="db.tbCDR.beginTime.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.endTime"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               		<input  type="text" id="endTime" name="endTime"  placeholder="<spring:message code="db.tbCDR.endTime.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                               </div>
                             </div>           
                          </div> 
                           <div class="col-md-3 margin-bottom-3 ng-scope">
                             <span class="adv-name ng-binding"></span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               </div>
                             </div>           
                          </div>
                           <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"></span>
                             <div class="adv-value">
                               <div class="ng-scope text-right">
                                  <button class="btn btn-success" onclick="dosearch8('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                                  <button class="btn btn-darkorange" onclick="myclearSearch8()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                               </div>
                             </div>           
                          </div> 
                        </div> 
                      <!-- 搜索和清除按钮 -->
                        <!-- <div class="row">
                          <div class="col-md-12 adv-opt text-right">
                            <button class="btn btn-success" onclick="dosearch('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                            <button class="btn btn-darkorange" onclick="myclearSearch()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                          </div>
                        </div>  -->
                      </div>
                    </div>

                    <!-- 列表表头 -->
                    <div id="my-data-table8">
                      <div class="data-thead data-thead8">
                          <table class="table table-bordered table-striped dataTable">
                            <thead class="flip-content">
                              <tr role="row" id="html_thead8">
                              
                               <!-- 循环体 --> 
                               
                              </tr>
                            </thead> 
                          </table>
                      </div>
                      
                      <!-- 列表内容 -->
                      <div class="data-tbody data-tbody8">
                        <div>
                          <table class="table table-bordered table-hover table-striped">
                            <tbody class="page-data-tbody" id="html_tdata8"> 

                              <!-- 循环体 --> 

                            </tbody>
                          </table>
                        </div>
                       </div>
                    </div>
                    
                    <!-- 分页 -->              
                    <div class="row foot-tools" id="foot_page_tools8" style="height:45px;">
                      <div class="pull-right table-page-tools position-relative">
                      <div class="pagetools" id="toolsPage8">
                         <!-- 分页内容 --> 
					   </div>
					   
                      
                      <select id="pagesizeSelect8" onchange="changePageSize8()" class="form-control">
                        <option label="25" value="25">25</option>
                        <option label="50" value="50">50</option>
                        <option label="100" value="100">100</option>
                      </select>
                      </div>  
                    </div>

                  </div>
                  
                  
                  <div id="list3_tab" class="tab-pane" style="border-radius:0;">
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search9">
                      <div class="panel-body">
                       
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.UUWiFiCountDaily.idxViFiID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxViFiID_uuwifi" style="width: 700px"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.UUWiFiCountDaily.idxViFiID.help"/>" > 
                               </div>
                             </div>           
                          </div>
                          </div>
                          <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.beginTime"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               		<input  type="text" id="beginTime_uuwifi" name="beginTime"  placeholder="<spring:message code="db.tbCDR.beginTime.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.endTime"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               		<input  type="text" id="endTime_uuwifi" name="endTime"  placeholder="<spring:message code="db.tbCDR.endTime.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                               </div>
                             </div>           
                          </div> 
                           <div class="col-md-3 margin-bottom-3 ng-scope">
                             <span class="adv-name ng-binding"></span>
                             <div class="adv-value">
                               <div class="ng-scope">
                               </div>
                             </div>           
                          </div>
                           <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"></span>
                             <div class="adv-value">
                               <div class="ng-scope text-right">
                                  <button class="btn btn-success" onclick="dosearch9('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                                  <button class="btn btn-darkorange" onclick="myclearSearch9()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                               </div>
                             </div>           
                          </div> 
                        </div> 
                      <!-- 搜索和清除按钮 -->
                        <!-- <div class="row">
                          <div class="col-md-12 adv-opt text-right">
                            <button class="btn btn-success" onclick="dosearch('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                            <button class="btn btn-darkorange" onclick="myclearSearch()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                          </div>
                        </div>  -->
                      </div>
                    </div>

                    <!-- 列表表头 -->
                    <div id="my-data-table9">
                      <div class="data-thead data-thead8">
                          <table class="table table-bordered table-striped dataTable">
                            <thead class="flip-content">
                              <tr role="row" id="html_thead9">
                              
                               <!-- 循环体 --> 
                               
                              </tr>
                            </thead> 
                          </table>
                      </div>
                      
                      <!-- 列表内容 -->
                      <div class="data-tbody data-tbody8">
                        <div>
                          <table class="table table-bordered table-hover table-striped">
                            <tbody class="page-data-tbody" id="html_tdata9"> 

                              <!-- 循环体 --> 

                            </tbody>
                          </table>
                        </div>
                       </div>
                    </div>
                    
                    <!-- 分页 -->              
                    <div class="row foot-tools" id="foot_page_tools9" style="height:45px;">
                      <div class="pull-right table-page-tools position-relative">
                      <div class="pagetools" id="toolsPage9">
                         <!-- 分页内容 --> 
					   </div>
					   
                      
                      <select id="pagesizeSelect9" onchange="changePageSize9()" class="form-control">
                        <option label="25" value="25">25</option>
                        <option label="50" value="50">50</option>
                        <option label="100" value="100">100</option>
                      </select>
                      </div>  
                    </div>
                  </div>
                </div>
              </div>  
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>  


<!-- 详情层 -->
<div class="modal fade modal-primary" id="mydetailModal"  role="dialog" aria-hidden="true">
  <div class="modal-dialog" >
    <div class="modal-content">
      <!-- 窗口头 -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i><spring:message code="details"/></h4>
      </div>
      
      <div class="modal-body bg-white no-padding">  
        <div>
          <table class="table table-bordered table-striped">  
			<tbody id="html_viewDetails">

			<!-- 循环体 --> 

            </tbody> 

          </table>
        </div> 
      </div>
      <!-- 关闭按钮 -->
      <div class="modal-footer">
        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
      </div>
      
    </div>
  </div>
</div>


<!-- 编辑层 -->
<div class="modal fade modal-primary" id="myeditModal"  aria-hidden="true">
  <div class="modal-dialog" ng-class="modal-lg">
    <div class="modal-content">
      <form id="registrationForm1" class="form-horizontal ng-pristine ng-valid">
        <div class="modal-header">
          <button type="button" class="close" onclick="mycancelEdit()"><span aria-hidden="true">&times;</span></button>
          <input type="hidden" id="editAddType" value="" />
          <h4 class="modal-title" ng-class="text-success" id="editAddModel">
          
          </h4>
        </div>
        
       
          <!--上下布局样式 --> 
          <div class="ng-scope" style="margin-top:15px"> 
            
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbViFiDevice.keyDevID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="keyDevID1" name="keyDevID" placeholder="<spring:message code="db.tbViFiDevice.keyDevID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbViFiDevice.idxViFiID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="idxViFiID1" name="idxViFiID" placeholder="<spring:message code="db.tbViFiDevice.idxViFiID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbViFiDevice.pwd"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="pwd1" name="pwd" placeholder="<spring:message code="db.tbViFiDevice.pwd.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.idxDevGrpID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="idxDevGrpID" id="idxDevGrpID1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.idxDevGrpID.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.idxVNSID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="idxVNSID" id="idxVNSID1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.idxVNSID.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.devState"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="devState" id="devState1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.devState.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbViFiDevice.idxUserID"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="idxUserID1" name="idxUserID" placeholder="<spring:message code="db.tbViFiDevice.idxUserID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.idxAgentID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="idxAgentID" id="idxAgentID1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.idxAgentID.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.debugIdt"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="debugIdt" id="debugIdt1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.debugIdt.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.hardwareVer"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="hardwareVer" id="hardwareVer1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.hardwareVer.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.firmwareVer"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="firmwareVer" id="firmwareVer1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.firmwareVer.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbViFiDevice.softwareVer"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="softwareVer" id="softwareVer1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbViFiDevice.softwareVer.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
        </div>
        
        <!-- 保存和取消按钮 -->
         <div class="modal-footer ">  
          <button type="submit" class="btn btn-blue" style="background-color: #5db2ff !important"><spring:message code="save"/></button> 
          <a class="btn btn-danger" onclick="mycancelEdit()"><spring:message code="cancel"/></a>
        </div>  
        
      
      </form>
    </div>
  </div>
</div> 


<!-- 详情层  viFiDevGroup--->
<div class="modal fade modal-primary" id="mydetailModal8"  role="dialog" aria-hidden="true">
  <div class="modal-dialog" style="width: 850px">
    <div class="modal-content">
      <!-- 窗口头 -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i>&nbsp;&nbsp; <spring:message code="db.tbCountDailyTariffe.idxUserId"/>:&nbsp;<B><span id="idView8" style="color:grid;"></span></B><spring:message code="details"/></h4>
      </div>
      
      <div class="modal-body bg-white no-padding " style="margin-top: 1px;">  
         <!-- 列表内容 -->
         <div class="data-tbody data-tbody8" id="idViewDataBody" style="background-color: #f5f5f5;width: 800px;overflow: hidden;">
         <!--
           <div>
             <table class="table table-bordered table-hover table-striped" style="padding: 0 20px 0 20px;">
               <thead class="flip-content">
                 <tr >
                   <td><spring:message code="db.common.crtTm"/></td>
                   <td><spring:message code="db.tbCountDaily3.cntDataSum"/></td>
                   <td><spring:message code="db.tbCountDaily3.cost"/></td>
                 </tr>
               </thead> 
               <tbody class="page-data-tbody" id="html_viewDetails8"> 


               </tbody>
             </table>
           </div>
           --> 
          </div>
      </div>
     
                    
      <!-- 关闭按钮 -->
      <div class="modal-footer">
        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
      </div>
      
    </div>
  </div>
</div>


<!-- 编辑层  viFiDevGroup--->
<div class="modal fade modal-primary" id="myeditModal8"  aria-hidden="true">
  <div class="modal-dialog" ng-class="modal-lg">
    <div class="modal-content">
      <form id="registrationForm8" method="post" class="form-horizontal ng-pristine ng-valid">
        <div class="modal-header">
          <button type="button" class="close" onclick="mycancelEdit8()"><span aria-hidden="true">&times;</span></button>
          <input type="hidden" id="editAddType8" value="" />
          <h4 class="modal-title" ng-class="text-success" id="editAddModel8">
          
          </h4>
        </div>
        
       
          <!--上下布局样式 --> 
          <div class="ng-scope" style="margin-top:15px"> 
            
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.keyDevGrpID"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="keyDevGrpID8" disabled style="background-color: #F0F0F0 !important;" name="keyDevGrpID" placeholder="<spring:message code="db.tbViFiDevGroup.keyDevGrpID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.name"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="name8" name="name" placeholder="<spring:message code="db.tbViFiDevGroup.name.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbViFiDevGroup.productionDate"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input  type="text" id="productionDate8" name="productionDate"  placeholder="<spring:message code="db.tbViFiDevGroup.productionDate.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"> 
                  </div> 
                </div>
                </div> 
			</div> 
			
			
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.productionNo"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="productionNo8" name="productionNo" placeholder="<spring:message code="db.tbViFiDevGroup.productionNo.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.productionVer"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="productionVer8" name="productionVer" placeholder="<spring:message code="db.tbViFiDevGroup.productionVer.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.hardwareVer"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="hardwareVer8" name="hardwareVer" placeholder="<spring:message code="db.tbViFiDevGroup.hardwareVer.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.firmwareVer"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="firmwareVer8" name="firmwareVer" placeholder="<spring:message code="db.tbViFiDevGroup.firmwareVer.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.softwareVer"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="softwareVer8" name="softwareVer" placeholder="<spring:message code="db.tbViFiDevGroup.softwareVer.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbViFiDevGroup.initNumber"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="initNumber8" name="initNumber" placeholder="<spring:message code="db.tbViFiDevGroup.initNumber.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>   
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbViFiDevGroup.currentNumber"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="currentNumber8" name="currentNumber" placeholder="<spring:message code="db.tbViFiDevGroup.currentNumber.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbViFiDevGroup.normalNumber"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="normalNumber8" name="normalNumber" placeholder="<spring:message code="db.tbViFiDevGroup.normalNumber.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			<div class="form-group ng-scope" id="repairTimes8_div">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbViFiDevGroup.repairTimes"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="repairTimes8" name="repairTimes" placeholder="<spring:message code="db.tbViFiDevGroup.repairTimes.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbViFiDevGroup.remark"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="remark8" name="remark" placeholder="<spring:message code="db.tbViFiDevGroup.remark.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			  
        </div>
        
        <!-- 保存和取消按钮 -->
         <div class="modal-footer ">  
          <button type="submit" class="btn btn-blue" style="background-color: #5db2ff !important"><spring:message code="save"/></button> 
          <a class="btn btn-danger" onclick="mycancelEdit8()"><spring:message code="cancel"/></a>
        </div>  
        
      
      </form>
    </div>
  </div>
</div> 

<!-- end -->
<!-- tab4 -->
<!-- 详情层  uuwifCount--->
<div class="modal fade modal-primary" id="mydetailModal9"  role="dialog" aria-hidden="true">
  <div class="modal-dialog" style="width: 850px">
    <div class="modal-content">
      <!-- 窗口头 -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i>&nbsp;&nbsp; <spring:message code="db.UUWiFiCountDaily.idxViFiID"/>:&nbsp;<B><span id="idView9" style="color: grid;"></span></B><spring:message code="details"/></h4>
      </div>
      
      <div class="modal-body bg-white no-padding" style="margin-top: 1px;">  
         <!-- 列表内容 -->
         <div class="data-tbody data-tbody8" id="idViewDataBody9" style="background-color: #f5f5f5;overflow: hidden;width: 800px">
          <!--
           <div>
             <table class="table table-bordered table-hover table-striped" style="padding: 0 20px 0 20px;">
               <thead class="flip-content">
                 <tr >
                   <td><spring:message code="db.common.crtTm"/></td>
                   <td><spring:message code="db.tbCountDaily3.cntDataSum"/></td>
                   <td><spring:message code="db.tbCountDaily3.cost"/></td>
                   <td><spring:message code="db.tbCountDaily.deviceDur"/></td>
                 </tr>
               </thead> 
               <tbody class="page-data-tbody" id="html_viewDetails9"> 


               </tbody>
             </table>
           </div>
          </div>
           --> 
      </div>
     
                    
      <!-- 关闭按钮 -->
      <div class="modal-footer">
        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
      </div>
      
    </div>
  </div>
</div>
<!-- end -->
		<script>
			//新增设备组
			/*function addDeviceGrp(){
				showTools99("tools8","list2_tab","list","state_tab","list3_tab");
				myopenModel8('myeditModal8','new');
				hideElement();
			}
			*/
			//新增设备
			/*function addDevice(){
				showTools9('tools','tab2','list','list2_tab','state_tab');
				myopenModel('myeditModal','new');
			}*/
			function setViewTr(leftValue,rightValue){
				return "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+leftValue+": </td><td><div class=\"f-p-tips ng-binding\">"+(rightValue !=undefined ? rightValue:"")+"</div></td></tr>";
			}
			function onClickRedirectURL(){
				showTools8("tools8","list2_tab","list","state_tab");
				$("#tab1").removeClass("active");
				$("#tab2").removeClass("active");
				$("#tab3").removeClass("active");
				$("#tab3").addClass("active");
			}
			function getTimeValue(timeVal){
			     var tempVal = "";
			     if(timeVal == undefined || timeVal == null || timeVal == ""){
			    	 timeVal = 0;
			     }
			     if(timeVal >= 60){
			    	 if(timeVal >= 3600){
			    		 tempVal = (parseInt(timeVal/3600) < 10 ? ("0"+parseInt(timeVal/3600)):parseInt(timeVal/3600))+":";
			    		 if(timeVal%3600 > 0){
			    			 var t1 = timeVal%3600;
			    			 tempVal +=(parseInt(t1/60) < 10 ? ("0"+parseInt(t1/60)):parseInt(t1/60))+":";
			    			 if(t1%60 > 0){
				    			 tempVal +=(t1%60 < 10 ? ("0"+t1%60):t1%60);
				    		 }else{
				    			 tempVal +="00";
				    		 }
			    		 }else{
			    			 tempVal +="00:00";
			    		 }
			    	 }else{
			    		 tempVal = "00:"+(parseInt(timeVal/60) < 10 ? ("0"+parseInt(timeVal/60)):parseInt(timeVal/60))+":";
			    		 if(timeVal%60 > 0){
			    			 tempVal +=(timeVal%60 < 10 ? ("0"+timeVal%60):timeVal%60);
			    		 }else{
			    			 tempVal +="00";
			    		 }
			    	 }
			     }else{
			    	 tempVal = "00:00:"+(timeVal < 10 ? ("0"+timeVal):timeVal);
			     }
			     return tempVal;
			}
			function onClickRedirectURL2(){
				showTools99('tools','list','list2_tab','state_tab','list3_tab');
				$("#tab1").removeClass("active");
				$("#tab2").removeClass("active");
				$("#tab3").removeClass("active");
				$("#tab4").removeClass("active");
				$("#tab2").addClass("active");
			}
		</script>
		
		<!--  //tab viFiDevice  -->
		<script>
			
			//访问路径
			var visit_url = "/vsw/cdrNew";
			//国际化开头
			var tbI18n = "db.tbCDR.";
			//表的主键
			var tablekey = "keyCDRID";
			//获取从后台传过来的参数值
			try {
			    var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
			} catch (e) {
			    throw new Error("js视图数据,解析错误,请检测!~!");
			}
			var permi = selectPermissionsInfo.permissions;
			if (!permi || permi.length < 4) {
				selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
			}
			 //设置存在localStorage 的列表配置名
		    var itemName = "my_setTrs_cdrNew";
		    //设置初始化排序字段
		    var MY_ORDER_LIST = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems = {"resetTimes" : "5","trs": [
   		       	  {"name": "keyId","show": "true","width":"120"},
                  {"name": "idxUserId","show": "true","width":"150"},
                  {"name": "idxVifiId","show": "true","width":"150"},
                  {"name": "idxIccid","show": "true","width":"150"},
                  {"name": "idxSlotNum","show": "true","width":"80"},
                  {"name": "idxSimPDevID","show": "true","width":"80"},
                  {"name": "mac","show": "true","width":"130"},
                  {"name": "upFlow","show": "true","width":"90"},
                  {"name": "downFlow","show": "true","width":"90"},
                 /* {"name": "online","show": "true","width":"60",comType:"select"},*/
//                  {"name": "suiteRateIds","show": "false","width":"150"},
//                  {"name": "dailyRentalID","show": "true","width":"60"},
//                  {"name": "dataTraffic","show": "true","width":"90"},
                  //{"name": "uuwifiDataUp","show": "true","width":"120"},
                  //{"name": "uuwifiDataDown","show": "true","width":"120"},
//                  {"name": "uuwifiSessId","show": "true","width":"160"},
//                  {"name": "costCash","show": "true","width":"90"},
//                  {"name": "costReward","show": "true","width":"90"},
//                  {"name": "idxSupplierId","show": "true","width":"125"},
//                  {"name": "supplierDiscount","show": "true","width":"70"},
                  {"name": "idxAgentID","show": "true","width":"125"},
//                  {"name": "idxVSWID","show": "true","width":"115"},
//                  {"name": "idxSimPID","show": "true","width":"80"},
//                  {"name": "idxSimCardID","show": "true","width":"150"},
//                  {"name": "idxVAPPID","show": "false","width":"125"},
//                  {"name": "idxViFiID","show": "false","width":"170"},
//                  {"name": "countryCode","show": "false","width":"80"},
                  {"name": "crtTm","show": "true","width":"125"},
                  {"name": "crtBy","show": "true","width":"150"}]
   		    };
		    //设置重置参数
		    var resetSelectItems = selectItems;
		    
		    //列表展示数据转换
			function changeData(tdname,showLengthData,dataTdValue){ 
				var html = "";
				if(tdname=="devState"){  
					   var i18nText = $.i18n(tbI18n+"devState.comData");  
					   if(i18nText !=null){
				    	   for(var i=0; i<i18nText.length; i++){   
				    		   if(i18nText[i][0]==dataTdValue){
				    			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+i18nText[i][1]+"</div></td>"; 
								   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\"><i class=\"img-fmt uuw-vifi-sta-"+dataTdValue+"\"></i><i class=\"f-tips\">"+i18nText[i][1]+"</i></div></td>"; 
				    			   break;
				    		   } 
				  	       } 
					   }
				}else if(tdname == "dataTraffic" || tdname == "uuwifiDataUp" || tdname == "uuwifiDataDown" ){
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ (dataTdValue/1000 > 1000 ? (toDecimal(dataTdValue/1000/1000,2)+"G"):toDecimal(dataTdValue/1000,2)+"M")+"</div></td>"; 
				}else if(tdname == "costCash" || tdname == "costReward"){
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ toDecimal(dataTdValue/1000,2)+"</div></td>"; 
				}else{
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
				return html;
			}
		    
			
			/********** 详情 ：流量账单表 bit转 M************/
			 //查看详情方法
		    function viewDetails(number){  
		       var html_viewDetails = ""; 
		       
		 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"keyDevID")+": </td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].keyGlobalSIMID+"</div></td></tr>";
			   html_viewDetails += setViewTr($.i18n(tbI18n+"keyId"),mydata[number].keyId);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxUserId"),mydata[number].idxUserId);
			 /*  html_viewDetails += setViewTr($.i18n(tbI18n+"idxRateId"),mydata[number].idxRateId);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"suiteRateIds"),mydata[number].suiteRateIds);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"dailyRentalID"),mydata[number].dailyRentalID);*/
			   
			   html_viewDetails += setViewTr($.i18n(tbI18n+"dataTraffic"), toDecimal((mydata[number].upFlow+mydata[number].downFlow)/1024/1024,2));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"uuwifiDataUp"), toDecimal((mydata[number].upFlow/1024/1024),2));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"uuwifiDataDown"), toDecimal(mydata[number].downFlow/1024/1024,2));
//			   html_viewDetails += setViewTr($.i18n(tbI18n+"uuwifiSessId"),mydata[number].uuwifiSessId);
//			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxSupplierId"),mydata[number].idxSupplierId);
			   //html_viewDetails += setViewTr($.i18n(tbI18n+"idxAgentID"),mydata[number].idxAgentID);
//			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxVSWID"),mydata[number].idxVSWID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxSimPID"),mydata[number].idxSlotNum);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxSimCardID"),mydata[number].idxIccid);
//			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxViFiID"),mydata[number].idxViFiID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"ispID"),mydata[number].ispID);
			   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),mydata[number].crtTm);
			   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),mydata[number].crtBy);
		 	   $("#html_viewDetails").html(html_viewDetails);
		 	   myopenModel('mydetailModal','detail'); 
		 	  
		    }
			function getValue(selData,dataTdValue){
				var html_SelData = dataTdValue;
				   if(selData != null){
		    	     for(var i=0; i<selData.length; i++){   
		    		   if(selData[i][0]==dataTdValue){
		    			   html_SelData = selData[i][1]; 
		    			   break;
		    		   } 
		  	         } 
				   }
				return html_SelData;
			}
			/********** 详情 end************/
			
			/***********  新增  ****************/
			/***********  新增 end *************/
			
			/********** 编辑************/
			//设置编辑框的值
		    function setEditItems(){
		    }
			
		    function myclearForm(){
		    	$("#keyDevID1").val(""); 
		    	$("#keyDevID1").removeAttr("disabled");
		    	$("#idxViFiID1").val("");   
		    	$("#idxViFiID1").removeAttr("disabled");
		    	$("#pwd1").val(""); 
		    	$("#pwd1").removeAttr("disabled");
		    	$("#idxDevGrpID1").val("");   
		    	$("#idxVNSID1").val("");   
		    	$("#devState1").val("");   
		    	$("#idxUserID1").val("");  
		    	$("#idxAgentID1").val("");   
		    	$("#debugIdt1").val(""); 
		    	$("#hardwareVer1").val("");   
		    	$("#firmwareVer1").val("");   
		    	$("#softwareVer1").val("");
		    }
		  //获取编辑的内容
		    function mygetSaveData() { 
		        return "";
		    }
			/********** 编辑 end************/
			
			/***********  删除  ****************/
			/***********  删除 end *************/
			
			/********** 查询 ************/
			//设置查询区、编辑区下拉框的选项值
		    function setSearchParams(){ 
				//VNS 服务器
				/**
		    	var vnsSelData = selectPermissionsInfo.vnsSelData;  
		    	setOptionData(vnsSelData,"idxVNSID");
		    	setOptionData(vnsSelData,"idxVNSID1");
		    	//状态
		    	 var i18nTextQryType = $.i18n(tbI18n+"devState.comData");  
				    var html_qryType = "";
				    for(var i=0; i<i18nTextQryType.length; i++){ 
				    	if(i18nTextQryType[i][0] == "1"){
				    		html_qryType += "<option selected=\"selected\"  value=\""+i18nTextQryType[i][0]+"\">"+i18nTextQryType[i][1]+"</option>";
				    	}else{
				    		html_qryType += "<option  value=\""+i18nTextQryType[i][0]+"\">"+i18nTextQryType[i][1]+"</option>";
				    	} 
			  	    }
				    */
		    	$("#endTime_cdr").val(setToday(true));
		    }
			
			function setOptionData(setData,id){
				var html_setData = "";
		    	if(setData!=null){
		    	for(var i=0; i<setData.length; i++){   
		    		html_setData += "<option value=\""+setData[i][0]+"\">"+setData[i][1]+"</option>";
		  	    } 
		    	}
		    	if(html_setData!=""){ 
		    		$("#"+id).append(html_setData);
		    	}  
			}
		  	//获取查询条件
		    function mygetSearchParams() {
		        var params = '{'; 
		        
		        if($("#idxUserId").val()!="" && $("#idxUserId").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxUserId\":"+"\""+$("#idxUserId").val()+"*\",";  
		        } 
		        if($("#idxSupplierId").val()!="" && $("#idxSupplierId").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxSupplierId\":"+"\""+$("#idxSupplierId").val()+"*\",";  
		        } 
		        if($("#idxSimCardID").val()!="" && $("#idxSimCardID").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxSimCardID\":"+"\""+$("#idxSimCardID").val()+"*\",";  
		        } 
		        if($("#idxSimPID").val()!="" && $("#idxSimPID").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxSimPID\":"+"\""+$("#idxSimPID").val()+"\",";  
		        } 
		        if($("#beginTime_cdr").val()!="" && $("#beginTime_cdr").val()!=null){ 
		        	params +="\"cx_GT-|-crtTm\":"+"\""+$("#beginTime_cdr").val()+"\",";  
		        } 
		        if($("#endTime_cdr").val()!="" && $("#endTime_cdr").val()!=null){ 
		        	params +="\"cx_LT-|-crtTm\":"+"\""+$("#endTime_cdr").val()+"\",";  
		        } 
		        
		        //获取排序条件参数
		        if(MY_ORDER_LIST.length>0){  
		        	var html="[";
		        	for(var i=0;i<MY_ORDER_LIST.length;i++){
		        		var html_str="[";
		        		if(i!=MY_ORDER_LIST.length-1){
		        		    html_str += "\'"+MY_ORDER_LIST[i][0]+"\',"+MY_ORDER_LIST[i][1]+"]";
		        		    html += html_str +",";
		        		}else{
		        			html_str+="\'"+MY_ORDER_LIST[i][0]+"\',"+MY_ORDER_LIST[i][1]+"]"; 
		        			html += html_str +"]";
		        		}  
		        	} 
		        	params += "'cx_ORDER_LIST':\""+ html +"\",";  
		        }  
		        
		        if(params!='{'){  
		        	params = params.substr(0,params.length-1);
		        } 
		        params+='}';  
		        var params = eval('(' + params + ')');    
		        return params;
		    }
		  	//清空搜索条件表单
			function myclearSearchItems(){
				$("#idxUserId").val("");  
				$("#idxSupplierId").val("");  
				$("#idxSimCardID").val("");  
				$("#idxSimPID").val("");  
				$("#beginTime_cdr").val("");  
				$("#endTime_cdr").val(setToday(true));
			}
			/********** 查询  end************/
			
		</script>
		
		
		<!-- // tab 用户用量  -->
		<script>
			
			//国际化开头
		    var tbI18n8 = "db.tbCountDaily3.";
		    //表的主键
		    var tablekey8 = "keyCDID";  
		    
		    //设置存在localStorage 的列表配置名
		    var itemName8 = "my_setTrs_countDaily";
		    //设置初始化排序字段
		    var MY_ORDER_LIST8 = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems8 = {"resetTimes" : "7","trs": [
				       {"name": "idxUserId","show": "true","width":"190"},
				       {"name": "lastUpFlow","show": "true","width":"190"},
                       {"name": "lastDownFlow","show": "true","width":"190"},
                       {"name": "upFlow","show": "true","width":"190"},
//				       {"name": "cost","show": "true","width":"190"},
				       {"name": "crtTm","show": "true","width":"500"},
		              ]
				    };
		    //设置重置参数
		    var resetSelectItems8 = selectItems8;
		    //设置查询区、编辑区下拉框的选项值
		    function setSearchParams8(){   
		    	$("#endTime").val(setToday(false));
		    }
		    //列表展示数据转换
			function changeData8(tdname,showLengthData,dataTdValue){
				var html = "";
		    	if(tdname == "cntDataSum"){
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ (dataTdValue/1000 > 1000 ? (toDecimal(dataTdValue/1000/1000,2)+"G"):toDecimal(dataTdValue/1000,2)+"M")+"</div></td>"; 
				}else if(tdname == "cost"){
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ toDecimal(dataTdValue/1000,2)+"</div></td>"; 
				}else if(tdname == "crtTm"){
					 html += "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;padding-left:2px\">";
					 if(($("#beginTime").val()!="" && $("#beginTime").val()!=null) || ($("#endTime").val()!="" && $("#endTime").val()!=null) ){ 
						 if($("#beginTime").val()!="" && $("#beginTime").val()!=null){
							html += $("#beginTime").val().substring($("#beginTime").val().indexOf("-")+1);
						 }else{
							 html +="  ... ";
						 }
						 html +="  ~  ";
						 if($("#endTime").val()!="" && $("#endTime").val()!=null){
							 html += $("#endTime").val().substring($("#endTime").val().indexOf("-")+1);
						 }else{
							 html += dataTdValue.substring(dataTdValue.indexOf("-")+1);
						 }
					 }else{
						 html += dataTdValue.substring(dataTdValue.indexOf("-")+1)+" ~ " +dataTdValue.substring(dataTdValue.indexOf("-")+1);
					 }
					html += "</div></td>"; 
				}else{	
		    		html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
		    	return html;
			}
		    
			/********** 详情 ************/
			 //查看详情方法html_viewDetails8
		    function viewDetails8(number){  
		    	var idxUserId = mydata8[number].idxUserId;
		    	 var sqlWhere = "";
		         if($("#beginTime").val()!="" && $("#beginTime").val()!=null){ 
		        	sqlWhere +="&beginTime="+encodeURIComponent($("#beginTime").val() ==null ? "":$("#beginTime").val());
		         } 
		         if($("#endTime").val()!="" && $("#endTime").val()!=null){ 
		        	sqlWhere +="&endTime="+ encodeURIComponent($("#endTime").val() ==null ? "":$("#endTime").val());
		        } 
				$.ajax({
		       	    url:window.PATH + visit_url +"/list.ajax2?idxUserId="+idxUserId+sqlWhere,    //请求的url地址 
		       	    data:{},    //参数值
		       	    type:"post",   //请求方式   
		       	    dataType: "json",
		       	    success:function(req){  
		       	    	var datas = req.data;  
		       	    	var chartView = echarts.init(document.getElementById('idViewDataBody'));
		       	    	myopenModel8('mydetailModal8','detail'); 
		       	        $("#idViewDataBody").css("max-height","650px");
		       	    	chartView.setOption(getViewDetailOptions(datas[0],datas[1]));
		       	        $("#idViewDataBody").find("div").css("height","100%");
		       	        $("#idViewDataBody").find("canvas").css("height","100%");
		       	     	$("#idView8").html(idxUserId+"  "); 
		       	    	//window.onresize= function(){
		       	    	//	chartView.resize();
		       	    	//}
		       	        //请求成功时处理
		       	    }, 
		       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
		       	    	//alert(exception);
		           }
		       	}); 
		    }
		    function getViewDetailOptions(xAxisVal,series1){
				var option = {
					    grid: {
					        bottom: 80,
					        width: 700
					    },
					    tooltip : {
					        trigger: 'axis',
					        formatter: function (params,ticket,callback) {
		        	            var res = params[0].name;
		        	            if(params[0].value !=undefined){
//	        	            		res += '<br/>'+$.i18n("status.cdrNew.info20")+': ' + (params[0].value > 1000 ? (toDecimal(params[0].value/1000,2)+"G"):toDecimal(params[0].value,2)+"M");
                                    res += '<br/>'+$.i18n("status.cdrNew.info20")+': ' + (params[0].value/1024/1024 > 1024 ? (toDecimal(params[0].value/1024/1024/1024,2)+"G"):toDecimal(params[0].value/1024/1024,2)+"M");
		        	            }
		        	            return res;
		        	        },
					        axisPointer: {
					            animation: false
					        }
					    },
					    legend: {
					        data:[],
					        x: 'left'
					    },
					    dataZoom: [
					        {
					            show: true,
					            realtime: true,
					            start: 0,
					            end: 100
					        },
					        {
					            type: 'inside',
					            realtime: true,
					            start: 0,
					            end: 100
					        }
					    ],
					    xAxis : [
					        {
					            type : 'category',
					            boundaryGap : false,
					            axisLine: {onZero: false},
					            data : xAxisVal.map(function (str) {
					                return str.replace(' ', '\n')
					            })
					        }
					    ],
					    yAxis: [
					        {
					            type: 'value',
					            axisLabel: {
					                formatter: function (val) {
					                    return val/1000000 + 'M';
					                }
					            },
					        }
					    ],
					    series: [
					        {
					            name:$.i18n("status.cdrNew.info20"),
					            type:'line',
					            hoverAnimation: false,
					            areaStyle: {
					                normal: {}
					            },
					            lineStyle: {
					                normal: {
					                    width: 1
					                }
					            },
					            data:series1
					        }
					       
					    ]
					};
					return option;
				}
		  //列表展示数据转换
			function changeViewDetails8(dataTdValue){
	    		var html = "<td>"+dataTdValue+"</td>"; 
		    	return html;
			}
			function getValue(selData,dataTdValue){
				var html_SelData = dataTdValue;
				   if(selData != null){
		    	     for(var i=0; i<selData.length; i++){   
		    		   if(selData[i][0]==dataTdValue){
		    			   html_SelData = selData[i][1]; 
		    			   break;
		    		   } 
		  	         } 
				   }
				return html_SelData;
			}
			/********** 详情 end************/
			
		    /***********  新增  ****************/
			/***********  新增 end *************/
			
			/********** 编辑************/
			//设置编辑框的值
		    function setEditItems8(){
			 
		    }
			/**
				idSuffix:id后缀
				idPrefix：id后缀
			*/
			function setEditValue(arr,mydataName,disVal,idSuffix,idPrefix){
				if(idPrefix == undefined || idPrefix == null){
					idPrefix = "";
				}
				if(idSuffix == undefined || idSuffix == null){
					idSuffix = "";
				}
				if(mydataName !=null){
					var idName = idPrefix + mydataName + idSuffix;
					$("#"+idName).val(eval(("mydata8["+arr+"]."+mydataName)));  
					if(disVal){
			    		$("#"+idName).attr("disabled","disabled");
					}
				}
			}
		    function myclearForm8(){
		    	 
		    }
		   function hideElement(){
			   $("#repairTimes8_div").hide();
		    }
		  //获取编辑的内容
		    function mygetSaveData8() { 
		        return "";
		    }
			/********** 编辑 end************/
			
			/***********  删除  ****************/
			/***********  删除 end *************/
			
			/********** 查询 ************/
		    
		  	//获取查询条件
		    function dosearch8(page) {
		        var params = '{'; 
		        var sqlWhere = "";
		        if($("#idxUserId2").val()!="" && $("#idxUserId2").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxUserId\":"+"\""+$("#idxUserId2").val()+"\",";  
		        	sqlWhere +="&idxUserId="+encodeURI($("#idxUserId2").val() ==null ? "":$("#idxUserId2").val().replace(/，/g,","));
		        } 
		        if($("#beginTime").val()!="" && $("#beginTime").val()!=null){ 
		        	//params +="\"cx_GE-|-crtTm\":"+"\""+$("#beginTime").val()+"\",";  
		        	sqlWhere +="&beginTime="+encodeURIComponent($("#beginTime").val() ==null ? "":$("#beginTime").val());
		        } 
		        if($("#endTime").val()!="" && $("#endTime").val()!=null){ 
		        	//params +="\"cx_LE-|-crtTm\":"+"\""+$("#endTime").val()+"\",";  
		        	sqlWhere +="&endTime="+ encodeURIComponent($("#endTime").val() ==null ? "":$("#endTime").val());
		        } 
		        //获取排序条件参数
		        if(MY_ORDER_LIST8.length>0){  
		        	var html="[";
		        	for(var i=0;i<MY_ORDER_LIST8.length;i++){
		        		var html_str="[";
		        		if(i!=MY_ORDER_LIST8.length-1){
		        		    html_str += "\'"+MY_ORDER_LIST8[i][0]+"\',"+MY_ORDER_LIST8[i][1]+"]";
		        		    html += html_str +",";
		        		}else{
		        			html_str+="\'"+MY_ORDER_LIST8[i][0]+"\',"+MY_ORDER_LIST8[i][1]+"]"; 
		        			html += html_str +"]";
		        		}  
		        	} 
		        	params += "'cx_ORDER_LIST':\""+ html +"\",";  
		        }  
		        
		        if(params!='{'){  
		        	params = params.substr(0,params.length-1);
		        } 
		        params+='}';  
		        params = eval('(' + params + ')');    
		        var storage = window.localStorage; 
		   	    var PAGE_SIZE_LS_KEY = "config.table.pageSize";
		   	    var pageSize = storage.getItem(PAGE_SIZE_LS_KEY);
		   	    if(pageSize==null||pageSize==""){
		   		    pageSize="25";
		   	    }  
		        $.ajax({
		       	    url:window.PATH + visit_url +"/list.ajax1?pageSize="+pageSize+"&page="+page+sqlWhere,    //请求的url地址 
		       	    data:params,    //参数值
		       	    type:"post",   //请求方式   
		       	    dataType: "json",
		       	    success:function(req){  
		       	    	var newresult = req.data;  
		       	    	mydata8 = newresult.contentList;  
		       	    	showData8();
		       	    	var pageInfo = doPagination8(newresult, 'mychangePage8');
		       	    	var $tablePage = $("#toolsPage8"); 
		       	    	if( mydata8 !=null && mydata8 !=undefined && mydata8.length==0){  
		       	    		$("#foot_page_tools8").hide();
		       	    	}else{
		       	    		$("#foot_page_tools8").show();
		       	    	}
		       	    	$tablePage.html(pageInfo);
		       	    	disabledDAD8(); 
		       	    	
		       	        //请求成功时处理
		       	    }, 
		       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
		       	    	//alert(exception);
		           }
		       	}); 
		    }
		  	//清空搜索条件表单
			function myclearSearchItems8(){
				$("#idxUserId2").val("");  
		    	$("#beginTime").val("");   
		    	$("#endTime").val(setToday(false));
			}
			/********** 查询  end************/
			
		</script>
		
		
		<!-- // tab4 uuwifiCount -->
		<script>
			
			//国际化开头
		    var tbI18n9 = "db.UUWiFiCountDaily.";
		    //表的主键
		    var tablekey9 = "keyUUWiFiCDID";  
		    
		    //设置存在localStorage 的列表配置名
		    var itemName9 = "my_setTrs_UUWiFiCountDaily";
		    //设置初始化排序字段
		    var MY_ORDER_LIST9 = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems9 = {"resetTimes" : "2","trs": [
				       {"name": "idxViFiID","show": "true","width":"190"},
				       {"name": "aliasName","show": "true","width":"100"},
				       {"name": "cntDataSum","show": "true","width":"190"},
				       {"name": "cost","show": "true","width":"190"},
				       {"name": "deviceDur","show": "true","width":"190"},
				       {"name": "crtTm","show": "true","width":"350"},
		               //{"name": "crtBy","show": "true","width":"90"}
		              ]
				    };
		    //设置重置参数
		    var resetSelectItems9 = selectItems9;
		    //设置查询区、编辑区下拉框的选项值
		    function setSearchParams9(){   
		    	$("#endTime_uuwifi").val(setToday(false));
		    }
		    //列表展示数据转换
			function changeData9(tdname,showLengthData,dataTdValue){
				var html = "";
		    	if(tdname == "cntDataSum"){
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ (dataTdValue/1000 > 1000 ? (toDecimal(dataTdValue/1000/1000,2)+"G"):toDecimal(dataTdValue/1000,2)+"M")+"</div></td>"; 
				}else if(tdname == "cost"){
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ toDecimal(dataTdValue/1000,2)+"</div></td>"; 
				}else if(tdname == "deviceDur"){
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+ getTimeValue(dataTdValue)+"</div></td>"; 
				}else if(tdname == "crtTm"){
					 html += "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;padding-left:2px\">";
					 if(($("#beginTime_uuwifi").val()!="" && $("#beginTime_uuwifi").val()!=null) || ($("#endTime_uuwifi").val()!="" && $("#endTime_uuwifi").val()!=null) ){ 
						 if($("#beginTime_uuwifi").val()!="" && $("#beginTime_uuwifi").val()!=null){
							html += $("#beginTime_uuwifi").val().substring($("#beginTime_uuwifi").val().indexOf("-")+1);
						 }else{
							 html +="  ... ";
						 }
						 html +="  ~  ";
						 if($("#endTime_uuwifi").val()!="" && $("#endTime_uuwifi").val()!=null){
							 html += $("#endTime_uuwifi").val().substring($("#endTime_uuwifi").val().indexOf("-")+1);
						 }else{
							 html += dataTdValue.substring(dataTdValue.indexOf("-")+1);
						 }
					 }else{
						 html +=dataTdValue.substring(dataTdValue.indexOf("-")+1)+" ~ " +dataTdValue.substring(dataTdValue.indexOf("-")+1);
					 }
					html += "</div></td>"; 
				}else{	
		    		html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
		    	return html;
			}
		    
			/********** 详情 ************/
			 //查看详情方法html_viewDetails9
		    function viewDetails9(number){  
		    	var idxViFiID = mydata9[number].idxViFiID;
		    	 var sqlWhere = "";
		         if($("#beginTime_uuwifi").val()!="" && $("#beginTime_uuwifi").val()!=null){ 
		        	sqlWhere +="&beginTime="+encodeURIComponent($("#beginTime_uuwifi").val() ==null ? "":$("#beginTime_uuwifi").val());
		         } 
		         if($("#endTime_uuwifi").val()!="" && $("#endTime_uuwifi").val()!=null){ 
		        	sqlWhere +="&endTime="+ encodeURIComponent($("#endTime_uuwifi").val() ==null ? "":$("#endTime_uuwifi").val());
		        } 
				$.ajax({
		       	    url:window.PATH + visit_url +"/list.ajax4?idxViFiID="+idxViFiID+sqlWhere,    //请求的url地址 
		       	    data:{},    //参数值
		       	    type:"post",   //请求方式   
		       	    dataType: "json",
		       	    success:function(req){  
		       	    	var datas = req.data;  
		       	    	var chartView = echarts.init(document.getElementById('idViewDataBody9'));
		       	    	myopenModel9('mydetailModal9','detail'); 
		       	        $("#idViewDataBody9").css("max-height","650px");
		       	    	chartView.setOption(getViewDetailOptions(datas[0],datas[1]));
		       	        $("#idViewDataBody9").find("div").css("height","100%");
		       	        $("#idViewDataBody9").find("canvas").css("height","100%");
		       	     	$("#idView9").html(idxViFiID+"  "); 
		       	        //请求成功时处理
		       	    }, 
		       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
		       	    	//alert(exception);
		           }
		       	}); 
		    }
		  //列表展示数据转换
			function changeViewDetails9(dataTdValue){
	    		var html = "<td>"+dataTdValue+"</td>"; 
		    	return html;
			}
			function getValue(selData,dataTdValue){
				var html_SelData = dataTdValue;
				   if(selData != null){
		    	     for(var i=0; i<selData.length; i++){   
		    		   if(selData[i][0]==dataTdValue){
		    			   html_SelData = selData[i][1]; 
		    			   break;
		    		   } 
		  	         } 
				   }
				return html_SelData;
			}
			/********** 详情 end************/
			
		    /***********  新增  ****************/
			/***********  新增 end *************/
			
			/********** 编辑************/
			//设置编辑框的值
		    function setEditItems9(){
			 
		    }
			/**
				idSuffix:id后缀
				idPrefix：id后缀
			*/
			function setEditValue(arr,mydataName,disVal,idSuffix,idPrefix){
				if(idPrefix == undefined || idPrefix == null){
					idPrefix = "";
				}
				if(idSuffix == undefined || idSuffix == null){
					idSuffix = "";
				}
				if(mydataName !=null){
					var idName = idPrefix + mydataName + idSuffix;
					$("#"+idName).val(eval(("mydata9["+arr+"]."+mydataName)));  
					if(disVal){
			    		$("#"+idName).attr("disabled","disabled");
					}
				}
			}
		    function myclearForm9(){
		    	 
		    }
		    
		  //获取编辑的内容
		    function mygetSaveData9() { 
		        return "";
		    }
			/********** 编辑 end************/
			
			/***********  删除  ****************/
			/***********  删除 end *************/
			
			/********** 查询 ************/
		    
		  	//获取查询条件
		    function dosearch9(page) {
		        var params = '{'; 
		        var sqlWhere = "";
		        if($("#idxViFiID_uuwifi").val()!="" && $("#idxViFiID_uuwifi").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxViFiID\":"+"\""+$("#idxViFiID_uuwifi").val()+"\",";  
		        	sqlWhere +="&idxViFiID="+encodeURI($("#idxViFiID_uuwifi").val() ==null ? "":$("#idxViFiID_uuwifi").val().replace(/，/g,","));
		        } 
		        if($("#beginTime_uuwifi").val()!="" && $("#beginTime_uuwifi").val()!=null){ 
		        	//params +="\"cx_GE-|-crtTm\":"+"\""+$("#beginTime").val()+"\",";  
		        	sqlWhere +="&beginTime="+encodeURIComponent($("#beginTime_uuwifi").val() ==null ? "":$("#beginTime_uuwifi").val());
		        } 
		        if($("#endTime_uuwifi").val()!="" && $("#endTime_uuwifi").val()!=null){ 
		        	//params +="\"cx_LE-|-crtTm\":"+"\""+$("#endTime").val()+"\",";  
		        	sqlWhere +="&endTime="+ encodeURIComponent($("#endTime_uuwifi").val() ==null ? "":$("#endTime_uuwifi").val());
		        } 
		        //获取排序条件参数
		        if(MY_ORDER_LIST9.length>0){  
		        	var html="[";
		        	for(var i=0;i<MY_ORDER_LIST9.length;i++){
		        		var html_str="[";
		        		if(i!=MY_ORDER_LIST9.length-1){
		        		    html_str += "\'"+MY_ORDER_LIST9[i][0]+"\',"+MY_ORDER_LIST9[i][1]+"]";
		        		    html += html_str +",";
		        		}else{
		        			html_str+="\'"+MY_ORDER_LIST9[i][0]+"\',"+MY_ORDER_LIST9[i][1]+"]"; 
		        			html += html_str +"]";
		        		}  
		        	} 
		        	params += "'cx_ORDER_LIST':\""+ html +"\",";  
		        }  
		        
		        if(params!='{'){  
		        	params = params.substr(0,params.length-1);
		        } 
		        params+='}';  
		        params = eval('(' + params + ')');    
		        var storage = window.localStorage; 
		   	    var PAGE_SIZE_LS_KEY = "config.table.pageSize";
		   	    var pageSize = storage.getItem(PAGE_SIZE_LS_KEY);
		   	    if(pageSize==null||pageSize==""){
		   		    pageSize="25";
		   	    }  
		      /*  $.ajax({
		       	    url:window.PATH + visit_url +"/list.ajax3?pageSize="+pageSize+"&page="+page+sqlWhere,    //请求的url地址 
		       	    data:params,    //参数值
		       	    type:"post",   //请求方式   
		       	    dataType: "json",
		       	    success:function(req){  
		       	    	var newresult = req.data;  
		       	    	mydata9 = newresult.contentList;  
		       	    	showData9();
		       	    	var pageInfo = doPagination9(newresult, 'mychangePage9');
		       	    	var $tablePage = $("#toolsPage9"); 
		       	    	if( mydata9 !=null && mydata9 !=undefined && mydata9.length==0){  
		       	    		$("#foot_page_tools9").hide();
		       	    	}else{
		       	    		$("#foot_page_tools9").show();
		       	    	}
		       	    	$tablePage.html(pageInfo);
		       	    	disabledDAD9(); 
		       	    	
		       	        //请求成功时处理
		       	    }, 
		       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
		       	    	//alert(exception);
		           }
		       	}); */
		    }
		  	//清空搜索条件表单
			function myclearSearchItems9(){
				$("#idxViFiID_uuwifi").val("");  
		    	$("#beginTime_uuwifi").val("");   
		    	$("#endTime_uuwifi").val(setToday(false));
			}
			/********** 查询  end************/
			
		</script>
		
		
		<script>
			//统计信息
			function selectCount(){
				$.ajax({
			   	    url:window.PATH + visit_url +"/selectCount.ajax",    //请求的url地址
			   	    dataType:"json",   //返回格式为json
			   	    async:true,//请求是否异步，默认为异步，这也是ajax重要特性
			   	    data:{},    //参数值
			   	    type:"POST",   //请求方式 
			   	    success:function(res){ 
			   	    	var data = res.data; 
			   	    	$("#countViFiDev").html(data[0].countViFiDev);
			   	    	$("#countViFiDevGrp").html(data[0].countViFiDevGrp);
			   	    	$("#countStatus0").html(data[0].countStatus0);
			   	    	$("#countStatus1").html(data[0].countStatus1);
			   	    	$("#countStatus2").html(data[0].countStatus2);
			   	    	$("#countStatus3").html(data[0].countStatus3);
			   	    	$("#countStatus4").html(data[0].countStatus4);
			   	    	$("#countStatus").html(data[0].countStatus0+','+data[0].countStatus1+','+data[0].countStatus2+','+data[0].countStatus3+','+data[0].countStatus4);
			   	    	InitiateSparklineCharts.init();
			   	        //请求成功时处理
			   	    }, 
			   	    error:function(){  
			   	        //请求出错处理
			   	    }
			    });
			}
		    $(function(){      
		        //统计
		    	//selectCount();
		        
		    	//根据权限设置 增删改查按钮的显示
		        setpermsion();  
		        setpermsion8();
		        setpermsion9();
		    	
		    	//初始化编辑框验证表单
		        var validator_language = window.LANGUAGE;
		        if(window.LANGUAGE != "zh_CN"){
		        	validator_language = "en_US";
		        }
		        
		        
		    	mydelayedInit();  //初始化窗口
		    	setSelectPageSize(); //设置分页数量下拉框的值 
		　      setSearchParams(); //设置查询条件中、编辑区域 下拉框的选项值
				setTrs(selectItems); //初始化要显示的列 
				dosearch('1'); //查询列表 
				
		        
				mydelayedInit8();  //初始化窗口
		    	setSelectPageSize8(); //设置分页数量下拉框的值 
		　                setSearchParams8(); //设置查询条件中、编辑区域 下拉框的选项值
				setTrs8(selectItems8); //初始化要显示的列 
				dosearch8('1'); //查询列表  
				
				
				mydelayedInit9();  //初始化窗口
		    	setSelectPageSize9(); //设置分页数量下拉框的值 
		    	setSearchParams9(); //设置查询条件中、编辑区域 下拉框的选项值
				setTrs9(selectItems9); //初始化要显示的列 
				dosearch9('1'); //查询列表  
				//设置其它标签页的高度
				var winHeight = document.documentElement.clientHeight;
				$("#list").css("height", winHeight-170);

                /* "","state_tab","list","list2_tab","list3_tab */
				showTools99('tools','list','list2_tab','state_tab','list3_tab');
		    }); 
		</script>
		<script>
	        
	        //概要信息赋值
	        var onlineInfo = selectPermissionsInfo.onlineInfo;
	        $("#outLineInfo11").html(onlineInfo.countUser);
	        $("#outLineInfo13").html(onlineInfo.countOnLineUser);
	        $("#outLineInfo12").html(onlineInfo.countDevice);
	        $("#outLineInfo14").html(onlineInfo.countOnLineDevice);
	        /////今日
	        var info = selectPermissionsInfo.info;
	        $("#todayInfo2").html(info.countUser);
	        $("#todayInfo4").html(info.countDevice);
	        if(info.cntDataSum/1000 > 1000){
		        $("#todayInfo6").html(toDecimal(info.cntDataSum/1000/1000,2));
		        $("#todayInfo6_suff").html("(G)");
	        }else{
		        $("#todayInfo6").html(toDecimal(info.cntDataSum/1000,2));
		        $("#todayInfo6_suff").html("(M)");
	        }
	        $("#todayInfo7").html(toDecimal(info.cost/1000,2) );
	        ////本月
	        var infoMon = selectPermissionsInfo.infoMon; 
	        $("#monthInfo2").html(infoMon.countUser);
	        $("#monthInfo4").html(infoMon.countDevice);
	        if(infoMon.cntDataSum/1000 > 1000){
		        $("#monthInfo6").html(toDecimal(infoMon.cntDataSum/1000/1000,2));
		        $("#monthInfo6_suff").html("(G)");
	        }else{
		        $("#monthInfo6").html(toDecimal(infoMon.cntDataSum/1000,2));
		        $("#monthInfo6_suff").html("(M)");
	        }
	        $("#monthInfo7").html(toDecimal(infoMon.cost/1000,2) );
	        
	        //概要end
	        function setTopDiv(tops,flag){
	        	var topDivHtml = "";
		        for(var i = 0; i<tops.length; i++){
		        	topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px;font-size:13px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
		        	topDivHtml +=tops[i].idxUserId+"</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
		        	if(flag){
		        		if(tops[i].cntDataSum/1000 > 1000){
		  	        	  topDivHtml += toDecimal(tops[i].cntDataSum/1000/1000,2) +"G";
		  	        	}else{
		  	        	   if(tops[i].cntDataSum/1000 > 1){
		  		        	   topDivHtml += toDecimal(tops[i].cntDataSum/1000,2) +"M";
		  	        	   }else{
		  		        	   topDivHtml += tops[i].cntDataSum/1000 +"M";
		  	        	   }
		  	        	}
		        		topDivHtml +="</span><span class=\"price\">";
		        	}else{
			        	topDivHtml += getTimeValue(tops[i].durM)+"</span><span class=\"price\">";
		        	}
		        	topDivHtml +="</span></div></div></div></li>";
		        	//topDivHtml += "<tr style=\"height: 34px\"><td style=\"padding-left:9px;width: 10%\"><B>"+((i+1) !=10 ? "&nbsp;":"")+(i+1)+".</B></td>";
		        	//topDivHtml += "<td style=\"width: 62%;text-align: left;padding-left:5px;\">"+tops[i].idxUserId+"</td><td style=\"text-align: right;padding-right:15px\">"+toDecimal( tops[i].cost/1000,2)+" 元 </td></tr>";
		        	
		        }
		        for ( var i = tops.length; i < 10; i++) {
		        	//topDivHtml += "<tr style=\"height: 34px\"><td style=\"padding-left:9px;width: 10%\"><B>"+((i+1) !=10 ? "&nbsp;":"")+(i+1)+".</B></td><td></td><td></td></tr>";
		        	topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
		        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
		        	topDivHtml +="</span><span class=\"price\"></span></div></div></div></li>";
		        }
		        topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
	        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
	        	topDivHtml +="</span><span class=\"price\"><button class=\"btn btn-palegreen btn-sm pull-right\" onclick=\"onClickRedirectURL2()\" >"+$.i18n("status.cdrNew.info29")+"</button></span></div></div></div></li>";
		        return topDivHtml;
	        }
	        //top排行榜
	        var tops = selectPermissionsInfo.tops;
	        $("#topDiv").html(setTopDiv(tops,true));
	        
	        //柱图赋值
	        //图1
	        var hours = selectPermissionsInfo.hours;
	        var hoursData = "";
	        var hoursVal = "";
	        for(var i = 0; i<hours.length; i++){
	        	hoursVal += toDecimal(hours[i].cntDataSum/1000,2)+",";
	        	hoursData +=hours[i].countUser+",";
	        }
	        if(hoursVal.lastIndexOf(",") !=-1){
	        	hoursVal = hoursVal.substring(0,hoursVal.length-1);
	        }
	        if(hoursData.lastIndexOf(",") !=-1){
	        	hoursData = hoursData.substring(0,hoursData.length-1);
	        }
	        $("#databox_today").attr("data-prefix",$.i18n("status.cdrNew.info20")+":");
	        $("#databox_today").attr("data-lineprefix",$.i18n("status.cdrNew.info19")+":");
	        $("#databox_today").attr("data-linesuffix"," "+$.i18n("status.cdrNew.info3"));
	        $("#databox_today").html(hoursVal);
	        $("#databox_today").attr("data-composite",hoursData);
	        $("#maxUserHours").html(selectPermissionsInfo.maxUserHours);
	        if(selectPermissionsInfo.maxDataHours/1000 > 1000){
		        $("#maxDataHours").html(toDecimal(selectPermissionsInfo.maxDataHours/1000/1000,2)+" G");
	        }else{
		        $("#maxDataHours").html(toDecimal(selectPermissionsInfo.maxDataHours/1000,2)+" M");
	        }
	        
	        $("#maxUserMonths").html(selectPermissionsInfo.maxUserMonths);
	        if(selectPermissionsInfo.maxDataMonths/1000 > 0){
		        $("#maxDataMonths").html(toDecimal(selectPermissionsInfo.maxDataMonths/1000/1000,2)+" G");
	        }else{
		        $("#maxDataMonths").html(toDecimal(selectPermissionsInfo.maxDataMonths/1000,2)+"M");
	        }
	        $("#maxUserYears").html(selectPermissionsInfo.maxUserYears);
	        var maxDataYearsVal = selectPermissionsInfo.maxDataYears;
	        if(maxDataYearsVal/1000 > 1000){
		        $("#maxDataYears").html(toDecimal(maxDataYearsVal/1000/1000,2) +"G");
        	}else{
	        $("#maxDataYears").html(toDecimal(maxDataYearsVal/1000,2)+"M");
        	}
	        //////////图2
	        var months = selectPermissionsInfo.months;
	        var monthsData = "";
	        var monthsVal = "";
	        for(var i = 0; i<months.length; i++){
	        	monthsVal += toDecimal(months[i].cntDataSum/1000,2)+",";
	        	monthsData +=months[i].countUser+",";
	        }
	        if(monthsVal.lastIndexOf(",") !=-1){
	        	monthsVal = monthsVal.substring(0,monthsVal.length-1);
	        }
	        if(monthsData.lastIndexOf(",") !=-1){
	        	monthsData = monthsData.substring(0,monthsData.length-1);
	        }
	        $("#databox_month").attr("data-prefix",$.i18n("status.cdrNew.info20")+":");
	        $("#databox_month").attr("data-lineprefix",$.i18n("status.cdrNew.info19")+":");
	        $("#databox_month").attr("data-linesuffix"," "+$.i18n("status.cdrNew.info3"));
	        $("#databox_month").html(monthsVal);
	        $("#databox_month").attr("data-composite",monthsData);
	        ///////图3
	        var years = selectPermissionsInfo.years;
	        var yearsData = "";
	        var yearsVal = "";
	        for(var i = 0; i<years.length; i++){
	        	yearsVal += toDecimal(years[i].cntDataSum/1000,2)+",";
	        	yearsData +=years[i].countUser+",";
	        }
	        if(yearsVal.lastIndexOf(",") !=-1){
	        	yearsVal = yearsVal.substring(0,yearsVal.length-1);
	        }
	        if(yearsData.lastIndexOf(",") !=-1){
	        	yearsData = yearsData.substring(0,yearsData.length-1);
	        }
	        $("#databox_year").attr("data-prefix",$.i18n("status.cdrNew.info20")+":");
	        $("#databox_year").attr("data-lineprefix",$.i18n("status.cdrNew.info19")+":");
	        $("#databox_year").attr("data-linesuffix"," "+$.i18n("status.cdrNew.info3"));
	        $("#databox_year").html(yearsVal);
	        $("#databox_year").attr("data-composite",yearsData);
	        //end
	         
	        InitiateSparklineCharts.init();
	        /////////new
			var dataCharts = selectPermissionsInfo.realtimeData[1],
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
            var maxVal=parseInt(selectPermissionsInfo.realtimeData[2])+100;
          /*  var plot = $.plot("#realtime-chart", [getData2()], {
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
                    data: selectPermissionsInfo.realtimeData[0]
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
*/
//            function update() {
//            	$.ajax({
//                    url: window.PATH + visit_url + "/realTime.ajax", //请求的url地址
//                    data: {}, //参数值
//                    type: "post", //请求方式
//                    dataType: "json",
//                    success: function success(req) {
//                    	if(location.href.contains("vsw/cdrNew")){//及时关闭
//			                plot.setData([getData2(req.data)]);
//			                if( parseInt(req.data) > maxVal){
//			                	maxVal = req.data;
//			                	plot.getYAxes()[0].options.max=maxVal+50;
//			                }
//			                var xAxisData = plot.getXAxes()[0].options.data;
//			                if(xAxisData.length >= totalPoints){
//				                xAxisData =xAxisData.slice(1);
//			                }
//			                xAxisData.push(new Date().format("HH:mm:ss"));
//			                plot.getXAxes()[0].options.data = xAxisData;
//			                plot.setupGrid();
//			                plot.draw();
//			                setTimeout(update, updateInterval);
//		                }
//                        //请求成功时处理
//                    },
//                    error: function error(xhr, type, exception) {//获取ajax的错误信息
//                        //alert(exception);
//                    }
//                });
//
//            }
//            update();
		</script>
  </body>
</html>
