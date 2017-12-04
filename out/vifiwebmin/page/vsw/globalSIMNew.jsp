<script>
	g_var.view = ${view};
</script>
<style>
	.vifi-tab-td{
		padding: 10px;
		vertical-align:middle;
	}
	.vifi-font24{
		font-size:24px;
	}
	#recent-charge-record td{
		border-top:none !important;
    	border-bottom: 1px solid #ddd !important;
	}
	#recent-charge-record table{
		background-color:#FBFBFB;
	}
	.rank-list-div{
		height:23.3px;line-height:23.3px;font-size:13px;
	}
	#traffic-record-tool div.btn, #traffic-record-tool a.btn{
		margin-left:3.56px;
	}
	.required_icon{
		color: red;
		width: 8px;
		display: inline-block;
		margin: 0 5px 0 10px;
	}
</style> 
<!-- Body -->
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
                  
                  <li class="flag-tabs-btn" id="tab1" style="display:none;">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('state_tab','')"><i class="fa fa-th font14"></i><spring:message code="menu.uuwifi_globalSIM"/></a> 
                  </li>
                  <li class="flag-tabs-btn tab-blue active" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('list2_tab','tools8')"><i class="fa fa-list font14"></i><spring:message code="label.globalSIMNew.simcardGroup"/></a> 
                  </li>  
                  <li class="flag-tabs-btn tab-blue" id="tab2"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('list','tools')"><i class="fa fa-list font14"></i><spring:message code="label.globalSIMNew.simcard"/></a>
                  </li> 
                  <!-- li class="flag-tabs-btn tab-blue" id="tab4"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('traffic_tab','traffic-record-tool')"><i class="fa fa-list font14"></i><spring:message code="statue.uuwifi.trafficRecord"/></a>
                  </li>-->
                  
                  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="tools">
				    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail" onclick="btnViewDetails()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    
                    <!-- 新增 -->
					<div class=" btn success " style="font-size: 14px;padding: 4px 12px;" id="my_btn_add" onclick="myopenModel('myeditModal','new','other')" >
                      <i class="fa fa-plus"></i>
                    </div> 
                    <!-- 编辑 -->
					<div  class="btn primary " style="font-size: 14px;padding: 4px 12px;" id="my_btn_edit"  onclick="myopenModel('myeditModal','edit')">
                      <i class="fa fa-edit"></i>
                    </div> 
                    <!-- 删除 -->
					<div  class="btn danger" style="font-size: 14px;padding: 4px 12px;" id="my_btn_delete" onclick="dodelete()" >
                      <i class="fa fa-trash-o"></i>
                    </div>&nbsp;&nbsp;
                    
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
				  <li class="head-tools-r navbar-right flag-tools" id="tools8">
				    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail8" onclick="btnViewDetails8()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    
                    <!-- 新增 -->
					<div class=" btn success " style="font-size: 14px;padding: 4px 12px;" id="my_btn_add8" onclick="myopenModel8('myeditModal8','new')" >
                      <i class="fa fa-plus"></i>
                    </div> 
                    <!-- 编辑 -->
					<div  class="btn primary " style="font-size: 14px;padding: 4px 12px;" id="my_btn_edit8"  onclick="myopenModel8('myeditModal8','edit')">
                      <i class="fa fa-edit"></i>
                    </div> 
                    <!-- 删除 -->
					<div  class="btn danger" style="font-size: 14px;padding: 4px 12px;" id="my_btn_delete8" onclick="dodelete8()" >
                      <i class="fa fa-trash-o"></i>
                    </div>&nbsp;&nbsp;
                    
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
				  
				  <!-- tab4-工具按钮组 -->
				  <li class="head-tools-r navbar-right flag-tools" style="display:none;" id="traffic-record-tool"></li>
				      
                </ul>
                <!-- tab标签页 -->
                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">              
					
				  <!-- tab标签1NEW  -->
				  <div id="state_tab" class="flag-tabs tab-pane"> <!--   in active summary-tab -->
				  	<!-- 第一行 -->
				  	<div class="row ng-scope">	
					  	<div class="col-lg-9 col-sm-12 col-xs-12">
			                 <div class="row"  style="margin-top:20px"> 
			                  <div class="col=lg-12 col-md-12 col-sm-9 col-xs-9">
			                     <div class="widget radius-bordered">
			                        <div class="widget-header">
			                           <span class="widget-caption"><spring:message code="status.cdrNew.info1"/></span> 
			                        </div> 
			                        <div class="widget-body" style="padding:0 0 0 0">
			                        	 <table style="width: 100%;border: 0;" border="1">
			                        	 	<tr style="height: 30%">
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo1"></span>
			                                            <div class="databox-text darkgray"><spring:message code="label.common.cardGroup"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info22"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>
			                                            <div class="databox-text darkgray"> <spring:message code="status.globalSIMNew.info14"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>
			                                            <div class="databox-text darkgray"> <spring:message code="status.globalSIMNew.info15"/></div>
	 		                        	 		</td>
			                        	 	</tr>
			                        	 	<tr style="height: 30%">
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info16"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>
			                                            <div class="databox-text darkgray"> <spring:message code="status.globalSIMNew.info17"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px"  id="outLineInfo7"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info18"/><span id="todayInfo6_suff"></span> </div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo8"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info19"/></div>
	 		                        	 		</td>
			                        	 	</tr>
			                        	 	<tr style="height: 30%">
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo9"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info20"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px" id="outLineInfo10"></span>
			                                            <div class="databox-text darkgray"><spring:message code="status.globalSIMNew.info21"/></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px"></span>
			                                            <div class="databox-text darkgray"><span id="monthInfo6_suff"> </span></div>
	 		                        	 		</td>
			                        	 		<td width="25%" class="tdColor vifi-tab-td" >
			                                            <span class="databox-number sky" style="font-size: 24px"></span>
			                                            <div class="databox-text darkgray"></div>
	 		                        	 		</td>
			                        	 	</tr>
			                        	 </table>
			                        </div> 
			                        
			                     </div> 
			                   </div>
			                 </div>
			                 <div class="row">
			                 	<div class="col=lg-12 col-md-12 col-sm-9 col-xs-9">
			                 		<div class="widget">
			                 			<div class="widget-header">
			                 				<div class="widget-caption">
			                 					<spring:message code="statue.uuwifi.recentCharge"></spring:message>
			                 				</div>
			                 			</div>
			                 			<div class=" widget-body" style="padding-top:0px;">
			                 				<div id="recent-charge-record"></div>
								 			<div style="padding-top:7px;height:24px;width:100%;text-align:right;">
								 				<button class="btn btn-palegreen btn-sm pull-right" onclick="switchTabAndTools('list2_tab','tools8','tab3')">
								 				<spring:message code="statue.uuwifi.more"/></button></div>
										</div>
			                 		</div>
				                 	
								</div>
			                 </div>
			                 
	                    </div>
	                    
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="padding-top: 20px;">
						        <div class="widget "> 
						        	<div class="widget-header">
				                        <span class="widget-caption"> <spring:message code="status.cdrNew.info22_1" /></span>
				                    </div> 
				                    <div class="widget-body no-padding">
				                    	<div id="flow-top-list"></div>
				                    </div>
			                    </div>
						 </div>
	                </div>
	                <!--第二行 -->
	                <div class="row" >
	                	<div class="col-lg-12 col-sm-8 col-xs-12">
	                		<div class="widget">
			                 			<div class="widget-header">
			                 				<div class="widget-caption">
			                 					<spring:message code="statue.uuwifi.trafficStatistics1"></spring:message>
			                 				</div>
			                 			</div>
			                 			<div class=" widget-body">
								 			<div id="flow-statistics-charts" class="chart chart-lg"></div>
										</div>
			                 		</div>
	                	</div>
	                </div>
				  </div>
					
                  <!-- tab标签3——卡列表 -->
                  <div id="list" class="flag-tabs tab-pane" style="border-radius:0;"> 
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIM.keyGlobalSIMID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keyGlobalSIMID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIM.keyGlobalSIMID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIM.idxGlobalSIMGrpID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxGlobalSIMGrpID" style="width: 100%;"  placeholder="<spring:message code="db.tbGlobalSIM.idxGlobalSIMGrpID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbGlobalSIM.idxGlobalSIMGrpID.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div>  
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIM.status"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="status" style="width: 100%;"  placeholder="<spring:message code="db.tbGlobalSIM.status.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbGlobalSIM.status.help"/></option>
                                    <option id="status_0" value="0"></option>
                                    <option id="status_1" value="1"></option>
                                  </select>
                               </div>
                             </div>
                          </div>
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIM.number"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="number"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIM.number.help"/>" >
                               </div>
                             </div>           
                          </div> 
                           
                        </div> 
                        
                        <div class="row ng-scope">   
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIM.balance"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="balance"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIM.balance.help"/>" >
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIM.netData"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="netData"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIM.netData.help"/>" >
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
                    <!-- 测试表格粗略模板 -->
                    <div id="testTable1">
                    
                    </div>

                  </div>
                  
                  <!-- tab标签2——卡组  -->
                  <div id="list2_tab" class="flag-tabs tab-pane in active" style="border-radius:0;">
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search8">
                      <div class="panel-body">
                       
                        <div class="row ng-scope">
                          <!-- div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.keyGlobalSIMGrpID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keyGlobalSIMGrpID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIMGrp.keyGlobalSIMGrpID.help"/>" > 
                               </div>
                             </div>           
                          </div-->
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.groupName"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="groupName"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIMGrp.groupName.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.idxSalerID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSalerID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbGlobalSIMGrp.idxSalerID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                           
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.areaCode"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="areaCode" style="width: 100%;"  placeholder="<spring:message code="db.tbGlobalSIMGrp.areaCode.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.areaCode.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div>   
                           
                        </div> 
                        
                        <div class="row ng-scope">   
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.ispId"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="ispId" style="width: 100%;"  placeholder="<spring:message code="db.tbGlobalSIMGrp.ispId.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.ispId.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.cardType"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="cardType" style="width: 100%;"  placeholder="<spring:message code="db.tbGlobalSIMGrp.cardType.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.cardType.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbGlobalSIMGrp.cardSize"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="cardSize" style="width: 100%;"  placeholder="<spring:message code="db.tbGlobalSIMGrp.cardSize.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.cardSize.help"/></option>
                                    
                                  </select>
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
                  
                  <!-- tab页4——流量记录 -->
 				  <div id="traffic_tab" class="flag-tabs tab-pane" style="border-radius:0;">
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
      
      <div class="modal-body bg-white no-padding" style="overflow-y:auto;max-height: 80vh;">  
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
      <div  class="btn primary f-p-tips" id="mydetailModal-skip2Edit" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;"
           		onclick="skip2EditModalG_globalSIMNew('global')">
           		<i class="fa fa-edit"></i><div class="f-t-tips"><spring:message code="edit"/></div></div>
        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
      </div>
      
    </div>
  </div>
