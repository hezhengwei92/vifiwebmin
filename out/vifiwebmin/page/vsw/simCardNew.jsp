<body>
<style>
	.tool_btn_size{
		font-size: 14px;
		padding: 4px 12px;
	}
	.required_icon{
		color: red;
		width: 8px;
		display: inline-block;
		margin: 0 5px 0 10px;
	}
	.rank-list-div{
		height:20.9px;line-height:20.9px;font-size:12px;
	}
	/*彩色图标*/
	.myDataBox{
		height:250px;
		width:100%;
		padding:0px;
		background-color: #11a9cc !important;
	}
	.dataBox-row{
		padding:0;
		text-align: left !important;
	}
	
</style>


	<div class="bs-example">
	    <div class="row">
	      <div class="col-xs-12 col-md-12">
	        <div class="widget no-margin-bottom">
	          <div class="widget-body no-padding">
	            <div id="searchable_wrapper">
		         <div class="tabbable">
	                <ul class="nav nav-tabs">
		                  <!-- tab标签组 -->
		                  <li class="flag-tabs-btn active" id="simCardNewBtn1">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('state_tab','')"><i class="fa fa-th font14"></i>
		                     <span class="tab-title"><spring:message code="label.common.outlineInfo"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="simCardNewBtn2">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simCardNewGrp','simCardNewGrpTool')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.simCard.cardGroup"/></span></a> 
		                  </li>
		                  <li class="flag-tabs-btn tab-blue" id="simCardNewBtn3">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('simCardNew','simCardNewTool')"><i class="fa fa-list font14"></i>
		                     <span class="tab-title"><spring:message code="label.simCard.cardList"/></span></a> 
		                  </li>
		                  <!-- tab2卡组-工具按钮组 -->
						  <li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simCardNewGrpTool">
	<div class="btn blue f-p-tips tool_btn_size" id="simCardNewGrp-tools-detail" onclick="viewDetail_simCardGrp('simCardNewGrp')">
		<i class="fa fa-list-alt"></i><div class="f-t-tips"><spring:message code="details" /></div></div>
	<div class=" btn success f-p-tips tool_btn_size" id="simCardNewGrp-tools-add" onclick="viewEditOrAdd_simCardNewGrp('simCardNewGrp', 'new')" >
		<i class="fa fa-plus"></i><div class="f-t-tips"><spring:message code="new"/></div></div>
	<div  class="btn primary f-p-tips tool_btn_size" id="simCardNewGrp-tools-edit"  onclick="viewEditOrAdd_simCardNewGrp('simCardNewGrp', 'edit')">
		<i class="fa fa-edit"></i><div class="f-t-tips"><spring:message code="edit"/></div></div>				  
	<div  class="btn danger f-p-tips tool_btn_size" id="simCardNewGrp-tools-delete" onclick="toolDelete('simCardNewGrp')" >
		<i class="fa fa-trash-o"></i><div class="f-t-tips"><spring:message code="delete"/></div></div>&nbsp;&nbsp;
	<div class="viewcfg-dropdown"><a class="btn purple f-p-tips dropdown-toggle tool_btn_size" data-toggle="dropdown" href="javascript:" aria-expanded="false">
		<i class="fa fa-gear"></i><div class="f-t-tips"><spring:message code="setting"/></div></a>
		<ul class="dropdown-menu dropdown-blue" >
			<li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
				<div class="pull-left">
					<label style="margin: 0 0 0 16px;">
					<input type="checkbox" id="simCardNewGrp-checkAllBtn" onchange="checkAllShowItems('simCardNewGrp')">
					<span class="text"></span></label><spring:message code="check_all"/></div>
				<button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" onclick="resetShowItems('simCardNewGrp')">
					<i class="fa fa-refresh"></i><spring:message code="restore"/></button>
			</li>
			<div id="simCardNewGrp-RowPopId"></div>
		</ul>
	</div>
	<div id="simCardNewGrp-searchBtnId" class="btn f-p-tips warning tool_btn_size" aria-expanded="false">
		<i class="fa fa-search-plus" id="simCardNewGrp-searchPlusId"></i>
		<i class="fa fa-search-minus" style="display:none" id="simCardNewGrp-searchMinusId"></i>
		<div class="f-t-tips"><spring:message code="search"/></div>
	</div>
						</li>
						<li class="head-tools-r navbar-right flag-tools" style="display:none;"  id="simCardNewTool">
						
						
						</li>
	                 </ul>
	                 <!-- tab页面组 -->
	                 <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
	                 <!-- 概览tab页面 -->
	                 <div id="state_tab" class="flag-tabs tab-pane in active summary-tab">
                    <div class="row" style="margin-top:20px">	
					  	<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
	                     <div class="widget">
	                        <div class="widget-header">
	                           <span class="widget-caption"><spring:message code="label.common.outlineInfo"/></span> 
	                        </div> 
	                        <div class="widget-body no-padding table-border-outlineInfo">
	                        	 <div class="row" style="padding:0 15px;">
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo1"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.simCard.outlineInfo1"/></div>
			                        	</div>&lt;%&ndash; 卡组数 &ndash;%&gt;--%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo2"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.simCard.outlineInfo2"/></div>
			                        	</div><%-- 卡数量 --%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
											<span class="databox-number sky" style="font-size: 24px" id="outLineInfo3"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simCard.outlineInfo3"/></div>
			                        	</div><%-- 已用卡 --%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo4"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="label.simCard.outlineInfo4"/></div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo5"></span>--%>
			                                <%--<div class="databox-text darkgray"> <spring:message code="label.simCard.outlineInfo5"/></div>--%>
			                        	<%--</div>--%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo6"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simCard.outlineInfo6"/></div>
			                        	</div><%-- 待分配卡 --%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo7"></span>
			                                <div class="databox-text darkgray"> <spring:message code="label.simCard.outlineInfo7"/></div>
			                        	</div><%-- 故障卡 --%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo8">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo9">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo10">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<%--<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding">--%>
			                        		<%--<span class="databox-number sky" style="font-size: 24px" id="outLineInfo11">&nbsp;</span>--%>
			                                <%--<div class="databox-text darkgray">&nbsp;</div>--%>
			                        	<%--</div>--%>
			                        	<div class="col-xs-6 col-sm-4 col-md-3 outline-border-padding cursor:pointer;" onclick="initOutlineInfo()">
			                        		<span class="databox-number sky" style="font-size: 24px" id="outLineInfo12"></span>
			                                <div class="databox-text darkgray"><spring:message code="label.common.refreshTime"/></div>
			                        	</div><%-- 刷新时间 --%>
			                        </div>
	                        </div> 
	                     </div> 
	                    </div>
	                    
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <div class="databox databox-vertical radius-bordered no-padding bg-sky" style="height:250px;box-shadow: 1px 0 10px 1px rgba(0, 0, 0, .3);">
                                	<div class="databox-row row-2 bg-orange padding-left-30 text-align-left" style="border-bottom: 5px solid #ffce55;border-top-left-radius: 3px;border-top-right-radius: 3px;">
                                		<span style="line-height:35px;font-size: 14px;"><%--<spring:message code="label.simCard.simCardSize"/>--%></span>
                                    </div>
                                    <div class="databox-row row-4 bg-yellow padding-left-30 text-align-left">
                                        <span style="font-size:20px;line-height:30px;"><spring:message code="label.simCard.todayUsable"/></span>
                                        <span style="display:block;padding-left:30px;font-size:30px;line-height:50px;" id="todayUsable">40G</span>
                                    </div>
                                    <%--<div class="databox-row row-2 padding-5 padding-left-30 text-align-left bordered-bottom bordered-whitesmoke bg-undefined">--%>
                                        <%--<div class="databox-cell cell-8">--%>
                                            <%--<span class="databox-title no-margin" style="line-height: 30px;font-size: 15px;"><spring:message code="label.simCard.tomorrowUsable"/></span>--%>
                                        <%--</div>--%>
                                        <%--<div class="databox-cell cell-4">--%>
                                            <%--<span class="databox-number" id="tomorrowUsable">1.5G</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="databox-row row-2 padding-5 padding-left-30 text-align-left bordered-bottom bordered-whitesmoke bg-undefined">--%>
                                        <%--<div class="databox-cell cell-8">--%>
                                            <%--<span class="databox-title no-margin" style="line-height: 30px;font-size: 15px;"><spring:message code="label.simCard.monthUsable"/></span>--%>
                                        <%--</div>--%>
                                        <%--<div class="databox-cell cell-4">--%>
                                            <%--<span class="databox-number" id="monthUsable">16.5G</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="databox-row row-2 padding-5 padding-left-30 text-align-left bg-undefined">--%>
                                        <%--<div class="databox-cell cell-8">--%>
                                            <%--<span class="databox-title no-margin" style="line-height: 30px;font-size: 15px;"><spring:message code="label.simCard.monthPerDayUsable"/></span>--%>
                                        <%--</div>--%>
                                        <%--<div class="databox-cell cell-4">--%>
                                            <%--<span class="databox-number" id="monthPerDayUsable">0.55G</span>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                            </div>
                        </div> 
                        
	                </div>
	                <div class="row">
	                <div class="widget" style="padding:0 15px;"> 
	                	<div class="widget-header "><span class="widget-caption"><spring:message code="label.simCard.recent30Record"/></span></div>
                        <div class="widget-body" style="display:block;padding:1px;">
                         	<div class="chart chart-lg" id="simCardStatisticChart" style="margin:0 0 0 20px; position: relative;"></div>
                         	<table id="xaliasTable" class="table" style="text-align:center;"></table>
                        </div>
	                </div>
	                </div>                  
				 	</div> 
				 	
	 			<!-- 卡组tab -->
				<div id="simCardNewGrp" class="flag-tabs tab-pane" style="border-radius:0;">
