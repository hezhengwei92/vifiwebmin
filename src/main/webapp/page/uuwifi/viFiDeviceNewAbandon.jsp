
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
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('','state_tab','list','list2_tab')"><i class="fa fa-th font14"></i><spring:message code="tabname.device.viFiDevMess"/></a> 
                  </li>
                  <li class="tab-red" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools8','list2_tab','list','state_tab')"><i class="fa fa-list font14"></i><spring:message code="tabname.device.viFiDevGrp"/></a> 
                  </li>  
                  <li class="tab-purple" id="tab2"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools','list','list2_tab','state_tab')"><i class="fa fa-list font14"></i><spring:message code="tabname.device.viFiDev"/></a>
                  </li> 
                 
                  <!--
                  <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools('false','tabpanle3','list2_tab','list')">图表 </a>
                  </li>  -->
                  
                  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right" style="display:none;"  id="tools">
				    <!-- 详情 --> 
				    <div class="btn blue" style="font-size: 14px;padding: 4px 12px;" id="my_btn_detail" onclick="btnViewDetails()">
                        <i class="fa fa-list-alt"></i>
                    </div>
                    
                    <!-- 新增 -->
					<div class=" btn success " style="font-size: 14px;padding: 4px 12px;" id="my_btn_add" onclick="myopenModel('myeditModal','new')" >
                      <i class="fa fa-plus"></i>
                    </div> 
                    <!-- 编辑 -->
					<div  class="btn primary " style="font-size: 14px;padding: 4px 12px;" id="my_btn_edit"  onclick="myopenModel('myeditModal','edit')">
                      <i class="fa fa-edit"></i>
                    </div> 
                    <!-- 删除 -->
					<div  class="btn danger" style="font-size: 14px;padding: 4px 12px;" id="my_btn_delete" onclick="dodelete()" >
                      <i class="fa fa-trash-o"></i>
                    </div> 
                    <input type="file" id="import-csv" class="hidden" accept="text/csv" />
                    <div class="btn darkorange" onclick="$('#import-csv').click()">
			            <i class="fa fa-upload"></i>
			        </div>
			        <div class="btn darkorange"  ng-click="exportCsv($event)">
			            <i class="fa fa-download"></i>
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
                    
                    <!-- 新增 -->
					<div class=" btn success " style="font-size: 14px;padding: 4px 12px;" id="my_btn_add8" onclick="myopenModel8('myeditModal8','new'); hideElement()" >
                      <i class="fa fa-plus"></i>
                    </div> 
                    <!-- 编辑 -->
					<div  class="btn primary " style="font-size: 14px;padding: 4px 12px;" id="my_btn_edit8"  onclick="myopenModel8('myeditModal8','edit')">
                      <i class="fa fa-edit"></i>
                    </div> 
                    <!-- 删除 -->
					<div  class="btn danger" style="font-size: 14px;padding: 4px 12px;" id="my_btn_delete8" onclick="dodelete8()" >
                      <i class="fa fa-trash-o"></i>
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
				  
				      
                </ul>
                
                
                <!-- tab1标签页 -->
                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                
                  <div id="state_tab" class="tab-pane  in active" style="padding-left:20px"> 

                  <div class="row"  style="margin-top:20px"> 
                    <div class="col-lg-6 col-sm-6 col-xs-12">
                       <div class="widget radius-bordered">
                          <div class="widget-header">
                             <span class="widget-caption"><spring:message code="status.vifidevice.info1"/></span> 
                          </div> 
                          <div class="widget-body">
                             <p><spring:message code="status.vifidevice.info2"/>   <a href ="javaScript:showTools9('tools8','tab3','list2_tab','list','state_tab')" id="countViFiDevGrp"></a>  <spring:message code="status.vifidevice.info3"/>，<a href="javaScript:addDeviceGrp()"><spring:message code="status.vifidevice.info4"/></a></p>
                             <p><spring:message code="status.vifidevice.info5"/> 
                               <a href ="javaScript:showTools9('tools','tab2','list','list2_tab','state_tab')" id="countViFiDev"></a>  <spring:message code="status.vifidevice.info6"/> <a href="javaScript:addDevice()">
                               	<spring:message code="status.vifidevice.info7"/>
                               </a>
                              </p>
                          </div> 
                       </div> 
                     </div>
                   </div>
                   
                   <div class="row">  
                     <div class="col-lg-6 col-sm-6 col-xs-12" >
                       <div class="widget radius-bordered">
                          <div class="widget-header">
                             <span class="widget-caption"><spring:message code="status.vifidevice.info10"/></span> 
                          </div> 
                          <div class="widget-body" style="height:350px">
                            <div style="float:left;width:69%;padding:60px 0 0 40px">
                             <span id="countStatus" data-sparkline="pie" data-height="175px" data-width="175px" data-bordercolor="#fafafa"
                                                  data-slicecolors='["#5DB2FF","#8cc474","#f4b400","#d73d32","#981b48"]'>
                                                  
                             </span> 
                             </div>
                             <div style="float:left;width:30%">
                             <div style="margin-top:18px">
                                <h6 class="row-title"><spring:message code="status.vifidevice.info11"/>：<span id="countStatus0"></span></h6> 
                                <br/>
                                <h6 class="row-title before-green"><spring:message code="status.vifidevice.info12"/>：<span id="countStatus1"></span></h6>
                                <br>
                                <h6 class="row-title before-warning"><spring:message code="status.vifidevice.info13"/>：<span id="countStatus2"></span></h6>
                                <br>
                                <h6 class="row-title before-danger"><spring:message code="status.vifidevice.info14"/>：<span id="countStatus3"></span></h6>
                                <br>
                                <h6 class="row-title before-maroon"><spring:message code="status.vifidevice.info15"/>：<span id="countStatus4"></span></h6>
                                <br>
                                <br> 
                             </div> 
                             </div>
                          </div> 
                       </div> 
                     </div>
                   </div>  

				  </div> 
					
						
                  <!-- 列表页签  tab viFiDevice-->
                  <div id="list" class="tab-pane" style="border-radius:0;"> 
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.keyDevID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keyDevID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevice.keyDevID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.idxViFiID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxViFiID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevice.idxViFiID.help"/>" > 
                               </div>
                             </div>
                          </div>  
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.idxVNSID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxVNSID" style="width: 100%;"  placeholder="<spring:message code="db.tbViFiDevice.idxVNSID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbViFiDevice.idxVNSID.help"/></option>
                                  </select>
                               </div>
                             </div>
                          </div>
                        
                           
                        </div> 
                        
                        <div class="row ng-scope">   
                            
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.devState"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="devState" style="width: 100%;"  placeholder="<spring:message code="db.tbViFiDevice.devState.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbViFiDevice.devState.help"/></option>
                                  </select>
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.idxAgentID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxAgentID" style="width: 100%;"  placeholder="<spring:message code="db.tbViFiDevice.idxAgentID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbViFiDevice.idxAgentID.help"/></option>
                                  </select>
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.hardwareVer"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="hardwareVer" style="width: 100%;"  placeholder="<spring:message code="db.tbViFiDevice.hardwareVer.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbViFiDevice.hardwareVer.help"/></option>
                                  </select>
                               </div>
                             </div>           
                          </div> 
                          </div>
                        <div class="row ng-scope"> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevice.firmwareVer"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="firmwareVer" style="width: 100%;"  placeholder="<spring:message code="db.tbViFiDevice.firmwareVer.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbViFiDevice.firmwareVer.help"/></option>
                                  </select>
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.softwareVer"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="softwareVer" style="width: 100%;"  placeholder="<spring:message code="db.tbViFiDevGroup.softwareVer.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbViFiDevGroup.softwareVer.help"/></option>
                                  </select>
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
                    <div class="row foot-tools" id="foot_page_tools">
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
                  
                  
                  
                  <!-- 状态页签  tab viFiDevGroup-->
                  <div id="list2_tab" class="tab-pane" style="border-radius:0;">
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search8">
                      <div class="panel-body">
                       
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.keyDevGrpID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keyDevGrpID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.keyDevGrpID.help"/>" > 
                               </div>
                             </div>           
                          </div>
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.name"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="name"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.name.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.productionNo"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="productionNo"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.productionNo.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.productionVer"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="productionVer"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.productionVer.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                        </div> 
                        
                        <div class="row ng-scope">   
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.hardwareVer"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="hardwareVerGrp"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.hardwareVer.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.firmwareVer"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="firmwareVerGrp"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.firmwareVer.help"/>" > 
                               </div>
                             </div>
                           </div>           
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbViFiDevGroup.softwareVer"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="softwareVerGrp"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbViFiDevGroup.softwareVer.help"/>" > 
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
                    <div class="row foot-tools" id="foot_page_tools8">
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
			            <spring:message code="db.tbViFiDevice.alaisName"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="alaisName1" name="alaisName" placeholder="<spring:message code="db.tbViFiDevice.alaisName.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
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
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbViFiDevGroup.productionDate"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input  type="text" id="productionDate8" name="productionDate"  placeholder="<spring:message code="db.tbViFiDevGroup.productionDate.help"/>"  
                    	class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm " 
                    	onclick="laydate({istime: true, format: 'YYYY-MM-DD'})"> 
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
		</script>
		
		<!--  //tab viFiDevice  -->
		<script>
			
			//访问路径
			var visit_url = "/uuwifi/viFiDeviceNew";
			//国际化开头
			var tbI18n = "db.tbViFiDevice.";
			//表的主键
			var tablekey = "keyDevID";
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
		    var itemName = "my_setTrs_viFiDeviceNew";
		    //设置初始化排序字段
		    var MY_ORDER_LIST = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems = {"resetTimes" : "1","trs": [
   		       	  {"name": "keyDevID","show": "true","width":"100"},
   		       	  {"name": "alaisName", "show": "true", "width": "100"},
                  {"name": "idxViFiID","show": "true","width":"180"},
                  {"name": "pwd","show": "false","width":"180"},
                  {"name": "idxDevGrpID","show": "false","width":"150"},
                  {"name": "idxVNSID","show": "true","width":"100"},
                  {"name": "devState","show": "true","width":"100"},
                  //{"name": "cos","show": "true","width":"100"},
                  {"name": "idxUserID","show": "true","width":"125"},
                  {"name": "idxAgentID","show": "true","width":"125"}, 
                  //{"name": "redirectTimes","show": "true","width":"60"},
                  //{"name": "lastRedirectDate","show": "false","width":"80"},
                  //{"name": "expire","show": "false","width":"100"},
                  //{"name": "lastDomain","show": "false","width":"125"},
                  {"name": "debugIdt","show": "false","width":"100"},  
                  //{"name": "updateIdt","show": "true","width":"220"}, 
                  {"name": "hardwareVer","show": "true","width":"125"},
                  {"name": "firmwareVer","show": "true","width":"125"},
                  {"name": "softwareVer","show": "true","width":"125"},
                  {"name": "lastUpdateDate","show": "false","width":"125"},
                  {"name": "lastConnectTime","show": "false","width":"125"},
                  {"name": "lastConnectIP","show": "false","width":"125"},
                  {"name": "remark","show": "false","width":"125"},
                  {"name": "mdfTm","show": "true","width":"125"},
                  {"name": "mdfBy","show": "false","width":"125"},
                  {"name": "crtTm","show": "false","width":"125"},
                  {"name": "crtBy","show": "false","width":"125"}]
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
				}else if(tdname=="idxDevGrpID" || tdname=="idxAgentID" || tdname=="idxVNSID" || tdname=="firmwareVer" || tdname=="hardwareVer" || tdname=="softwareVer"){
					   var selData = null;  
					   if(tdname=="idxDevGrpID"){
						   selData = selectPermissionsInfo.devGroupSelData;   
					   }else if(tdname=="idxAgentID"){
						   selData = selectPermissionsInfo.agentSelData;
					   }else if(tdname=="idxVNSID"){
						   selData = selectPermissionsInfo.vnsSelData;
					   }else if(tdname=="firmwareVer"){
						   selData = selectPermissionsInfo.firmwareVerSelData;
					   }else if(tdname=="hardwareVer"){
						   selData = selectPermissionsInfo.hardwareVerSelData;
					   }else if(tdname=="softwareVer"){
						   selData = selectPermissionsInfo.softwareVerSelData;
					   }
					   var html_SelData = "";
					   if(selData != null){
			    	     for(var i=0; i<selData.length; i++){   
			    		   if(selData[i][0]==dataTdValue){
			    			   html_SelData = selData[i][1]; 
			    			   break;
			    		   } 
			  	         } 
					   }
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_SelData+"</div></td>"; 
				}else if(tdname=="debugIdt"){
					   var i18nText = $.i18n(tbI18n+"debugIdt.comData"); 
					   if(i18nText !=null){
				    	   for(var i=0; i<i18nText.length; i++){   
				    		   if(i18nText[i][0]==dataTdValue){
				    			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+i18nText[i][1]+"</div></td>"; 
				    			   break;
				    		   } 
				  	       } 
					   }
				}else{
					   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
				return html;
			}
		    
			
			/********** 详情 ************/
			 //查看详情方法
		    function viewDetails(number){  
		       var html_viewDetails = ""; 
		       
		 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"keyDevID")+": </td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].keyGlobalSIMID+"</div></td></tr>";
			   html_viewDetails += setViewTr($.i18n(tbI18n+"keyDevID"),mydata[number].keyDevID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxViFiID"),mydata[number].idxViFiID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"pwd"),mydata[number].pwd);
			   
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxDevGrpID"),getValue(selectPermissionsInfo.devGroupSelData,mydata[number].idxDevGrpID));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxVNSID"),getValue(selectPermissionsInfo.vnsSelData,mydata[number].idxVNSID));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"devState"),getValue($.i18n(tbI18n+"devState.comData"),mydata[number].devState));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxUserID"),mydata[number].idxUserID);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"idxAgentID"),getValue(selectPermissionsInfo.agentSelData,mydata[number].idxAgentID));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"debugIdt"),getValue($.i18n(tbI18n+"debugIdt.comData"),mydata[number].debugIdt));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"hardwareVer"),getValue(selectPermissionsInfo.hardwareVerSelData,mydata[number].hardwareVer));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"firmwareVer"),getValue(selectPermissionsInfo.firmwareVerSelData,mydata[number].firmwareVer));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"softwareVer"),getValue(selectPermissionsInfo.softwareVerSelData,mydata[number].softwareVer));
			   html_viewDetails += setViewTr($.i18n(tbI18n+"lastUpdateDate"),mydata[number].lastUpdateDate);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"lastConnectIP"),mydata[number].lastConnectIP);
			   html_viewDetails += setViewTr($.i18n(tbI18n+"remark"),mydata[number].remark);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),mydata[number].mdfTm);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),mydata[number].mdfBy);
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
		    	$("#editAddModel").removeClass("text-success").addClass("text-primary").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit"));
		    	$("#editAddType").val("edit");
		    	var checkedsubList = $("input[name*='Listitems']:checked"); //获取选中的name中包含Listitems的值  
		    	var arr = checkedsubList[0].value.split("-|-");  
		    	$("#keyDevID1").val(eval("mydata["+arr[1]+"].keyDevID")); 
		    	$("#keyDevID1").attr("disabled","disabled");
		    	
		    	$("#idxViFiID1").val(eval("mydata["+arr[1]+"].idxViFiID"));   
		    	$("#idxViFiID1").attr("disabled","disabled");
		    	
		    	$("#pwd1").val(eval("mydata["+arr[1]+"].pwd")); 
		    	$("#pwd1").attr("disabled","disabled");
		    	
		    	$("#alaisName1").val(eval("mydata["+arr[1]+"].alaisName"));   
		    	$("#idxDevGrpID1").val(eval("mydata["+arr[1]+"].idxDevGrpID"));   
		    	$("#idxVNSID1").val(eval("mydata["+arr[1]+"].idxVNSID"));   
		    	$("#devState1").val(eval("mydata["+arr[1]+"].devState"));   
		    	$("#idxUserID1").val(eval("mydata["+arr[1]+"].idxUserID"));  
		    	$("#idxAgentID1").val(eval("mydata["+arr[1]+"].idxAgentID"));   
		    	$("#debugIdt1").val(eval("mydata["+arr[1]+"].debugIdt"));  
		    	$("#hardwareVer1").val(eval("mydata["+arr[1]+"].hardwareVer"));   
		    	$("#firmwareVer1").val(eval("mydata["+arr[1]+"].firmwareVer"));    
		    	$("#softwareVer1").val(eval("mydata["+arr[1]+"].softwareVer")); 
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
		        var params1 = '{';  
		        	params1 +="\"keyDevID\":"+"\""+$("#keyDevID1").val()+"\",";   
		        	params1 +="\"idxViFiID\":"+"\""+$("#idxViFiID1").val()+"\",";   
		        	params1 +="\"pwd\":"+"\""+$("#pwd1").val()+"\","; 
		        	params1 +="\"idxDevGrpID\":"+"\""+$("#idxDevGrpID1").val()+"\",";   
		        	params1 +="\"idxVNSID\":"+"\""+$("#idxVNSID1").val()+"\",";  
		        	params1 +="\"devState\":"+"\""+$("#devState1").val()+"\",";  
		        	params1 +="\"idxViFiID\":"+"\""+$("#idxViFiID1").val()+"\",";   
		        	params1 +="\"idxUserID\":"+"\""+$("#idxUserID1").val()+"\",";   
		        	params1 +="\"idxAgentID\":"+"\""+$("#idxAgentID1").val()+"\","; 
		        	params1 +="\"debugIdt\":"+"\""+$("#debugIdt1").val()+"\",";   
		        	params1 +="\"hardwareVer\":"+"\""+$("#hardwareVer1").val()+"\",";  
		        	params1 +="\"firmwareVer\":"+"\""+$("#firmwareVer1").val()+"\","; 
		        	params1 +="\"softwareVer\":"+"\""+$("#softwareVer1").val()+"\","; 
		        	params1 +="\"alaisName\":"+"\""+$("#alaisName1").val()+"\","; 
		        	
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
			/********** 编辑 end************/
			
			/***********  删除  ****************/
			/***********  删除 end *************/
			
			/********** 查询 ************/
			//设置查询区、编辑区下拉框的选项值
		    function setSearchParams(){ 
				//VNS 服务器
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
			    $("#devState").append(html_qryType); 
			    $("#devState1").append(html_qryType); 
			    var devGroupSelData = selectPermissionsInfo.devGroupSelData;
			    setOptionData(devGroupSelData,"idxDevGrpID1");
		    	//代理商
		    	var agentSelData = selectPermissionsInfo.agentSelData;  
		    	setOptionData(agentSelData,"idxAgentID");
		    	setOptionData(agentSelData,"idxAgentID1");
		    	//硬件版本
		    	var hardwareVerSelData = selectPermissionsInfo.hardwareVerSelData;  
		    	setOptionData(hardwareVerSelData,"hardwareVer");
		    	setOptionData(hardwareVerSelData,"hardwareVer1");
		    	//固件版本
		    	var firmwareVerSelData = selectPermissionsInfo.firmwareVerSelData;  
		    	setOptionData(firmwareVerSelData,"firmwareVer");
		    	setOptionData(firmwareVerSelData,"firmwareVer1");
		    	//系统版本
		    	var softwareVerSelData = selectPermissionsInfo.softwareVerSelData;  
		    	setOptionData(softwareVerSelData,"softwareVer");
		    	setOptionData(softwareVerSelData,"softwareVer1");
		    	
		    	var i18nText = $.i18n(tbI18n+"debugIdt.comData"); 
		    	setOptionData(i18nText,"debugIdt1");
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
		        
		        if($("#keyDevID").val()!="" && $("#keyDevID").val()!=null){ 
		        	params +="\"cx_LIKE-|-keyDevID\":"+"\""+$("#keyDevID").val()+"\",";  
		        } 
		        
		        if($("#idxViFiID").val()!="" && $("#idxViFiID").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxViFiID\":"+"\""+$("#idxViFiID").val()+"\",";  
		        }
		        
		        if($("#idxVNSID").val()!="" && $("#idxVNSID").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxVNSID\":"+"\""+$("#idxVNSID").val()+"\",";  
		        }
		        
		        if($("#devState").val()!="" && $("#devState").val()!=null){ 
		        	params +="\"cx_LIKE-|-devState\":"+"\""+$("#devState").val()+"\",";  
		        } 
		        if($("#idxAgentID").val()!="" && $("#idxAgentID").val()!=null){ 
		        	params +="\"cx_LIKE-|-idxAgentID\":"+"\""+$("#idxAgentID").val()+"\",";  
		        } 
		        if($("#hardwareVer").val()!="" && $("#hardwareVer").val()!=null){ 
		        	params +="\"cx_LIKE-|-hardwareVer\":"+"\""+$("#hardwareVer").val()+"\",";  
		        } 
		        if($("#firmwareVer").val()!="" && $("#firmwareVer").val()!=null){ 
		        	params +="\"cx_LIKE-|-firmwareVer\":"+"\""+$("#firmwareVer").val()+"\",";  
		        } 
		        if($("#softwareVer").val()!="" && $("#softwareVer").val()!=null){ 
		        	params +="\"cx_LIKE-|-softwareVer\":"+"\""+$("#softwareVer").val()+"\",";  
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
				$("#keyDevID").val("");  
		    	$("#idxViFiID").val("");   
		    	$("#idxVNSID").val(""); 
		    	$("#devState").val("");     
		    	$("#idxAgentID").val(""); 
		    	$("#hardwareVer").val("");  
		    	$("#firmwareVer").val("");  
		    	$("#softwareVer").val("");  
			}
			/********** 查询  end************/
		</script>
		
		
		<!-- // tab ViFiDevGroup -->
		<script>
			
			//国际化开头
		    var tbI18n8 = "db.tbViFiDevGroup.";
		    //表的主键
		    var tablekey8 = "keyDevGrpID";  
		    
		    //设置存在localStorage 的列表配置名
		    var itemName8 = "my_setTrs_viFiDeviceGrp";
		    //设置初始化排序字段
		    var MY_ORDER_LIST8 = [];
		    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
		    var selectItems8 = {"resetTimes" : "1","trs": [
				       {"name": "keyDevGrpID","show": "true","width":"80"},
		               {"name": "name","show": "true","width":"120"},
		               {"name": "productionDate","show": "true","width":"90"},
		               {"name": "productionNo","show": "false","width":"150"},
		               {"name": "productionVer","show": "true","width":"80"},
		               {"name": "hardwareVer","show": "true","width":"120"},
		               {"name": "firmwareVer","show": "true","width":"120"},
		               {"name": "softwareVer","show": "true","width":"120"},
		               {"name": "initNumber","show": "true","width":"80"}, 
		               {"name": "currentNumber","show": "true","width":"80"},
		               {"name": "normalNumber","show": "false","width":"80"},
		               {"name": "repairTimes","show": "false","width":"100"},
		               {"name": "remark","show": "false","width":"150"},
		               {"name": "mdfTm","show": "true","width":"125"},  
		               {"name": "mdfBy","show": "false","width":"80"}, 
		               {"name": "crtTm","show": "false","width":"125"},
		               {"name": "crtBy","show": "false","width":"90"}]
				    };
		    //设置重置参数
		    var resetSelectItems8 = selectItems8;
		    //设置查询区、编辑区下拉框的选项值
		    function setSearchParams8(){   
		    }
		    //列表展示数据转换
			function changeData8(tdname,showLengthData,dataTdValue){
				var html = "";
				if(tdname=="monthlyRental"||tdname=="roamDataPrice"||tdname=="dataPrice"){   
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+parseFloat(dataTdValue)/1000+"</div></td>";
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
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_areaSelData+"</div></td>";
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
			    	html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_ispSelData+"</div></td>";
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
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_cardType+"</div></td>"; 
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
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_cardSize1+"</div></td>"; 
				}else{
					html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
				}
				return html;
			}
		    
			/********** 详情 ************/
			 //查看详情方法
		    function viewDetails8(number){  
		       var html_viewDetails = ""; 
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"keyDevGrpID"),mydata8[number].keyDevGrpID);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"name"),mydata8[number].name);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"productionDate"),mydata8[number].productionDate);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"productionNo"),mydata8[number].productionNo);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"productionVer"),mydata8[number].productionVer);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"hardwareVer"),mydata8[number].hardwareVer);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"firmwareVer"),mydata8[number].firmwareVer);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"softwareVer"),mydata8[number].softwareVer);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"initNumber"),mydata8[number].initNumber);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"currentNumber"),mydata8[number].currentNumber);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"normalNumber"),mydata8[number].normalNumber);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"repairTimes"),mydata8[number].repairTimes);
			   html_viewDetails += setViewTr($.i18n(tbI18n8+"remark"),mydata8[number].remark);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),mydata8[number].mdfTm);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),mydata8[number].mdfBy);
			   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),mydata8[number].crtTm);
			   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),mydata8[number].crtBy);
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
		    function setEditItems8(){
				$("#editAddModel8").removeClass("text-success").addClass("text-primary").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit"));
		    	$("#editAddType8").val("edit");
		    	var checkedsubList = $("input[name*='List8items']:checked"); //获取选中的name中包含Listitems的值  
		    	var arr = checkedsubList[0].value.split("-|-");  
		    	setEditValue(arr[1],"keyDevGrpID",true,"8");
		    	setEditValue(arr[1],"name",false,"8");
		    	setEditValue(arr[1],"productionDate",true,"8");
		    	setEditValue(arr[1],"productionNo",true,"8");
		    	setEditValue(arr[1],"productionVer",true,"8");
		    	setEditValue(arr[1],"hardwareVer",true,"8");
		    	setEditValue(arr[1],"firmwareVer",true,"8");
		    	setEditValue(arr[1],"softwareVer",true,"8");
		    	setEditValue(arr[1],"initNumber",true,"8");
		    	setEditValue(arr[1],"currentNumber",false,"8");
		    	setEditValue(arr[1],"normalNumber",false,"8");
		    	setEditValue(arr[1],"repairTimes",true,"8");
		    	setEditValue(arr[1],"remark",false,"8");
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
		    	$("#keyDevGrpID8").val(""); 
		    	$("#keyDevGrpID8").removeAttr("disabled");
		    	$("#name8").val("");   
		    	$("#productionDate8").val(""); 
		    	$("#productionDate8").removeAttr("disabled");
		    	$("#productionNo8").val("");   
		    	$("#productionNo8").removeAttr("disabled");
		    	$("#productionVer8").val("");   
		    	$("#productionVer8").removeAttr("disabled");
		    	$("#hardwareVer8").val("");   
		    	$("#hardwareVer8").removeAttr("disabled");
		    	$("#firmwareVer8").val("");   
		    	$("#firmwareVer8").removeAttr("disabled");
		    	$("#softwareVer8").val("");   
		    	$("#softwareVer8").removeAttr("disabled");
		    	$("#initNumber8").val("");   
		    	$("#initNumber8").removeAttr("disabled");
		    	$("#currentNumber8").val("");   
		    	$("#normalNumber8").val("");
		    	$("#repairTimes8").val("");   
       			$("#repairTimes8_div").show();
		    	$("#remark8").val("");   
		    }
		   function hideElement(){
			   $("#repairTimes8_div").hide();
		    }
		  //获取编辑的内容
		    function mygetSaveData8() { 
		        var params1 = '{';  
		        	params1 +="\"keyDevGrpID\":"+"\""+$("#keyDevGrpID8").val()+"\",";   
		        	params1 +="\"name\":"+"\""+$("#name8").val()+"\",";   
		        	params1 +="\"productionDate\":"+"\""+$("#productionDate8").val()+"\","; 
		        	params1 +="\"productionNo\":"+"\""+$("#productionNo8").val()+"\",";   
		        	params1 +="\"productionVer\":"+"\""+$("#productionVer8").val()+"\",";  
		        	params1 +="\"hardwareVer\":"+"\""+$("#hardwareVer8").val()+"\",";  
		        	params1 +="\"firmwareVer\":"+"\""+$("#firmwareVer8").val()+"\",";   
		        	params1 +="\"softwareVer\":"+"\""+$("#softwareVer8").val()+"\",";   
		        	params1 +="\"initNumber\":"+"\""+$("#initNumber8").val()+"\","; 
		        	params1 +="\"currentNumber\":"+"\""+$("#currentNumber8").val()+"\",";   
		        	params1 +="\"normalNumber\":"+"\""+$("#normalNumber8").val()+"\",";  
		        	params1 +="\"remark\":"+"\""+$("#remark8").val()+"\","; 
		        	if(params1 != '{'){
		        		if($("#editAddType8").val()=="new"){
		        		   params1 += "\"actionName\":"+"\""+$.i18n("new")+"\""; 
		        		}else if($("#editAddType8").val()=="edit"){
				        	//params1 +="\"repairTimes\":"+"\""+$("#repairTimes8").val()+"\","; 
		        			params1 += "\"actionName\":"+"\""+$.i18n("edit")+"\""; 
		        		} 
		        	} 
		        params1+='}';   
		        var params1 = eval('(' + params1 + ')');   
		        return params1;
		    }
			/********** 编辑 end************/
			
			/***********  删除  ****************/
			/***********  删除 end *************/
			
			/********** 查询 ************/
		  	//获取查询条件
		    function mygetSearchParams8() {
		        var params = '{'; 
		        
		        if($("#keyDevGrpID").val()!="" && $("#keyDevGrpID").val()!=null){ 
		        	params +="\"cx_LIKE-|-keyDevGrpID\":"+"\""+$("#keyDevGrpID").val()+"\",";  
		        } 
		        
		        if($("#name").val()!="" && $("#name").val()!=null){ 
		        	params +="\"cx_LIKE-|-name\":"+"\""+$("#name").val()+"\",";  
		        }
		        
		        if($("#productionNo").val()!="" && $("#productionNo").val()!=null){ 
		        	params +="\"cx_LIKE-|-productionNo\":"+"\""+$("#productionNo").val()+"\",";  
		        }
		        
		        if($("#productionVer").val()!="" && $("#productionVer").val()!=null){ 
		        	params +="\"cx_LIKE-|-productionVer\":"+"\""+$("#productionVer").val()+"\",";  
		        } 
		        if($("#hardwareVerGrp").val()!="" && $("#hardwareVerGrp").val()!=null){ 
		        	params +="\"cx_LIKE-|-hardwareVer\":"+"\""+$("#hardwareVerGrp").val()+"\",";  
		        } 
		        if($("#firmwareVerGrp").val()!="" && $("#firmwareVerGrp").val()!=null){ 
		        	params +="\"cx_LIKE-|-firmwareVer\":"+"\""+$("#firmwareVerGrp").val()+"\",";  
		        } 
		        if($("#softwareVerGrp").val()!="" && $("#softwareVerGrp").val()!=null){ 
		        	params +="\"cx_LIKE-|-softwareVer\":"+"\""+$("#softwareVerGrp").val()+"\",";  
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
			function myclearSearchItems8(){
				$("#keyDevGrpID").val("");  
		    	$("#name").val("");   
		    	$("#productionNo").val(""); 
		    	$("#productionVer").val("");     
		    	$("#hardwareVerGrp").val("");  
		    	$("#firmwareVerGrp").val("");  
		    	$("#softwareVerGrp").val("");  
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
		    	selectCount();
		        
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
	                	keyDevID: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },idxViFiID: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },pwd: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },idxDevGrpID: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },idxVNSID: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },devState: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },idxUserID: {
	                        validators: {
	                            stringLength: {
	                                min: 1,
	                                max: 60,
	                                message: eval('validator_'+validator_language+'.range').replace('{0}','15').replace('{1}','15')
	                            }
	                        }
	                    },debugIdt: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },hardwareVer: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },firmwareVer: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
	                            }
	                        }
	                    },softwareVer: {
	                        validators: {
	                            notEmpty: {
	                                message: eval('validator_'+validator_language+'.required')
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
		            	keyDevGrpID: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },name: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        },stringLength: {
		                            min: 0,
		                            max: 100,
		                            message: eval('validator_'+validator_language+'.maxlength').replace('{0}','100')
		                        }
		                    }
		                },idxSalerID: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },productionDate: {               	
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },productionNo: {
		                    validators: {
		                    	notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },productionVer: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },hardwareVer: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },firmwareVer: {
		                    validators: {
		                    	notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },softwareVer: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },initNumber: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        },regexp: {
		                            regexp: /^[0-9]\d*$/,
		                            message: eval('validator_'+validator_language+'.digits')
		                        }
		                    }
		                },currentNumber: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        },regexp: {
		                            regexp: /^[0-9]\d*$/,
		                            message: eval('validator_'+validator_language+'.digits')
		                        }
		                    }
		                },normalNumber: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        },regexp: {
		                            regexp: /^[0-9]\d*$/,
		                            message: eval('validator_'+validator_language+'.digits')
		                        }
		                    }
		                },repairTimes: {
		                    validators: {
		                        notEmpty: {
		                            message: eval('validator_'+validator_language+'.required')
		                        }
		                    }
		                },remark: {
		                    validators: {
		                    	stringLength: {
		                            min: 0,
		                            max: 200,
		                            message: eval('validator_'+validator_language+'.maxlength').replace('{0}','200')
		                        }
		                    }
		                } 
		                
		            }
		        });
		        
				mydelayedInit8();  //初始化窗口
		    	setSelectPageSize8(); //设置分页数量下拉框的值 
		　                //setSearchParams8(); //设置查询条件中、编辑区域 下拉框的选项值
				setTrs8(selectItems8); //初始化要显示的列 
				dosearch8('1'); //查询列表  
				//设置其它标签页的高度
				var winHeight = document.documentElement.clientHeight;
				$("#state_tab").css("height", winHeight-170); 
				
		    }); 
		</script>
  </body>
</html>
