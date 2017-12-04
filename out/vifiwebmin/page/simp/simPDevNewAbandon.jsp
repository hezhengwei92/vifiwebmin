 
  
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
                  <!-- <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools('false','status_tab','list','tabpanle3')"><spring:message code="state"/></a> 
                  </li>  -->
                  <li class="active">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('false','simPDev_tab','list','list2_tab');dosearchsimPDevVal();">图表 </a>
                  </li> 
                  
                  <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools','list','simPDev_tab','list2_tab')"><i class="fa fa-list font14"></i><spring:message code="db.tbSimPDev.list"/></a><!-- 列表 -->
                  </li>
                  <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools8','list2_tab','simPDev_tab','list')"><i class="fa fa-list font14"></i><spring:message code="db.tbSimPPort.list"/></a><!-- 列表 -->
                  </li>
                  
                  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right" id="tools">
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
                  <!-- 工具按钮组2 -->
				   <li class="head-tools-r navbar-right" style="display:none;" id="tools8">
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
				       
                </ul>
                <!-- tab标签页 -->
                <div class="tab-content no-padding tabs-flat" style="border-radius:0;">
                  
                  <!-- list 列表页签tab -->
                  <div id="list" class="tab-pane in active" style="border-radius:0;"> 
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.keySimPDevID"/><!-- 编号 -->:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keySimPDevID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimPDev.keySimPDevID.help"/>" > 
                               </div>
                             </div>           
                          </div>
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.devName"/><!-- 名称 -->:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="devName"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimPDev.devName.help"/>" >
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.typeName"/><!-- 型号 -->:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="typeName" style="width: 100%;"  placeholder="<spring:message code="db.tbSimPDev.typeName.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" label="<spring:message code="db.tbSimPDev.typeName.help"/>"><spring:message code="db.tbSimPDev.typeName.help"/></option>
                                    <option label="Simpool 128" value="Simpool 128">Simpool 128</option>
                                    <option label="Simpool 224" value="Simpool 224">Simpool 224</option>
                                  </select>
                               </div>
                             </div>
                          </div>
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.ipaddr"/><!--设备 IP-->:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="ipaddr"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimPDev.ipaddr.help"/>" >
                               </div>
                             </div>           
                          </div> 
                        </div> 
                        
                        <div class="row ng-scope">   
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.status"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="status" style="width: 100%;"  placeholder="<spring:message code="db.tbSimPDev.status.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" label="<spring:message code="db.tbSimPDev.status.help"/>"><spring:message code="db.tbSimPDev.status.help"/></option>
                                    <option id="status0" value="0"></option>
                                    <option id="status1" value="1"></option>
                                  </select>
                               </div>
                             </div>
                          </div>
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.ports"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="ports"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimPDev.ports.help"/>" >
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPDev.idxVSWID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxVSWID" style="width: 100%;"  placeholder="<spring:message code="db.tbSimPDev.idxVSWID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" label=<spring:message code="db.tbSimPDev.idxVSWID.help"/>><spring:message code="db.tbSimPDev.idxVSWID.help"/></option>
                                    
                                  </select>
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
                          <table id="tb_1" class="table table-bordered table-hover table-striped">
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
                  <!-- 图表页签  tab -->
                  <div id="simPDev_tab" class="tab-pane" style="border-radius:0;">
                  	
                  </div>
                  <!--  
                  <div id="tabpanle3" class="tab-pane">
                    <p>222</p>
                  </div> --> 
 				
 				
 				<!-- 状态页签  tab viFiDevGroup-->
                  <div id="list2_tab" class="tab-pane" style="border-radius:0;">
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search8">
                      <div class="panel-body">
                       
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPPort.idxSimPDevID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSimPDevID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimPPort.idxSimPDevID.help"/>" > 
                               </div>
                             </div>           
                          </div>
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimPPort.idxViFiId"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxViFiId"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimPPort.idxViFiId.help"/>" > 
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
			            <spring:message code="db.tbSimPDev.keySimPDevID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="keySimPDevID1" name="keySimPDevID" placeholder="<spring:message code="db.tbSimPDev.keySimPDevID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.devName"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="devName1" name="devName" placeholder="<spring:message code="db.tbSimPDev.devName.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.idxSimPDevGrpID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
	                  <select name="idxSimPDevGrpID" id="idxSimPDevGrpID1" style="width:100%;">
	                     <option value="" selected="selected" label="<spring:message code="db.tbSimPDev.idxSimPDevGrpID.help"/>"><spring:message code="db.tbSimPDev.idxSimPDevGrpID.help"/></option> 
	                   </select>
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.typeName"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select id="typeName1" name="typeName" style="width:100%;">
                     <option value="" label="<spring:message code="db.tbSimPDev.typeName.help"/>"><spring:message code="db.tbSimPDev.typeName.help"/></option>
                     <option label="Simpool 128" value="Simpool 128">Simpool 128</option>
                     <option label="Simpool 224" value="Simpool 224">Simpool 224</option>
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.username"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="username1" name="username" placeholder="<spring:message code="db.tbSimPDev.username.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.password"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="password1" name="password" placeholder="<spring:message code="db.tbSimPDev.password.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>   
			 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.expire"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="expire1" name="expire" placeholder="<spring:message code="db.tbSimPDev.expire.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched"  > 
                  </div> 
                </div>
                </div> 
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimPDev.ports"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="ports1" name="ports" placeholder="<spring:message code="db.tbSimPDev.ports.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched"  > 
                  </div> 
                </div>
                </div> 
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbSimPDev.idxVSWID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="idxVSWID" id="idxVSWID1" style="width:100%;">
                     <option value="" selected="selected" label="<spring:message code="db.tbSimPDev.idxVSWID.help"/>"><spring:message code="db.tbSimPDev.idxVSWID.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbSimPDev.remarks"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="remarks1" name="remarks" placeholder="<spring:message code="db.tbSimPDev.remarks.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
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


