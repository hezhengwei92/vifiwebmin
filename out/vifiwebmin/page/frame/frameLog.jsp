<style>
	@media (min-width:1300px){.modal-lg{width:1280px}}

	.real-time-ctt{
		overflow:auto;
		white-space:nowrap;
		height:800px;
	}

	.modal-dialog .row{
		padding-right: 20px;
	}
	#log-content-panel {
		height:615px;
		position:relative;
	}
	#log-content-panel > div {
		position:absolute;
		height:100%;
	}
	#log-line-nmb {
		 text-align:right;
		 width:6%;
		 background-color:#E9E9E9;
		 padding-right:5px;
	}
	#log-det-ctt {
		overflow:auto;
		left:6%;
		width:91%;
	}
	#log-scroll{
		overflow:auto;
		left:97%;
		width:3%;
	}
	.table button{
		padding : 1px 6px;
	}
	
	@media only screen and (max-width: 880px){
		.DTTTFooter>div>select{
			display: none;
		}
	}
	tr.btn-display button{
		display:none;
	}
	tr.btn-display:hover button{
		display:inline-block;
	}
	
</style>
<div class="bs-example">
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="widget" style="margin:0;">
				<div class="widget-body no-padding">
					<div id="searchable_wrapper" class="dataTables_wrapper form-inline">
						<ul class="nav nav-tabs">
							<li class="active">
	                            <a href="javascript:" ng-click="graphViewShow=true">
	                                <i class="fa fa-th font14"></i><spring:message code="label.common.logList"/>
	                            </a>
	                        </li>
						</ul>
						<%-- 表格数据 --%>
						<div class="data-tbody data-tbody-logPage" style="border-top: 1px solid #e5e5e5;">
							<table class="table  table-hover table-striped dataTable" id="searchable"
								   role="grid" aria-describedby="searchable_info">

								<thead class="flip-content bordered-palegreen">

								<tr role="row">
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="file.name"/></th>
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="db.common.mdfTm"/></th>
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="file.size"/></th>
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"></th>
								</tr>
								</thead>

								<tbody>
								<tr role="row" class="odd btn-display" ng-repeat="data in view.page.contentList" style="height:25px;">
									<td>&nbsp;&nbsp;{{data.name}}</th>
									<td>&nbsp;&nbsp;{{data.mdfTime}}</th>
									<td>&nbsp;&nbsp;{{data.size | number:3}}Mb</th>
									<td align="right" style="min-width:150px;">
										<button class="btn btn-sm btn-info" ng-click="openDetails(data.name)"><spring:message code="details"/></button>&nbsp;
										<button class="btn btn-sm btn-blue" ng-click="logDown(data.name)"><spring:message code="download"/></button>&nbsp;
										<button class="btn btn-sm btn-danger" ng-if="!data.lastMdfFile" ng-click="logRecycle(data.name)"><spring:message code="page.log.op.archive"/></button>
										<button class="btn btn-sm btn-success" ng-if="data.lastMdfFile" ng-click="openRealTime(data.name)" ><spring:message code="page.log.op.tailf"/></button>
									&nbsp;&nbsp;
									</td>
								</tr>
								</tbody>
							</table>
						</div>
						<div class="row DTTTFooter">
							<div class="pull-right">
								<select class=" form-control" style="padding:0;width:50px; height: 31px;" ng-model="view.pageSize" ng-options="size as size for size in [25,50,100]"></select>
							</div>
							<div class="pull-right">
								<span ng-html="Utils.pagination(view.page,'changePage')"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>


<div class="modal fade" id="realTimeModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="width:90%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><spring:message code="page.log.op.tailf"/>&nbsp;{{logModelName}}</h4>
			</div>


			<div class="modal-body real-time-ctt"	style="background-color:#000000;color:#ffffff;"
				 ng-bind-html="view.realDate|toHtmlTag">
			</div>

		</div>
	</div>
</div>



<%--日志详情层--%>
<div class="modal fade" id="logDetModal" tabindex="-1" role="dialog" aria-hidden="true" ng-keydown="keyCtrlPage($event)">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">{{form.fileName}}</h4>
			</div>


			<div class="modal-body">
				<div class="row">
					<div class="col-md-6"></div>
					<div class="col-md-6 input-group">
						<input type="text" class="form-control" ng-model="form.keyword"/>
							<span class="input-group-btn">
								<button class="btn btn-default fa fa-search bg-blur" type="button" ng-click="searchDetails()"></button>
							</span>
					</div>
				</div>
				<br>

				<div id="log-content-panel">
					<div id="log-line-nmb">
						<div ng-repeat="nmb in view.pageDetails.lineNmb" ng-html="nmb"></div>
					</div>
					<div id="log-det-ctt">
						<div style="white-space:nowrap;"
							 ng-bind-html="Utils.hiLiteContent(view.pageDetails?view.pageDetails.content:'',form.keyword)|toHtmlTag">
						</div>
					</div>
					<div id="log-scroll">
						<div style="width:100%" ng-style="{height:((view.pageDetails.totalPages || 0)*DET_HG)+'px'}">
						</div>
					</div>
				</div>


			</div>
			<div class="modal-footer" ng-if="form.copyData.actionName!=i18n('details')">
				<div class="row">
					<div class="col-md-12 input-group" ng-keydown="keyCtrlPage($event)">
						<span  ng-bind-html="Utils.pagination(view.pageDetails,'changePageDetails')|html"></span>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