<div class="collapse" id="simCardNewGrp-searchArea"></div>
<div class="data-thead simCardNewGrp-theadDivClass" style="background-color: #F7F7F7;border-top: 1px solid #ddd;border-bottom: 1px solid #00A2E9;"
	onmousemove="thOnMouseMoveModel('simCardNewGrp')" onmouseup="thOnMouseUpModel('simCardNewGrp')">
	<table class="table table-bordered table-striped dataTable" style="width:auto;">
		<thead class="flip-content"><tr role="row" id="simCardNewGrp-thead"></tr></thead>
	</table>
</div>
<div class="data-tbody simCardNewGrp-bodyDivClass" onmousemove="thOnMouseMoveModel('simCardNewGrp')" onmouseup="thOnMouseUpModel('simCardNewGrp')">
	<div>
		<table class="table table-bordered table-hover table-striped" style="width:auto;">
			<tbody class="page-data-tbody" id="simCardNewGrp-body"></tbody>
		</table>
	</div>
</div>
<div class="row foot-tools" id="simCardNewGrp-foot"><div class="pull-right table-page-tools position-relative">
	<div class="pagetools" id="simCardNewGrp-footBody"></div>
	<select id="simCardNewGrp-footPop" onchange="changePagesizeModal('simCardNewGrp')" class="form-control">
		<option label="25" value="25">25</option>
		<option label="50" value="50">50</option>
		<option label="100" value="100">100</option>
	</select>
	</div>
</div>
				</div>
				<!-- 卡列表tab -->
				<div id="simCardNew" class="flag-tabs tab-pane" style="border-radius:0;"></div>
	                 </div>
	              </div>   
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div> 
	