</div>


<!-- 编辑层 -->
<div class="modal fade modal-primary" id="myeditModal"  aria-hidden="true">
  <div class="modal-dialog" ng-class="modal-lg">
    <div class="modal-content">
      <form id="registrationForm1" class="form-horizontal ng-pristine ng-valid" onchange="formChange2mycommon()">
      	<input type="hidden" id="myeditModaltype" value="edit">
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
			            <spring:message code="db.tbGlobalSIM.keyGlobalSIMID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="keyGlobalSIMID1" name="keyGlobalSIMID" placeholder="<spring:message code="db.tbGlobalSIM.keyGlobalSIMID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbGlobalSIM.idxGlobalSIMGrpID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="idxGlobalSIMGrpID" id="idxGlobalSIMGrpID1" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbGlobalSIM.idxGlobalSIMGrpID.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<!-- div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.imsi"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="imsi1" name="imsi" placeholder="<spring:message code="db.tbGlobalSIM.imsi.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.imei"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="imei1" name="imei" placeholder="<spring:message code="db.tbGlobalSIM.imei.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> --> 
			 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.status"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select id="status1" name="status" style="width:100%;">
                     <option value=""><spring:message code="db.tbGlobalSIM.status.help"/></option>
                     <option id="status_2" value="0"></option>
                     <option id="status_3" value="1"></option>
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.number"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="number1" name="number" placeholder="<spring:message code="db.tbGlobalSIM.number.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.balance"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="balance1" name="balance" placeholder="<spring:message code="db.tbGlobalSIM.balance.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>   
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.idxViFiID"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <select name="idxViFiID" id="idxViFiID1" style="width:100%;">
                       
                    </select>
                    
                  </div> 
                </div>
                </div> 
			</div>  
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.billingDate"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select id="billingDate1" name="billingDate" style="width:100%;"> 
                     <option value="0"><spring:message code="db.tbGlobalSIM.billingDate.help"/></option>
                     <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>
                     <option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>
                     <option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
                     <option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option>
                     <option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
                     <option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option>
                     <option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option>
                     <option value="29">29</option><option value="30">30</option><option value="31">31</option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.qryType"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select id="qryType1" name="qryType" style="width:100%;"> 
                      
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.qryResult"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="qryResult1" name="qryResult" placeholder="<spring:message code="db.tbGlobalSIM.qryResult.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.lastTopupValue"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="lastTopupValue1" name="lastTopupValue" placeholder="<spring:message code="db.tbGlobalSIM.lastTopupValue.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbGlobalSIM.lastTopupDate"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input  type="text" id="lastTopupDate1" name="lastTopupDate"  placeholder="<spring:message code="db.tbGlobalSIM.lastTopupDate.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"> 
                    <!-- <input type="text" id="lastTopupDate1" name="lastTopupDate" placeholder="<spring:message code="db.tbGlobalSIM.lastTopupDate.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" >  -->
                  </div> 
                </div>
                </div> 
			</div> 
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbGlobalSIM.remarks"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="remarks1" name="remarks" placeholder="<spring:message code="db.tbGlobalSIM.remarks.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			  
        </div>
        
        <!-- 保存和取消按钮 -->
         <div class="modal-footer ">  
         <div  class="btn primary f-p-tips" id="myeditModal-skip2Detail" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;" 
           		onclick="skip2DetailModalG_globalSIMNew('global')">
           		<i class="fa fa-list-alt"></i><div class="f-t-tips"><spring:message code="details"/></div></div>
          <button type="submit" class="btn btn-primary"><spring:message code="save"/></button> 
          <a class="btn btn-danger" onclick="mycancelEdit()"><spring:message code="cancel"/></a>
        </div>  
        
      
      </form>
    </div>
  </div>
</div> 



<!-- 详情层 -->
<div class="modal fade modal-primary" id="mydetailModal8"  role="dialog" aria-hidden="true">
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
			<tbody id="html_viewDetails8">

			<!-- 循环体 --> 

            </tbody> 

          </table>
        </div> 
      </div>
      <!-- 关闭按钮 -->
      <div class="modal-footer">
      <div  class="btn primary f-p-tips" id="mydetailModal8-skip2Edit" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;" 
           		onclick="skip2EditModalG_globalSIMNew('globalGroup')">
           		<i class="fa fa-edit"></i><div class="f-t-tips"><spring:message code="edit"/></div></div>
        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
      </div>
      
    </div>
  </div>
</div>