<!-- 详情层  simpDev--->
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
			<tbody id="html_viewDetails_dev">

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

    <script> 
    //设置带搜索功能的下拉框
    //$("#a1").select2();
    </script>
     
    <script>
    //访问路径
    var visit_url = "/simp/simPDevNew";
    //国际化开头
    var tbI18n = "db.tbSimPDev.";
    //表的主键
    var tablekey = "keySimPDevID";
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
    var itemName = "my_setTrs_simPDevNew";
    //设置初始化排序字段
    var MY_ORDER_LIST = [];
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems = {"resetTimes" : "2","trs": [{"name": "keySimPDevID","show": "false","width":"90"},
               {"name": "devName","show": "true","width":"130"},
               {"name": "idxSimPDevGrpID","show": "true","width":"130"},
               {"name": "typeName","show": "true","width":"100"},
               {"name": "username","show": "true","width":"130"},
               {"name": "password","show": "false","width":"70"},
               {"name": "expire","show": "true","width":"90"},
               {"name": "lastUpdate","show": "true","width":"125"},
               {"name": "ipaddr","show": "true","width":"90"},
               {"name": "port","show": "true","width":"90"},
               {"name": "status","show": "true","width":"90"},
               {"name": "ports","show": "true","width":"90"},
               {"name": "idxVSWID","show": "true","width":"140"},
               {"name": "remarks","show": "false","width":"128"},
               {"name": "mdfTm","show": "true","width":"125"},
               {"name": "mdfBy","show": "false","width":"90"},
               {"name": "crtTm","show": "false","width":"125"},
               {"name": "crtBy","show": "false","width":"90"}]
    };
    //设置重置参数
    var resetSelectItems = selectItems;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams(){ 
    	var vswSelData = selectPermissionsInfo.vswSelData;  
    	var html_idxVSWID = "";
    	if(vswSelData!=null){
    	for(var i=0; i<vswSelData.length; i++){   
    		html_idxVSWID += "<option label=\""+vswSelData[i][1]+"\" value=\""+vswSelData[i][0]+"\">"+vswSelData[i][1]+"</option>";
  	    } 
    	}
    	if(html_idxVSWID!=""){ 
    		$("#idxVSWID").append(html_idxVSWID);
    		$("#idxVSWID1").append(html_idxVSWID);
    	}  
    	
    	var simpDevGrpData = selectPermissionsInfo.simpDevGrpData;
    	var html_simpDevGrpData = "";
    	if(simpDevGrpData){
    		for(var i=0; i<simpDevGrpData.length; i++){
    			html_simpDevGrpData += "<option label=\""+simpDevGrpData[i][1]+"\" value=\""+simpDevGrpData[i][0]+"\">"+simpDevGrpData[i][1]+"</option>";
    		}
    	}
    	if(html_simpDevGrpData){
    		//$("#idxSimPDevGrpID").append(html_simpDevGrpData);
    		$("#idxSimPDevGrpID1").append(html_simpDevGrpData);
    	}
    	
    	var i18nText = $.i18n("db.tbSimPDev.status.comData");   
 	    $("#status0").append(i18nText["0"]["1"]); 
 	    $("#status1").append(i18nText["1"]["1"]); 
    } 
    
    //获取查询条件
    function mygetSearchParams() {
        var params = '{'; 
        
        if($("#keySimPDevID").val()!="" && $("#keySimPDevID").val()!=null){ 
        	params +="\"cx_LIKE-|-keySimPDevID\":"+"\""+$("#keySimPDevID").val()+"\",";  
        } 
        
        if($("#devName").val()!="" && $("#devName").val()!=null){ 
        	params +="\"cx_LIKE-|-devName\":"+"\""+$("#devName").val()+"\",";  
        }
        
        if($("#typeName").val()!="" && $("#typeName").val()!=null){ 
        	params +="\"cx_LIKE-|-typeName\":"+"\""+$("#typeName").val()+"\",";  
        }
        
        if($("#ports").val()!="" && $("#ports").val()!=null){ 
        	params +="\"cx_LIKE-|-ports\":"+"\""+$("#ports").val()+"\",";  
        } 
        
        if($("#ipaddr").val()!="" && $("#ipaddr").val()!=null){ 
        	params +="\"cx_LIKE-|-ipaddr\":"+"\""+$("#ipaddr").val()+"\",";  
        }
        
        if($("#status").val()!="" && $("#status").val()!=null){ 
        	params +="\"cx_LIKE-|-status\":"+"\""+$("#status").val()+"\",";  
        }
        
        if($("#idxVSWID").val()!="" && $("#idxVSWID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxVSWID\":"+"\""+$("#idxVSWID").val()+"\",";  
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
        	params1 +="\"keySimPDevID\":"+"\""+$("#keySimPDevID1").val()+"\",";   
        	params1 +="\"devName\":"+"\""+$("#devName1").val()+"\",";   
        	params1 +="\"idxSimPDevGrpID\":"+"\""+$("#idxSimPDevGrpID1").val()+"\",";
        	params1 +="\"typeName\":"+"\""+$("#typeName1").val()+"\","; 
        	params1 +="\"ports\":"+"\""+$("#ports1").val()+"\",";   
        	params1 +="\"username\":"+"\""+$("#username1").val()+"\",";  
        	params1 +="\"password\":"+"\""+$("#password1").val()+"\",";   
        	params1 +="\"idxVSWID\":"+"\""+$("#idxVSWID1").val()+"\","; 
        	params1 +="\"expire\":"+"\""+$("#expire1").val()+"\",";   
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
         
        
    //查看详情方法
    function viewDetails(number){  
       var i18nText = $.i18n("db.tbSimPDev.status.comData");  
	   var value = (mydata[number].status).toString();
	   var i18nText_get = i18nText[value]["1"]; 
       var html_viewDetails = ""; 
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"keySimPDevID")+": </td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].keySimPDevID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"devName")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].devName+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxSimPDevGrpID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].idxSimPDevGrpID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"typeName")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].typeName+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"username")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].username+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"password")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].password+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"expire")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].expire+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"lastUpdate")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].lastUpdate+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"ipaddr")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].ipaddr+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"port")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].port+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"status")+"：</td><td><div class=\"f-p-tips ng-binding\"><i class=\"img-fmt simp-dev-sta-"+mydata[number].status+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"ports")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].ports+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxVSWID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].idxVSWID+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"remarks")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].remarks+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfTm")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].mdfTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfBy")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].mdfBy+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtTm")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].crtTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtBy")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].crtBy+"</div></td></tr>";
 	   $("#html_viewDetails").html(html_viewDetails);
 	   myopenModel('mydetailModal');
    }
    
    //设置编辑框的值
    function setEditItems(){
    	$("#editAddModel").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit"));
    	$("#editAddType").val("edit");
    	var checkedsubList = $("input[name*='Listitems']:checked"); //获取选中的name中包含Listitems的值  
    	var arr = checkedsubList[0].value.split("-|-");  
    	$("#keySimPDevID1").val(eval("mydata["+arr[1]+"].keySimPDevID")); 
    	$("#keySimPDevID1").attr("disabled","disabled");
    	$("#devName1").val(eval("mydata["+arr[1]+"].devName"));   
    	$("#idxSimPDevGrpID1").val(eval("mydata["+arr[1]+"].idxSimPDevGrpID"));  
    	$("#typeName1").val(eval("mydata["+arr[1]+"].typeName")); 
    	$("#ports1").val(eval("mydata["+arr[1]+"].ports"));   
    	$("#username1").val(eval("mydata["+arr[1]+"].username"));  
    	$("#password1").val(eval("mydata["+arr[1]+"].password"));   
    	$("#idxVSWID1").val(eval("mydata["+arr[1]+"].idxVSWID")); 
    	$("#expire1").val(eval("mydata["+arr[1]+"].expire"));   
    	$("#remarks1").val(eval("mydata["+arr[1]+"].remarks")); 
    }
    
    //清空编辑表单
	function myclearForm(){
		$("#keySimPDevID1").val(""); 
    	$("#keySimPDevID1").removeAttr("disabled");
    	$("#devName1").val("");
    	$("#idxSimPDevGrpID1").val("");
    	$("#typeName1").val(""); 
    	$("#ports1").val("");   
    	$("#username1").val("");  
    	$("#password1").val("");   
    	$("#idxVSWID1").val(""); 
    	$("#expire1").val("");   
    	$("#remarks1").val(""); 
    }
    
	//清空搜索条件表单
	function myclearSearchItems(){
		$("#keySimPDevID").val("");  
    	$("#devName").val("");   
    	$("#typeName").val(""); 
    	$("#ports").val("");     
    	$("#idxVSWID").val(""); 
    	$("#ipaddr").val("");     
    	$("#status").val(""); 
	}
	
	//列表展示数据转换
	function changeData(tdname,showLengthData,dataTdValue){ 
		var html = "";
		if(tdname=="status"){  
			   var i18nText = $.i18n(tbI18n+"status.comData");  
			   var value = parseInt(dataTdValue);
			   var i18nText_get = i18nText[value][1]; 
			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\"><i class=\"img-fmt simp-dev-sta-"+dataTdValue+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td>"; 
		}else{
			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	}
	     
    $(function(){     
    	//根据权限设置 增删改查按钮的显示
        setpermsion(); 
    	
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
                	keySimPDevID: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },devName: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },typeName: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },ports: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }, 
                            regexp: {
                                regexp: /^[1-9]\d*$/,
                                message: eval('validator_'+validator_language+'.digits')
                            }
                        }
                    },username: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },password: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }, 
                            regexp: {
                                regexp: /^[1-9]\d*$/,
                                message: eval('validator_'+validator_language+'.digits')
                            }
                        }
                    },idxVSWID: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },expire: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }, 
                            regexp: {
                                regexp: /^[1-9]\d*$/,
                                message: eval('validator_'+validator_language+'.digits')
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
		//设置其它标签页的高度
		//var winHeight = document.documentElement.clientHeight;
		//$("#status_tab").css("height", winHeight-150); 
		
    }); 
     
    </script> 
    
    <!-- 表图simPDev -->
    <script>
	    function mydelayedInitDev() {  
	        // 计算table高度 
	        var winHeight8 = document.documentElement.clientHeight; 
	        var dataTableDivHeight8 = winHeight8 - 198 - $(".stati-info").height() - $(".page-breadcrumbs").height();
	        var $dataTBody8 = $(".data-tbody8"), $dataTHead8 = $(".data-thead8"), $html = $($("html")[0]);
	        $dataTBody8.css("height", dataTableDivHeight8); 
	    }
	  	 //状态数据查询
	     var mydata_dev;
	  	 function showDataSimPDev(graphViews){
	  		
	  		if(graphViews == null || graphViews == undefined){
	  		 	graphViews = selectPermissionsInfo.graphView;
	  		}
	  		var viewHtml = "";
	  		if(graphViews !=null && graphViews.length>0){
	  			mydata_dev = graphViews;
	  			var selData = $.i18n("db.tbSimPPort.status.comData");
	  			viewHtml += "<div class=\"text-center\"><div class=\"simp-dev-shelf\"><div>";
	  			for(var i=0; i<graphViews.length; i++){
	  			    var graphView = graphViews[i];
	  				if(graphView !=null){
		  				viewHtml += "<div class=\"margin-bottom-20 ng-scope\" ng-repeat=\"dev in ::view.graphView\">"
	                    		 +"<div class=\"text-left padding-5\"><a class=\"fa-lg ng-binding\" href=\"javascript:\" onclick=\"viewDetails_dev('"+i+"')\">"+graphView["devName"]+"</a></div><div class=\"simp-dev\"><table><tbody>";
	                    var portInfoArray = graphView["portInfoArray"];
	  					if(portInfoArray !=null && portInfoArray.length>0){
	  						for(var m =0; m < portInfoArray.length;m++){
		  						viewHtml += "<tr class=\"simp-row ng-scope\" ng-repeat=\"row in dev.portInfoArray\">";
	  							var protInfo = portInfoArray[m];
	  							for(var n =0 ;n < protInfo.length;n++){
	  								 var pro = protInfo[n];
		  							 viewHtml +="<td class=\"f-p-tips ng-scope\" ng-repeat=\"port in row\" onclick=\"openSimPPortDtl('"+pro["keyID"]+"')\">"
			                                  +"<div class=\"simp-col-num ng-binding\">"+pro["portNum"]+"</div>";
			                                  if("1" == pro["state"]){
			                                	  viewHtml += "<div class=\"simp-col-sta1\"></div>";
			                                  }else if("2" == pro["state"]){
			                                	  viewHtml += "<div class=\"simp-col-sta2\"></div>";
			                                  }else{
			                                	  viewHtml += "<div class=\"simp-col-sta0\"></div>";
			                                  }
			                                  viewHtml += "<i class=\"f-tips ng-binding\" style=\"top:26px;left:12px;\">"+getValue(selData,(pro["state"] == null || pro["state"] == undefined ? "0":pro["state"]))+"</i>"
			                                  +"<div class=\"simp-col-split\">*</div></td>";
	  							}
		  						viewHtml += "</tr>";
	  						}
	  					}
	  					viewHtml += "</tbody></table></div></div>";
	  				}
	  	  	    } 
  				viewHtml +="</div></div></div>"; 
	  		}
	  		$("#simPDev_tab").html(viewHtml);
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
	  	
	  	/********** 详情 ************/
		 //查看详情方法
	    function viewDetails_dev(info){  
	  	   var tbI18nDev = "db.tbSimPDev.";
	  	   var html_viewDetails = ""; 
	  	   html_viewDetails += setViewTr($.i18n(tbI18nDev+"keySimPDevID"),mydata_dev[info]["keySimPDevID"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"devName"),mydata_dev[info]["devName"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"typeName"),mydata_dev[info]["typeName"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"username"),mydata_dev[info]["username"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"password"),mydata_dev[info]["password"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"expire"),mydata_dev[info]["expire"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"lastUpdate"),mydata_dev[info]["lastUpdate"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"ipaddr"),mydata_dev[info]["ipaddr"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"port"),mydata_dev[info]["port"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"status"),mydata_dev[info]["status"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"ports"),mydata_dev[info]["ports"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"idxVSWID"),mydata_dev[info]["idxVSWID"]);
		   html_viewDetails += setViewTr($.i18n(tbI18nDev+"remarks"),mydata_dev[info]["remarks"]);
		   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),mydata_dev[info]["mdfTm"]);
		   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),mydata_dev[info]["mdfBy"]);
		   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),mydata_dev[info]["crtTm"]);
		   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),mydata_dev[info]["crtBy"]);
	 	   $("#html_viewDetails_dev").html(html_viewDetails);
	 	   myopenModel8('mydetailModal8','detail'); 
	    }
	    function openSimPPortDtl(keyid){  
	    	$.ajax({
	       	    url:window.PATH + visit_url +"/simp-port-info.ajax",    //请求的url地址 
	       	 	data: { keyID: keyid },
	       	    type:"post",   //请求方式   
	       	    dataType: "json",
	       	    success:function(res){  
				 	   $("#html_viewDetails_dev").html(setViewDet(res.data));
				 	   myopenModel8('mydetailModal8','detail'); 
	       	        //请求成功时处理
	       	    }, 
	       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
	       	    	//alert(exception);
	           }
	       	}); 
	    }
	    function setViewDet(dataView){
	    	   var tbI18nPort = "db.tbSimPPort.";
	    	   var html_viewDetails = ""; 
	    	   html_viewDetails += setViewTr($.i18n(tbI18nPort+"keyID"),dataView.keyID);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxSimPDevID"),dataView.idxSimPDevID);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxSlotNum"),dataView.idxSlotNum);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"status"),dataView.status);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxIccid"),dataView.idxIccid);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"idxViFiId"),dataView.idxViFiId);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"usage"),dataView.usage);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"duration"),dataView.duration);
			   html_viewDetails += setViewTr($.i18n(tbI18nPort+"remarks"),dataView.remarks);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfTm"),dataView.mdfTm);
			   html_viewDetails += setViewTr($.i18n("db.common.mdfBy"),dataView.mdfBy);
			   html_viewDetails += setViewTr($.i18n("db.common.crtTm"),dataView.crtTm);
			   html_viewDetails += setViewTr($.i18n("db.common.crtBy"),dataView.crtBy);
			   return html_viewDetails;
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
		function setViewTr(leftValue,rightValue){
			return "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+leftValue+": </td><td><div class=\"f-p-tips ng-binding\">"+(rightValue !=undefined ? rightValue:"")+"</div></td></tr>";
		}
		/********** 详情 end************/
	     function dosearchsimPDevVal(page){  
			//alert(JSON.stringify(mygetSearchParams8()));
	        $.ajax({
	       	    url:window.PATH + visit_url +"/queryDev.ajax",    //请求的url地址 
	       	    type:"post",   //请求方式   
	       	    dataType: "json",
	       	    success:function(req){  
	       	    	showDataSimPDev(req.data);
	       	        //请求成功时处理
	       	    }, 
	       	    error: function (xhr, type, exception) {//获取ajax的错误信息 
	       	    	//alert(exception);
	           }
	       	}); 
	      }
	     	mydelayedInitDev();
		    showTools("false","simPDev_tab","status_tab","list");
		    setTimeout(function(){
		     	showDataSimPDev();
	    	}, 300);
		    
    </script>
	<script>
		//国际化开头
	    var tbI18n8 = "db.tbSimPPort.";
	    //表的主键
	    var tablekey8 = "keyID";  
	    
	    //设置存在localStorage 的列表配置名
	    var itemName8 = "my_setTrs_SimPPort";
	    //设置初始化排序字段
	    var MY_ORDER_LIST8 = [];
	    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
	    var selectItems8 = {"resetTimes" : "2","trs": [
			       {"name": "keyID","show": "true","width":"80"},
			       {"name": "idxSimPDevID","show": "true","width":"80"},
	               {"name": "idxSlotNum","show": "true","width":"80"},
	               {"name": "status","show": "true","width":"80"},
	               {"name": "idxIccid","show": "true","width":"150"},
	               {"name": "idxViFiId","show": "true","width":"150"},
	               {"name": "usage","show": "true","width":"120"},
	               {"name": "duration","show": "true","width":"80"}, 
	               {"name": "remarks","show": "false","width":"125"},
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
	    function viewDetails8(number){
	       var i18nText = $.i18n("db.tbSimPDev.status.comData");  
	  	   var value = (mydata8[number].status).toString();
	  	   var i18nText_get = i18nText[value]["1"]; 
	       var html_viewDetails = ""; 
	       $("#html_viewDetails_dev").html(setViewDet(mydata8[number]));
	       myopenModel8('mydetailModal8','detail'); 
	    }
	    function changeData8(tdname,showLengthData,dataTdValue){
			var html = "";
			if(tdname=="cardType"){      
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
			}else{
				html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
			}
			return html;
		}
	  //获取查询条件
	    function mygetSearchParams8() {
	        var params = '{'; 
	        
	        if($("#idxSimPDevID").val()!="" && $("#idxSimPDevID").val()!=null){ 
	        	params +="\"cx_LIKE-|-keyID\":"+"\""+$("#keyID").val()+"\",";  
	        } 
	        if($("#idxViFiId").val()!="" && $("#idxViFiId").val()!=null){ 
	        	params +="\"cx_LIKE-|-idxSimPDevID\":"+"\""+$("#idxViFiId").val()+"\",";  
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
			$("#idxSimPDevID").val("");  
			$("#idxViFiId").val("");  
		}
	  	$(function(){
	  		mydelayedInit8();  //初始化窗口
	    	setSelectPageSize8(); //设置分页数量下拉框的值 
	　                //setSearchParams8(); //设置查询条件中、编辑区域 下拉框的选项值
			setTrs8(selectItems8); //初始化要显示的列 
			dosearch8('1'); //查询列表  
			//设置其它标签页的高度
			var winHeight = document.documentElement.clientHeight;
			$("#list2_tab").css("height", winHeight-158); 
	  	
	  	});
	  	
	</script>
</body>
 