<!-- 卡组 编辑框 -->
<div class="modal fade modal-primary" id="simCardNewGrp-edit"  aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="simCardNewGrp-edit-form" class="form-horizontal ng-pristine ng-valid" onchange="simCGFormChange()">
        <div class="modal-header">
          <button type="button" class="close" onclick="hideEditModal_simCardNewGrp()"><span aria-hidden="true">&times;</span></button>
          <input type="hidden" id="simCardNewGrp-editAddType" value="" />
          <h4 class="modal-title" ng-class="text-success" id="simCardNewGrp-edit-header">
          
          </h4>
        </div>
        
       <div class="modal-body" style="overflow-y:auto;"><!-- 分左右栏 -->
       <inpt type="hidden" id="simCardNewGrp-tableKey-keySCGroupID" val=""/>
       		<div class="ng-scope">
       			<div class="col-sm-6">
       			
       		<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.keySCGroupID"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="keySCGroupID8" disabled="disabled" style="background-color: #F0F0F0 !important;" name="keySCGroupID" placeholder="<spring:message code="db.tbSCGroup.keySCGroupID.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3  no-padding-right">
			            <spring:message code="db.tbSCGroup.groupName"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="groupName8" name="groupName" placeholder="<spring:message code="db.tbSCGroup.groupName.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched">
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.idxSalerId"/>:<span class="required_icon" ></span>
			    </label>
                <div class="col-sm-8 no-padding">
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
			    <label class="control-label ng-binding col-sm-3  no-padding-right">
			        <spring:message code="db.tbSCGroup.areaCode"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
			      <div class="ng-scope"> 
                   <div  style="width: 100%;">
                     <select id="continent" name="continent" onchange="checkContinent()" style="width: 32%;margin-top:2px">
                       <!-- option value="" selected="selected"><spring:message code="continent.help"/></option-->
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbSCGroup.ispID"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
			      <div class="ng-scope"> 
                   <select name="ispID" id="ispID8" style="width:100%;"> 
                   </select>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbSCGroup.cardType"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbSCGroup.cardSize"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbSCGroup.monthlyRental"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="monthlyRental8" name="monthlyRental" placeholder="<spring:message code="db.tbSCGroup.monthlyRental.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbSCGroup.dataUsage"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="dataUsage8" name="dataUsage" placeholder="<spring:message code="db.tbSCGroup.dataUsage.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>   
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbSCGroup.dataPrice"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbSCGroup.roamSupport"/>:<span class="required_icon" ></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
			      <div class="ng-scope">   
			         <label  class="ng-scope">
			         	<input name="roamSupport" type="hidden" value="0"/>
                        <input type="checkbox" id="roamSupport8"  onclick="javaScript:checkRoamSupport()" class="ng-pristine ng-untouched ng-valid">
                     <span class="text ng-binding">是否漫游</span>
                     </label>
				  </div> 
                </div>
              </div>
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbSCGroup.roamAreaCodes"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			             <spring:message code="db.tbSCGroup.roamDataPrice"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="roamDataPrice8"  disabled="disabled" name="roamDataPrice" placeholder="<spring:message code="db.tbSCGroup.roamDataPrice.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			        <spring:message code="db.tbSCGroup.priority"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding"> 
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
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.number"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="number8" name="number" placeholder="<spring:message code="db.tbSCGroup.number.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.apn"/>:<span class="required_icon" ><b>*</b></span>
			    </label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="apn8" name="apn" placeholder="<spring:message code="db.tbSCGroup.apn.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.dialnumber"/>:<span class="required_icon" ></span></label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="dialnumber8" name="dialnumber" placeholder="<spring:message code="db.tbSCGroup.dialnumber.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.dialuid"/>:<span class="required_icon" ></span></label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="dialuid8" name="dialuid" placeholder="<spring:message code="db.tbSCGroup.dialuid.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div> 
			
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.dialpwd"/>:<span class="required_icon" ></span></label>
                <div class="col-sm-8 no-padding">
                  <div  class="ng-scope">
                    <input type="text" id="dialpwd8" name="dialpwd" placeholder="<spring:message code="db.tbSCGroup.dialpwd.help"/>"  class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched" > 
                  </div> 
                </div>
                </div> 
			</div>  
			 
			<div class="form-group ng-scope">
			  <div data-input="">
			    <label class="control-label ng-binding col-sm-3 no-padding-right">
			            <spring:message code="db.tbSCGroup.remarks"/>:<span class="required_icon" ></span>
			    </label>
                <div class="col-sm-8 no-padding">
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
           <div  class="btn primary f-p-tips" id="simCardNewGrp-skip2Detail" style="font-size: 14px;padding: 4px 12px;margin-left:3.56px;float:left;" 
           		onclick="skip2DetailModalG_simCardGrp('simCardNewGrp')">
           		<i class="fa fa-list-alt"></i><div class="f-t-tips"><spring:message code="details"/></div></div>
          <button type="submit" class="btn btn-primary"><spring:message code="save"/></button> 
          <a class="btn btn-danger" onclick="hideEditModal_simCardNewGrp()"><spring:message code="cancel"/></a>
        </div>  
        
      
      </form>
    </div>
  </div>
