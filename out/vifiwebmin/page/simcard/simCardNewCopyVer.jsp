  
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
                  
                  <li class="active" id="tab1">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('','state_tab','list','list2_tab')"><i class="fa fa-th font14"></i><spring:message code="tabname.simCart.list1"/></a> 
                  </li>
                  <li class="tab-red" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools8','list2_tab','list','state_tab')"><i class="fa fa-list font14"></i><spring:message code="label.common.cardGroup"/></a> 
                  </li>  
                  <li class="tab-purple" id="tab2"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools','list','list2_tab','state_tab')"><i class="fa fa-list font14"></i><spring:message code="label.common.cardList"/></a>
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
                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                
                  <div id="state_tab" class="tab-pane  in active" style="padding-left:20px"> 

                    <div class="row"  style="margin-top:20px"> 
                    <div class="col-lg-6 col-sm-6 col-xs-12">
                       <div class="widget radius-bordered">
                          <div class="widget-header">
                             <span class="widget-caption"><spring:message code="status.globalSIMNew.info1"/></span> 
                          </div> 
                          <div class="widget-body">
                             <p><spring:message code="status.globalSIMNew.info2"/>   <a href ="javaScript:showTools9('tools8','tab3','list2_tab','list','state_tab')" id="countGlobalSIMGrp"></a>  <spring:message code="status.globalSIMNew.info3"/>，<a href="javaScript:addclub()"><spring:message code="status.globalSIMNew.info4"/></a></p>
                             <p><spring:message code="status.globalSIMNew.info5"/>   <a href ="javaScript:showTools9('tools','tab2','list','list2_tab','state_tab')" id="countGlobalSIM"></a>  <spring:message code="status.globalSIMNew.info6"/>，<a href="javaScript:addcard()"><spring:message code="status.globalSIMNew.info7"/></a></p>
                             <p><spring:message code="status.globalSIMNew.info8"/>   <a id="countOverTimeCard" href="javaScript:void(0)"></a>  <spring:message code="status.globalSIMNew.info9"/>。</p> 
                          </div> 
                       </div> 
                     </div>
                   </div>
                   
                   <div class="row">  
                     <div class="col-lg-6 col-sm-6 col-xs-12" >
                       <div class="widget radius-bordered">
                          <div class="widget-header">
                             <span class="widget-caption"><spring:message code="status.globalSIMNew.info13"/></span> 
                          </div> 
                          <div class="widget-body" style="height:220px">
                            <div style="float:left;width:69%">
                             <span id="countStatus" data-sparkline="pie" data-height="175px" data-width="175px" data-bordercolor="#fafafa"
                                                  data-slicecolors='["#5DB2FF","#d73d32"]'>
                                                  
                             </span> 
                             </div>
                             <div style="float:left;width:30%">
                             <div style="margin-top:40px">
                                <h6 class="row-title before-orange"><spring:message code="status.globalSIMNew.info11"/>：<span id="countStatus0"></span></h6> 
                                <br/>
                                <h6 class="row-title "><spring:message code="status.globalSIMNew.info12"/>：<span id="countStatus1"></span></h6> 
                             </div> 
                             </div>
                          </div> 
                       </div> 
                     </div>
                   </div>  
                   
					<!-- <div role="tabpanel" class="ng-scope">
						<h3 class="title ng-binding">欧洲</h3>
						<div class="row ng-scope">
							<div class="col-sm-4 ng-scope">
								<div class="databox radius-bordered databox-shadowed databox-graded">
									<div class="databox-left bg-palegreen" style="width: 88px;">
										<div class="databox-piechart">
											<div class="icon country-icon-England"  style="background-size: 100%;width: 68px;height: 45px;"></div>
										</div>
									</div>
									<div class="databox-right" style="width: calc(100% - 98px)">
										<span class="databox-number green ng-binding">2</span>
										<div class="databox-text darkgray ng-binding">英国</div>
										<div class="databox-stat bg-palegreen radius-bordered">
											<div class="stat-text ng-binding">正常:2</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="ng-scope">
						<h3 class="title ng-binding">亚洲</h3>
						<div class="row ng-scope">
							<div class="col-sm-4 ng-scope">
								<div class="databox radius-bordered databox-shadowed databox-graded">
									<div class="databox-left bg-palegreen"  style="width: 88px;">
										<div class="databox-piechart">
											<div class="icon country-icon-HongKong" style="background-size: 100%;width: 68px;height: 45px;"></div>
										</div>
									</div>
									<div class="databox-right" style="width: calc(100% - 98px)">
										<span class="databox-number green ng-binding">2</span>
										<div class="databox-text darkgray ng-binding">香港</div>
										<div class="databox-stat bg-palegreen radius-bordered">
											<div class="stat-text ng-binding">正常:2</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4 ng-scope">
								<div class="databox radius-bordered databox-shadowed databox-graded">
									<div class="databox-left bg-palegreen" style="width: 88px;">
										<div class="databox-piechart">
											<div class="icon country-icon-China"  style="background-size: 100%;width: 68px;height: 45px;"></div>
										</div>
									</div>
									<div class="databox-right" style="width: calc(100% - 98px)">
										<span class="databox-number green ng-binding">24</span>
										<div class="databox-text darkgray ng-binding">中国</div>
										<div class="databox-stat bg-palegreen radius-bordered">
											<div class="stat-text ng-binding">正常:21</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>-->


				 </div> 
						
					
                  <!-- 列表页签 -->
                  <div id="list" class="tab-pane" style="border-radius:0;"> 
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimCard.keySimCardID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keySimCardID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimCard.keySimCardID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimCard.idxSCGroupID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxSCGroupID" style="width: 100%;"  placeholder="<spring:message code="db.tbSimCard.idxSCGroupID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbSimCard.idxSCGroupID.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div>  
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSimCard.number"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="number"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSimCard.number.help"/>" >
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
                  
                  
                  
                  <!-- 状态页签  -->
                  <div id="list2_tab" class="tab-pane" style="border-radius:0;">
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search8">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSCGroup.groupName"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="groupName"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSCGroup.groupName.help"/>" > 
                               </div>
                             </div>           
                          </div>
                           
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSCGroup.areaCode"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="areaCode" style="width: 100%;"  placeholder="<spring:message code="db.tbSCGroup.areaCode.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    
                                   </select>
                               </div>
                             </div>
                          </div>  
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSCGroup.ispID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="ispID" style="width: 100%;"  placeholder="<spring:message code="db.tbSCGroup.ispID.help"/>" class="ng-pristine ng-untouched ng-valid">                                    
                                    
                                  </select>
                               </div>
                             </div>
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSCGroup.cardType"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="cardType" style="width: 100%;"  placeholder="<spring:message code="db.tbSCGroup.cardType.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" ><spring:message code="db.tbSCGroup.cardType.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div> 
                           
                           
                        </div> 
                        
                        <div class="row ng-scope">    
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSCGroup.cardSize"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="cardSize" style="width: 100%;"  placeholder="<spring:message code="db.tbSCGroup.cardSize.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" ><spring:message code="db.tbSCGroup.cardSize.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div>   
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSCGroup.priority"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="priority" style="width: 100%;"  placeholder="<spring:message code="db.tbSCGroup.priority.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected"><spring:message code="db.tbSCGroup.priority.help"/></option>
                                    <option value="1">1</option><option value="2">2</option><option value="3">3</option>
                                    <option value="4">4</option><option value="5">5</option><option value="6">6</option>
                                    <option value="7">7</option><option value="8">8</option><option value="9">9</option>
                                  </select>
                               </div>
                             </div>
                          </div> 
                          
                          <div class="col-md-6 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"></span>
                             <div class="adv-value">
                               <div class="ng-scope text-right">
                                  <button class="btn btn-success" onclick="dosearch8('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                                  <button class="btn btn-darkorange" onclick="myclearSearch8()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                               </div>
                             </div>           
                          </div>  
                          
                           
                        </div>   
 
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
			            <spring:message code="db.tbSimCard.keySimCardID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="keySimCardID1" name="keySimCardID" placeholder="<spring:message code="db.tbSimCard.keySimCardID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			        <spring:message code="db.tbSimCard.idxSCGroupID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="idxSCGroupID" id="idxSCGroupID1" style="width:100%;">
                     <option value="" selected="selected" ><spring:message code="db.tbSimCard.idxSCGroupID.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimCard.imsi"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="imsi1" name="imsi" placeholder="<spring:message code="db.tbSimCard.imsi.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimCard.imei"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="imei1" name="imei" placeholder="<spring:message code="db.tbSimCard.imei.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimCard.ssId"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="ssId1" name="ssId" placeholder="<spring:message code="db.tbSimCard.ssId.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimCard.status"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select id="status1" name="status" style="width:100%;">
                     <option value=""><spring:message code="db.tbSimCard.status.help"/></option>
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
			             <spring:message code="db.tbSimCard.number"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="number1" name="number" placeholder="<spring:message code="db.tbSimCard.number.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimCard.balance"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="balance1" name="balance" placeholder="<spring:message code="db.tbSimCard.balance.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>    
			 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSimCard.restNetData"/>:<span class="required"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="restNetData1" name="restNetData" placeholder="<spring:message code="db.tbSimCard.restNetData.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			 
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbSimCard.remarks"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="remarks1" name="remarks" placeholder="<spring:message code="db.tbSimCard.remarks.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
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



