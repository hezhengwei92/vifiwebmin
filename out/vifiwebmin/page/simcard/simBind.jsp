  
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
                   
                   
                  <li class="active" id="tab2"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools','list','list2_tab','state_tab')"><i class="fa fa-list font14"></i><spring:message code="tabname.simBind.list1"/></a>
                  </li> 
                  <li class="tab-red" id="tab3"> 
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools8('tools8','list2_tab','list','state_tab')"><i class="fa fa-list font14"></i><spring:message code="tabname.simBind.list2"/></a> 
                  </li> 
                  
                  <!--
                  <li class="tab-red">
                     <a data-toggle="tab" href="javaScript:void(0)" onclick="showTools('false','tabpanle3','list2_tab','list')">图表 </a>
                  </li>  -->
                  
                  <!-- 工具按钮组 -->
				  <li class="head-tools-r navbar-right"  id="tools">
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
							<spring:message code="check_all"/> 
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
                
                  <!-- 列表页签 -->
                  <div id="list" class="tab-pane in active" style="border-radius:0;"> 
                    <!-- 搜索条件区域 -->
                    <div class="collapse" id="collapse-adv-search">
                      <div class="panel-body">
                      
                        <div class="row ng-scope">
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.keySUBindID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="keySUBindID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSUStaticBind.keySUBindID.help"/>" > 
                               </div>
                             </div>           
                          </div>
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.idxSCGroupID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSCGroupID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSUStaticBind.idxSCGroupID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.idxDevGrpID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxDevGrpID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSUStaticBind.idxDevGrpID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <!-- div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.idxSimCardID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxSimCardID" style="width: 100%;"  placeholder="<spring:message code="db.tbSUStaticBind.idxSimCardID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" ><spring:message code="db.tbSUStaticBind.idxSimCardID.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.idxViFiID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxViFiID" style="width: 100%;"  placeholder="<spring:message code="db.tbSUStaticBind.idxViFiID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" ><spring:message code="db.tbSUStaticBind.idxViFiID.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div>   -->
                          
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
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBindRecord.idxSUBindID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSUBindID"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSUStaticBindRecord.idxSUBindID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.idxSCGroupID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxSCGroupID3"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSUStaticBind.idxSCGroupID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBind.idxDevGrpID"/>:</span>
                             <div class="adv-value">
                               <div class="ng-scope">
                                  <input  type="text" id="idxDevGrpID3"  class="input-sm ng-pristine ng-valid ng-scope ng-touched" placeholder="<spring:message code="db.tbSUStaticBind.idxDevGrpID.help"/>" > 
                               </div>
                             </div>           
                          </div> 
                          
                          <!-- div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBindRecord.idxSimCardID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxSimCardID3" style="width: 100%;"  placeholder="<spring:message code="db.tbSUStaticBindRecord.idxSimCardID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" ><spring:message code="db.tbSUStaticBindRecord.idxSimCardID.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div> 
                          
                          <div class="col-md-3 margin-bottom-5 ng-scope">
                             <span class="adv-name ng-binding"><spring:message code="db.tbSUStaticBindRecord.idxViFiID"/>:</span>
                             <div class="adv-value">
                               <div class="input-sm no-border no-padding ng-scope" style="min-width:154px;"> 
                                  <select id="idxViFiID3" style="width: 100%;"  placeholder="<spring:message code="db.tbSUStaticBindRecord.idxViFiID.help"/>" class="ng-pristine ng-untouched ng-valid">
                                    <option value="" selected="selected" ><spring:message code="db.tbSUStaticBindRecord.idxViFiID.help"/></option>
                                    
                                  </select>
                               </div>
                             </div>
                          </div-->  
                          
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
          
            <input type="hidden" id="keySUBindID1" name="keySUBindID"/> 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbSUStaticBind.idxSCGroupID"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="idxSCGroupID1" name="idxSCGroupID" placeholder="<spring:message code="db.tbSUStaticBind.idxSCGroupID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbSUStaticBind.idxDevGrpID"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="idxDevGrpID1" name="idxDevGrpID" placeholder="<spring:message code="db.tbSUStaticBind.idxDevGrpID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>
			<!-- div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSUStaticBind.idxSimCardID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <select name="idxSimCardID" id="idxSimCardID1" style="width:100%;">
                       
                    </select>
                    
                  </div> 
                </div>
                </div> 
			</div>  
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSUStaticBind.idxViFiID"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <select name="idxViFiID" id="idxViFiID1" style="width:100%;">
                       
                    </select>
                    
                  </div> 
                </div>
                </div> 
			</div-->   
			 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			             <spring:message code="db.tbSUStaticBind.status"/>:<span class="required"><b class="ng-scope">*</b></span>
			    </label>
                <div class="col-sm-8"> 
			      <div class="ng-scope"> 
                   <select id="status1" name="status" style="width:100%;">
                     <option value="" ><spring:message code="db.tbSUStaticBind.status.help"/></option>
                     <option id="status_2" value="1">enable</option>
                     <option id="status_3" value="0">disable</option>
                   </select>
				  </div> 
                </div>
              </div>
			</div> 
			 
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3">
			            <spring:message code="db.tbSUStaticBind.remarks"/>:<span class="required"> </span>
			    </label>
                <div class="col-sm-8">
                  <div  class="ng-scope">
                    <input type="text" id="remarks1" name="remarks" placeholder="<spring:message code="db.tbSUStaticBind.remarks.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
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



 
    <script>
    //访问路径
    var visit_url = "/vsw/simBind";
    //国际化开头
    var tbI18n = "db.tbSUStaticBind.";
    //表的主键
    var tablekey = "keySUBindID";
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
    var itemName = "my_setTrs_simBind";
    //设置初始化排序字段
    var MY_ORDER_LIST = [];
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems = {"resetTimes" : "3","trs": [{"name": "keySUBindID","show": "false","width":"200"},
               //{"name": "idxSimCardID","show": "true","width":"200"},
               //{"name": "idxViFiID","show": "true","width":"200"}, 
               {"name": "idxSCGroupID","show": "true","width":"200"},
               {"name": "idxDevGrpID","show": "true","width":"200"}, 
               {"name": "status","show": "true","width":"100"},
               {"name": "useTimes","show": "true","width":"100"},
               {"name": "lastBindDate","show": "true","width":"125"},   
               {"name": "remarks","show": "true","width":"220"}, 
               {"name": "mdfTm","show": "true","width":"125"},
               {"name": "mdfBy","show": "true","width":"90"},
               {"name": "crtTm","show": "true","width":"125"},
               {"name": "crtBy","show": "true","width":"90"}]
    };
    //设置重置参数
    var resetSelectItems = selectItems;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams(){  
    	var globalSIMGrpSelData = selectPermissionsInfo.listIdxViFiIDED;   
	    var html_idxViFiID = "";
	    if(globalSIMGrpSelData!=null){
    	  for(var i=0; i<globalSIMGrpSelData.length; i++){  
    		html_idxViFiID += "<option value=\""+globalSIMGrpSelData[i].idxViFiID+"\">"+globalSIMGrpSelData[i].idxViFiID+"</option>";
  	      } 
    	  $("#idxViFiID").append(html_idxViFiID);
    	  $("#idxViFiID").select2();
	    }
	    
    	var listIdxSimCardID = selectPermissionsInfo.listIdxSimCardIDED;   
	    var html_idxSimCardID = "";
	    if(listIdxSimCardID!=null){
    	  for(var i=0; i<listIdxSimCardID.length; i++){  
    		html_idxSimCardID += "<option value=\""+listIdxSimCardID[i].idxSimCardID+"\">"+listIdxSimCardID[i].idxSimCardID+"</option>";
  	      } 
    	  $("#idxSimCardID").append(html_idxSimCardID);
    	  $("#idxSimCardID").select2();  
	    }
	     
    } 
    
    var idxViFiIDArr = [];
    var idxViFiIDArr2 = [];
    function setIdxViFiID(){ //设置idxViFiID的值 
    	var globalSIMGrpSelData = selectPermissionsInfo.listIdxViFiID;   
	    var html_idxViFiID = "<option value=\"\" selected=\"selected\">"+$.i18n(tbI18n+"idxViFiID.help")+"</option>";
	    if(globalSIMGrpSelData!=null){
    	  for(var i=0; i<globalSIMGrpSelData.length; i++){  
    		if($.inArray(globalSIMGrpSelData[i].idxViFiID , idxViFiIDArr) == -1){
    		    html_idxViFiID += "<option value=\""+globalSIMGrpSelData[i].idxViFiID+"\">"+globalSIMGrpSelData[i].idxViFiID+"</option>";
    		}
  	      } 
	    }
    	$("#idxViFiID1").html(html_idxViFiID);
    	$("#idxViFiID1").select2();
    	
    	var listIdxSimCardID = selectPermissionsInfo.listIdxSimCardID;   
	    var html_idxSimCardID = "<option value=\"\" selected=\"selected\">"+$.i18n(tbI18n+"idxSimCardID.help")+"</option>";
	    if(listIdxSimCardID!=null){
    	  for(var i=0; i<listIdxSimCardID.length; i++){  
    		if($.inArray(listIdxSimCardID[i].idxSimCardID , idxViFiIDArr2) == -1){
    			html_idxSimCardID += "<option value=\""+listIdxSimCardID[i].idxSimCardID+"\">"+listIdxSimCardID[i].idxSimCardID+"</option>";
    		}
  	      } 
	    }
    	$("#idxSimCardID1").html(html_idxSimCardID);
    	$("#idxSimCardID1").select2();
    	
    }
    
    function setSelectArr(){
    	if($("#idxViFiID1").val()!=""){
			idxViFiIDArr.push($("#idxViFiID1").val()); 
		}  
    	if($("#idxSimCardID1").val()!=""){
			idxViFiIDArr2.push($("#idxSimCardID1").val()); 
		} 
    }
    
    //获取查询条件
    function mygetSearchParams() {
        var params = '{'; 
        
        if($("#keySUBindID").val()!="" && $("#keySUBindID").val()!=null){ 
        	params +="\"cx_LIKE-|-keySUBindID\":"+"\""+$("#keySUBindID").val()+"\",";  
        } 
        
        //if($("#idxSimCardID").val()!="" && $("#idxSimCardID").val()!=null){ 
        //	params +="\"cx_LIKE-|-idxSimCardID\":"+"\""+$("#idxSimCardID").val()+"\",";  
        //}
        //if($("#idxViFiID").val()!="" && $("#idxViFiID").val()!=null){ 
        //	params +="\"cx_LIKE-|-idxViFiID\":"+"\""+$("#idxViFiID").val()+"\",";  
        //}
        if($("#idxSCGroupID").val()!="" && $("#idxSCGroupID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxSCGroupID\":"+"\""+$("#idxSCGroupID").val()+"\",";  
        } 
        if($("#idxDevGrpID").val()!="" && $("#idxDevGrpID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxDevGrpID\":"+"\""+$("#idxDevGrpID").val()+"\",";  
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
        	
        	//params1 +="\"idxSimCardID\":"+"\""+$("#idxSimCardID1").val()+"\",";   
        	params1 +="\"idxViFiID\":"+"\""+$("#idxViFiID1").val()+"\","; 
        	params1 +="\"idxSCGroupID\":"+"\""+$("#idxSCGroupID1").val()+"\",";  
        	params1 +="\"idxDevGrpID\":"+"\""+$("#idxDevGrpID1").val()+"\",";  
        	params1 +="\"status\":"+"\""+$("#status1").val()+"\",";     
        	params1 +="\"remarks\":"+"\""+$("#remarks1").val()+"\","; 
        	
        	if(params1 != '{'){
        		if($("#editAddType").val()=="new"){
        			var myDate = new Date();  
        		    var year = myDate.getFullYear();
        		    var month = myDate.getMonth() + 1;
        		    var strDate = myDate.getDate();
        		    
        		    var h = myDate.getHours();       //获取当前小时数(0-23)
        		    var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        		    var s = myDate.getSeconds();     //获取当前秒数(0-59)
        		     
        		    if (month >= 1 && month <= 9) {
        		        month = "0" + month;
        		    }
        		    if (strDate >= 0 && strDate <= 9) {
        		        strDate = "0" + strDate;
        		    }
        		    
        		    if (h >= 1 && h <= 9) {
        		        h = "0" + h;
        		    }
        		    if (m >= 0 && m <= 9) {
        		        m = "0" + m;
        		    }
        		    if (s >= 0 && s <= 9) {
        		        s = "0" + s;
        		    }
        		    
        		    var time = year+month+strDate+h+m+s;
        			
        			params1 +="\"keySUBindID\":"+"\""+time+"_"+$("#idxSimCardID1").val()+"_"+$("#idxViFiID1").val()+"\",";   
        			params1 += "\"actionName\":"+"\""+$.i18n("new")+"\""; 
        		}else if($("#editAddType").val()=="edit"){
        			params1 +="\"keySUBindID\":"+"\""+$("#keySUBindID1").val()+"\",";  
        			params1 += "\"actionName\":"+"\""+$.i18n("edit")+"\""; 
        		} 
        	} 
        params1+='}';   
        var params1 = eval('(' + params1 + ')');   
        return params1;
    } 
     
    
    //设置编辑框的值
    function setEditItems(){
    	$("#editAddModel").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit"));
    	$("#editAddType").val("edit");
    	var checkedsubList = $("input[name*='Listitems']:checked"); //获取选中的name中包含Listitems的值  
    	var arr = checkedsubList[0].value.split("-|-");  
    	
    	$("#keySUBindID1").val(eval("mydata["+arr[1]+"].keySUBindID"));  
    	
    	setIdxViFiID();  
    	if(eval("mydata["+arr[1]+"].idxSimCardID") !=undefined && eval("mydata["+arr[1]+"].idxSimCardID") != ""){
        	$("#idxSimCardID1").append("<option value=\""+eval("mydata["+arr[1]+"].idxSimCardID")+"\">"+eval("mydata["+arr[1]+"].idxSimCardID")+"</option>");
        	$("#idxSimCardID1").val(eval("mydata["+arr[1]+"].idxSimCardID"));
        }
    	$("#idxSimCardID1").select2(); 
        if(eval("mydata["+arr[1]+"].idxViFiID") !=undefined && eval("mydata["+arr[1]+"].idxViFiID") != ""){
        	$("#idxViFiID1").append("<option value=\""+eval("mydata["+arr[1]+"].idxViFiID")+"\">"+eval("mydata["+arr[1]+"].idxViFiID")+"</option>");
        	$("#idxViFiID1").val(eval("mydata["+arr[1]+"].idxViFiID"));
        } 
        $("#idxViFiID1").select2();  
        $("#status1").val(eval("mydata["+arr[1]+"].status"));     
    	//$("#useTimes1").val(eval("mydata["+arr[1]+"].useTimes") ==undefined ? "":eval("mydata["+arr[1]+"].useTimes"));  
    	//$("#lastBindDate1").val(eval("mydata["+arr[1]+"].lastBindDate") ==undefined ? "":eval("mydata["+arr[1]+"].lastBindDate"));   
    	$("#remarks1").val(eval("mydata["+arr[1]+"].remarks") ==undefined ? "":eval("mydata["+arr[1]+"].remarks"));     
    }
         
        
    //查看详情方法
    function viewDetails(number){  
       var i18nText = $.i18n(tbI18n+"status.comData"); 
	   var value = (mydata[number].status).toString();
	   var i18nText_get = i18nText[value]["1"]; 
       var html_viewDetails = ""; 
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"keySUBindID")+": </td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].keySUBindID+"</div></td></tr>";
 	   
 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxSimCardID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].idxSimCardID+"</div></td></tr>";
 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxViFiID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].idxViFiID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxSCGroupID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].idxSCGroupID+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"idxDevGrpID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].idxDevGrpID+"</div></td></tr>";
	   
 	   
 	   if(mydata[number].status == 0){
 	      html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"status")+"：</td><td><div class=\"f-p-tips ng-binding\"><i class=\"img-fmt simp-dev-sta-"+1+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td></tr>";
 	   }else{
 		  html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"status")+"：</td><td><div class=\"f-p-tips ng-binding\"><i class=\"img-fmt simp-dev-sta-"+0+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td></tr>";
 	   }
 	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"useTimes")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].useTimes+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"lastBindDate")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].lastBindDate+"</div></td></tr>";  
 	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n+"remarks")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].remarks+"</div></td></tr>"; 
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfTm")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].mdfTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.mdfBy")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].mdfBy+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtTm")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].crtTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtBy")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata[number].crtBy+"</div></td></tr>";
 	   $("#html_viewDetails").html(html_viewDetails);
 	   myopenModel('mydetailModal','detail'); 
 	  
    } 
    
    //清空编辑表单
	function myclearForm(){
		$("#keySUBindID1").val(""); 
		$("#idxSCGroupID1").val(""); 
		$("#idxDevGrpID1").val(""); 
    	//$("#keySUBindID1").removeAttr("disabled");
    	//$("#idxSimCardID1").val(""); 
    	//$("#idxSimCardID1").select2();  
    	//$("#idxViFiID1").val(""); 
    	//$("#idxViFiID1").select2();   
    	$("#status1").val("");  
    	//$("#useTimes1").val("");  
    	//$("#lastBindDate1").val("");    
    	$("#remarks1").val("");  
    }
    
	//清空搜索条件表单
	function myclearSearchItems(){
		$("#keySUBindID").val("");
		$("#idxSCGroupID").val(""); 
		$("#idxDevGrpID").val(""); 
		//$("#idxSimCardID").val(""); 
    	//$("#idxSimCardID").select2();  
    	//$("#idxViFiID").val(""); 
    	//$("#idxViFiID").select2();   
	}
	
	//列表展示数据转换
	function changeData(tdname,showLengthData,dataTdValue){ 
		var html = "";
		if(tdname=="status"){  
			   var i18nText = $.i18n(tbI18n+"status.comData");  
			   var value = parseInt(dataTdValue); 
			   var i18nText_get = i18nText[value][1]; 
			   if(value==0){
				   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\"><i class=\"img-fmt simp-dev-sta-"+1+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td>"; 
			   }else{
				   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\"><i class=\"img-fmt simp-dev-sta-"+0+"\"></i><i class=\"f-tips\">"+i18nText_get+"</i></div></td>"; 
			   }
			   
		}else{
			   html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	}
	 
	
	//************************************** 第二个列表的配置 begin **************************// 
	 
    //国际化开头
    var tbI18n8 = "db.tbSUStaticBindRecord.";
    //表的主键
    var tablekey8 = "keySUBindRecordID";  
    
    //设置存在localStorage 的列表配置名
    var itemName8 = "my_setTrs_tbSUStaticBindRecord";
    //设置初始化排序字段
    var MY_ORDER_LIST8 = [];
    //要显示在列表上的列  resetTimes 如有更改，resetTimes加1，作用是刷新用户本地的保存 show:是否显示；width:列的宽度
    var selectItems8 = {"resetTimes" : "3","trs": [{"name": "keySUBindRecordID","show": "false","width":"200"},
               {"name": "idxSUBindID","show": "true","width":"200"}, 
               //{"name": "idxSimCardID","show": "true","width":"200"}, 
               //{"name": "idxViFiID","show": "true","width":"200"},
               {"name": "idxSCGroupID","show": "true","width":"200"}, 
               {"name": "idxDevGrpID","show": "true","width":"200"}, 
               {"name": "action","show": "true","width":"100"},
               {"name": "result","show": "true","width":"100"},   
               {"name": "reason","show": "false","width":"220"}, 
               {"name": "useTimes","show": "false","width":"100"},  
               {"name": "crtIP","show": "true","width":"90"},
               {"name": "crtTm","show": "true","width":"125"},
               {"name": "crtBy","show": "true","width":"90"}]
    };
    //设置重置参数
    var resetSelectItems8 = selectItems8;
    
    //设置查询区、编辑区下拉框的选项值
    function setSearchParams8(){   
    	var globalSIMGrpSelData = selectPermissionsInfo.listIdxViFiIDEDRecord;   
	    var html_idxViFiID = "";
	    if(globalSIMGrpSelData!=null){
    	   for(var i=0; i<globalSIMGrpSelData.length; i++){  
    		 html_idxViFiID += "<option value=\""+globalSIMGrpSelData[i].idxViFiID+"\">"+globalSIMGrpSelData[i].idxViFiID+"</option>";
  	       } 
    	   $("#idxViFiID3").append(html_idxViFiID);
    	   $("#idxViFiID3").select2();
	    }
    	
    	var listIdxSimCardID = selectPermissionsInfo.listIdxSimCardIDEDRecord;
	    var html_idxSimCardID = "";
	    if(listIdxSimCardID!=null){
    	   for(var i=0; i<listIdxSimCardID.length; i++){  
    		  html_idxSimCardID += "<option value=\""+listIdxSimCardID[i].idxSimCardID+"\">"+listIdxSimCardID[i].idxSimCardID+"</option>";
  	       } 
    	   $("#idxSimCardID3").append(html_idxSimCardID);
    	   $("#idxSimCardID3").select2();
	    }
    }
    
   
    
    //获取查询条件
    function mygetSearchParams8() {
        var params = '{'; 
        
        if($("#idxSUBindID").val()!="" && $("#idxSUBindID").val()!=null){ 
        	params +="\"cx_LIKE-|-idxSUBindID\":"+"\""+$("#idxSUBindID").val()+"\",";  
        } 
        
        //if($("#idxSimCardID3").val()!="" && $("#idxSimCardID3").val()!=null){ 
        //	params +="\"cx_LIKE-|-idxSimCardID\":"+"\""+$("#idxSimCardID3").val()+"\",";  
        //}
        //if($("#idxViFiID3").val()!="" && $("#idxViFiID3").val()!=null){ 
        //	params +="\"cx_LIKE-|-idxViFiID\":"+"\""+$("#idxViFiID3").val()+"\",";  
        //}
        if($("#idxSCGroupID3").val()!="" && $("#idxSCGroupID3").val()!=null){ 
        	params +="\"cx_LIKE-|-idxSCGroupID\":"+"\""+$("#idxSCGroupID3").val()+"\",";  
        }
        if($("#idxDevGrpID3").val()!="" && $("#idxDevGrpID3").val()!=null){ 
        	params +="\"cx_LIKE-|-idxDevGrpID\":"+"\""+$("#idxDevGrpID3").val()+"\",";  
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
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"keySUBindRecordID")+": </td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].keySUBindRecordID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxSUBindID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].idxSUBindID+"</div></td></tr>";
 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxSimCardID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].idxSimCardID+"</div></td></tr>";
 	   //html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxViFiID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].idxViFiID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxSCGroupID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].idxSCGroupID+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"idxDevGrpID")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].idxDevGrpID+"</div></td></tr>";
 	    
 	   
	   var i18nTextAction = $.i18n(tbI18n8+"action.comData");   
	   var html_Action = "";
		if(i18nTextAction[0][0]==mydata8[number].action){ 
			html_Action = i18nTextAction[0][1];
		}else if(i18nTextAction[1][0]==mydata8[number].action){ 
		    html_Action = i18nTextAction[1][1];
		}      
			
	   var i18nTextResult = $.i18n(tbI18n8+"result.comData");   
	   var html_result = "";
	   if(i18nTextResult[0][0]==mydata8[number].result){ 
			html_result = i18nTextResult[0][1];
	   }else{ 
			html_result = i18nTextResult[1][1];
	   }  
	   
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"action")+"：</td><td><div class=\"f-p-tips ng-binding\">"+html_Action+"</div></td></tr>";	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"result")+"：</td><td><div class=\"f-p-tips ng-binding\">"+html_result+"</div></td></tr>";
	   
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"reason")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].reason+"</div></td></tr>";
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"useTimes")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].useTimes+"</div></td></tr>"; 
	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n(tbI18n8+"crtIP")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].crtIP+"</div></td></tr>";  
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtTm")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].crtTm+"</div></td></tr>";
 	   html_viewDetails += "<tr class=\"ng-scope\"><td class=\"text-right ng-binding\" > "+$.i18n("db.common.crtBy")+"：</td><td><div class=\"f-p-tips ng-binding\">"+mydata8[number].crtBy+"</div></td></tr>";
 	   $("#html_viewDetails8").html(html_viewDetails);
 	   myopenModel8('mydetailModal8','detail');   
 	  
    }  
    
	//清空搜索条件表单
	function myclearSearchItems8(){
		$("#idxSUBindID").val("");
		$("#idxSCGroupID3").val("");  
		$("#idxDevGrpID3").val("");  
		//$("#idxSimCardID3").val(""); 
    	//$("#idxSimCardID3").select2();  
    	//$("#idxViFiID3").val(""); 
    	//$("#idxViFiID3").select2();  
	}
	
	//列表展示数据转换
	function changeData8(tdname,showLengthData,dataTdValue){
		var html = "";
		if(tdname=="action"){      
			var i18nTextAction = $.i18n(tbI18n8+"action.comData");   
		    var html_cardType = "";
			if(i18nTextAction[0][0]==dataTdValue){ 
				html_cardType = i18nTextAction[0][1];
			}else if(i18nTextAction[1][0]==dataTdValue){ 
				html_cardType = i18nTextAction[1][1];
			}  
			html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_cardType+"</div></td>"; 
		}else if(tdname=="result"){      
			var i18nTextResult = $.i18n(tbI18n8+"result.comData");   
		    var html_result = "";
			if(i18nTextResult[0][0]==dataTdValue){ 
				html_result = i18nTextResult[0][1];
			}else{ 
				html_result = i18nTextResult[1][1];
			}  
			html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+html_result+"</div></td>"; 
		}else{
			html = "<td><div class=\"table-data f-p-tips th_"+tdname+" \" style=\"width:"+showLengthData+"px;\">"+dataTdValue+"</div></td>"; 
		}
		return html;
	} 
	 
    
   //************************************** 第二个列表的配置 end **************************// 
    
    
    
    
    
	     
    $(function(){      
        
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
                	idxSCGroupID: {
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
                    },status: {
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
		 
		
		mydelayedInit8();  //初始化窗口
    	//setSelectPageSize8(); //设置分页数量下拉框的值 
　                  //setSearchParams8(); //设置查询条件中、编辑区域 下拉框的选项值
		setTrs8(selectItems8); //初始化要显示的列 
		dosearch8('1'); //查询列表   
    }); 
     
    </script> 
	
</body>
 