</div> 

	
	
	<script>
	
	g_var.view = ${view};
	var agentName=g_var.view.agentName;/** 代理商 登录用户名 **/

	try {
	    var selectPermissionsInfo = JSON.parse('${view}' || '{"permissions":[]}');
	} catch (e) {
	    throw new Error("js视图数据,解析错误,请检测!~!");
	}
	var simCardNewPermi = selectPermissionsInfo.permissions;
    if (!simCardNewPermi || simCardNewPermi.length < 4) {
    	selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
    }
    
    /**  commonUtil ******************************/
    function initTableHeight(tableId){
    	// 计算table高度 
        var winHeight8 = document.documentElement.clientHeight; 
        //stati-info 含义未知***********************************
        var dataTableDivHeight8 = winHeight8 - 198 - $(".stati-info").height() - $(".page-breadcrumbs").height();//窗体高度-198-？的高度-栏目条高度
        var $dataTBody = $("."+tableId+"-bodyDivClass"), 
        		$dataTHead = $("."+tableId+"-theadDivClass");//表格body高度，表格头高度
        		$dataTBody.css("height", dataTableDivHeight8); 
        // table body 滚动,带动table head平行移动,解决头部固定问题
        $dataTBody.scroll(function (e) {
            return $dataTHead.prop("scrollLeft", e.target.scrollLeft);
        });
    }
    
    function searchBtnClick(tableId){// event.target
        var winHeight = document.documentElement.clientHeight; 
        var dataTableDivHeight = winHeight - 198 - $(".stati-info").height() - $(".page-breadcrumbs").height();
        var $searchBtn = $("#"+tableId+"-searchBtnId"), 
   			$searchArea = $("#"+tableId+"-searchArea");
        var isExpanded = !JSON.parse($searchBtn.attr("aria-expanded")); 
        var height = dataTableDivHeight;
        if (isExpanded) {
     	   $searchArea.show();
            $("#"+tableId+"-searchPlusId").hide();
            $("#"+tableId+"-searchMinusId").show();
            height = (dataTableDivHeight - $searchArea.height());
        } else {
     	   $searchArea.hide();
            $("#"+tableId+"-searchMinusId").hide();
            $("#"+tableId+"-searchPlusId").show();
            //最小化时，清空搜索框
            var columns = getLocalStorageModel(tableId, "tableParams").trs,
			   	   len = columns.length;
	       		for(var i=0; i<len; i++){
	       			$("#search-"+tableId + "-"+ columns[i].name).val("");
	       		}
        }
        $dataTBody.css({"height": height + "px"}); 
        $searchBtn.attr("aria-expanded", isExpanded + "");
    }
    var formChangeFlag = false;
	function simCGFormChange(){
		formChangeFlag = true;
	};
    /************************************************* common end *****************/
    
    /**************特殊的页面处理***************/
    //使用模板中的一些方法
    function InitTableSimCard(tableId, toolsAreaId, requestUrl, params, permissions, page,isImportAndExport){
		//格式化表格参数
		params = initTableItems(tableId, params);
		//本地存储
		initLocalStorage(tableId, requestUrl, params, permissions);
		/*基础页面静态写在页面中，方便其他处理
		 *	table容器
		 *	搜索区域实体
		 */
		//initTableBaseHtml(tableId, toolsAreaId, requestUrl,isImportAndExport);
		initSearchWidgetModel(tableId);
		//初始化表格位置
		initTablePositionModel(tableId);
		//初始化表格实体内容 & 初始化表格设置
		initTableContentAndSetting(tableId, page);
		//edit&add表格验证
   		setSelectData_simCG();
   		initSimCGValidator(tableId, "edit");
   		initSearchEvent(tableId);

	}
    function initSimCGValidator(tableId, type){
 	   //初始化验证表单之后 var a = $(form).data("bootstrapValidator"); a.resetForm(); 或 $(form).bootstrapValidator(methodName, parameters);
 	   var tableItems = getLocalStorageModel(tableId, "tableParams").trs,
 	   	   itemLen = tableItems.length,
 	   	   fieldObj = createValidator(tableId, type);
 	   //初始化编辑框验证表单
 	   $('#'+ tableId+ "-edit-form").bootstrapValidator({ 
            excluded: [':disabled'],
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            submitHandler: function (validator, form, submitButton) {
            	simCGSave(tableId, type); 
            },   
            fields: fieldObj
 	   });
    }
    function simCGSave(tableId, type) { 
    	var params = getSubmitData(tableId, type);
    	var requestUrl = getLocalStorageModel(tableId, "requestUrl");
    	if(params){ 
	        $.ajax({
	    	    url: window.PATH+ requestUrl +"save.ajax",    //请求的url地址
	    	    dataType: "json",   //返回格式为json
	    	    async: true,//请求是否异步，默认为异步，这也是ajax重要特性
	    	    data: params,    //参数值
	    	    type:"POST",   //请求方式 
	    	    success:function(res){ 
	    	    	layer.msg.success(res.message);
	    	    	queryTableDataModel(tableId);
	    	    	hideEditModal_simCardNewGrp(true);
	    	    }, 
	    	    error:function(){  
	    	    }
	     	});
    	}
    }
    function initSearchEvent(tableId){
    	$("#search-simCardNewGrp-areaCode").change(function(){
    		checkareaCode();
        	var tbI18n8 = "db.tbSCGroup.";
        	var thisSelect = $("#search-simCardNewGrp-areaCode").val();
        	//运营商编号
        	var ispSelData = selectPermissionsInfo.ispSelData;  
        	var html_ispSelData = 
        		"<option value=\"\" selected=\"selected\">"+$.i18n(tbI18n8+"ispID.help")+"</option> ";
        	if(ispSelData!=null){
        	   for(var i=0; i<ispSelData.length; i++){   
        		  if(ispSelData[i][2]==thisSelect){
        		     html_ispSelData += "<option value=\""+ispSelData[i][0]+"\">"+ispSelData[i][1]+"</option>";
        		  }
      	       }
        	}
        	$("#search-simCardNewGrp-ispID").html(html_ispSelData);
        	//$("#search-simCardNewGrp-ispID").select2();
    	});
    	//$("#search-simCardNewGrp-areaCode").select2();
    	//$("#search-simCardNewGrp-ispID").select2();
    	//$("#search-simCardNewGrp-cardType").select2();
    	//$("#search-simCardNewGrp-cardSize").select2();
    	//$("#search-simCardNewGrp-priority").select2();
    }
    
    
    /*******************************************  卡组 begin ***********************************************/
    
	var simCardGroupNewItems = {resetTime: "3", tableKey: "keySCGroupID", i18nPrefix:"db.tbSCGroup.",trs:[			
   		{name:"keySCGroupID", width:"80",disabled:"E",vali:{stringLength:64}, show:false},		
   		{name:"groupName", width:100,advQry:["LIKE"],vali:{stringLength:128}},
   		{name:"idxSalerId", width:"80",vali:{required:false,stringLength:64},comType:"select",comData:g_var.view.supplierSelData}, 
   		{name:"areaCode", width:210,advQry:["LIKE"],comType:"select",comData:g_var.view.areaSelData},
   		//comType:"diy",comTypeFunc:"comTypeDiy_areaCode"
   		//comType:"select", comData:g_var.view.areaSelData
		{name: "idxAgentID", vali:{stringLength:64}, width: 60, advQry:["LIKE"], comType:"select", comData:g_var.view.agentSelData},
   		{name:"ispID", width:180,advQry:["LIKE"],comType:"select",comData:g_var.view.ispSelData},
   		{name:"cardType", width:"80",advQry:["LIKE"],comType:"select"},
   		{name:"cardSize", width:"100",show:false,advQry:["LIKE"],comType:"select"},
   		{name:"monthlyRental", width:"80",vali:{decimals:3,lessThan:10000},ratio:1000},
   		{name:"dataUsage", width:"100",show:false,vali:{decimals:3,lessThan:10000},ratio:1000},
   		{name:"dataPrice", width:"110",vali:{decimals:3,lessThan:10000},ratio:1000},
   		{name:"roamSupport", width:"80",vali:{required:false}, comType:"select"},
   		{name:"roamAreaCodes", width:"150",show:false},
   		{name:"roamDataPrice", width:"100",vali:{decimals:3,lessThan:10000},ratio:1000,show:false},
   		{name:"priority", width:"80",advQry:["LIKE"],comType:"select"},//,comType:"select" 增加data，1-9
   		{name:"apn", width:"80",vali:{stringLength:30}},
   		{name:"dialnumber", width:"80",vali:{required:false,stringLength:32}, show:false},
   		{name:"dialuid", width:"80",vali:{required:false,stringLength:32}, show:false},
   		{name:"dialpwd", width:"80",vali:{required:false,stringLength:32}, show:false},
   		{name:"number", width:"80",vali:{integer:true,stringLength:9}, disabled:"E"},
   		{name:"remarks", width:"125",show:false,vali:{required:false,stringLength:128}},
   		{name:"mdfTm", width:"125",hideEdit:"A"},
   		{name:"mdfBy", width:"125", show:false,hideEdit:"A"},
   		{name:"crtTm", width:"125", show:false,hideEdit:"A"},
   		{name:"crtBy", width:"125", show:false,hideEdit:"A"}
   		]}
   	var simCardGroupNewUrl = "/vsw/simCardNew/group";
   	//非模板
   	InitTableSimCard("simCardNewGrp", "simCardNewGrpTool", simCardGroupNewUrl, simCardGroupNewItems, simCardNewPermi,  "1");
   	//编辑框另写  simCardNewGrp-edit   type = $("#"+tableId+"-editAddType").val(),
   	function viewEditOrAdd_simCardNewGrp(tableId, type,number){
   		//选中行
   		if(number==undefined || number==""){
	 		   var checkedRows = $("input[name*="+ tableId+"-rowItems]:checked");
	 		   if(checkedRows && checkedRows.length>0){
	 			   number = checkedRows[0].value.split("-|-"); 
	 			   number = number[1];
	 		   }else{
	 			   number = "0";
	 		   }
		}
   		if(type &&type=="edit"){
   			$("#simCardNewGrp-editAddType").val("edit");
   			setEditValue_simCardNewGrp(number);
   			$("#simCardNewGrp-skip2Detail").show();
   			$("#simCardNewGrp-edit").find("[name=keySCGroupID]").attr("disabled",true);
   		}else if(type && type=="new"){
   			$("#simCardNewGrp-editAddType").val("new");
   			$("#simCardNewGrp-skip2Detail").hide();
   			$("#simCardNewGrp-edit").find("[name=keySCGroupID]").attr("disabled",false);
   		}
   		//样式
   		var $editModalHeader = $("#simCardNewGrp-edit-header");
		if(type=='edit'){
			$editModalHeader.removeClass("text-success").addClass("text-primary").html("<i class=\"fa fa-edit\"></i> "+ $.i18n("edit")).val("edit");
		}else if(type=='new'){
			$editModalHeader.removeClass("text-primary").addClass("text-success").html("<i class=\"fa fa-plus\"></i> "+ $.i18n("new")).val("new");
		}
		
 	   	$("#simCardNewGrp-edit").modal({backdrop: 'static'});
   	}
  //从详情到编辑
  	function skip2EditModalG_simCardGrp(tableId){
  		hideEditModal_simCardNewGrp();
  		viewEditOrAdd(tableId, "edit");
  	}
  	//从编辑到详情
  	function skip2DetailModalG_simCardGrp(tableId){
  		hideEditModal_simCardNewGrp(undefined, "detail");
  			//viewDetail(tableId);
  	}
  	function viewDetail_simCardGrp(){
  		viewDetail("simCardNewGrp");
  		$("#simCardNewGrp-skip2EditModal").unbind("click").bind("click",function(){
  			skip2EditModalG_simCardGrp("simCardNewGrp");
  		})
  	}
   	function hideEditModal_simCardNewGrp(isSaveBtn, skipFlag){
   		//var type = $("#simCardNewGrp-editAddType").val();
   		if(formChangeFlag && !isSaveBtn){//是否有改动
  			layer.confirm($.i18n("frame.from.tips.confirmCancel"),function(idx){
  	  			layer.close(idx);
  	  			$("#simCardNewGrp-edit-form").data('bootstrapValidator').resetForm();
  	  			clearForm_simCardNewGrp();
  	  			$("#simCardNewGrp-edit").modal("hide");
  	  			formChangeFlag = false;//reset flag
  	  			if(skipFlag && skipFlag=="detail"){
  	  				viewDetail("simCardNewGrp");
  	  			}
  	  		});
  		}else{
  			$("#simCardNewGrp-edit-form").data('bootstrapValidator').resetForm();
  			clearForm_simCardNewGrp();
  			$("#simCardNewGrp-edit").modal("hide");
  			formChangeFlag = false;//reset flag
  			if(skipFlag && skipFlag=="detail"){
  	  			viewDetail("simCardNewGrp");
  	  		}
  		}
   	}
   	function setEditValue_simCardNewGrp(number){
   		var data = getLocalStorageModel("simCardNewGrp", "queryData"),
   			dataRow = eval("data["+ number +"]");
   		var $editModal = $("#simCardNewGrp-edit");
   		//$editModal.find("[name="+ name +"]").each(function(index,item){
   		//});
   		$("#simCardNewGrp-tableKey-keySCGroupID").val(dataRow["keySCGroupID"]);
   		$editModal.find("[name=keySCGroupID]").val(dataRow["keySCGroupID"]);
   		$editModal.find("[name=groupName]").val(dataRow["groupName"]);
   		$editModal.find("[name=idxSalerId]").val(dataRow["idxSalerId"]);
   		var areaCode = dataRow["areaCode"];
   		$editModal.find("[name=areaCode]").val(areaCode);
   		$editModal.find("[name=areaCode]").select2();
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
   		
   		$editModal.find("[name=ispID]").val(dataRow["ispID"]);
   		$editModal.find("[name=ispID]").select2();
   		$editModal.find("[name=cardType]").val(dataRow["cardType"]);
   		$editModal.find("[name=cardSize]").val(dataRow["cardSize"]);
   		$editModal.find("[name=monthlyRental]").val((dataRow["monthlyRental"])/1000);
   		$editModal.find("[name=dataUsage]").val((dataRow["dataUsage"])/1000);
   		$editModal.find("[name=dataPrice]").val((dataRow["dataPrice"])/1000);
   		$editModal.find("[name=roamSupport]").val(dataRow["roamSupport"]);
   		if(dataRow["roamSupport"]=="1"){ 
    		$("#roamSupport8").prop("checked", true); 
    		$("#roamAreaCodes8").attr("disabled",false);
			$("#roamDataPrice8").attr("disabled",false);
		}else{
			$("#roamSupport8").prop("checked", false);  
			$("#roamAreaCodes8").attr("disabled",true);
			$("#roamDataPrice8").attr("disabled",true);
		} 
   		
   		
   		var arr2 = [];
    	var roamAreaCodesValue = dataRow["roamAreaCodes"].toString();   
    	if(roamAreaCodesValue!=null && roamAreaCodesValue !="" && roamAreaCodesValue!=undefined){
    		arr2 = roamAreaCodesValue.split(","); 
    	}
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
    	$editModal.find("[name=roamDataPrice]").val((dataRow["roamDataPrice"])/1000);
    	$editModal.find("[name=priority]").val(dataRow["priority"]);
    	$editModal.find("[name=number]").val(dataRow["number"]);
    	$editModal.find("[name=remarks]").val(dataRow["remarks"]);
    	$editModal.find("[name=apn]").val(dataRow["apn"]);
    	$editModal.find("[name=dialnumber]").val(dataRow["dialnumber"]);
    	$editModal.find("[name=dialuid]").val(dataRow["dialuid"]);
    	$editModal.find("[name=dialpwd]").val(dataRow["dialpwd"]);
   		
   	}
   	function setSelectData_simCG(){
   		var $editModal = $("#simCardNewGrp-edit");
   		var tbI18n8 = "db.tbSCGroup.";
   		//卡大小
	    var i18nTextCardSize = $.i18n(tbI18n8+"cardSize.comData");   
	    var html_cardSize = comData2SelectHtml(i18nTextCardSize);
    	//$("#cardSize").append(html_cardSize);//搜索框 
    	//$("#cardSize8").append(html_cardSize); //编辑框
    	$editModal.find("[name=cardSize]").append(html_cardSize);
    	
    	//网络类型
    	var i18nTextCardType = $.i18n(tbI18n8+"cardType.comData");   
	    var html_cardType = comData2SelectHtml(i18nTextCardType);
	    $editModal.find("[name=cardType]").append(html_cardType);
    	//设置运营商和地区编号下来框
    	setIspSelDataAndAreaSelData();
    	//洲
	    var i18nTextContinent = $.i18n("continent.comData");    
	    var textContinent = comData2SelectHtml(i18nTextContinent);
	    $("#continent").append(textContinent); 	    
	    //供应商编号
    	var supplierSelData = selectPermissionsInfo.supplierSelData;  
    	var html_supplierSelData = comData2SelectHtml(supplierSelData);
    	$editModal.find("[name=idxSalerId]").append(html_supplierSelData);
   	}
   	function setIspSelDataAndAreaSelData(){
   		var tbI18n8 = "db.tbSCGroup.";
   		var $editModal = $("#simCardNewGrp-edit");
   		var ispSelData = selectPermissionsInfo.ispSelData;     
	    var html_ispSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbSCGroup.ispID.help")+"</option>"+
	    	comData2SelectHtml(ispSelData);
	    $editModal.find("[name=ispID]").append(html_ispSelData);
	    $editModal.find("[name=ispID]").select2();
	    
	    var areaSelData = selectPermissionsInfo.areaSelData;  
	    var html_roamAreaCode = comData2SelectHtml(areaSelData);
	    var html_areaSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbSCGroup.areaCode.help")+"</option>"+
	    	html_roamAreaCode;
	    $editModal.find("[name=areaCode]").append(html_areaSelData);
	    $editModal.find("[name=areaCode]").select2();
	    
	    $("#roamAreaCodes8").html(html_roamAreaCode); 
    	$("#roamAreaCodes8").select2({
            placeholder: $.i18n("db.tbSCGroup.roamAreaCodes.help"),
            allowClear: true
        });
   	}
   	//onchange事件 使用html而不是append
   	function checkContinent(){
   		var tbI18n8 = "db.tbSCGroup.";
   		var $editModal = $("#simCardNewGrp-edit");
   		var thisSelect = $("#continent").val();
   		var areaSelData = selectPermissionsInfo.areaSelData;  
   		var html_areaSelData = "<option value=\"\" selected=\"selected\">"+$.i18n("db.tbCDR.countryCode.help")+"</option>";
    	if(areaSelData!=null){
    	  for(var i=0; i<areaSelData.length; i++){   
    		  if(areaSelData[i][2]==thisSelect){
    		     html_areaSelData += "<option value=\""+areaSelData[i][0]+"\">"+areaSelData[i][1]+"</option>";
    		  }
  	      }
    	}
    	$editModal.find("[name=areaCode]").html(html_areaSelData);
	    $editModal.find("[name=areaCode]").select2();
    	//重置验证
    	$("#simCardNewGrp-edit-form").data('bootstrapValidator').resetForm();
   	}
    function checkareaCode(){ 
    	var tbI18n8 = "db.tbSCGroup.";
    	var $editModal = $("#simCardNewGrp-edit");
    	var thisSelect = $("#areaCode8").val();
    	//运营商编号
    	var ispSelData = selectPermissionsInfo.ispSelData;  
    	var html_ispSelData = 
    		"<option value=\"\" selected=\"selected\">"+$.i18n(tbI18n8+"ispID.help")+"</option> ";
    	if(ispSelData!=null){
    	   for(var i=0; i<ispSelData.length; i++){   
    		  if(ispSelData[i][2]==thisSelect){
    		     html_ispSelData += "<option value=\""+ispSelData[i][0]+"\">"+ispSelData[i][1]+"</option>";
    		  }
  	       }
    	}
    	$editModal.find("[name=ispID]").html(html_ispSelData);
	    $editModal.find("[name=ispID]").select2();
    	//重置验证
    	$("#simCardNewGrp-edit-form").data('bootstrapValidator').resetForm();
    }
    
  //点击是否漫游 复选框
	function checkRoamSupport(){
		if($("#roamSupport8").is(':checked')){
			$("#simCardNewGrp-edit-form").find("[name=roamSupport]").val(1);
			$("#roamAreaCodes8").attr("disabled",false);
			$("#roamDataPrice8").attr("disabled",false);
		}else{
			$("#simCardNewGrp-edit-form").find("[name=roamSupport]").val(0);
			$("#roamAreaCodes8").attr("disabled",true);
			$("#roamDataPrice8").attr("disabled",true);
		}
		$("#simCardNewGrp-edit-form").data('bootstrapValidator').resetForm();
	}
    
    function clearForm_simCardNewGrp(){
    	var tableItems = getLocalStorageModel("simCardNewGrp", "tableParams").trs,
    		len = tableItems.length;
    	for(var i=0;i<len;i++){
    		var name = tableItems[i].name;
    		$("#simCardNewGrp-edit-form").find("[name="+ name +"]").val("");
    	}
    }
   	
   	/*******************************	卡组	end		*************************/
    
   
    /*******************************	卡列表	begin	**************************/
    var valformat_simCardNewStatus = function(value){
    	var tips = matchComdata2Alias("db.tbSimCard.status.comData", value);
   		return "<i class='img-fmt simc-simc-sta-"+value+"'></i><i class='f-tips'>"+tips+"</i>";
   	}
	var simCardNewItems = {resetTime: "3", tableKey: "keySimCardID", i18nPrefix:"db.tbSimCard.",trs:[			
		{name:"keySimCardID", width:"160",advQry:["LIKE"],disabled:"E"},		
		{name:"idxSCGroupID", width:"100",comType:"select",comData:g_var.view.scGroupSelData},
//		{name:"imsi", width:"150",show:false,vali:{stringLength:16}},
//		{name:"imei", width:"150",show:false,vali:{required:false,stringLength:[15,15]}},
//		{name:"ssId", width:"150",show:false,vali:{required:false,digits:true,stringLength:11}},
		{name:"status", width:"60",vali:{digits:true,stringLength:11},valFormat:"valformat_simCardNewStatus",advQry:["LIKE"],comType:"select"},
//		{name:"bindType", width:"80", vali:{stringLength:1},advQry:["LIKE"],comType:"select"},
		{name:"number", width:"100",vali:{required:false,stringLength:32}},
		{name: "idxAgentID", vali:{stringLength:64}, width: 60, advQry:["LIKE"], comType:"select", comData:g_var.view.agentSelData},
		{name:"balance", width:"80",vali:{required:false,decimals:2,lessThan:10000000},ratio:1000},
		{name:"restNetData", width:"100"},//,ratio:1000 小数点 1000
//		{name:"onlineTime", width:"100",hideEdit:"A"},
//		{name:"totalSuccess", width:"60",hideEdit:"A"},
//		{name:"totalFailed", width:"60",hideEdit:"A"},
		{name:"totalData", width:"100",hideEdit:"A",vali:{decimals:0}},
//		{name:"lastIdleTime", width:"125",hideEdit:"A"},
		{name:"remarks", width:"125",show:false,vali:{required:false,stringLength:128}},
		{name:"mdfTm", width:"125",hideEdit:"A"},
		{name:"mdfBy", width:"125", show:false,hideEdit:"A"},
		{name:"crtTm", width:"125", show:false,hideEdit:"A"},
		{name:"crtBy", width:"125", show:false,hideEdit:"A"}
	]}
	var simCardNewUrl = "/vsw/simCardNew/";
	InitTableMoudle("simCardNew", "simCardNewTool", simCardNewUrl, simCardNewItems, simCardNewPermi,  "1","","","",agentName);
	
	/*******************************	卡列表	end		*************************/
    
    
	/************************************* 概要信息 begin	***************************************/
		//rank
	    var tops = [];//selectPermissionsInfo.uuwifiSessionRecord;
	 	var topsLen = tops.length;
	 	//for(var i=0; i<topsLen; i++){
	 	//	tops[i].keyWord = tops[i].idxVifiID;
	 	//	tops[i].keyValue = tops[i].idxSimCIccId;
	 	//}
	 	function getTopRankHtml_vifiDev(tops, tabId, toolsId, tabBtnId){
	     	var topDivHtml = "<div class='orders-container' style='position:inherit;'><ul class='orders-list' style='background-color: #FBFBFB'>";
	         for(var i = 0; i<tops.length; i++){
	         	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">"
	         		+ tops[i].keyWord+"</span></div>";
	         	topDivHtml += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
	         	topDivHtml += tops[i].keyValue+"</span><span class=\"price\">";
	         	topDivHtml +="</span></div></div></div></li>";
	         }
	         //填充空数据
	         for ( var i = tops.length; i < 5; i++) {
	         	topDivHtml +="<li class=\"order-item\"><div class=\"row rank-list-div\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">-";
	         	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
	         	topDivHtml +="</span><span class=\"price\"></span></div></div></div></li>";
	         }
	         topDivHtml +="<li class=\"order-item\"><div class=\"row\" style=\"height:21px;line-height:21px\"><div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-8 item-left\"><span class=\"item-booker\">";
	     	topDivHtml +="</span></div><div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 item-right\"><div class=\"item-booker\" style=\"text-align: right;\"><span class=\"currency\">";
	     	topDivHtml +="</span><span class=\"price\"><button class=\"btn btn-palegreen btn-sm pull-right\" onclick='switchTabAndTools(\""+tabId+"\",\""+toolsId+"\",\""+tabBtnId+"\")'>"
	     		+$.i18n("status.cdrNew.info29")+"</button></span></div></div></div></li>";
	     	topDivHtml +="</ul></div>";
	         return topDivHtml;
	     }
	 	$("#flow-top-list").html(getTopRankHtml_vifiDev(tops, "viFiDeviceNewTab3", "viFiDeviceNewTool3", "viFiDeviceNewBtn3"));//设置“更多”按钮点击事件
	    
	     //概要信息
	     function initOutlineInfo(){
	    	 Utils_ajax({
		     		url:window.PATH + "/vsw/simPDevNew/outlineInfo.ajax",
					dataType:"json",
					async:true,
					data:{},
					type:"POST",
					success:function(res){
						var outlineInfo = res.data;
				     	if(outlineInfo){
				 	        $("#outLineInfo1").html(outlineInfo.outlineInfo1);//卡组数
				 	        $("#outLineInfo2").html(outlineInfo.outlineInfo6);//卡数
				 	        $("#outLineInfo3").html(outlineInfo.outlineInfo7);//已用数
//				 	        $("#outLineInfo4").html("-");
//				 	        $("#outLineInfo5").html("-");
				 	        $("#outLineInfo6").html(outlineInfo.outlineInfo6-outlineInfo.outlineInfo8-outlineInfo.outlineInfo7);//空闲
				 	        $("#outLineInfo7").html(outlineInfo.outlineInfo8);//故障
				 	        $("#outLineInfo12").html((new Date()).format("hh:mm:ss"));
				     	}
					}
	     });
	 	}
	     function initSimCardChart(){
	    	 var simCardData = g_var.view.simCardData;
	    	 if(simCardData){
	    		 $("#todayUsable").html(0);//simCardData.data1);
//	    		 $("#tomorrowUsable").html(0);//simCardData.data1);
//	    		 $("#monthUsable").html(0);//simCardData.data1);
//	    		 $("#monthPerDayUsable").html(0);//simCardData.data1);
	    	 }
	     }
	     
	    /** init **/
	    initSimCardChart();
	    initOutlineInfo();
	    //echarts
		var simcardAndTraffic = g_var.view.simcardAndTraffic;
    	var simCardCount = simcardAndTraffic.simCardCount;
    	var trafficSum = simcardAndTraffic.trafficSum;
		function InitiateFlotBarChart() {
		            var data2 = [{
		                color: themesecondary,
		                label: "卡数统计",
		                data: simCardCount,
		                lines: {
		                    show: true,
		                    fill: true,
		                    lineWidth: .1,
		                    fillColor: {
		                        colors: [{
		                            opacity: 0
		                        }, {
		                            opacity: 0.4
		                        }]
		                    }
		                },
		                points: {
		                    show: false
		                },
		                shadowSize: 0
		            },
		                {
		                    color: themeprimary,
		                    label: "流量统计(G)",
		                    data: trafficSum,
		                    bars: {
		                        order: 1,
		                        show: true,
		                        borderWidth: 0,
		                        barWidth: 0.4,
		                        lineWidth: .5,
		                        fillColor: {
		                            colors: [{
		                                opacity: 0.4
		                            }, {
		                                opacity: 1
		                            }]
		                        }
		                    }
		                },
		                {
		                    color: themethirdcolor,
		                    label: "卡数统计(张)",
		                    data: simCardCount,
		                    lines: {
		                        show: true,
		                        fill: false,
		                        fillColor: {
		                            colors: [{
		                                opacity: 0.3
		                            }, {
		                                opacity: 0
		                            }]
		                        }
		                    },
		                    points: {
		                        show: true
		                    }
		                }
		            ];
		            var options = {
		                legend: {
		                    show: false
		                },
		                xaxis: {
		                	show:false,
		                	//mode:"time",
		                    tickDecimals: 0,
		                    color: '#f3f3f3'
		                },
		                yaxis: {
		                    min: 0,
		                    color: '#f3f3f3',
		                    tickFormatter: function (val, axis) {
		                        return "";
		                    },
		                },
		                grid: {
		                    hoverable: true,
		                    clickable: false,
		                    borderWidth: 0,
		                    aboveData: false,
		                    color: '#fbfbfb'
		
		                },
		                tooltip: true,
		                tooltipOpts: {
		                    defaultTheme: false,
		                    content: " <b>%x天前</b> , <b>%s</b> : <span>%y</span>",
		                }
		            };
		            var placeholder = $("#simCardStatisticChart");
		            var plot = $.plot(placeholder, data2, options);
		};
		//自定义横轴
		function initXaliasTable(){
			var html="";
			var today = new Date();
			var todayTime = today.getTime();
			for(var i=0;i<30;i++){
				var days = new Date(todayTime -24*60*60*1000*(i+1));
				var dateStr = days.format("MM.dd");
				html += "<td>"+ dateStr+"</td>";
			}
			$("#xaliasTable").html(html);
		}
		InitiateFlotBarChart();
		initXaliasTable();
	
	/************************************* 概要信息 end 	***************************************/
	
    

    
    
    </script>
</body>
    