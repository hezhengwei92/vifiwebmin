<body> 
	   <div class="bs-example">
	    <div class="row">
	      <div class="col-xs-12 col-md-12">
	        <div class="widget no-margin-bottom">
	          <div class="widget-body no-padding">
	            <div id="searchable_wrapper">
		         <div class="tabbable">
	                <ul class="nav nav-tabs">
		                  <!-- tab标签组 -->
		                  <li class="flag-tabs-btn active" id="suBindBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('suBindTab1','')"><i class="fa fa-th font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="suBindBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('suBindTab2','suBindTool2')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="suBindBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('suBindTab3','suBindTool3')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
		                  </li>
		                  <!-- tab2-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="suBindTool2"></li>
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="suBindTool3"></li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
							<div id="suBindTab1" class="flag-tabs tab-pane  in active" style="border-radius:0;"></div>
							<div id="suBindTab2" class="flag-tabs tab-pane" style="border-radius:0;"></div>
							<div id="suBindTab3" class="flag-tabs tab-pane" style="border-radius:0;"></div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>  
	  
	  
	  <script>
	  
	  
	  
	  var suBindItems = {tableKey:"KeySUBindId", i18nPrefix:"db.suBind.",trs:[                                     
	           {name:"KeySUBindId",disabled:"A"},
	           {name:"idxSimCardID",advQry:["LIKE"],comType:"select",comData:null},//所有静态分配的卡
	           {name:"idxViFiID",advQry:["LIKE"],comType:"select",comData:null},
	           {name:"status",advQry:["LIKE"],comType:"select"},
	           {name:"useTimes",hideEdit:"A"},
	           {name:"lastBindDate",vali:{date:true}},
	           {name:"remarks",show:false,vali:{stringLength:128,required:false}},
	           {name:"mdfTM",hideEdit:"A"},
	           {name:"mdfBy",hideEdit:"A",show:false},
	           {name:"crtBy",hideEdit:"A",show:false},
	           {name:"crtBy",hideEdit:"A",show:false}
	  ]}
	  var suBindUrl = "";
	  var suBindPermi = "";
	  
	  </script>
 </body>