<!-- 编辑层 -->
<div class="modal fade modal-primary" id="myeditModal8"  aria-hidden="true" onchange="formChange2mycommon()">
  <div class="modal-dialog" ng-class="modal-lg">
    <div class="modal-content">
      <form id="registrationForm8" class="form-horizontal ng-pristine ng-valid">
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbGlobalSIMGrp.keyGlobalSIMGrpID"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="keyGlobalSIMGrpID8" disabled style="background-color: #F0F0F0 !important;" name="keyGlobalSIMGrpID" placeholder="<spring:message code="db.tbGlobalSIMGrp.keyGlobalSIMGrpID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbGlobalSIMGrp.groupName"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="groupName8" name="groupName" placeholder="<spring:message code="db.tbGlobalSIMGrp.groupName.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbGlobalSIMGrp.idxSalerID"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="idxSalerID8" name="idxSalerID" placeholder="<spring:message code="db.tbGlobalSIMGrp.idxSalerID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbGlobalSIMGrp.areaCode"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
			      <div class="ng-scope"> 
                   <div  style="width: 100%;">
                     <select id="continent" name="continent" onchange="checkContinent()" style="width: 32%;margin-top:2px">
                       <option value="" selected="selected"><spring:message code="continent.help"/></option>
                       
                     </select>
                     <select style="width:67%" placeholder="<spring:message code="db.tbCDR.countryCode.help"/>" onchange="checkareaCode()" id="areaCode8" name="areaCode">
                       <option value="" selected="selected"><spring:message code="db.tbCDR.countryCode.help"/></option>
                     </select>
                  </div>
                  
				 </div> 
                </div>
              </div>
			</div>
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbGlobalSIMGrp.ispId"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
			      <div class="ng-scope"> 
                   <select name="ispId" id="ispId8" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.ispId.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbGlobalSIMGrp.cardType"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
			      <div class="ng-scope"> 
                   <select name="cardType" id="cardType8" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.cardType.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbGlobalSIMGrp.cardSize"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
			      <div class="ng-scope"> 
                   <select name="cardSize" id="cardSize8" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbGlobalSIMGrp.cardSize.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div> 
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbGlobalSIMGrp.monthlyRental"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="monthlyRental8" name="monthlyRental" placeholder="<spring:message code="db.tbGlobalSIMGrp.monthlyRental.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>   
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbGlobalSIMGrp.dataPrice"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="dataPrice8" name="dataPrice" placeholder="<spring:message code="db.tbGlobalSIMGrp.dataPrice.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbGlobalSIMGrp.roamDataPrice"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="roamDataPrice8" name="roamDataPrice" placeholder="<spring:message code="db.tbGlobalSIMGrp.roamDataPrice.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbGlobalSIMGrp.remarks"/>:<span class="required_icon" ></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="remarks8" name="remarks" placeholder="<spring:message code="db.tbGlobalSIMGrp.remarks.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			  
        </div>
        
        <!-- 保存和取消按钮 -->
         <div class="modal-footer ">  
         <div  class="btn primary f-p-tips" id="myeditModal8-skip2Detail" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;" 
           		onclick="skip2DetailModalG_globalSIMNew('globalGroup')">
           		<i class="fa fa-list-alt"></i><div class="f-t-tips"><spring:message code="details"/></div></div>
          <button type="submit" class="btn btn-primary"><spring:message code="save"/></button> 
          <a class="btn btn-danger" onclick="mycancelEdit8()"><spring:message code="cancel"/></a>
        </div>  
        
      
      </form>
    </div>
  </div>
