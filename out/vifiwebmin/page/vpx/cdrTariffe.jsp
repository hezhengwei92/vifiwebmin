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
                  <li class="active" id="tab1">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('','state_tab','list','list2_tab')"><i class="fa fa-th font14"></i>
                     <span class="tab-title"><spring:message code="status.cdrNew.info1"/></span></a> 
                  </li>
                  <li class="tab-red" id="tab2"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools','list','list2_tab','state_tab')"><i class="fa fa-list font14"></i>
                     <span class="tab-title"><spring:message code="menu.cdr_cdr"/></span></a>
                  </li> 
                  <li class="tab-red" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools8','list2_tab','list','state_tab')"><i class="fa fa-list font14"></i>
                     <span class="tab-title"><spring:message code="menu.cdr_cdrTariffeCount"/></span></a> 
                  </li>  
                 
                  <!--
                  <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools('false','tabpanle3','list2_tab','list')">图表 </a>
                  </li>  -->
                  
                  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right" style="display:block;"  id="tools">
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
				  <li class="head-tools-r navbar-right" style="display:none;" id="tools8">
                    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail8" onclick="btnViewDetails8()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    <!-- 设置按钮，设置显示列 -->
                    <div class="viewcfg-dropdown">
                      <a class="btn purple  dropdown-toggle" style="font-size: 14px;padding: 4px 12px;" data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i></a>
                      <ul class="dropdown-menu dropdown-blue" style="width: 180px">
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
				  
				      
                </ul>
                
                
                <!-- tab1标签页 -->
                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                  <div id="state_tab" class="tab-pane  in active summary-tab"> 
				  <div class="row" style="margin-top:20px">	
				  	<div class="col-lg-6 col-sm-12 col-xs-12">
                     <div class="widget radius-bordered">
                        <div class="widget-header">
                           <span class="widget-caption"><spring:message code="status.cdrNew.info1"/></span> 
                        </div>
                        <div class="widget-body no-padding table-border-outlineInfo">
                        	 <div class="row" style="padding:0 15px;">
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo11"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info11"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo13"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info13"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
											<span class="databox-number sky" style="font-size: 24px" id="outLineInfo12"></span>
			                                <div class="databox-text darkgray"> <spring:message code="status.cdrTariffe.info12"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo14"></span>
			                                <div class="databox-text darkgray"> <spring:message code="status.cdrTariffe.info14"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo2"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrNew.info2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo4"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrTariffe.info4"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo6"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrTariffe.outline2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="todayInfo7">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info9"/><spring:message code="status.cdrNew.info7"/>(<spring:message code="status.cdrNew.info24"/>)</div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo2">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrNew.info2"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo4">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrTariffe.info4"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo6">&nbsp;</span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrTariffe.outline1"/></div>
			                        	</div>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="monthInfo7"></span>
			                                <div class="databox-text darkgray"><spring:message code="status.cdrNew.info10"/><spring:message code="status.cdrNew.info7"/>(<spring:message code="status.cdrNew.info24"/>)</div>
			                        	</div>
			                        </div>
                        </div> 
                     </div> 
		                 <div class="row" >
			                 <div class="col-lg-12 col-sm-12 col-xs-12">
                                    <div class="databox databox-xxlg radius-bordered " style="height: 185px">
                                        <div class="databox-right bordered-thick bordered-whitesmoke bg-blue no-padding" style="width: 100%;height: 100%">
                                            <div class="databox-stat bg-yellow radius-bordered">
                                                <div class="stat-text" id="realtime-chart-value"></div>
                                            </div>
                                            <div class="databox-stat stat-left radius-bordered">
                                                <div class="stat-text white"><spring:message code="status.cdrNew.info25"/></div>
                                            </div>
                                            <div id="realtime-chart" class="chart chart-lg" style="height: 170px">

                                            </div>
                                        </div>
                                    </div>
                                </div>
		                 </div>
		                 
                          </div>
						
					    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
					        <div class="widget "> 
					        	<div class="widget-header">
			                        <span class="widget-caption"><spring:message code="status.cdrNew.info22"/></span>
			                    </div> 
			                    <div class="widget-body no-padding">
							        <div class="orders-container">
		                                <ul class="orders-list" id="topDiv" style="background-color: #FBFBFB">
		                                </ul>
		                            </div>
			                    </div>
		                    </div>
					    </div>
					    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
					        <div class="widget "> 
					        	<div class="widget-header">
			                        <span class="widget-caption"><spring:message code="status.cdrNew.info22_2"/></span>
			                    </div> 
			                    <div class="widget-body no-padding">
			                    	<div class="orders-container">
		                                <ul class="orders-list"  id="topDiv2" style="background-color: #FBFBFB">
		                                </ul>
		                            </div>
			                    </div>
		                    </div>
					    </div>
                   </div>
					<div class="row">
			            <div class="col-lg-12 col-sm-12 col-xs-12">
			             <div class="widget-body">
                           <div class="dashboard-box" style="margin-top: -10px;">
                               <div class="box-tabbs">
                                   <div class="tabbable">
                                       <ul class="nav nav-tabs tabs-flat nav-justified" id="myTab11">
                                           <li class="active tab-white">
                                               <a data-toggle="tab" style="font-size: 14px" href="javaScript:void(0)" onclick="onClickChangTab('idToday','idMonth','idYear')">
                                                   <spring:message code="status.cdrNew.info9" />-<spring:message code="status.cdrNew.info10_2" />
                                               </a>
                                           </li>
                                           <li class="tab-white">
                                               <a data-toggle="tab" style="font-size: 14px" href="javaScript:void(0)"  onclick="onClickChangTab('idMonth','idToday','idYear')">
                                                   <spring:message code="status.cdrNew.info10" />-<spring:message code="status.cdrNew.info10_2" />
                                               </a>
                                           </li>
                                           <li class="tab-white">
                                               <a data-toggle="tab" style="font-size: 14px" href="javaScript:void(0)"  onclick="onClickChangTab('idYear','idToday','idMonth')">
                                                   <spring:message code="status.cdrNew.info10_1" />-<spring:message code="status.cdrNew.info10_2" />
                                               </a>
                                           </li>
                                       </ul>
                                       <div class="tab-content tabs-flat no-padding">
                                           <div id="idToday" class="tab-pane active animated fadeInUp" style="height: 250px;padding-top: 20px">
                                               <div class="row">
                                                   <div class="col-lg-12 chart-container">
                                                       <div id="dashboard-chart-visits-today" class="chart chart-lg no-margin"></div>
                                                   </div>
                                               </div>

                                           </div>
                                           <div id="idMonth" class="tab-pane padding-10 animated fadeInUp" style="height: 250px;padding-top: 20px">
                                                <div class="row">
                                                   <div class="col-lg-12 chart-container">
                                                       <div id="dashboard-chart-visits-month" class="chart chart-lg no-margin"></div>
                                                   </div>
                                               </div>
                                           </div>
                                           <div id="idYear" class="tab-pane animated fadeInUp no-padding-bottom" style="height: 250px;padding-top: 20px">
                                                <div class="row">
                                                   <div class="col-lg-12 chart-container">
                                                       <div id="dashboard-chart-visits-year" class="chart chart-lg no-margin"></div>
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
                         <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.cdrType"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="cdrType" style="width: 100%;"  placeholder="<spring:message code="db.tbCDR.cdrType.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbCDR.cdrType.help"/></option>
                                  </select>
                               </div>
                             </div>
                          </div> 
                         <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.direction"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="direction" style="width: 100%;"  placeholder="<spring:message code="db.tbCDR.direction.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbCDR.direction.help"/></option>
                                  </select>
                               </div>
                             </div>
                          </div> 
                         <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.distance"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="distance" style="width: 100%;"  placeholder="<spring:message code="db.tbCDR.distance.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbCDR.distance.help"/></option>
                                  </select>
                               </div>
                             </div>
                          </div> 
                           </div>
                           <div class="row ng-scope">
                           <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbCDR.callee"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="callee"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCDR.callee.help"/>" > 
                               </div>
                             </div>           
                          </div> 
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
                           <div class="col-md-3 margin-bottom-5 ng-scope">
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
                    <div class="row foot-tools" id="foot_page_tools"  style="height:45px;">
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
                          <div class="col-md-3  margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding " ><spring:message code="db.tbCountDaily3.idxUserId"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxUserId2" style="width: 700px" class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbCountDaily3.idxUserId.help"/>" > 
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
                      <div class="data-thead data-thead8" style="background-color: #F7F7F7;border-top: 1px solid #ddd;border-bottom: 1px solid #00A2E9;">
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
  <div class="modal-dialog" style="width: 550px;">
    <div class="modal-content">
      <!-- 窗口头 -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i>&nbsp;&nbsp; <spring:message code="db.tbCountDailyTariffe.idxUserId"/>:&nbsp;<B><span id="idView8" style="color: grid;"></span></B><spring:message code="details"/></h4>
      </div>
      
      <div class="modal-body bg-white no-padding" style="margin-top: 1px;" id="idViewDataDiv" >  
         <div class="data-tbody data-tbody8" id="idViewDataBody" style="background-color: #f5f5f5;overflow: hidden;width: 500px;">
         <!-- 列表内容 
           <div>
             <table class="table table-bordered table-hover table-striped" style="padding: 0 20px 0 20px;">
               <thead class="flip-content">
                 <tr >
                   <td><spring:message code="db.common.crtTm"/></td>
                   <td><spring:message code="db.tbCountDaily.numTotalMMOut"/></td>
                   <td><spring:message code="db.tbCountDaily.numTotalMO"/></td>
                   <td><spring:message code="db.tbCountDaily.numTotalMOCb"/></td>
                   <td><spring:message code="db.tbCountDaily.numTotalMTGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.numTotalMOGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.numTotalMOGoipCb"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMMIn"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMMOut"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMO"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMOCb"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMTGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMOGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.numFailedMOGoipCb"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMMIn"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMMOut"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMO"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMOCb"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMOGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMTGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.numShortMOGoipCb"/></td>
                   <td><spring:message code="db.tbCountDaily.durMMOut"/></td>
                   <td><spring:message code="db.tbCountDaily.durMO"/></td>
                   <td><spring:message code="db.tbCountDaily.durMOCb"/></td>
                   <td><spring:message code="db.tbCountDaily.durMTGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.durMOGoip"/></td>
                   <td><spring:message code="db.tbCountDaily.durMOGoipCb"/></td>
                   <td><spring:message code="db.tbCountDaily.cost"/></td>
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

		<script>
			//新增设备组
			function addDeviceGrp(){
				showTools9('tools8','tab3','list2_tab','list','state_tab');
				myopenModel8('myeditModal8','new');
				hideElement();
			}
			
			//新增设备
			function addDevice(){
				showTools9('tools','tab2','list','list2_tab','state_tab');
				myopenModel('myeditModal','new');
			}
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
			function onClickRedirectURL2(){
				showTools8('tools','list','list2_tab','state_tab');
				$("#tab1").removeClass("active");
				$("#tab2").removeClass("active");
				$("#tab3").removeClass("active");
				$("#tab2").addClass("active");
			}
		</script>
		
		<!--  //tab viFiDevice  -->
		<script>
			
			//访问路径
			var visit_url = "/vpx/cdrTariffe";
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
		    var itemName = "my_setTrs_cdrTariffe";
		    //设置初始化排序字段
		    var MY_ORDER_LIST = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems = {"resetTimes" : "5","trs": [
   		       	  {"name": "keyCDRID","show": "true","width":"60"},
                  {"name": "idxUserId","show": "true","width":"110"},
                  {"name": "cdrType","show": "true","width":"80"},
                  {"name": "direction","show": "true","width":"45"},
                  {"name": "distance","show": "true","width":"45"},
                  {"name": "idxRateId","show": "true","width":"80"}, 
                  {"name": "dnis","show": "false","width":"90"},  
                  {"name": "caller","show": "true","width":"130"},
                  {"name": "callee","show": "true","width":"130"},
                  //{"name": "idxAgentID","show": "true","width":"125"},
                  {"name": "StartTime","show": "false","width":"130"},
                  {"name": "AnswerTime","show": "true","width":"130"},
                  {"name": "StopTime","show": "true","width":"130"},
                  {"name": "callDuration","show": "true","width":"80"},
                  {"name": "costCash","show": "true","width":"80"},
                  //{"name": "idxCallID","show": "false","width":"80"},
                  {"name": "idxVPXID","show": "false","width":"80"},
                  {"name": "idxTrunkID","show": "false","width":"80"},
                  {"name": "hangupPart","show": "false","width":"80"},
                  {"name": "hangupReason","show": "false","width":"80"},
                  {"name": "idxGoIPID","show": "false","width":"80"},
                  {"name": "crtTm","show": "true","width":"125"},
                  {"name": "crtBy","show": "false","width":"90"}]
   		    };
		    //设置重置参数
		    var resetSelectItems = selectItems;
		    
		    //列表展示数据转换
			function changeData(tdname,showLengthData,dataTdValue){ 
				var html = "";
				if(tdname=="cdrType" || tdname =="distance" || tdname =="hangupPart"){  
					   var i18nText = $.i18n(tbI18n+"cdrType.comData");
					   
					   if(tdname=="distance"){
					   		i18nText = $.i18n(tbI18n+"distance.comData");
					   }
					   if(tdname=="hangupPart"){
						   i18nText = $.i18n(tbI18n+"hangupPart.data");
					   }
					   if(i18nText !=null){
						   var flag = true;
				    	   for(var i=0; i<i18nText.length; i++){   
				    		   if(i18nText[i][0]==dataTdValue){
				    			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+i18nText[i][1]+"</div></td>"; 
				    			   flag = false;
				    			   break;
				    		   } 
				  	       } 
				    	   if(flag){
				    		   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				    	   }
					   }
				}else if(tdname == "direction"){
				   	 var i18nText = $.i18n(tbI18n+"direction.comData");
				   	if(i18nText !=null){
				   	 		var flag = true;
				    	   for(var i=0; i<i18nText.length; i++){
				    		   if(i18nText[i][0]==dataTdValue){
								   html = "<td><div class=\"table-data f-p-tips\" style=\"width:"+showLengthData+"px;\"><i class=\"img-fmt cdr-cdr-dir-"+dataTdValue+"\"></i><i class=\"f-tips\">"+i18nText[i][1]+"</i></div></td>"; 
								   flag = false;
								   break;
				    		   } 
				  	       }
				    	   if(flag){
				    		   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				    	   }
					   }
				}else if(tdname == "costCash"){
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+toDecimal(dataTdValue/1000,2)+"</div></td>"; 
					   
				}else if(tdname == "callDuration"){
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+getTimeValue(dataTdValue)+"</div></td>"; 
				}else{
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
				return html;
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
			/********** 详情 ************/
			 //查看详情方法
		    function viewDetails(number){  
		       var html_viewDetails = ""; 
		       
		 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"keyDevID")+": </td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].keyGlobalSIMID+"</div></td></tr>";
		 	   html_viewDetails += setViewTr($.i18n(tbI18n+"keyCDRID"),mydata[number].keyCDRID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxUserId"),mydata[number].idxUserId);
			   
			   
			   html_viewDetails += setViewTr($.i18n(tbI18n+"cdrType"),getValue($.i18n(tbI18n+"cdrType.comData"),mydata[number].cdrType));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"direction"),getValue($.i18n(tbI18n+"direction.comData"),mydata[number].direction));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"distance"),getValue($.i18n(tbI18n+"distance.comData"),mydata[number].distance));
			   
			   
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxRateId"), mydata[number].idxRateId);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"dnis"),mydata[number].dnis);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"caller"),mydata[number].caller);
			   //html_viewDetails += setViewTr($.i18n(tbI18n+"idxAgentID"),mydata[number].idxAgentID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"callee"),mydata[number].callee);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"StartTime"),mydata[number].StartTime);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"AnswerTime"),mydata[number].AnswerTime);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"callDuration"),getTimeValue(mydata[number].callDuration));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"costCash"),mydata[number].costCash);
			   //html_viewDetails += setViewTr($.i18n(tbI18n+"idxCallID"),mydata[number].idxCallID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxTrunkID"),mydata[number].idxTrunkID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"hangupPart"),mydata[number].hangupPart);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"hangupReason"),mydata[number].hangupReason);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxGoIPID"),mydata[number].idxGoIPID);
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
		    	//$("#keyDevID1").val(""); 
		    	//$("#keyDevID1").removeAttr("disabled");
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
		    	//状态
		    	setOptionData2($.i18n(tbI18n+"cdrType.comData"),"cdrType");
		    	setOptionData2($.i18n(tbI18n+"direction.comData"),"direction");
		    	setOptionData2($.i18n(tbI18n+"distance.comData"),"distance");
		    	
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
			function setOptionData2(i18nTextType,id){
				var html_qryType = "";
			    for(var i=0; i<i18nTextType.length; i++){ 
		    		html_qryType += "<option  value=\""+i18nTextType[i][0]+"\">"+i18nTextType[i][1]+"</option>";
		  	    }
			    if(html_qryType!=""){ 
		    		$("#"+id).append(html_qryType);
		    	}
			}
		  	//获取查询条件
		    function mygetSearchParams() {
		        var params = '{'; 
		        if($("#idxUserId").val()!="" && $("#idxUserId").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxUserId\":"+"\""+$("#idxUserId").val()+"*\",";  
		        } 
		        if($("#cdrType").val()!="" && $("#cdrType").val()!=null){ 
		        	params +="\"cx_LIKE-|-cdrType\":"+"\""+$("#cdrType").val()+"\",";  
		        } 
		        if($("#direction").val()!="" && $("#direction").val()!=null){ 
		        	params +="\"cx_LIKE-|-direction\":"+"\""+$("#direction").val()+"\",";  
		        } 
		        if($("#distance").val()!="" && $("#distance").val()!=null){ 
		        	params +="\"cx_LIKE-|-distance\":"+"\""+$("#distance").val()+"\",";  
		        } 
		        if($("#callee").val()!="" && $("#callee").val()!=null){ 
		        	params +="\"cx_LIKE-|-callee\":"+"\""+$("#callee").val()+"*\",";  
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
				$("#cdrType").val("");  
				$("#direction").val("");  
				$("#distance").val("");  
				$("#callee").val("");  
				$("#beginTime_cdr").val("");  
				$("#endTime_cdr").val(setToday(true));  
			}
			/********** 查询  end************/
			
		</script>
		
		
		<!-- // tab ViFiDevGroup -->
		<script>
			
			//国际化开头
		    var tbI18n8 = "db.tbCountDailyTariffe.";
		    //表的主键
		    var tablekey8 = "keyCDID";  
		    
		    //设置存在localStorage 的列表配置名
		    var itemName8 = "my_setTrs_countDailyTariffe";
		    //设置初始化排序字段
		    var MY_ORDER_LIST8 = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems8 = {"resetTimes" : "4","trs": [
				       {"name": "idxUserId","show": "true","width":"100"},
				       //{"name": "keyCDID","show": "true","width":"120"},
				       {"name": "numTotalMMOut","show": "true","width":"70"},
				       {"name": "numTotalMO","show": "true","width":"70"},
				       {"name": "numTotalMOCb","show": "false","width":"70"},
				       {"name": "numTotalMTGoip","show": "true","width":"70"},
				       {"name": "numTotalMOGoip","show": "true","width":"70"},
				       {"name": "numTotalMOGoipCb","show": "false","width":"70"},
				       {"name": "numFailedMMIn","show": "false","width":"95"},
				       {"name": "numFailedMMOut","show": "false","width":"95"},
				       {"name": "numFailedMO","show": "true","width":"95"},
				       {"name": "numFailedMOCb","show": "false","width":"95"},
				       {"name": "numFailedMTGoip","show": "false","width":"95"},
				       {"name": "numFailedMOGoip","show": "false","width":"95"},
				       {"name": "numFailedMOGoipCb","show": "false","width":"95"},
				       {"name": "numShortMMIn","show": "false","width":"85"},
				       {"name": "numShortMMOut","show": "false","width":"85"},
				       {"name": "numShortMO","show": "false","width":"85"},
				       {"name": "numShortMOCb","show": "false","width":"85"},
				       {"name": "numShortMTGoip","show": "false","width":"85"},
				       {"name": "numShortMOGoip","show": "false","width":"85"},
				       {"name": "numShortMOGoipCb","show": "false","width":"85"},
				       //{"name": "durMMIn","show": "true","width":"120"},
				       {"name": "durMMOut","show": "false","width":"105"},
				       {"name": "durMO","show": "true","width":"105"},
				       {"name": "durMOCb","show": "false","width":"105"},
				       {"name": "durMTGoip","show": "true","width":"105"},
				       {"name": "durMOGoip","show": "true","width":"105"},
				       {"name": "durMOGoipCb","show": "false","width":"105"},
				       {"name": "cost","show": "true","width":"70"},
				       {"name": "crtTm","show": "true","width":"160"},
		               //{"name": "crtBy","show": "true","width":"90"}
		              ]
				    };
		    //设置重置参数
		    var resetSelectItems8 = selectItems8;
		    //设置查询区、编辑区下拉框的选项值
		    function setSearchParams8(){   
		    	$("#endTime").val(setToday());
		    }
		    //列表展示数据转换
			function changeData8(tdname,showLengthData,dataTdValue){
				var html = "";
		    	if(tdname == "cost"){
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
						 html +=dataTdValue.substring(dataTdValue.indexOf("-")+1)+" ~ " +dataTdValue.substring(dataTdValue.indexOf("-")+1);
					 }
					html += "</div></td>"; 
				}else if(tdname == "durMMOut" || tdname == "durMO" || tdname == "durMOCb" || tdname == "durMTGoip" || tdname == "durMOGoip" || tdname == "durMOGoipCb"){
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+getTimeValue(dataTdValue)+"</div></td>"; 
				}else{	
		    		html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
		    	return html;
			}
		    
			/********** 详情 ***
			
			
			
			*********/
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
			       	     $("#idViewDataBody").css("max-height","550px");
		       	    	chartView.setOption(getViewDetailOptions(datas[0],datas[1],datas[2],datas[3]));
		       	        $("#idViewDataBody").find("div").css("height","100%");
		       	        $("#idViewDataBody").find("canvas").css("height","100%");
	       	        	$("#idView8").html(idxUserId+"  "); 
		       	        //请求成功时处理
		       	    }, 
		       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
		       	    	//alert(exception);
		           }
		       	}); 
		    }
		  function getViewDetailOptions(xAxisVal,series1,series2,series3){
			  var option = {
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        },
					        formatter: function (params,ticket,callback) {
		        	            var res = params[0].name;
		        	            for (var i = 0, l = params.length; i < l; i++) {
		        	            		res += '<br/>'+params[i].seriesName+': ' + params[i].value +' 个';
		        	            }
		        	            return res;
		        	        }
					    },
					    legend: {
					        data:[]
					    },
					    grid: {
					    	left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
					    xAxis : [
					        {
					        	type: 'category',
		        	            data: xAxisVal,
		        	            splitLine:{ 
		                            show:false 
		                     	}
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value',
					            show: true,  
					            precision:0,
					            splitNumber:1,
		        	            splitLine:{ 
		                            show:false 
		                     	},
					        }
					    ],
					    series : [
					        {
					            name:$.i18n("success"),
					            type:'bar',
					            stack: $.i18n("status.cdrNew.info27"),
					            barMaxWidth: 40,
					            data: series1
					        },
					        {
					            name:$.i18n("status.cdrNew.info28"),
					            type:'bar',
					            stack: $.i18n("status.cdrNew.info27"),
					            barMaxWidth: 40,
					            data: series2
					        },
					        {
					            name:$.i18n("failure"),
					            type:'bar',
					            barMaxWidth: 40,
					            stack: $.i18n("status.cdrNew.info27"),
					            data: series3
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
		    	$("#endTime").val(setToday());
			}
			/********** 查询  end************/
			
		</script>
		
		<script>
			 
		    $(function(){      
		        //统计
		        
		    	//根据权限设置 增删改查按钮的显示
		        setpermsion();  
		        setpermsion8();
		    	
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
				//设置其它标签页的高度
				//var winHeight = document.documentElement.clientHeight;
				//$("#list").css("height", winHeight-170); 
				showTools8("","state_tab","list","list2_tab");
				//$("#state_tab").css("height", (winHeight-140)<830 ? 830:winHeight-140);
		    }); 
		</script>
		<script>
	        
	        //概要信息赋值
	        var onlineInfo = selectPermissionsInfo.onlineInfo;
	        $("#outLineInfo11").html(onlineInfo.countUser);
	        $("#outLineInfo13").html(onlineInfo.countOnLineUser);
	        $("#outLineInfo12").html(onlineInfo.calls);
	        $("#outLineInfo14").html(onlineInfo.goIPNum);
	        /////
	        var info = selectPermissionsInfo.info;
	        $("#todayInfo2").html(info.countUser);
	        $("#todayInfo4").html(info.numTotal);
	        $("#todayInfo6").html(Math.round(info.durM/3600*100)/100);
	        $("#todayInfo7").html(toDecimal(info.cost/1000,2));
	        var infoMon = selectPermissionsInfo.infoMon; 
	        $("#monthInfo2").html(infoMon.countUser);
	        $("#monthInfo4").html(infoMon.numTotal);
	        $("#monthInfo6").html(Math.round(infoMon.durM/3600*100)/100);
	        $("#monthInfo7").html(toDecimal(infoMon.cost/1000,2) );
	        
	        //概要end
	        //top排行榜
	        /**
	        
	        <li class="order-item">
                   <div class="row">
                       <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left">
                           <span class="item-booker">Ned Stards</span>
                       </div>
                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right">
                           <div class="item-booker" style="text-align: right;">
                               <span class="currency">$</span>
                               <span class="price">400000</span>
                           </div>
                       </div>
                   </div>
               </li>
	        
	        */
	        var tops = selectPermissionsInfo.tops;
	        $("#topDiv").html(setTopDiv(tops,true));
	        var timeTops = selectPermissionsInfo.timeTops;
	        $("#topDiv2").html(setTopDiv(timeTops));
	        
	        function setTopDiv(tops,flag){
	        	var topDivHtml = "";
		        for(var i = 0; i<tops.length; i++){
		        	topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:24px;line-height:24px;font-size:13px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
		        	topDivHtml +=tops[i].idxUserId+"</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
		        	if(flag){
			        	topDivHtml += toDecimal( tops[i].cost/1000,2)+"</span><span class=\"price\">";
			        	topDivHtml +=$.i18n("status.cdrNew.info24");
		        	}else{
			        	topDivHtml += getTimeValue(tops[i].durM)+"</span><span class=\"price\">";
		        	}
		        	topDivHtml +="</span></div></div></div></li>";
		        	//topDivHtml += "<tr style=\"height: 34px\"><td style=\"padding-left:9px;width: 10%\"><B>"+((i+1) !=10 ? "&nbsp;":"")+(i+1)+".</B></td>";
		        	//topDivHtml += "<td style=\"width: 62%;text-align: left;padding-left:5px;\">"+tops[i].idxUserId+"</td><td style=\"text-align: right;padding-right:15px\">"+toDecimal( tops[i].cost/1000,2)+" 元 </td></tr>";
		        	
		        }
		        for ( var i = tops.length; i < 10; i++) {
		        	//topDivHtml += "<tr style=\"height: 34px\"><td style=\"padding-left:9px;width: 10%\"><B>"+((i+1) !=10 ? "&nbsp;":"")+(i+1)+".</B></td><td></td><td></td></tr>";
		        	topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:24px;line-height:24px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
		        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
		        	topDivHtml +="</span><span class=\"price\"></span></div></div></div></li>";
		        }
		        topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:24px;line-height:24px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
	        	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
	        	topDivHtml +="</span><span class=\"price\"><button class=\"btn btn-palegreen btn-sm pull-right\" onclick=\"onClickRedirectURL2()\" >"+$.i18n("status.cdrNew.info29")+"</button></span></div></div></div></li>";
		        return topDivHtml;
	        }
		</script>
		<script>
		   themeprimary = getThemeColorFromCss('themeprimary');
		   themeprimary2 = getThemeColorFromCss('themeprimary');
           themesecondary = getThemeColorFromCss('themesecondary');
           themethirdcolor = getThemeColorFromCss('themethirdcolor');
           themethirdcolor2 = getThemeColorFromCss('themethirdcolor');
           themefourthcolor = getThemeColorFromCss('themefourthcolor');
           themefifthcolor = getThemeColorFromCss('themefifthcolor');

		//------------------------------Visit Chart------------------------------------------------//
			 
	        //今日
	        var chartToday = echarts.init(document.getElementById('dashboard-chart-visits-today'));
	        var todays = selectPermissionsInfo.todays;
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
	        function fixWidth(percent)    
	        {    
	            return document.body.clientWidth * percent ; //这里你可以自己做调整    
	        }  
	        function onClickChangTab(tab1,tab2,tab3){
		   		$('#'+tab1).show();
		   		if(tab1 == "idMonth"){
	   				if(flagMonthNum ==0){
				        var chartMonth = echarts.init(document.getElementById('dashboard-chart-visits-month'));
				        var months = selectPermissionsInfo.months;
				        chartMonth.setOption(getOptionVal(months[0],months[1],months[2],months[3],months[4],months[5],months[6]));
		        		flagMonthNum++;
		   			}
	   			}
		   		if(tab1 == "idYear"){
	   				if(flagYearNum ==0){
				        var chartYear = echarts.init(document.getElementById('dashboard-chart-visits-year'));
				        var years = selectPermissionsInfo.years;
				        chartYear.setOption(getOptionVal(years[0],years[1],years[2],years[3],years[4],years[5],years[6]));
	   			        flagYearNum++;
		   			}
	   			}
				if(tab2!=undefined){
		   			$('#'+tab2).hide();
		       	}
				if(tab3!=undefined){
		   			$('#'+tab3).hide();
		       	}
		   }
	        
	        
        var dataCharts = selectPermissionsInfo.realtimeData[1],
           totalPoints = 100;
       	var updateInterval = 5000, curTime = new Date().getTime();
       	var maxVal=parseInt(selectPermissionsInfo.realtimeData[2])+20;
        function getData(y) {
            // Zip the generated y values with the x values
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
                res.push([i, dataCharts[i]]);
            }
            return res;
        }	

        var plot = $.plot("#realtime-chart", [getData()], {
            yaxis: {
                color: '#f3f3f3',
                min: 0,
                max: maxVal,
                tickFormatter: function (val, axis) {
                    return "";
                }
            },
            xaxis: {
                color: '#f3f3f3',
                min: 0,
                max: 100,
                tickFormatter: function (val, axis) {
                    return "";
                }
            },
            colors: ['#fff'],
            series: {
                lines: {
                    lineWidth: 2,
                    fill: false,
                    fillColor: {
                        colors: [{
                            opacity: 0.5
                        }, {
                            opacity: 0
                        }]
                    },
                    steps: false
                },
                shadowSize: 0
            },
            grid: {
                show: false,
                hoverable: true,
                clickable: false,
                borderWidth: 0,
                aboveData: false
            },
            tooltip: true,
            tooltipOpts: {
                defaultTheme: false,
                content:  "<span>%y</span> "+$.i18n("status.cdrNew.info3"),
            }
        });

        function update() {
        	$.ajax({
                url: window.PATH + visit_url + "/realTime.ajax", //请求的url地址
                data: {}, //参数值
                type: "post", //请求方式 
                dataType: "json",
                success: function success(req) {
                	if(location.href.contains("vpx/cdrTariffe")){//及时关闭
                    var dataTras = req.data;
                    plot.setData([getData(dataTras)]);
                    if( parseInt(req.data) > maxVal){
	                	maxVal = req.data;
	                	plot.getYAxes()[0].options.max=maxVal+20;
	                	plot.setupGrid();
	                }
                    $("#realtime-chart-value").html("  "+dataTras+"  ");
                    plot.draw();
                    setTimeout(update, updateInterval);
                    //请求成功时处理
                	}
                },
                error: function error(xhr, type, exception) {//获取ajax的错误信息
                    //alert(exception);
                }
            });
          
        }
        update();
		</script>
  </body>
</html>