<!-- 详情层 -->
<div class="modal fade modal-primary" id="mydetailModal8"  role="dialog" aria-hidden="true">
  <div style="margin: 40px auto;width:67%" >
    <div class="modal-content">
      <!-- 窗口头 -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
        <h4 class="modal-title text-info"><i class="fa fa-list-alt" ></i><spring:message code="details"/></h4>
      </div> 
      
      <!--左右布局的样式 -->
		<div class="form-group row" >
			<div class="col-sm-8">

	
				<div class="modal-body bg-white no-padding">
					<div>
						<table class="table table-bordered table-striped">
							<tbody id="html_viewDetails8">
	
								<!-- 循环体 -->
	
							</tbody>
	
						</table>
					</div>
				</div>


			</div>
			
			<div class="col-sm-4">
				<div class="form-group">
					
                            <div style="width:69%;margin-top:50px;">
                             <span id="countStatus_detail" data-sparkline="pie" data-height="175px" data-width="175px" data-bordercolor="#fafafa"
                                                  data-slicecolors='["#5DB2FF","#d73d32"]'>
                                               3,5   
                             </span> 
                             </div>
                             <div style="width:30%">
                             <div style="margin-top:40px">
                                <h6 class="row-title before-orange"><spring:message code="status.globalSIMNew.info11"/>：<span id="countStatus0_detail"></span></h6> 
                                <br/>
                                <h6 class="row-title "><spring:message code="status.globalSIMNew.info12"/>：<span id="countStatus1_detail"></span></h6> 
                             </div> 
                             </div>
                          
				</div>
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
<div class="modal fade modal-primary" id="myeditModal8"  aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="registrationForm8" class="form-horizontal ng-pristine ng-valid">
        <div class="modal-header">
          <button type="button" class="close" onclick="mycancelEdit8()"><span aria-hidden="true">&times;</span></button>
          <input type="hidden" id="editAddType8" value="" />
          <h4 class="modal-title" ng-class="text-success" id="editAddModel8">
          
          </h4>
        </div>
        
       <div class="modal-body" style="overflow-y:auto;"><!-- 分左右栏 -->
       		<div class="ng-scope">
       			<div class="col-sm-6">
       			
       				<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbSCGroup.keySCGroupID"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="keySCGroupID8" disabled style="background-color: #F0F0F0 !important;" name="keySCGroupID" placeholder="<spring:message code="db.tbSCGroup.keySCGroupID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbSCGroup.groupName"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="groupName8" name="groupName" placeholder="<spring:message code="db.tbSCGroup.groupName.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:6px">
			            <spring:message code="db.tbSCGroup.idxSalerId"/>:<span class="required" style="color:red"></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <select name="idxSalerId" id="idxSalerId8" style="width:100%;">
                       <option value="" selected="selected" ><spring:message code="db.tbSCGroup.idxSalerId.help"/></option> 
                    </select> 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			        <spring:message code="db.tbSCGroup.areaCode"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <div  style="width: 100%;">
                     <select id="continent" name="continent" onchange="checkContinent()" style="width: 32%;margin-top:2px">
                       <option value="" selected="selected"><spring:message code="continent.help"/></option>
                       
                     </select>
                     <select style="width:67%" placeholder="<spring:message code="db.tbCDR.countryCode.help"/>" onchange="checkareaCode()" id="areaCode8" name="areaCode">
          
                     </select>
                  </div>
                  
				 </div> 
                </div>
              </div>
			</div>
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			        <spring:message code="db.tbSCGroup.ispID"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="ispID" id="ispID8" style="width:100%;"> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			        <spring:message code="db.tbSCGroup.cardType"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="cardType" id="cardType8" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbSCGroup.cardType.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			        <spring:message code="db.tbSCGroup.cardSize"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="cardSize" id="cardSize8" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbSCGroup.cardSize.help"/></option> 
                   </select>
				  </div> 
                </div>
              </div>
			</div> 
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbSCGroup.monthlyRental"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="monthlyRental8" name="monthlyRental" placeholder="<spring:message code="db.tbSCGroup.monthlyRental.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbSCGroup.dataUsage"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="dataUsage8" name="dataUsage" placeholder="<spring:message code="db.tbSCGroup.dataUsage.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>   
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbSCGroup.dataPrice"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="dataPrice8" name="dataPrice" placeholder="<spring:message code="db.tbSCGroup.dataPrice.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
       			
       			
       			</div>
       			<div class="col-sm-6">
       			
       			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:6px">
			        <spring:message code="db.tbSCGroup.roamSupport"/>:<span class="required" style="color:red"></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope">   
			         <label  class="ng-scope">
                        <input type="checkbox" id="roamSupport8"  onclick="javaScript:checkRoamSupport()" class="ng-pristine ng-untouched ng-valid">
                     <span class="text ng-binding">是否漫游</span>
                     </label>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			        <spring:message code="db.tbSCGroup.roamAreaCodes"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="roamAreaCodes" id="roamAreaCodes8" multiple="multiple" disabled="disabled" style="width:100%;">
                     <!-- <option value="" selected="selected"><spring:message code="db.tbSCGroup.roamAreaCodes.help"/></option>    -->
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			             <spring:message code="db.tbSCGroup.roamDataPrice"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="roamDataPrice8"  disabled="disabled" name="roamDataPrice" placeholder="<spring:message code="db.tbSCGroup.roamDataPrice.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			        <spring:message code="db.tbSCGroup.priority"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select name="priority" id="priority8" style="width:100%;">
                     <option value="" selected="selected"><spring:message code="db.tbSCGroup.priority.help"/></option> 
                     <option value="1">1</option><option value="2">2</option><option value="3">3</option>
                     <option value="4">4</option><option value="5">5</option><option value="6">6</option>
                     <option value="7">7</option><option value="8">8</option><option value="9">9</option>
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbSCGroup.number"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="number8" name="number" placeholder="<spring:message code="db.tbSCGroup.number.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:0px">
			            <spring:message code="db.tbSCGroup.apn"/>:<span class="required" style="color:red"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="apn8" name="apn" placeholder="<spring:message code="db.tbSCGroup.apn.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:6px">
			            <spring:message code="db.tbSCGroup.dialnumber"/>:</label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="dialnumber8" name="dialnumber" placeholder="<spring:message code="db.tbSCGroup.dialnumber.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:6px">
			            <spring:message code="db.tbSCGroup.dialuid"/>:</label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="dialuid8" name="dialuid" placeholder="<spring:message code="db.tbSCGroup.dialuid.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:6px">
			            <spring:message code="db.tbSCGroup.dialpwd"/>:</label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="dialpwd8" name="dialpwd" placeholder="<spring:message code="db.tbSCGroup.dialpwd.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3" style="padding-left:0px;padding-right:6px">
			            <spring:message code="db.tbSCGroup.remarks"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="remarks8" name="remarks" placeholder="<spring:message code="db.tbSCGroup.remarks.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
       			
       			
       			</div>
       		</div>
       </div>
        <!--上下布局样式                 <div class="ng-scope" style="margin-top:15px"></div> --> 
        
        
        <!-- 保存和取消按钮 -->
        <div class="modal-footer ">  
          <button type="submit" class="btn btn-blue" style="background-color: #5db2ff !important"><spring:message code="save"/></button> 
          <a class="btn btn-danger" onclick="mycancelEdit8()"><spring:message code="cancel"/></a>
        </div>  
        
      
      </form>
    </div>
  </div>