</div> 

    <script> 
    //设置带搜索功能的下拉框
    $("#ispId").select2();
    $("#ispId8").select2();
    $("#continent").select2();
    $("#areaCode").select2();
    $("#areaCode8").select2();
    $("#idxViFiID1").select2(); 
    </script> 
    <script>
    //访问路径
    var visit_url = "/vsw/globalSIMNew";
    //国际化开头
    var tbI18n = "db.tbGlobalSIM.";
    //表的主键
    var tablekey = "keyGlobalSIMID";
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
    var itemName = "my_setTrs_globalSimNew";
    //设置初始化排序字段
    var MY_ORDER_LIST = [];
    //tbglobalSIM
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems = {"resetTimes" : "3","trs": [{"name": "keyGlobalSIMID","show": "true","width":"180"},
               {"name": "idxGlobalSIMGrpID","show": "true","width":"100"},
               {"name": "imsi","show": "false","width":"180"},
               {"name": "imei","show": "false","width":"180"},
               {"name": "status","show": "true","width":"60"},
               {"name": "number","show": "true","width":"100"},
               {"name": "balance","show": "true","width":"80"},
               {"name": "lastQryDate","show": "true","width":"125"},
               {"name": "netData","show": "true","width":"100"}, 
               {"name": "idxViFiID","show": "true","width":"180"},
               {"name": "billingDate","show": "false","width":"100"},
               {"name": "qryType","show": "false","width":"100"},
               {"name": "lastTopupDate","show": "false","width":"125"},
               {"name": "lastTopupValue","show": "false","width":"100"},  
               {"name": "remarks","show": "true","width":"200"}, 
               {"name": "mdfTm","show": "true","width":"140"},
               {"name": "mdfBy","show": "false","width":"140"},
               {"name": "crtTm","show": "false","width":"140"},
               {"name": "crtBy","show": "false","width":"140"}]
    };
    //设置重置参数
    var resetSelectItems = selectItems;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams(){  
    	var globalSIMGrpSelData = selectPermissionsInfo.globalSIMGrpSelData;  
    	var html_idxGlobalSIMGrpID = "";
    	if(globalSIMGrpSelData!=null){
    	for(var i=0; i<globalSIMGrpSelData.length; i++){   
    		html_idxGlobalSIMGrpID += "<option value=\""+globalSIMGrpSelData[i][0]+"\">"+globalSIMGrpSelData[i][1]+"</option>";
  	    } 
    	}
    	if(html_idxGlobalSIMGrpID!=""){ 
    		$("#idxGlobalSIMGrpID").append(html_idxGlobalSIMGrpID);
    		$("#idxGlobalSIMGrpID1").append(html_idxGlobalSIMGrpID);
    		$("#idxGlobalSIMGrpID").select2();
    		$("#idxGlobalSIMGrpID1").select2();
    	}  
    	
    	var i18nText = $.i18n(tbI18n+"status.comData");   
 	    $("#status_0").append(i18nText["0"]["1"]);
 	    $("#status_1").append(i18nText["1"]["1"]); 
 	    $("#status_2").append(i18nText["0"]["1"]); 
	    $("#status_3").append(i18nText["1"]["1"]);
	    
	    var i18nTextQryType = $.i18n(tbI18n+"qryType.comData");  
	    var html_qryType = "";
	    for(var i=0; i<i18nTextQryType.length; i++){ 
	    	if(i18nTextQryType[i][0] == "1"){
	    		html_qryType += "<option selected=\"selected\"  value=\""+i18nTextQryType[i][0]+"\">"+i18nTextQryType[i][1]+"</option>";
	    	}else{
	    		html_qryType += "<option  value=\""+i18nTextQryType[i][0]+"\">"+i18nTextQryType[i][1]+"</option>";
	    	} 
  	    }
	    $("#qryType1").append(html_qryType); 
	     
    } 
    
    var idxViFiIDArr = [];
    function setIdxViFiID(){ //设置idxViFiID的值
    	var globalSIMGrpSelData = selectPermissionsInfo.idxViFiIDVO;   
	    var html_idxViFiID = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbGlobalSIM.idxViFiID.help")+"</option>";
	    if(globalSIMGrpSelData!=null){ 
    	  for(var i=0; i<globalSIMGrpSelData.length; i++){  
    		if($.inArray(globalSIMGrpSelData[i].idxViFiID , idxViFiIDArr) == -1){
    		    html_idxViFiID += "<option value=\""+globalSIMGrpSelData[i].idxViFiID+"\">"+globalSIMGrpSelData[i].idxViFiID+"</option>";
    		}
  	      } 
        }
    	$("#idxViFiID1").html(html_idxViFiID);
    	$("#idxViFiID1").select2();
    }
    
    //获取查询条件
    function mygetSearchParams() {
        var params = '{'; 
        
        if($("#keyGlobalSIMID").val()!="" && $("#keyGlobalSIMID").val()!=null){ 
        	params +="\"cx_LIKE-|-keyGlobalSIMID\":"+"\""+$("#keyGlobalSIMID").val()+"\",";  
        } 
        
        if($("#idxGlobalSIMGrpID").val()!="" && $("#idxGlobalSIMGrpID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxGlobalSIMGrpID\":"+"\""+$("#idxGlobalSIMGrpID").val()+"\",";  
        }
        
        if($("#status").val()!="" && $("#status").val()!=null){ 
        	params +="\"cx_LIKE-|-status\":"+"\""+$("#status").val()+"\",";  
        }
        
        if($("#number").val()!="" && $("#number").val()!=null){ 
        	params +="\"cx_LIKE-|-number\":"+"\""+$("#number").val()+"\",";  
        } 
        
        if($("#balance").val()!="" && $("#balance").val()!=null){ 
        	params +="\"cx_LIKE-|-balance\":"+"\""+parseFloat($("#balance").val())*1000+"\",";  
        }
        
        if($("#netData").val()!="" && $("#netData").val()!=null){ 
        	params +="\"cx_LIKE-|-netData\":"+"\""+parseFloat($("#netData").val())*1000+"\",";  
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
    
        
    //获取编辑的内容
    function mygetSaveData() { 
        var params1 = '{';  
        	params1 +="\"keyGlobalSIMID\":"+"\""+$("#keyGlobalSIMID1").val()+"\",";   
        	params1 +="\"idxGlobalSIMGrpID\":"+"\""+$("#idxGlobalSIMGrpID1").val()+"\",";   
        	//params1 +="\"imsi\":"+"\""+$("#imsi1").val()+"\","; 
        	//params1 +="\"imei\":"+"\""+$("#imei1").val()+"\",";   
        	params1 +="\"status\":"+"\""+$("#status1").val()+"\",";  
        	params1 +="\"number\":"+"\""+$("#number1").val()+"\",";  
        	if($("#balance1").val()==""){
        		params1 +="\"balance\":"+"\""+0+"\","; 
        	}else{
        		params1 +="\"balance\":"+"\""+parseFloat($("#balance1").val())*1000+"\","; 
        	} 
        	
        	params1 +="\"idxViFiID\":"+"\""+$("#idxViFiID1").val()+"\",";   
        	params1 +="\"billingDate\":"+"\""+$("#billingDate1").val()+"\",";   
        	params1 +="\"qryType\":"+"\""+$("#qryType1").val()+"\","; 
        	params1 +="\"qryResult\":"+"\""+$("#qryResult1").val()+"\",";   
        	params1 +="\"lastTopupDate\":"+"\""+$("#lastTopupDate1").val()+"\",";  
        	params1 +="\"lastTopupValue\":"+"\""+$("#lastTopupValue1").val()+"\","; 
        	
        	params1 +="\"remarks\":"+"\""+$("#remarks1").val()+"\","; 
        	
        	if(params1 != '{'){
        		if($("#editAddType").val()=="new"){
        		   params1 += "\"actionName\":"+"\""+$.i18n("new")+"\""; 
        		}else if($("#editAddType").val()=="edit"){
        		   params1 += "\"actionName\":"+"\""+$.i18n("edit")+"\""; 
        		} 
        	} 
        params1+='}';   
        var params1 = eval('(' + params1 + ')');   
        return params1;
    } 
     
    
  //设置编辑框的值
    function setEditItems(){
    	$("#editAddModel").removeClass("text-success").addClass("text-primary").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit"));
    	$("#editAddType").val("edit");
    	var checkedsubList = $("input[name*='Listitems']:checked"); //获取选中的name中包含Listitems的值  
    	var arr = checkedsubList[0].value.split("-|-");  
    	$("#keyGlobalSIMID1").val(eval("mydata["+arr[1]+"].keyGlobalSIMID")); 
    	$("#keyGlobalSIMID1").attr("disabled","disabled");
    	$("#idxGlobalSIMGrpID1").val(eval("mydata["+arr[1]+"].idxGlobalSIMGrpID"));   
    	//$("#imsi1").val(eval("mydata["+arr[1]+"].imsi")); 
    	//$("#imei1").val(eval("mydata["+arr[1]+"].imei"));   
    	$("#status1").val(eval("mydata["+arr[1]+"].status"));  
    	$("#number1").val(eval("mydata["+arr[1]+"].number"));   
    	$("#balance1").val(eval("mydata["+arr[1]+"].balance")/1000);    
    	$("#remarks1").val(eval("mydata["+arr[1]+"].remarks")); 
    	
    	setIdxViFiID(); 
        if(eval("mydata["+arr[1]+"].idxViFiID") !=undefined && eval("mydata["+arr[1]+"].idxViFiID") != ""){
        	$("#idxViFiID1").append("<option value=\""+eval("mydata["+arr[1]+"].idxViFiID")+"\">"+eval("mydata["+arr[1]+"].idxViFiID")+"</option>");
        } 
    	
    	$("#idxViFiID1").val(eval("mydata["+arr[1]+"].idxViFiID") ==undefined ? "":eval("mydata["+arr[1]+"].idxViFiID")); 
    	$("#idxViFiID1").select2(); 
    	$("#billingDate1").val(eval("mydata["+arr[1]+"].billingDate"));   
    	$("#qryType1").val(eval("mydata["+arr[1]+"].qryType") ==undefined ? "1":eval("mydata["+arr[1]+"].qryType"));  
    	$("#qryResult1").val(eval("mydata["+arr[1]+"].qryResult") ==undefined ? "":eval("mydata["+arr[1]+"].qryResult"));   
    	$("#lastTopupDate1").val(eval("mydata["+arr[1]+"].lastTopupDate") ==undefined ? "":eval("mydata["+arr[1]+"].lastTopupDate"));    
    	$("#lastTopupValue1").val(eval("mydata["+arr[1]+"].lastTopupValue") ==undefined ? "":eval("mydata["+arr[1]+"].lastTopupValue"));  
    }
         
        
    //查看详情方法
    function viewDetails(number){ 
       var i18nText = $.i18n(tbI18n+"status.comData");  
	   var value = parseInt(mydata[number].status);
	   var i18nText_get = i18nText[value][1]; 
       var html_viewDetails = ""; 
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"keyGlobalSIMID")+"： </td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].keyGlobalSIMID+"</div></td></tr>";
 	   var globalSIMGrpSelData = selectPermissionsInfo.globalSIMGrpSelData;  
	   var html_globalSIMGrpSelData = "";
	   if(globalSIMGrpSelData!=null){
	     for(var i=0; i<globalSIMGrpSelData.length; i++){   
		   if(globalSIMGrpSelData[i][0]==mydata[number].idxGlobalSIMGrpID){
			   html_globalSIMGrpSelData = globalSIMGrpSelData[i][1];
			   break;
		   } 
	     }
	   }
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" width=\"32%\"> "+$.i18n(tbI18n+"idxGlobalSIMGrpID")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_globalSIMGrpSelData+"</div></td></tr>";
 	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" width=\"32%\" > "+$.i18n(tbI18n+"imsi")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].imsi+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\"  width=\"32%\"> "+$.i18n(tbI18n+"imei")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].imei+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\"  width=\"32%\"> "+$.i18n(tbI18n+"status")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\"><i class=\"img-fmt simp-dev-sta-"+mydata[number].status+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\"  width=\"32%\"> "+$.i18n(tbI18n+"number")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].number+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\"  width=\"32%\"> "+$.i18n(tbI18n+"balance")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata[number].balance)/1000+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\"  width=\"32%\"> "+$.i18n(tbI18n+"lastQryDate")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].lastQryDate+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\"  width=\"32%\"> "+$.i18n(tbI18n+"netData")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata[number].netData)/1000+"</div></td></tr>";
	    
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxViFiID")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].idxViFiID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"billingDate")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].billingDate+"</div></td></tr>";
 	   
 	    var i18nTextQryType = $.i18n(tbI18n+"qryType.comData");  
	    var html_qryType = "";
	    for(var i=0; i<i18nTextQryType.length; i++){ 
	    	if(i18nTextQryType[i][0] == mydata[number].qryType){
	    		html_qryType = i18nTextQryType[i][1];
	    	} 
	    }
	    
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"qryType")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_qryType+"</div></td></tr>";
	  
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"qryResult")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].qryResult+"</div></td></tr>";
 	   var lastTopupDate = mydata[number].lastTopupDate?mydata[number].lastTopupDate:"";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"lastTopupDate")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+lastTopupDate+"</div></td></tr>";
	   var lastTopupValue = mydata[number].lastTopupValue?mydata[number].lastTopupValue:"";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"lastTopupValue")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+lastTopupValue+"</div></td></tr>";
 	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"remarks")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].remarks+"</div></td></tr>"; 
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfTm")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].mdfTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfBy")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].mdfBy+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtTm")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].crtTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtBy")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].crtBy+"</div></td></tr>";
 	   $("#html_viewDetails").html(html_viewDetails);
 	   myopenModel('mydetailModal','detail'); 
 	  
    } 
    
    //清空编辑表单
	function myclearForm(){
		$("#keyGlobalSIMID1").val(""); 
    	$("#keyGlobalSIMID1").removeAttr("disabled");
    	$("#idxGlobalSIMGrpID1").val("");   
    	//$("#imsi1").val(""); 
    	//$("#imei1").val("");   
    	$("#status1").val("");  
    	$("#number1").val("");   
    	$("#balance1").val("");    
    	$("#remarks1").val(""); 
    	
    	$("#idxViFiID1").val(""); 
    	$("#idxViFiID1").select2(); 
    	$("#billingDate1").val("0");   
    	$("#qryType1").val("1");  
    	$("#qryResult1").val("");   
    	$("#lastTopupDate1").val("");    
    	$("#lastTopupValue1").val("");  
    }
    
	//清空搜索条件表单
	function myclearSearchItems(){
		$("#keyGlobalSIMID").val("");  
    	$("#idxGlobalSIMGrpID").val("");   
    	$("#status").val(""); 
    	$("#number").val("");     
    	$("#balance").val(""); 
    	$("#netData").val("");  
	}
	
	//列表展示数据转换
	function changeData(tdname,showLengthData,dataTdValue){ 
		var html = "";
		if(tdname=="status"){  
			   var i18nText = $.i18n(tbI18n+"status.comData");  
			   var value = parseInt(dataTdValue); 
			   var i18text_value = i18nText[value];
			   var i18nText_get = "UNKNOWN";
			   if(i18text_value){
				   var i18nText_get = i18nText[value][1]; 
			   }
			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\"><i class=\"img-fmt simp-dev-sta-"+dataTdValue+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td>"; 
		}else if(tdname=="balance"){
			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+parseFloat(dataTdValue)/1000+"</div></td>"; 
		}else if(tdname=="netData"){
			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+parseFloat(dataTdValue)/1000+"</div></td>"; 
		}else if(tdname=="idxGlobalSIMGrpID"){
			   var globalSIMGrpSelData = selectPermissionsInfo.globalSIMGrpSelData;  
			   var html_globalSIMGrpSelData = "";
			   if(globalSIMGrpSelData != null){
	    	     for(var i=0; i<globalSIMGrpSelData.length; i++){   
	    		   if(globalSIMGrpSelData[i][0]==dataTdValue){
	    			   html_globalSIMGrpSelData = globalSIMGrpSelData[i][1]; 
	    			   break;
	    		   } 
	  	         } 
			   }
			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_globalSIMGrpSelData+"</div></td>"; 
		}else if(tdname=="qryType"){
			   var i18nTextQryType = $.i18n(tbI18n+"qryType.comData");   
	    	   for(var i=0; i<i18nTextQryType.length; i++){   
	    		   if(i18nTextQryType[i][0]==dataTdValue){
	    			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+i18nTextQryType[i][1]+"</div></td>"; 
	    			   break;
	    		   } 
	  	       } 
		}else{
			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+dataTdValue+"</div></td>"; 
		}
		if(!html){
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	} 
	
	function skip2DetailModalG_globalSIMNew(tableId){
		if(tableId && tableId == "global"){
			myCloseModal_Special("myeditModal", undefined, "btnViewDetails");
		}else{//globalGroup
			myCloseModal_Special("myeditModal8", undefined, "btnViewDetails8");
		}
	}
	
	function skip2EditModalG_globalSIMNew(tableId){
		if(tableId && tableId == "global"){
			myCloseModal_Special("mydetailModal");
			myopenModel('myeditModal','edit');
		}else{//globalGroup
			myCloseModal_Special("mydetailModal8");
			myopenModel8('myeditModal8','edit');
		}
	}
	
	// 关闭窗口层
	function myCloseModal_Special(type, isSaveBtn, skipFlag) {
		var next = function(){
			formChangeFlag2mycommon = false;//reset
			$('#' + type).modal('hide');
			if(skipFlag && skipFlag=="btnViewDetails"){
				btnViewDetails();
			}else if(skipFlag && skipFlag=="btnViewDetails8"){
				btnViewDetails8();
			}
		}
		if(!isSaveBtn && formChangeFlag2mycommon){
			layer.confirm($.i18n("frame.from.tips.confirmCancel"),function(idx){
				layer.close(idx);
				next();
			});
		}else{
			next();
		}
	}
	
	/**************************启动卡统计数据  begin************************************************/
	function initTab1CardInfo(){
		$.ajax({
			url:window.PATH + visit_url+"/simStatisticInfo.ajax",
			dataType:"json",
			async:true,
			data:{},
			type:"POST",
			success:function(res){
				var data = res.data;
		        $("#outLineInfo1").html(data[0].countGlobalSIMGrp);//卡组
		        $("#outLineInfo2").html(data[0].countGlobalSIM);//卡数量
		        $("#outLineInfo3").html(data[0].countStatus0);//有效设备
		        $("#outLineInfo4").html(data[0].arrearageCard);//欠费
		        $("#outLineInfo5").html(data[0].countStatus1);//待充值
		        $("#outLineInfo6").html("-");//本月使用
		        $("#outLineInfo7").html("-");//充值金额
		        $("#outLineInfo8").html("-");//日均使用
		        $("#outLineInfo9").html(data[0].chinaAreaCard);//中国卡
		        $("#outLineInfo10").html(data[0].internationalCard);//国际卡
			},
			error:function(){
				
			}
		});
		
	}
	
	function initRecentChargeRecordTable(){
		$.ajax({
			url:window.PATH + visit_url+"/recentCharge.ajax",
			dataType:"json",
			async:true,
			data:{},
			type:"POST",
			success:function(res){
				var data = res.data;
				var len = data.length;
				var tableHtml = "<table  class='table'>";
				for(var i=0; i<3; i++){
					if(i < len){
						tableHtml += "<tr><td>"+data[i].createDate+"</td><td>"+data[i].idxICCID+"</td><td>"+data[i].tbSIMOprRecord+"</td></tr>";
					}else{
						tableHtml += "<tr><td>-</td><td>-</td><td>-</td></tr>";
					}
				}
				tableHtml += "</table>";
				$("#recent-charge-record").html(tableHtml);
			},
			error:function(){
				
			}
		});
	}
	//前30天流量统计样式
	//var initFlowStatisticsCharts = function () {
	//var resultData1 = [];
	//[[3, 10], [4, 13], [5, 12], [6, 16], [7, 19], [8, 19], [9, 24], [10, 19], [11, 18], [12, 21], [13, 17],[14, 14], [15, 12], [16, 14], [17, 15]]
	//var data2 = [{
    //    color: themeprimary,
    //    label: "traffic:",
     //   data: resultData1,
    //    bars: {
    //        order: 1,
     //       show: true,
     //       borderWidth: 0,
    //        barWidth: 0.4,
    //        lineWidth: .5,
    //        fillColor: {
    //            colors: [{
    //                opacity: 0.4
   //             }, {
   //                 opacity: 1
    //            }]
   //         }
   //     }
   // }];
   // var options = {
    //    legend: {
   //         show: false
    //    },
   //     xaxis: {
    //        tickDecimals: 0,
     //       color: '#f3f3f3'
     //   },
      //  yaxis: {
     ///       min: 0,
      //      color: '#f3f3f3',
     //       tickFormatter: function (val, axis) {
      //          return "";
     //       },
        //},
       // grid: {
      //      hoverable: true,
      //      clickable: false,
      //      borderWidth: 0,
      //      aboveData: false,
      //      color: '#fbfbfb'
//
     //   },
     //   tooltip: true,
     //   tooltipOpts: {
     //       defaultTheme: false,
     //       content: " <b>%x May</b> , <b>%s</b> : <span>%y</span>",
     //   }
    //};
    //var placeholder = $("#flow-statistics-charts");
    //var plot = $.plot(placeholder, data2, options);
	//};
	//initFlowStatisticsCharts();
	
	//本月流量top10
    var tops = selectPermissionsInfo.flowTop10;
	var topsLen = tops.length;
	for(var i=0; i<topsLen; i++){
		tops[i].keyWord = tops[i].idxUserId;
		tops[i].keyValue = tops[i].cntDataSum;
	}
    //$("#flow-top-list").html(getTopRankHtml(tops, "rank-list-div", "list", "tools", "tab2"));
    
	/*************************************启动卡统计数据end********************************/
	
	//************************************** 第二个列表的配置 begin **************************// 
    //国际化开头
    var tbI18n8 = "db.tbGlobalSIMGrp.";
    //表的主键
    var tablekey8 = "keyGlobalSIMGrpID";  
    
    //设置存在localStorage 的列表配置名
    var itemName8 = "my_setTrs_globalSIMGrp";
    //设置初始化排序字段
    var MY_ORDER_LIST8 = [];
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems8 = {"resetTimes" : "1","trs": [{"name": "keyGlobalSIMGrpID","show": "false","width":"90"},
               {"name": "groupName","show": "true","width":"80"},
               {"name": "idxSalerID","show": "true","width":"100"},
               {"name": "areaCode","show": "true","width":"130"},
               {"name": "ispId","show": "true","width":"130"},
               {"name": "cardType","show": "true","width":"80"},
               {"name": "cardSize","show": "true","width":"100"},
               {"name": "monthlyRental","show": "true","width":"80"},
               {"name": "dataPrice","show": "true","width":"120"},
               {"name": "roamDataPrice","show": "true","width":"120"}, 
               {"name": "number","show": "true","width":"60"},
               {"name": "remarks","show": "true","width":"128"},  
               {"name": "mdfTm","show": "true","width":"125"},
               {"name": "mdfBy","show": "false","width":"140"},
               {"name": "crtTm","show": "false","width":"140"},
               {"name": "crtBy","show": "false","width":"140"}]
    };
    //设置重置参数
    var resetSelectItems8 = selectItems8;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams8(){   
	    //卡大小
	    var i18nTextCardSize = $.i18n("db.tbSCGroup.cardSize.comData");   
	    var html_cardSize = "";
	    html_cardSize += "<option value=\""+i18nTextCardSize[0][0]+"\">"+i18nTextCardSize[0][1]+"</option>";
	    html_cardSize += "<option value=\""+i18nTextCardSize[1][0]+"\">"+i18nTextCardSize[1][1]+"</option>";
	    html_cardSize += "<option value=\""+i18nTextCardSize[2][0]+"\">"+i18nTextCardSize[2][1]+"</option>";
    	$("#cardSize").append(html_cardSize); 
    	$("#cardSize8").append(html_cardSize); 
    	$("#cardSize").select2();
    	$("#cardSize8").select2();
    	//网络类型
    	var i18nTextCardType = $.i18n("db.tbSCGroup.cardType.comData");   
	    var html_cardType = "";
	    html_cardType += "<option value=\""+i18nTextCardType[0][0]+"\">"+i18nTextCardType[0][1]+"</option>";
	    html_cardType += "<option value=\""+i18nTextCardType[1][0]+"\">"+i18nTextCardType[1][1]+"</option>";
	    html_cardType += "<option value=\""+i18nTextCardType[2][0]+"\">"+i18nTextCardType[2][1]+"</option>";
    	$("#cardType").append(html_cardType); 
    	$("#cardType8").append(html_cardType); 
    	$("#cardType").select2();
    	$("#cardType8").select2();
    	//设置运营商和地区编号下来框
    	setIspSelDataAndAreaSelData();
    	
    	//洲
	    var i18nTextContinent = $.i18n("continent.comData");    
	    var textContinent = "";
	    textContinent += "<option value=\""+i18nTextContinent[1][0]+"\">"+i18nTextContinent[1][1]+"</option>";
	    textContinent += "<option value=\""+i18nTextContinent[2][0]+"\">"+i18nTextContinent[2][1]+"</option>";
	    textContinent += "<option value=\""+i18nTextContinent[3][0]+"\">"+i18nTextContinent[3][1]+"</option>";
	    textContinent += "<option value=\""+i18nTextContinent[4][0]+"\">"+i18nTextContinent[4][1]+"</option>";
	    textContinent += "<option value=\""+i18nTextContinent[5][0]+"\">"+i18nTextContinent[5][1]+"</option>";
	    textContinent += "<option value=\""+i18nTextContinent[6][0]+"\">"+i18nTextContinent[6][1]+"</option>";
	    textContinent += "<option value=\""+i18nTextContinent[7][0]+"\">"+i18nTextContinent[7][1]+"</option>";
	    $("#continent").append(textContinent); 
    	
    }
    
    function setIspSelDataAndAreaSelData(){
    	//运营商
    	var ispSelData = selectPermissionsInfo.ispSelData;  
    	var html_ispSelData = "";
    	if(ispSelData!=null){
    	  for(var i=0; i<ispSelData.length; i++){   
    		 html_ispSelData += "<option value=\""+ispSelData[i][0]+"\">"+ispSelData[i][1]+"</option>";
  	      }
    	}
    	if($("#ispId").find("option").length<2)
    		$("#ispId").append(html_ispSelData); 
    	if($("#ispId8").find("option").length<2)
    		$("#ispId8").append(html_ispSelData); 
    	
    	//地区编号
    	var areaSelData = selectPermissionsInfo.areaSelData;  
    	var html_areaSelData = "";
    	if(areaSelData!=null){
    	  for(var i=0; i<areaSelData.length; i++){   
    		 html_areaSelData += "<option value=\""+areaSelData[i][0]+"\">"+areaSelData[i][1]+"</option>";
  	      } 
    	}
    	if($("#areaCode").find("option").length<2)
    		$("#areaCode").append(html_areaSelData);
    	if($("#areaCode8").find("option").length<2)
    		$("#areaCode8").append(html_areaSelData);
    }
    
    function checkContinent(){ 
    	var thisSelect = $("#continent").val();
    	//地区编号
    	var areaSelData = selectPermissionsInfo.areaSelData;  
    	var html_areaSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbCDR.countryCode.help")+"</option>";
    	if(areaSelData!=null){
    	  for(var i=0; i<areaSelData.length; i++){   
    		 if(areaSelData[i][2]==thisSelect){
    		    html_areaSelData += "<option value=\""+areaSelData[i][0]+"\">"+areaSelData[i][1]+"</option>";
    		 }
  	      }
    	}
    	$("#areaCode8").html(html_areaSelData);  
    	$("#areaCode8").select2()
    	//重置验证
    	$("#registrationForm8").data('bootstrapValidator').resetForm();
    }
    
    function checkareaCode(){ 
    	var thisSelect = $("#areaCode8").val();
    	//运营商编号
    	var ispSelData = selectPermissionsInfo.ispSelData;  
    	var html_ispSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbGlobalSIMGrp.ispId.help")+"</option> ";
    	if(ispSelData!=null){
    	  for(var i=0; i<ispSelData.length; i++){   
    		 if(ispSelData[i][2]==thisSelect){
    		    html_ispSelData += "<option value=\""+ispSelData[i][0]+"\">"+ispSelData[i][1]+"</option>";
    		 }
  	      }
    	}
    	$("#ispId8").html(html_ispSelData);  
    	$("#ispId8").select2();
    	//重置验证
    	$("#registrationForm8").data('bootstrapValidator').resetForm();
    } 
    
    //获取查询条件
    function mygetSearchParams8() {
        var params = '{'; 
        
        if($("#keyGlobalSIMGrpID").val()!="" && $("#keyGlobalSIMGrpID").val()!=null){ 
        	params +="\"cx_LIKE-|-keyGlobalSIMGrpID\":"+"\""+$("#keyGlobalSIMGrpID").val()+"\",";  
        } 
        
        if($("#groupName").val()!="" && $("#groupName").val()!=null){ 
        	params +="\"cx_LIKE-|-groupName\":"+"\""+$("#groupName").val()+"\",";  
        }
        
        if($("#idxSalerID").val()!="" && $("#idxSalerID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxSalerID\":"+"\""+$("#idxSalerID").val()+"\",";  
        }
        
        if($("#areaCode").val()!="" && $("#areaCode").val()!=null){ 
        	params +="\"cx_LIKE-|-areaCode\":"+"\""+$("#areaCode").val()+"\",";  
        } 
        
        if($("#cardType").val()!="" && $("#cardType").val()!=null){ 
        	params +="\"cx_LIKE-|-cardType\":"+"\""+$("#cardType").val()+"\",";  
        }
        
        if($("#ispId").val()!="" && $("#ispId").val()!=null){ 
        	params +="\"cx_LIKE-|-ispId\":"+"\""+$("#ispId").val()+"\",";  
        } 
        
        if($("#cardSize").val()!="" && $("#cardSize").val()!=null){ 
        	params +="\"cx_LIKE-|-cardSize\":"+"\""+$("#cardSize").val()+"\",";  
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
        var params = eval('(' + params + ')');    
        return params;
    }
    
    //查看详情方法
    function viewDetails8(number){   
       var html_viewDetails = ""; 
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" width=\"32%\" > "+$.i18n(tbI18n8+"keyGlobalSIMGrpID")+": </td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].keyGlobalSIMGrpID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"groupName")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].groupName+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxSalerID")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].idxSalerID+"</div></td></tr>";
  
 	   var areaSelData = selectPermissionsInfo.areaSelData; 
 	   var html_areaSelData = "";
 	   if(areaSelData!=null){
         for(var i=0; i<areaSelData.length; i++){   
  		   if(areaSelData[i][0]==mydata8[number].areaCode){ 
  			  html_areaSelData = areaSelData[i][1];
  			  break;
  		   }
	     }
 	   }
       html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"areaCode")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_areaSelData+"</div></td></tr>";
 	    
 	   var ispSelData = selectPermissionsInfo.ispSelData; 
 	   var html_ispSelData = "";
	   if(ispSelData!=null){
         for(var i=0; i<ispSelData.length; i++){   
  		   if(ispSelData[i][0]==mydata8[number].ispId){
  			  html_ispSelData = ispSelData[i][1];
  			  break;
  		   }
	     } 
	   }
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"ispId")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_ispSelData+"</div></td></tr>";
       
 	    var i18nTextCardType = $.i18n("db.tbSCGroup.cardType.comData");   
	    var html_cardType = "";
		if(i18nTextCardType[0][0]==mydata8[number].cardType){ 
			html_cardType = i18nTextCardType[0][1];
		}else if(i18nTextCardType[1][0]==mydata8[number].cardType){ 
			html_cardType = i18nTextCardType[1][1];
		}else if(i18nTextCardType[2][0]==mydata8[number].cardType){ 
			html_cardType = i18nTextCardType[2][1];
		}
		html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"cardType")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_cardType+"</div></td></tr>";
	
		var html_cardSize = $.i18n("db.tbSCGroup.cardSize.comData");   
	    var html_cardSize1 = "";
		if(html_cardSize[0][0]==mydata8[number].cardSize){ 
			html_cardSize1 = html_cardSize[0][1];
		}else if(html_cardSize[1][0]==mydata8[number].cardSize){ 
			html_cardSize1 = html_cardSize[1][1];
		}else if(html_cardSize[2][0]==mydata8[number].cardSize){ 
			html_cardSize1 = html_cardSize[2][1];
		}  
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"cardSize")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_cardSize1+"</div></td></tr>";
 	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"monthlyRental")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata8[number].monthlyRental)/1000+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"roamDataPrice")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata8[number].roamDataPrice)/1000+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"dataPrice")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata8[number].dataPrice)/1000+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"number")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].number+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"remarks")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].remarks+"</div></td></tr>"; 
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfTm")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].mdfTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfBy")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].mdfBy+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtTm")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].crtTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtBy")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].crtBy+"</div></td></tr>";
 	   $("#html_viewDetails8").html(html_viewDetails);
 	   myopenModel8('mydetailModal8','detail');   
 	  
    } 
    
    //获取编辑的内容
    function mygetSaveData8() { 
        var params1 = '{';   
        	params1 +="\"groupName\":"+"\""+$("#groupName8").val()+"\",";   
        	params1 +="\"idxSalerID\":"+"\""+$("#idxSalerID8").val()+"\","; 
        	params1 +="\"areaCode\":"+"\""+$("#areaCode8").val()+"\",";   
        	params1 +="\"ispId\":"+"\""+$("#ispId8").val()+"\",";  
        	params1 +="\"cardType\":"+"\""+$("#cardType8").val()+"\",";   
        	params1 +="\"cardSize\":"+"\""+$("#cardSize8").val()+"\",";  
        	params1 +="\"remarks\":"+"\""+$("#remarks8").val()+"\","; 
        	params1 +="\"monthlyRental\":"+"\""+parseFloat($("#monthlyRental8").val())*1000+"\",";   
        	params1 +="\"dataPrice\":"+"\""+parseFloat($("#dataPrice8").val())*1000+"\",";  
        	params1 +="\"roamDataPrice\":"+"\""+parseFloat($("#roamDataPrice8").val())*1000+"\",";    
        	
        	
        	if(params1 != '{'){
        		if($("#editAddType8").val()=="new"){
        		   params1 += "\"actionName\":"+"\""+$.i18n("new")+"\""; 
        		}else if($("#editAddType8").val()=="edit"){
        		   params1 +="\"keyGlobalSIMGrpID\":"+"\""+$("#keyGlobalSIMGrpID8").val()+"\",";  
        		   params1 += "\"actionName\":"+"\""+$.i18n("edit")+"\""; 
        		} 
        	} 
        params1+='}';   
        var params1 = eval('(' + params1 + ')');   
        return params1;
    }  
        
    //设置编辑框的值
    function setEditItems8(){
    	$("#editAddModel8").removeClass("text-success").addClass("text-primary").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit"));
    	$("#editAddType8").val("edit");
    	var checkedsubList = $("input[name*='List8items']:checked"); //获取选中的name中包含Listitems的值  
    	var arr = checkedsubList[0].value.split("-|-");  
    	$("#keyGlobalSIMGrpID8").val(eval("mydata8["+arr[1]+"].keyGlobalSIMGrpID"));  
    	$("#groupName8").val(eval("mydata8["+arr[1]+"].groupName"));   
    	$("#idxSalerID8").val(eval("mydata8["+arr[1]+"].idxSalerID"));  
    	$("#areaCode8").val(eval("mydata8["+arr[1]+"].areaCode")); 
    	$("#areaCode8").select2();
    	
    	var areaCode = eval("mydata8["+arr[1]+"].areaCode");
    	var areaSelData = selectPermissionsInfo.areaSelData; 
    	if(areaSelData!=null){
    	  for(var i=0; i<areaSelData.length; i++){   
    		if(areaSelData[i][0]==areaCode){
    			$("#continent").val(areaSelData[i][2]);
    			$("#continent").select2();
    			break;
    		}
  	      } 
    	} 
    	
    	
    	$("#cardType8").val(eval("mydata8["+arr[1]+"].cardType"));   
    	$("#cardSize8").val(eval("mydata8["+arr[1]+"].cardSize"));   
    	$("#monthlyRental8").val(parseFloat(eval("mydata8["+arr[1]+"].monthlyRental"))/1000);  
    	$("#dataPrice8").val(parseFloat(eval("mydata8["+arr[1]+"].dataPrice"))/1000);   
    	$("#roamDataPrice8").val(parseFloat(eval("mydata8["+arr[1]+"].roamDataPrice"))/1000);  
    	$("#remarks8").val(eval("mydata8["+arr[1]+"].remarks"));   
    	checkareaCode();//初始化时，运营商的下拉框根据地区编号来
    	$("#ispId8").val(eval("mydata8["+arr[1]+"].ispId"));  
  	    $("#ispId8").select2();
    }
    
    //清空编辑表单
	function myclearForm8(){
		$("#keyGlobalSIMGrpID8").val("");  
    	$("#groupName8").val("");   
    	$("#idxSalerID8").val(""); 
    	$("#ispId8").val("");   
    	$("#cardType8").val("");  
    	$("#cardSize8").val("");   
    	$("#monthlyRental8").val(""); 
    	$("#dataPrice8").val("");  
    	$("#roamDataPrice8").val("");   
    	$("#remarks8").val(""); 
    	
    	//设置运营商和地区编号下来框
    	setIspSelDataAndAreaSelData(); 
        $("#continent").val("");
        $("#continent").select2();
        $("#areaCode8").val("");
        $("#areaCode8").select2();
        $("#ispId8").val("");
        $("#ispId8").select2();
    }
    
	//清空搜索条件表单
	function myclearSearchItems8(){
		$("#keyGlobalSIMGrpID").val("");  
    	$("#groupName").val("");   
    	$("#idxSalerID").val(""); 
    	$("#areaCode").val("");   
    	$("#areaCode").select2();
    	$("#cardType").val(""); 
    	$("#cardType").select2();
    	$("#ispId").val("");  
    	$("#ispId").select2();
    	$("#cardSize").val(""); 
    	$("#cardSize").select2();
	}
	
	//列表展示数据转换
	function changeData8(tdname,showLengthData,dataTdValue){
		var html = "";
		if(tdname=="monthlyRental"||tdname=="roamDataPrice"||tdname=="dataPrice"){   
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+parseFloat(dataTdValue)/1000+"</div></td>";
		}else if(tdname=="areaCode"){   
			var areaSelData = selectPermissionsInfo.areaSelData; 
			var html_areaSelData = "";
			if(areaSelData!=null){
	    	  for(var i=0; i<areaSelData.length; i++){   
	    		if(areaSelData[i][0]==dataTdValue){ 
	    			html_areaSelData = areaSelData[i][1];
	    			break;
	    		}
	  	      } 
			}
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_areaSelData+"</div></td>";
		}else if(tdname=="ispId"){    
	    	var ispSelData = selectPermissionsInfo.ispSelData;
	    	var html_ispSelData = "";
	    	if(ispSelData!=null){
	    	  for(var i=0; i<ispSelData.length; i++){   
	    		if(ispSelData[i][0]==dataTdValue){
	    			html_ispSelData = ispSelData[i][1];
	    			break;
	    		}
	  	      }
	    	}
	    	html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_ispSelData+"</div></td>";
		}else if(tdname=="cardType"){      
			var i18nTextCardType = $.i18n("db.tbSCGroup.cardType.comData");   
		    var html_cardType = "";
			if(i18nTextCardType[0][0]==dataTdValue){ 
				html_cardType = i18nTextCardType[0][1];
			}else if(i18nTextCardType[1][0]==dataTdValue){ 
				html_cardType = i18nTextCardType[1][1];
			}else if(i18nTextCardType[2][0]==dataTdValue){ 
				html_cardType = i18nTextCardType[2][1];
			}   
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_cardType+"</div></td>"; 
		}else if(tdname=="cardSize"){      
			var html_cardSize = $.i18n("db.tbSCGroup.cardSize.comData");   
		    var html_cardSize1 = "";
			if(html_cardSize[0][0]==dataTdValue){ 
				html_cardSize1 = html_cardSize[0][1];
			}else if(html_cardSize[1][0]==dataTdValue){ 
				html_cardSize1 = html_cardSize[1][1];
			}else if(html_cardSize[2][0]==dataTdValue){ 
				html_cardSize1 = html_cardSize[2][1];
			}   
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_cardSize1+"</div></td>"; 
		}else{
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+dataTdValue+"</div></td>"; 
		}
		if(!html){
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	}
	 
    
   //************************************** 第二个列表的配置 end **************************// 
    
    $(function(){  
        //统计
    	//initTab1CardInfo();
    	//initRecentChargeRecordTable();
        
    	//根据权限设置 增删改查按钮的显示
        setpermsion();  
        setpermsion8();
    	
    	//初始化编辑框验证表单
        var validator_language = window.LANGUAGE;
        if(window.LANGUAGE != "zh_CN"){
        	validator_language = "en_US";
        }
    	$('#registrationForm1').bootstrapValidator({ 
                excluded: [':disabled'],
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                submitHandler: function (validator, form, submitButton) {
                	dosave(); 
                },   
                fields: { 
                	keyGlobalSIMID: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            },stringLength:{
                            	min: 0,
                            	max: 64,
                            	message: eval('validator_'+validator_language+'.rangelength').replace('{0}','0').replace('{1}','64')
                            }
                        }
                    },idxGlobalSIMGrpID: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    //},imsi: {
                    //    validators: {
                    //        notEmpty: {
                    //            message: eval('validator_'+validator_language+'.required')
                    //        }
                    //    }
                    //},imei: {
                    //    validators: {
                    //        notEmpty: {
                    //            message: eval('validator_'+validator_language+'.required')
                    //        },regexp: {
                    //            regexp: /^[1-9]\d*$/,
                    //            message: eval('validator_'+validator_language+'.digits')
                    //        },stringLength: {
                    //            min: 15,
                    //            max: 15,
                    //            message: eval('validator_'+validator_language+'.range').replace('{0}','15').replace('{1}','15')
                    //        }
                    //    }
                    },number:{
                    	validators: {
                    		notEmpty: {
                    			message: eval('validator_'+validator_language+'.required')
                    		},stringLength:{
                            	min: 0,
                            	max: 32,
                            	message: eval('validator_'+validator_language+'.rangelength').replace('{0}','0').replace('{1}','32')
                            }
                    	}
                    },qryResult: {
                    	validators: {
                    		notEmpty: {
                    			message: eval('validator_'+validator_language+'.required')
                    		},stringLength:{
                            	min: 0,
                            	max: 256,
                            	message: eval('validator_'+validator_language+'.rangelength').replace('{0}','0').replace('{1}','256')
                            }
                    	}
                    },status: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },balance: {
                        validators: {
                            between:{
                            	min: 0,
                            	max: 999999,
                            	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','999999')
                            },decimals:{
                            	digits:3,
                            	message: eval('validator_'+validator_language+'.decimals').replace('{0}','3')
                            }
                        }
                    },billingDate: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },lastTopupValue: {
                        validators: {
                        	between:{
                            	min: 0,
                            	max: 999999,
                            	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','999999')
                            },integer: {
                            	message: eval('validator_'+validator_language+'.digits')
                            }
                        }
                    },remarks: {
                    	validators: {
                    		stringLength:{
                    			min:0,
                    			max:128,
                    			message: eval('validator_'+validator_language+'.rangelength').replace('{0}','0').replace('{1}','128')
                    		}
                    	}
                    }
                }
        }); 
    	
    	mydelayedInit();  //初始化窗口
    	setSelectPageSize(); //设置分页数量下拉框的值 
