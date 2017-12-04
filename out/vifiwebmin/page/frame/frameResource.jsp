<style>
	.table-resource th,.table-resource td{padding: 0 5px !important;}
</style>
<div class="bs-example">
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="widget">
				<div class="widget-body no-padding">
					<div id="searchable_wrapper" class="dataTables_wrapper form-inline">
						<table class="table table-bordered table-hover table-striped dataTable table-resource" id="searchable" role="grid" aria-describedby="searchable_info">

							<thead class="flip-content bordered-palegreen">

							<tr role="row" height="30px">
								<!-- th width="20" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">
									<label style="margin-bottom: 0px;"><input type="checkbox" ng-model="form.allCheckbox" ng-change="view.page.contentList.setBatch('checkbok',form.allCheckbox)"><span class="text"></span></label>
								</th-->
								<th tabindex="0" style="line-height:30px;" aria-controls="searchable" rowspan="1" colspan="1">&nbsp;&nbsp;<spring:message code="name" /></th>
								<th tabindex="0" style="line-height:30px;" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="page.frameResource.resourceUrl"/></th>
								<th tabindex="0" style="line-height:30px;" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="db.common.crtBy"/></th>
								<th tabindex="0" style="line-height:30px;" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="db.common.crtTm"/></th>
								<th></th>
							</tr>
							</thead>

							<tbody>
							<tr role="row" class="odd" ng-repeat="data in dataLs">
								<!-- th>
									<label style="margin-bottom: 0px;"><input type="checkbox" ng-model="data.checkbok"><span class="text"></span></label>
								</th-->
								<td ng-if="data.parent">&nbsp;&nbsp;<span class="fa fa-indent"></span> {{data.topMenuRs}}</th>
								<td ng-if="!data.parent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="fa fa-file-text-o"></span> {{data.nameRs}}
								</th>
								<td>{{data.keyResourceId}}</th>
								<td>{{data.createdBy}}</th>
								<td>{{data.createdTime}}</th>
								<td align="center">
									<button class="btn btn-sm btn-default" style="padding:0;" ng-if="!data.parent" ng-disabled="dataLs[$index-1].parent" ng-click="swapPosi(data,dataLs[$index-1])"><i class="fa fa-arrow-up" style="margin: 0;"></i></button>&nbsp;&nbsp;
									<button class="btn btn-sm btn-default" style="padding:0;" ng-if="!data.parent" ng-disabled="dataLs[$index+1].parent || !dataLs[$index+1]" ng-click="swapPosi(data,dataLs[$index+1])"><i class="fa fa-arrow-down" style="margin: 0;"></i></button>
								</td>
							</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

</div>

