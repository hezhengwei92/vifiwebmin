<div class="bs-example">
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="widget">
				<div class="widget-body no-padding">
					<div id="searchable_wrapper" class="dataTables_wrapper form-inline">

						<table class="table table-bordered table-hover table-striped dataTable" id="searchable"
							   role="grid" aria-describedby="searchable_info">

							<thead class="flip-content bordered-palegreen">

							<tr role="row">
								<th width="20" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">
									<label style="margin-bottom: 0"><input type="checkbox" ng-model="form.allCheckbox" ng-change="view.page.contentList.setBatch('checkbok',form.allCheckbox)"><span class="text"></span></label>
								</th>
								<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">name</th>
								<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">resourceUrl</th>
								<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">createdBy</th>
								<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">createdTime</th>
							</tr>
							</thead>

							<tbody>
							<tr role="row" class="odd" ng-repeat="data in view.page.contentList">
								<th>
									<label style="margin-bottom: 0px;"><input type="checkbox" ng-model="data.checkbok"><span class="text"></span></label>
								</th>
								<td ng-if="data.parent"><span class="fa fa-indent"></span> {{data.topMenuRs}}</th>
								<td ng-if="!data.parent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa fa-file-text-o"></span> {{data.nameRs}}</th>
								<td>{{data.keyResourceId}}</th>
								<td>{{data.createdBy}}</th>
								<td>{{data.createdTime}}</th>
							</tr>
							</tbody>
						</table>
						<div class="row DTTTFooter">
							<div class="col-sm-6">
								<div class="dataTables_info" id="searchable_info" role="status" aria-live="polite">
									totalElements : {{view.page.totalElements }}

									{{view.page.contentList}}
								</div>
							</div>
							<div class="col-sm-6">
								<div class="dataTables_paginate paging_bootstrap" id="searchable_paginate">

									<span ng-html="Utils.pagination(view.page,'changePage')"></span>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