　      setSearchParams(); //设置查询条件中、编辑区域 下拉框的选项值
		setTrs(selectItems); //初始化要显示的列 
		dosearch('1'); //查询列表 
		
		
		$('#registrationForm8').bootstrapValidator({ 
            excluded: [':disabled'],
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            submitHandler: function (validator, form, submitButton) {
            	dosave8(); 
            },   
            fields: { 
            	keyGlobalSIMGrpID: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },groupName: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },stringLength:{
                        	min: 0,
                        	max: 128,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','128')
                        }
                    }
                },idxSalerID: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },stringLength:{
                        	min: 0,
                        	max: 64,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','64')
                        }
                    }
                },continent: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },areaCode: {
                    validators: {
                    	notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },ispId: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },cardType: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },cardSize: {
                    validators: {
                    	notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },monthlyRental: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                		//,regexp: {
                        //   regexp: /^[0-9]\d*(\.\d+)?$/,
                        //    message: eval('validator_'+validator_language+'.number')
                        //}
                		,between:{
                        	min: 0,
                        	max: 999999,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','999999')
                        },decimals:{
                        	digits:3,
                        	message: eval('validator_'+validator_language+'.decimals').replace('{0}','3')
                        }
                    }
                },dataPrice: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },between:{
                        	min: 0,
                        	max: 999999,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','999999')
                        },decimals:{
                        	digits:3,
                        	message: eval('validator_'+validator_language+'.decimals').replace('{0}','3')
                        }
                    }
                },roamDataPrice: {
                    validators: {
                    	notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },between:{
                        	min: 0,
                        	max: 999999,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','999999')
                        },decimals:{
                        	digits:3,
                        	message: eval('validator_'+validator_language+'.decimals').replace('{0}','3')
                        }
                    }
                },remarks: {
                	validators: {
                		stringLength:{
                			min:0,
                			max:128,
                			message: eval('validator_'+validator_language+'.rangelength').replace('{0}','0').replace('{1}','128')
                		}
                	}
                } 
                
            }
        });
		
		mydelayedInit8();  //初始化窗口
    	//setSelectPageSize8(); //设置分页数量下拉框的值 