</div> 




 
    <script>
    //访问路径
    var visit_url = "/simcard/simCardNew";
    //国际化开头
    var tbI18n = "db.tbSimCard.";
    //表的主键
    var tablekey = "keySimCardID";
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
    var itemName = "my_setTrs_simCardNew";
    //设置初始化排序字段
    var MY_ORDER_LIST = [];
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems = {"resetTimes" : "3","trs": [{"name": "keySimCardID","show": "true","width":"180"},
               {"name": "idxSCGroupID","show": "true","width":"120"},
               {"name": "imsi","show": "false","width":"150"},
               {"name": "imei","show": "false","width":"150"},
               {"name": "ssId","show": "false","width":"150"},
               {"name": "status","show": "true","width":"80"},
               {"name": "number","show": "true","width":"180"},
               {"name": "balance","show": "true","width":"100"},
               {"name": "restNetData","show": "true","width":"125"},
               {"name": "onlineTime","show": "true","width":"125"}, 
               {"name": "totalSuccess","show": "true","width":"100"},
               {"name": "totalFailed","show": "true","width":"100"},
               {"name": "totalData","show": "true","width":"100"},
               {"name": "lastIdleTime","show": "true","width":"125"},   
               {"name": "remarks","show": "false","width":"220"}, 
               {"name": "mdfTm","show": "false","width":"125"},
               {"name": "mdfBy","show": "true","width":"90"},
               {"name": "crtTm","show": "true","width":"125"},
               {"name": "crtBy","show": "false","width":"90"}]
    };
    //设置重置参数
    var resetSelectItems = selectItems;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams(){ 
    	//设置状态页签的数据
    	var data = selectPermissionsInfo.areaSimCardStatusCount;  
    	if(data!=null){
    		var html = "";
    		html_model = "<div class=\"col-sm-2 ng-scope\"><div class=\"databox radius-bordered databox-shadowed databox-graded\"><div class=\"databox-left bg-palegreen\" style=\"width: 88px;\"><div class=\"databox-piechart\">" 
					    +"<div class=\"icon country-icon-[0]\"  style=\"background-size: 100%;width: 68px;height: 45px;\"></div></div></div><div class=\"databox-right\" style=\"width: calc(100% - 98px)\"><span class=\"databox-number green ng-binding\">[1]</span>" 
				        +"<div class=\"databox-text darkgray ng-binding\">[2]</div><div class=\"databox-stat bg-palegreen radius-bordered\"><div class=\"stat-text ng-binding\">"+$.i18n("status.globalSIMNew.info11")+":[3]</div></div></div></div></div>";
		   for(var key in data){
			  var country = $.i18n("continent.comData");
 			  var keyName = "";
 			  for(var j=0;j<country.length;j++){
 				  if(country[j][0] == key){
 					  keyName = country[j][1];
 					  break;
 				  }
 			  }
    		  html +="<div role=\"tabpanel\" class=\"ng-scope\"> <h3 class=\"title ng-binding\">"+keyName+"</h3> <div class=\"row ng-scope\">";
    		  for(var i=0;i<data[key].length;i++){
    			  var a = html_model.replace("[0]", data[key][i].areaName);
    			  var b = html_model.replace("[1]", data[key][i].simcardCount);
    			  var d = html_model.replace("[2]", $.i18n("country.area."+data[key][i].areaName));
    			  var f = html_model.replace("[3]", (data[key][i].statusCountMap)["0"]);
    			  html += html_model.replace("[0]", data[key][i].areaName).replace("[1]", data[key][i].simcardCount).replace("[2]", $.i18n("country.area."+data[key][i].areaName)).replace("[3]", (data[key][i].statusCountMap)["1"]);  
    		  }
    		  html +="</div></div>"; 
    		}
    		$("#state_tab").append(html);
     	} 
		 
    	
    	
    	var globalSIMGrpSelData = selectPermissionsInfo.scGroupSelData;  
    	var html_idxGlobalSIMGrpID = "";
    	if(globalSIMGrpSelData!=null){
    	   for(var i=0; i<globalSIMGrpSelData.length; i++){   
    		 html_idxGlobalSIMGrpID += "<option value=\""+globalSIMGrpSelData[i][0]+"\">"+globalSIMGrpSelData[i][1]+"</option>";
  	       } 
    	}
    	if(html_idxGlobalSIMGrpID!=""){ 
    		$("#idxSCGroupID").append(html_idxGlobalSIMGrpID);
    		$("#idxSCGroupID1").append(html_idxGlobalSIMGrpID);
    	}
    	
    	var i18nText = $.i18n(tbI18n+"status.comData");    
 	    $("#status_2").append(i18nText["0"]["1"]); 
	    $("#status_3").append(i18nText["1"]["1"]); 
    	
    	
	     
    } 
     
    
    //获取查询条件
    function mygetSearchParams() {
        var params = '{'; 
        
        if($("#keySimCardID").val()!="" && $("#keySimCardID").val()!=null){ 
        	params +="\"cx_LIKE-|-keySimCardID\":"+"\""+$("#keySimCardID").val()+"\",";  
        } 
        
        if($("#idxSCGroupID").val()!="" && $("#idxSCGroupID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxSCGroupID\":"+"\""+$("#idxSCGroupID").val()+"\",";  
        }
        
        if($("#number").val()!="" && $("#number").val()!=null){ 
        	params +="\"cx_LIKE-|-number\":"+"\""+$("#number").val()+"\",";  
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
        	params1 +="\"keySimCardID\":"+"\""+$("#keySimCardID1").val()+"\",";   
        	params1 +="\"idxSCGroupID\":"+"\""+$("#idxSCGroupID1").val()+"\",";   
        	params1 +="\"imsi\":"+"\""+$("#imsi1").val()+"\","; 
        	params1 +="\"imei\":"+"\""+$("#imei1").val()+"\",";   
        	params1 +="\"ssId\":"+"\""+$("#ssId1").val()+"\",";  
        	params1 +="\"status\":"+"\""+$("#status1").val()+"\",";  
        	params1 +="\"number\":"+"\""+$("#number1").val()+"\",";  
        	if($("#balance1").val()==""){
        		params1 +="\"balance\":"+"\""+0+"\","; 
        	}else{
        		params1 +="\"balance\":"+"\""+parseFloat($("#balance1").val())*1000+"\","; 
        	} 
        	
        	if($("#restNetData1").val()==""){
        		params1 +="\"restNetData\":"+"\""+0+"\","; 
        	}else{
        		params1 +="\"restNetData\":"+"\""+parseFloat($("#restNetData1").val())*1000+"\","; 
        	} 
        	 
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
    	
    	$("#keySimCardID1").val(eval("mydata["+arr[1]+"].keySimCardID")); 
    	$("#keySimCardID1").attr("disabled","disabled");
    	$("#idxSCGroupID1").val(eval("mydata["+arr[1]+"].idxSCGroupID"));   
    	$("#imsi1").val(eval("mydata["+arr[1]+"].imsi")); 
    	$("#imei1").val(eval("mydata["+arr[1]+"].imei"));  
    	$("#ssId1").val(eval("mydata["+arr[1]+"].ssId"));  
    	$("#status1").val(eval("mydata["+arr[1]+"].status"));  
    	$("#number1").val(eval("mydata["+arr[1]+"].number"));   
    	$("#balance1").val(eval("mydata["+arr[1]+"].balance")/1000);  
    	$("#restNetData1").val(eval("mydata["+arr[1]+"].restNetData")/1000); 
    	$("#remarks1").val(eval("mydata["+arr[1]+"].remarks"));  
    	
    }
         
        
    //查看详情方法
    function viewDetails(number){  
       var i18nText = $.i18n(tbI18n+"status.comData");  
	   var value = parseInt(mydata[number].status);
	   var i18nText_get = i18nText[value][1]; 
       var html_viewDetails = ""; 
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" width=\"32%\"> "+$.i18n(tbI18n+"keySimCardID")+": </td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].keySimCardID+"</div></td></tr>";
 	   var globalSIMGrpSelData = selectPermissionsInfo.scGroupSelData;  
	   var html_globalSIMGrpSelData  = "";
	   if(globalSIMGrpSelData!=null){
	     for(var i=0; i<globalSIMGrpSelData.length; i++){   
		     if(globalSIMGrpSelData[i][0]==mydata[number].idxSCGroupID){
		    	 html_globalSIMGrpSelData = globalSIMGrpSelData[i][1];
			     break;
		     } 
	     }
	   } 
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxSCGroupID")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_globalSIMGrpSelData+"</div></td></tr>";
 	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"imsi")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].imsi+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"imei")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].imei+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"ssId")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].ssId+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"status")+"：</td><td><div class=\"f-p-tips ng-binding\"><i class=\"img-fmt simp-dev-sta-"+mydata[number].status+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td></tr>";
 	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"number")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].number+"</div></td></tr>";	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"balance")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata[number].balance)/1000+"</div></td></tr>";	  
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"restNetData")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata[number].restNetData)/1000+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"onlineTime")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].onlineTime+"</div></td></tr>";
 	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"totalSuccess")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].totalSuccess+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"totalFailed")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].totalFailed+"</div></td></tr>";   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"totalData")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata[number].totalData)/1000+"</div></td></tr>";	    
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"lastIdleTime")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata[number].lastIdleTime+"</div></td></tr>";
 	    
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
		$("#keySimCardID1").val(""); 
    	$("#keySimCardID1").removeAttr("disabled");
    	$("#idxSCGroupID1").val("");   
    	$("#imsi1").val(""); 
    	$("#imei1").val("");  
    	$("#ssId1").val("");
    	$("#status1").val("");  
    	$("#number1").val("");   
    	$("#balance1").val("");   
    	$("#restNetData1").val("");   
    	$("#remarks1").val(""); 
    	 
    }
    
	//清空搜索条件表单
	function myclearSearchItems(){
		$("#keySimCardID").val("");  
    	$("#idxSCGroupID").val("");   
    	$("#number").val("");   
	}
	
	//列表展示数据转换
	function changeData(tdname,showLengthData,dataTdValue){ 
		var html = "";
		if(tdname=="status"){  
			   var i18nText = $.i18n(tbI18n+"status.comData");   
			   var value = parseInt(dataTdValue); 
			   var i18nText_get = i18nText[value][1];  
			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\"><i class=\"img-fmt simp-dev-sta-"+dataTdValue+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td>"; 
		}else if(tdname=="balance" || tdname=="restNetData" || tdname=="totalData"){
			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+parseFloat(dataTdValue)/1000+"</div></td>"; 
		}else if(tdname=="idxSCGroupID"){ 
			var globalSIMGrpSelData = selectPermissionsInfo.scGroupSelData;  
			var html_idxGlobalSIMGrpID = "";
			if(globalSIMGrpSelData!=null){ 
			   for(var i=0; i<globalSIMGrpSelData.length; i++){   
				   if(globalSIMGrpSelData[i][0]==dataTdValue){
					   html_idxGlobalSIMGrpID = globalSIMGrpSelData[i][1];
					   break;
				   } 
			   }
			}   
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_idxGlobalSIMGrpID+"</div></td>"; 
		}else{
			   html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	} 
	 
	
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
	   	    	$("#countGlobalSIM").html(data[0].countGlobalSIM);
	   	    	$("#countGlobalSIMGrp").html(data[0].countGlobalSIMGrp);
	   	    	$("#countStatus0").html(data[0].countStatus0);
	   	    	$("#countStatus1").html(data[0].countStatus1);
	   	    	$("#countStatus").html(data[0].countStatus0+','+data[0].countStatus1);
	   	    	InitiateSparklineCharts.init();
	   	    	$("#countOverTimeCard").html(data[0].countOverTimeCard); 
	   	    	
	   	        //请求成功时处理
	   	    }, 
	   	    error:function(){  
	   	        //请求出错处理
	   	    }
	    });
	}
	
	//新增卡组
	function addclub(){
		showTools9('tools8','tab3','list2_tab','list','state_tab');
		myopenModel8('myeditModal8','new');
	}
	
	//新增卡
	function addcard(){
		showTools9('tools','tab2','list','list2_tab','state_tab');
		myopenModel('myeditModal','new');
	} 
	
	
	//************************************** 第二个列表的配置 begin **************************// 
    
	//国际化开头
    var tbI18n8 = "db.tbSCGroup.";
    //表的主键
    var tablekey8 = "keySCGroupID";  
    
    //设置存在localStorage 的列表配置名
    var itemName8 = "my_setTrs_tbSCGroup";
    //设置初始化排序字段
    var MY_ORDER_LIST8 = [];
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems8 = {"resetTimes" : "3","trs": [{"name": "keySCGroupID","show": "true","width":"125"},
               {"name": "groupName","show": "true","width":"120"},
               {"name": "idxSalerId","show": "true","width":"150"},
               {"name": "areaCode","show": "true","width":"220"},
               {"name": "ispID","show": "true","width":"120"},
               {"name": "cardType","show": "true","width":"100"},
               {"name": "cardSize","show": "false","width":"100"}, 
               {"name": "monthlyRental","show": "true","width":"90"},
               {"name": "dataUsage","show": "false","width":"100"},
               {"name": "dataPrice","show": "true","width":"150"},
               
               {"name": "roamSupport","show": "true","width":"80"},
               {"name": "roamAreaCodes","show": "false","width":"150"},  
               {"name": "roamDataPrice","show": "true","width":"100"}, 
               {"name": "priority","show": "true","width":"100"},
               
               {"name": "apn", "show": "true", "width":"100"},
               {"name": "dialnumber", "show": "true", "width":"100"},
               {"name": "dialuid", "show": "true", "width":"100"},
               {"name": "dialpwd", "show": "true", "width":"100"},
               
               {"name": "number","show": "true","width":"100"},
               {"name": "remarks","show": "false","width":"128"},  
               {"name": "mdfTm","show": "true","width":"125"},
               {"name": "mdfBy","show": "false","width":"90"},
               {"name": "crtTm","show": "false","width":"125"},
               {"name": "crtBy","show": "false","width":"90"}]
    };
    //设置重置参数
    var resetSelectItems8 = selectItems8;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams8(){   
	    //卡大小
	    var i18nTextCardSize = $.i18n(tbI18n8+"cardSize.comData");   
	    var html_cardSize = "";
	    html_cardSize += "<option value=\""+i18nTextCardSize[0][0]+"\">"+i18nTextCardSize[0][1]+"</option>";
	    html_cardSize += "<option value=\""+i18nTextCardSize[1][0]+"\">"+i18nTextCardSize[1][1]+"</option>";
	    html_cardSize += "<option value=\""+i18nTextCardSize[2][0]+"\">"+i18nTextCardSize[2][1]+"</option>";
    	$("#cardSize").append(html_cardSize); 
    	$("#cardSize8").append(html_cardSize); 
    	
    	//网络类型
    	var i18nTextCardType = $.i18n(tbI18n8+"cardType.comData");   
	    var html_cardType = "";
	    html_cardType += "<option value=\""+i18nTextCardType[0][0]+"\">"+i18nTextCardType[0][1]+"</option>";
	    html_cardType += "<option value=\""+i18nTextCardType[1][0]+"\">"+i18nTextCardType[1][1]+"</option>";
	    html_cardType += "<option value=\""+i18nTextCardType[2][0]+"\">"+i18nTextCardType[2][1]+"</option>";
    	$("#cardType").append(html_cardType); 
    	$("#cardType8").append(html_cardType); 
    	
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
	    
	    //供应商编号
    	var supplierSelData = selectPermissionsInfo.supplierSelData;  
    	var html_supplierSelData = "";
    	if(supplierSelData!=null){
    	   for(var i=0; i<supplierSelData.length; i++){   
    		  html_supplierSelData += "<option value=\""+supplierSelData[i][0]+"\">"+supplierSelData[i][1]+"</option>";
  	       }
    	}
    	$("#idxSalerId8").append(html_supplierSelData); 
    	
    }
    
    function setIspSelDataAndAreaSelData(){
    	//运营商
    	var ispSelData = selectPermissionsInfo.ispSelData;  
    	var html_ispSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbSCGroup.ispID.help")+"</option>";
    	if(ispSelData!=null){
    	  for(var i=0; i<ispSelData.length; i++){   
    		 html_ispSelData += "<option value=\""+ispSelData[i][0]+"\">"+ispSelData[i][1]+"</option>";
  	      } 
    	}
    	$("#ispID").html(html_ispSelData); 
    	$("#ispID").select2(); 
    	$("#ispID8").html(html_ispSelData); 
    	$("#ispID8").select2(); 
    	
    	//地区编号
    	var areaSelData = selectPermissionsInfo.areaSelData;  
    	var html_areaSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbSCGroup.areaCode.help")+"</option>";
    	var html_areaSelData1 = "";
    	if(areaSelData!=null){
    	  for(var i=0; i<areaSelData.length; i++){   
    		  html_areaSelData += "<option value=\""+areaSelData[i][0]+"\">"+areaSelData[i][1]+"</option>";
    		  html_areaSelData1 += "<option value=\""+areaSelData[i][0]+"\">"+areaSelData[i][1]+"</option>";
  	      } 
    	}
    	$("#areaCode").html(html_areaSelData); 
    	$("#areaCode").select2();
    	$("#areaCode8").html(html_areaSelData); 
    	$("#areaCode8").select2();
    	$("#roamAreaCodes8").html(html_areaSelData1); 
    	$("#roamAreaCodes8").select2({
            placeholder: $.i18n("db.tbSCGroup.roamAreaCodes.help"),
            allowClear: true
        });
    	
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
    	var html_ispSelData = "<option value=\"\" selected=\"selected\">"+$.i18n(tbI18n8+"ispID.help")+"</option> ";
    	if(ispSelData!=null){
    	   for(var i=0; i<ispSelData.length; i++){   
    		  if(ispSelData[i][2]==thisSelect){
    		     html_ispSelData += "<option value=\""+ispSelData[i][0]+"\">"+ispSelData[i][1]+"</option>";
    		  }
  	       }
    	}
    	$("#ispID8").html(html_ispSelData);  
    	$("#ispID8").select2();
    	//重置验证
    	$("#registrationForm8").data('bootstrapValidator').resetForm();
    } 
    
    //获取查询条件
    function mygetSearchParams8() {
        var params = '{'; 
        
        if($("#groupName").val()!="" && $("#groupName").val()!=null){ 
        	params +="\"cx_LIKE-|-groupName\":"+"\""+$("#groupName").val()+"\",";  
        } 
        
        if($("#areaCode").val()!="" && $("#areaCode").val()!=null){ 
        	params +="\"cx_LIKE-|-areaCode\":"+"\""+$("#areaCode").val()+"\",";  
        }
        
        if($("#ispID").val()!="" && $("#ispID").val()!=null){ 
        	params +="\"cx_LIKE-|-ispID\":"+"\""+$("#ispID").val()+"\",";  
        }
        
        if($("#cardType").val()!="" && $("#cardType").val()!=null){ 
        	params +="\"cx_LIKE-|-cardType\":"+"\""+$("#cardType").val()+"\",";  
        } 
        
        if($("#cardSize").val()!="" && $("#cardSize").val()!=null){ 
        	params +="\"cx_LIKE-|-cardSize\":"+"\""+$("#cardSize").val()+"\",";  
        }
        
        if($("#priority").val()!="" && $("#priority").val()!=null){ 
        	params +="\"cx_LIKE-|-priority\":"+"\""+$("#priority").val()+"\",";  
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
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" width=\"32%\"> "+$.i18n(tbI18n8+"keySCGroupID")+": </td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].keySCGroupID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"groupName")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].groupName+"</div></td></tr>";
     
       var supplierSelData = selectPermissionsInfo.supplierSelData; 
	   if(supplierSelData!=null){
         for(var i=0; i<supplierSelData.length; i++){   
 		    if(supplierSelData[i][0]==mydata8[number].idxSalerId){
 		     	html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxSalerId")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+supplierSelData[i][1]+"</div></td></tr>";
 			    break;
 		    }
	      } 
	   }else{
		  html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxSalerId")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+""+"</div></td></tr>";
	   }
 	    
 	   var areaSelData = selectPermissionsInfo.areaSelData; 
 	   if(areaSelData!=null){
         for(var i=0; i<areaSelData.length; i++){   
  		    if(areaSelData[i][0]==mydata8[number].areaCode){ 
  			    html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"areaCode")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+areaSelData[i][1]+"</div></td></tr>";
  			    break;
  		    }
	     }
 	   }else{
 		  html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"areaCode")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+""+"</div></td></tr>";
 	   }
 	    
 	   var ispSelData = selectPermissionsInfo.ispSelData; 
 	   if(areaSelData!=null){
          for(var i=0; i<ispSelData.length; i++){   
  		    if(ispSelData[i][0]==mydata8[number].ispID){
  		     	html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"ispID")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+ispSelData[i][1]+"</div></td></tr>";
  			    break;
  		    }
	      } 
 	   }else{
 		  html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"ispID")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+""+"</div></td></tr>";
 	   }
       
 	    var i18nTextCardType = $.i18n(tbI18n8+"cardType.comData");   
	    var html_cardType = "";
		if(i18nTextCardType[0][0]==mydata8[number].cardType){ 
			html_cardType = i18nTextCardType[0][1];
		}else if(i18nTextCardType[1][0]==mydata8[number].cardType){ 
			html_cardType = i18nTextCardType[1][1];
		}else if(i18nTextCardType[2][0]==mydata8[number].cardType){ 
			html_cardType = i18nTextCardType[2][1];
		}
		html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"cardType")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_cardType+"</div></td></tr>";
	
		var html_cardSize = $.i18n(tbI18n8+"cardSize.comData");   
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
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"dataUsage")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata8[number].dataUsage)/1000+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"dataPrice")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata8[number].dataPrice)/1000+"</div></td></tr>";	
 	   var html_roamSupport = "";
		if("1"==mydata8[number].roamSupport){ 
			html_roamSupport = $.i18n("yes");
		}else{ 
			html_roamSupport = $.i18n("no");
		} 
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"roamSupport")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+html_roamSupport+"</div></td></tr>";
 	  
 	   
 	  var areaSelData1 = selectPermissionsInfo.areaSelData;  
 	  var roamAreaCodesValue = mydata8[number].roamAreaCodes.toString();  
 	  var thisthtml ="";
      if(roamAreaCodesValue!=null && roamAreaCodesValue !="" && roamAreaCodesValue!=undefined){  
    	var arr = roamAreaCodesValue.split(",");  
  		if(arr != null){  
  			for(var i=0;i<arr.length;i++){ 
  				if(areaSelData1!=null){
  			        for(var j=0; j<areaSelData1.length; j++){     
  			        	if(areaSelData1[j][0]==arr[i]){  
  			 		    	if(i==arr.length-1){
  			 		    		thisthtml += areaSelData1[j][1];
  			 		    	}else{
  			 		    		thisthtml += areaSelData1[j][1] + ",";
  			 		    	}
  			 			    break;
  			 		    }
  				     }
  				 }   
  			} 
  		}
  	  }
       html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"roamAreaCodes")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+thisthtml+"</div></td></tr>"; 
      
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"roamDataPrice")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+parseFloat(mydata8[number].roamDataPrice)/1000+"</div></td></tr>";	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"number")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].number+"</div></td></tr>";
	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"apn")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].apn+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"dialnumber")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].dialnumber+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"dialuid")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].dialuid+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"dialpwd")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].dialpwd+"</div></td></tr>";
	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"remarks")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].remarks+"</div></td></tr>"; 
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfTm")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].mdfTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfBy")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].mdfBy+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtTm")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].crtTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtBy")+"：</td><td><div class=\"f-p-tips ng-binding\" style=\"word-wrap:break-word;word-break:break-all;\">"+mydata8[number].crtBy+"</div></td></tr>";
 	   $("#html_viewDetails8").html(html_viewDetails);
 	   selectCount8(mydata8[number].keySCGroupID);  //详情中统计该组卡状态
 	   myopenModel8('mydetailModal8','detail');   
 	  
    }
    
    //详情中统计该组卡状态
	function selectCount8(keySCGroupID){
		$.ajax({
	   	    url:window.PATH + visit_url +"/selectCount8.ajax",    //请求的url地址
	   	    dataType:"json",   //返回格式为json
	   	    async:true,//请求是否异步，默认为异步，这也是ajax重要特性
	   	    data:{keySCGroupID:keySCGroupID},    //参数值
	   	    type:"POST",   //请求方式 
	   	    success:function(res){ 
	   	    	var data = res.data;  
	   	    	$("#countStatus0_detail").html(data[0].countStatus0);
	   	    	$("#countStatus1_detail").html(data[0].countStatus1);
	   	    	$("#countStatus_detail").html(data[0].countStatus0+','+data[0].countStatus1);
	   	    	InitiateSparklineCharts.init(); 
	   	    	
	   	        //请求成功时处理
	   	    }, 
	   	    error:function(){  
	   	        //请求出错处理
	   	    }
	    });
	}
    
    //获取编辑的内容
    function mygetSaveData8() { 
        var params1 = '{';   
        	params1 +="\"groupName\":"+"\""+$("#groupName8").val()+"\",";   
        	params1 +="\"idxSalerId\":"+"\""+$("#idxSalerId8").val()+"\","; 
        	params1 +="\"areaCode\":"+"\""+$("#areaCode8").val()+"\",";   
        	params1 +="\"ispID\":"+"\""+$("#ispID8").val()+"\",";  
        	params1 +="\"cardType\":"+"\""+$("#cardType8").val()+"\",";   
        	params1 +="\"cardSize\":"+"\""+$("#cardSize8").val()+"\",";   
        	params1 +="\"monthlyRental\":"+"\""+parseFloat($("#monthlyRental8").val())*1000+"\","; 
        	params1 +="\"dataUsage\":"+"\""+parseFloat($("#dataUsage8").val())*1000+"\","; 
        	params1 +="\"dataPrice\":"+"\""+parseFloat($("#dataPrice8").val())*1000+"\",";  
        	
        	if($("#roamSupport8").is(':checked')){
        		params1 +="\"roamSupport\":"+"\""+1+"\","; 
    		}else{
    			params1 +="\"roamSupport\":"+"\""+0+"\","; 
    		}
        	if($("#roamAreaCodes8").val()!=null){
        		params1 +="\"roamAreaCodes\":"+"\""+$("#roamAreaCodes8").val()+"\","; 
        	} 
        	if($("#roamAreaCodes8").val()!=null){
        	    params1 +="\"roamDataPrice\":"+"\""+parseFloat($("#roamDataPrice8").val())*1000+"\","; 
        	} 
        	params1 +="\"priority\":"+"\""+$("#priority8").val()+"\","; 
        	params1 +="\"number\":"+"\""+$("#number8").val()+"\","; 
        	params1 +="\"apn\":"+"\""+$("#apn8").val()+"\","; 
        	params1 +="\"dialnumber\":"+"\""+$("#dialnumber8").val()+"\","; 
        	params1 +="\"dialuid\":"+"\""+$("#dialuid8").val()+"\","; 
        	params1 +="\"dialpwd\":"+"\""+$("#dialpwd8").val()+"\","; 
        	params1 +="\"remarks\":"+"\""+$("#remarks8").val()+"\","; 
        	
        	if(params1 != '{'){
        		if($("#editAddType8").val()=="new"){
        		   params1 += "\"actionName\":"+"\""+$.i18n("new")+"\""; 
        		}else if($("#editAddType8").val()=="edit"){
        		   params1 +="\"keySCGroupID\":"+"\""+$("#keySCGroupID8").val()+"\",";  
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
    	
    	$("#keySCGroupID8").val(eval("mydata8["+arr[1]+"].keySCGroupID"));  
    	$("#groupName8").val(eval("mydata8["+arr[1]+"].groupName"));   
    	$("#idxSalerId8").val(eval("mydata8["+arr[1]+"].idxSalerId"));  
    	$("#areaCode8").val(eval("mydata8["+arr[1]+"].areaCode")); 
    	$("#areaCode8").select2();
    	
    	var areaCode = eval("mydata8["+arr[1]+"].areaCode");
    	var areaSelData = selectPermissionsInfo.areaSelData; 
    	if(areaCode!="" && areaCode!=null && areaSelData!=null){
    	  for(var i=0; i<areaSelData.length; i++){   
    		if(areaSelData[i][0]==areaCode){
    			$("#continent").val(areaSelData[i][2]);
    			$("#continent").select2();
    			break;
    		}
  	      } 
    	} 
    	
    	$("#ispID8").val(eval("mydata8["+arr[1]+"].ispID"));  
  	    $("#ispID8").select2();
    	$("#cardType8").val(eval("mydata8["+arr[1]+"].cardType"));   
    	$("#cardSize8").val(eval("mydata8["+arr[1]+"].cardSize"));   
    	$("#monthlyRental8").val(parseFloat(eval("mydata8["+arr[1]+"].monthlyRental"))/1000);  
    	$("#dataUsage8").val(parseFloat(eval("mydata8["+arr[1]+"].dataUsage"))/1000);   
    	$("#dataPrice8").val(parseFloat(eval("mydata8["+arr[1]+"].dataPrice"))/1000);  
    	 
    	if(eval("mydata8["+arr[1]+"].roamSupport")=="1"){ 
    		$("#roamSupport8").prop("checked", true); 
    		$("#roamAreaCodes8").attr("disabled",false);
			$("#roamDataPrice8").attr("disabled",false);
		}else{
			$("#roamSupport8").prop("checked", false);  
			$("#roamAreaCodes8").attr("disabled",true);
			$("#roamDataPrice8").attr("disabled",true);
		} 
    	
    	var arr2 = [];
    	var roamAreaCodesValue = eval("mydata8["+arr[1]+"].roamAreaCodes").toString();   
    	if(roamAreaCodesValue!=null && roamAreaCodesValue !="" && roamAreaCodesValue!=undefined){
    		arr2 = roamAreaCodesValue.split(","); 
    	}
    	
    	//地区编号
    	var areaSelData1 = selectPermissionsInfo.areaSelData;   
    	var html_areaSelData1 = "";
    	if(areaSelData1!=null){ 
    		for(var i=0; i<areaSelData1.length; i++){     
    		  if(arr2!=null && $.inArray(areaSelData1[i][0] , arr2) != -1){
    			  html_areaSelData1 += "<option selected=\"selected\" value=\""+areaSelData1[i][0]+"\">"+areaSelData1[i][1]+"</option>";
    		  }else{
    		      html_areaSelData1 += "<option value=\""+areaSelData1[i][0]+"\">"+areaSelData1[i][1]+"</option>";
    		  }
  	      } 
    	}  
    	$("#roamAreaCodes8").html(html_areaSelData1); 
    	$("#roamAreaCodes8").select2({
            placeholder: $.i18n("db.tbSCGroup.roamAreaCodes.help"),
            allowClear: true
        });
    	 
    	
    	$("#roamDataPrice8").val(parseFloat(eval("mydata8["+arr[1]+"].roamDataPrice"))/1000);  
    	$("#priority8").val(eval("mydata8["+arr[1]+"].priority")); 
    	$("#number8").val(eval("mydata8["+arr[1]+"].number"));  
    	$("#remarks8").val(eval("mydata8["+arr[1]+"].remarks"));    
    	$("#apn8").val(eval("mydata8["+arr[1]+"].apn")); 
    	$("#dialnumber8").val(eval("mydata8["+arr[1]+"].dialnumber")); 
    	$("#dialuid8").val(eval("mydata8["+arr[1]+"].dialuid")); 
    	$("#dialpwd8").val(eval("mydata8["+arr[1]+"].dialpwd")); 
    }
    
    //清空编辑表单
	function myclearForm8(){
		$("#keySCGroupID8").val("");  
    	$("#groupName8").val("");   
    	$("#idxSalerId8").val(""); 
    	   
    	$("#cardType8").val("");  
    	$("#cardSize8").val("");   
    	$("#monthlyRental8").val(""); 
    	$("#dataUsage8").val(""); 
    	$("#dataPrice8").val("");   
    	//$("#roamAreaCodes8").val("");  
    	$("#roamDataPrice8").val(""); 
    	$("#roamSupport8").prop("checked", false); 
		$("#roamAreaCodes8").attr("disabled",true);
		$("#roamDataPrice8").attr("disabled",true); 
    	$("#priority8").val("");
    	$("#number8").val("");
    	$("#remarks8").val(""); 
    	
    	$("#apn8").val("");
    	$("#dialnumber8").val("");
    	$("#dialuid8").val("");
    	$("#dialpwd8").val("");
    	
    	//设置运营商和地区编号下来框
    	setIspSelDataAndAreaSelData(); 
        $("#continent").val("");
        $("#continent").select2();
        $("#areaCode8").val("");
        $("#areaCode8").select2();
        $("#ispID8").val("");
        $("#ispID8").select2();
    }
    
	//清空搜索条件表单
	function myclearSearchItems8(){ 
    	$("#ispID").val(""); 
    	$("#ispID").select2(); 
    	$("#areaCode").val(""); 
    	$("#areaCode").select2();
    	$("#groupName").val(""); 
    	$("#cardType").val(""); 
    	$("#priority").val("");  
    	$("#cardSize").val(""); 
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
		}else if(tdname=="ispID"){    
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
			var i18nTextCardType = $.i18n(tbI18n8+"cardType.comData");   
		    var html_cardType = "";
			if(i18nTextCardType[0][0]==dataTdValue){ 
				html_cardType = i18nTextCardType[0][1];
			}else if(i18nTextCardType[1][0]==dataTdValue){ 
				html_cardType = i18nTextCardType[1][1];
			}else if(i18nTextCardType[2][0]==dataTdValue){ 
				html_cardType = i18nTextCardType[2][1];
			}   
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_cardType+"</div></td>"; 
		}else if(tdname=="roamSupport"){  
		    var html_roamSupport = "";
			if("1"==dataTdValue){ 
				html_roamSupport = $.i18n("yes");
			}else{ 
				html_roamSupport = $.i18n("no");
			} 
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_roamSupport+"</div></td>"; 
		}else if(tdname=="cardSize"){      
			var html_cardSize = $.i18n(tbI18n8+"cardSize.comData");   
		    var html_cardSize1 = "";
			if(html_cardSize[0][0]==dataTdValue){ 
				html_cardSize1 = html_cardSize[0][1];
			}else if(html_cardSize[1][0]==dataTdValue){ 
				html_cardSize1 = html_cardSize[1][1];
			}else if(html_cardSize[2][0]==dataTdValue){ 
				html_cardSize1 = html_cardSize[2][1];
			}   
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html_cardSize1+"</div></td>"; 
		}else if(tdname=="roamAreaCodes"){      
			var areaSelData1 = selectPermissionsInfo.areaSelData;  
			var roamAreaCodesValue = dataTdValue.toString();   
			var thisthtml ="";
		    if(roamAreaCodesValue!=null && roamAreaCodesValue !="" && roamAreaCodesValue!=undefined){  
		  	var arr = roamAreaCodesValue.split(",");  
				if(arr != null){  
					for(var i=0;i<arr.length;i++){ 
						if(areaSelData1!=null){
					        for(var j=0; j<areaSelData1.length; j++){     
					        	if(areaSelData1[j][0]==arr[i]){  
					 		    	if(i==arr.length-1){
					 		    		thisthtml += areaSelData1[j][1];
					 		    	}else{
					 		    		thisthtml += areaSelData1[j][1] + ",";
					 		    	}
					 			    break;
					 		    }
						     }
						 }   
					} 
				}
			  } 
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+thisthtml+"</div></td>"; 
		}else if(tdname=="idxSalerId"){      
			var html123 = "";
			var supplierSelData = selectPermissionsInfo.supplierSelData; 
		    if(supplierSelData!=null){
		      for(var i=0; i<supplierSelData.length; i++){   
				    if(supplierSelData[i][0]==dataTdValue){
				    	html123 = supplierSelData[i][1];
					    break;
				    }
			      } 
			   }  
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+html123+"</div></td>"; 
		}else{
			html = "<td><div class=\"table-data th_"+tdname+" \" style=\"width:"+showLengthData+"px;overflow:hidden;text-overflow:ellipsis;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	} 
	
	
	
	 
	
	//点击是否漫游 复选框
	function checkRoamSupport(){
		if($("#roamSupport8").is(':checked')){
			$("#roamAreaCodes8").attr("disabled",false);
			$("#roamDataPrice8").attr("disabled",false);
		}else{
			$("#roamAreaCodes8").attr("disabled",true);
			$("#roamDataPrice8").attr("disabled",true);
		}
		$("#registrationForm8").data('bootstrapValidator').resetForm();
	}
	 
    
   //************************************** 第二个列表的配置 end **************************// 
    
    
    
    
    
	     
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
                	keySimCardID: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },idxSCGroupID: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },imsi: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            }
                        }
                    },imei: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            },stringLength: {
                                min: 15,
                                max: 15,
                                message: eval('validator_'+validator_language+'.range').replace('{0}','15').replace('{1}','15')
                            }
                        }
                    },ssId: {
                        validators: {
                            notEmpty: {
                                message: eval('validator_'+validator_language+'.required')
                            },regexp: {
                                regexp: /^[0-9]\d*$/,
                                message: eval('validator_'+validator_language+'.digits')
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
                            regexp: {
                                regexp: /^[0-9]\d*(\.\d+)?$/,
                                message: eval('validator_'+validator_language+'.number')
                            }
                        }
                    },restNetData: {
                        validators: {
                        	regexp: {
                                regexp: /^[0-9]\d*(\.\d+)?$/,
                                message: eval('validator_'+validator_language+'.number')
                            }
                        }
                    },remarks: {
                    	validators:{
                    		stringLength: {
                                min: 0,
                                max: 128,
                                message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','128')
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
            	keySCGroupID: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },groupName: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },stringLength: {
                        	min:0,
                        	max: 128,
                        	message: eval('validator_'+validator_language+'.rangelength').replace("{0}",0).replace('{1}',128)
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
                },ispID: {
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
                        },decimals: {
                        	digits: 3,
                        	message: eval('validator_'+validator_language+'.decimals').replace('{0}',3)
                        },between: {
                        	min: 0,
                        	max: 999999,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}',0).replace('{1}',999999)
                        }
                    }
                },dataUsage: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },decimals: {
                        	digits: 3,
                        	message: eval('validator_'+validator_language+'.decimals').replace('{0}',3)
                        },between: {
                        	min: 0,
                        	max: 999999,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}',0).replace('{1}',999999)
                        }
                    }
                },dataPrice: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },decimals: {
                        	digits: 3,
                        	message: eval('validator_'+validator_language+'.decimals').replace('{0}',3)
                        },between: {
                        	min: 0,
                        	max: 999999,
                        	message: eval('validator_'+validator_language+'.range').replace('{0}',0).replace('{1}',999999)
                        }
                    }
                },roamAreaCodes: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },roamDataPrice: {
                    validators: {
                    	notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },regexp: {
                            regexp: /^[0-9]\d*(\.\d+)?$/,
                            message: eval('validator_'+validator_language+'.number')
                        }
                    }
                },priority: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },number: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        },regexp: {
                            regexp: /^[0-9]\d*$/,
                            message: eval('validator_'+validator_language+'.digits')
                        }
                    }
                },apn: {
                    validators: {
                        notEmpty: {
                            message: eval('validator_'+validator_language+'.required')
                        }
                    }
                },
                //dialnumber: {
                //    validators: {
                //       notEmpty: {
                //            message: eval('validator_'+validator_language+'.required')
                //        }
                //    }
                //},dialuid: {
                //    validators: {
                //        notEmpty: {
                //            message: eval('validator_'+validator_language+'.required')
                //        }
                //    }
                //},dialpwd: {
                //    validators: {
                //        notEmpty: {
                //            message: eval('validator_'+validator_language+'.required')
                //        }
                //   }
                //},
                remarks: {
                	validators:{
                		stringLength: {
                            min: 0,
                            max: 128,
                            message: eval('validator_'+validator_language+'.range').replace('{0}','0').replace('{1}','128')
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
		var winHeight = document.documentElement.clientHeight;
		$("#state_tab").css("height", winHeight-170); 
		
    }); 
     
    </script> 
	
</body>
 