　                setSearchParams8(); //设置查询条件中、编辑区域 下拉框的选项值
		setTrs8(selectItems8); //初始化要显示的列 
		dosearch8('1'); //查询列表  
		
		
		//设置其它标签页的高度
		//var winHeight = document.documentElement.clientHeight;
		//$("#state_tab").css("height", winHeight-170); 
		
		//测试表格模板内容
		var valFormat_AreaCode = function(value){
			var data = selectPermissionsInfo.areaSelData;
			return matchServiceData2Alias(data, value);
		}
		var valFormat_IspId = function(value){
			var data = selectPermissionsInfo.ispSelData;
			return matchServiceData2Alias(data, value);
		}
		var valFormat_cardType = function(value){
		   	return matchComdata2Alias("db.tbSCGroup.cardType.comData", value);
		}
		var valFormat_cardSize = function(value){
		   	return matchComdata2Alias("db.tbSCGroup.cardSize.comData", value);
		}
	    var selectItems1 = {resetTimes : "1",  tableKey : "keyGlobalSIMGrpID", i18nPrefix:"db.tbGlobalSIMGrp.",
				trs: [
	               {name: "keyGlobalSIMGrpID", show: "false", width:"90"},
	               {name: "groupName", show: "true", width:"120"},
	               {name: "idxSalerID", show: "true", width:"120"},
	               {name: "areaCode", show: "true", width:"130", valFormat:"valFormat_AreaCode"},
	               {name: "ispId", show: "true", width:"120", valFormat:"valFormat_IspId"},
	               {name: "cardType", show: "true", width:"100", valFormat:"valFormat_cardType"},
	               {name: "cardSize", show: "true", width:"100", valFormat:"valFormat_cardSize"},
	               {name: "monthlyRental", show: "true", width:"100", ratio:1000},
	               {name: "dataPrice", show: "true", width:"120", ratio:1000},
	               {name: "roamDataPrice", show: "true", width:"120", ratio:1000}, 
	               {name: "number", show: "true", width:"100"},
	               {name: "remarks", show: "true", width:"128"},  
	               {name: "mdfTm", show: "false", width:"125"},
	               {name: "mdfBy", show: "true", width:"90"},
	               {name: "crtTm", show: "false", width:"125"},
	               {name: "crtBy", show: "false", width:"90",}]
	    };
		var requestUrl2 = "/uuwifi/globalSIMNew/";
		//InitTableMoudle("traffic_tab", "traffic-record-tool", requestUrl2, selectItems1, permi, "1");

	
    }); 
    </script> 
	
</body>
 