<script>
	try {
		g_var.view = JSON.parse('${view}' || '{"permissions":[],"tabI18N":{}}');
	} catch (e) {
		throw new Error("js视图数据,解析错误,请检测!~!");
	}
	if (g_var.view.permissions.length < 4) {
		g_var.view.permissions = ['1', '1', '1', '1'];
		throw new Error("许可数据不正确");
	}
</script>
<style>
	.role_gray{
		color:#AAAAAA;
	}
	.btn_gray{
		color:gray;
	}
	.homePageRadio{
		width: 14px !important;
		height: 14px !important;
		opacity: 1 !important;
	}	
</style>
<div class="bs-example">
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="widget no-margin-bottom">
				<div class="widget-body no-padding">
					<div id="searchable_wrapper" class="dataTables_wrapper form-inline">
						<!-- 
						<div class="row" style="padding:0 10px 0 10px;">
							<div class="col-md-6" style="padding: 13px 15px;">
								<button class="btn btn-info" ng-disabled="isDsbDtlBtn()" ng-if="view.permissions[0]=='0'" ng-click="openDetailsModal()"><i class="fa fa-bullseye"></i> <spring:message code="details"/></button>&nbsp;
								<button class="btn btn-success" ng-if="view.permissions[1]=='0'" ng-click="openAddModal()"><i class="fa fa-plus"></i> <spring:message code="new"/></button>&nbsp;
								<button class="btn btn-primary" ng-disabled="isDsbEditBtn()" ng-if="view.permissions[2]=='0'" ng-click="openEditModal()"><i class="fa fa-edit"></i> <spring:message code="edit"/></button>&nbsp;
								<button class="btn btn-danger"  ng-disabled="form.selNumber==0" ng-if="view.permissions[3]=='0'" ng-click="delete()"><i class="fa fa-trash-o"></i> <spring:message code="delete"/></button>&nbsp;
							</div>
							<div class="col-md-1">
							</div>
							<div class="col-md-5 text-right" style="padding: 13px 15px;">
							</div>
						</div>
						-->
						<ul class="nav nav-tabs">
		                  <li class="active">
		                     <a data-toggle="tab" href="javaScript:void(0)" onclick=""><i class="fa fa-th font14"></i><spring:message code="menu.frame_role"/></a> 
		                  </li>
		                  <li class="head-tools-r navbar-right">
							<div class="btn btn_gray f-p-tips" style="font-size: 14px;padding: 4px 12px;" disabled="disabled" ng-if="view.permissions[0]=='0'" ng-click="openDetailsModal()">
								<i class="fa fa-list-alt"></i><div class="f-t-tips"><spring:message code="details"/></div></div>
							<div class="btn success f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-if="view.permissions[1]=='0'" ng-click="openAddModal()">
								<i class="fa fa-plus"></i><div class="f-t-tips"><spring:message code="new"/></div></div>	
								<!-- isDsbDtlBtn()不仅是判断，里面还有一些初始化操作  -->		
		                    <div class="btn  f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-disabled="isDsbDtlBtn() && isDsbEditBtn()" ng-if="view.permissions[2]=='0'" 
		                    	ng-click="openEditModal()" ng-class="{'btn_gray':isDsbEditBtn(),'primary':!isDsbEditBtn()}">
		                    	<i class="fa fa-edit"></i><div class="f-t-tips"><spring:message code="edit"/></div></div>
							<div class="btn danger f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-disabled="form.selNumber==0" ng-if="view.permissions[3]=='0'" ng-click="delete()">
								<i class="fa fa-trash-o"></i><div class="f-t-tips"><spring:message code="delete"/></div></div>
		                  </li>
						</ul> 
						<div class="data-tbody data-tbody-rolepage">
							<table class="table table-bordered table-hover table-striped dataTable" id="searchable"
								   role="grid" aria-describedby="searchable_info">

								<thead class="flip-content bordered-palegreen">

								<tr role="row">
									<th width="20" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1">
										<label class="no-margin-bottom"><input type="checkbox" ng-model="form.allCheckbox" ng-change="view.page.contentList.setBatch('checkbok',form.allCheckbox)"><span class="text"></span></label>
									</th>
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="page.index.role"/></th>
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="page.index.homepage"/></th>
									<th tabindex="0" aria-controls="searchable" rowspan="1" colspan="1"><spring:message code="statue.frame.role.permission"/></th>
								</tr>
								</thead>

								<tbody>
								<tr role="row" class="odd" ng-class="{active_tr:data.checkbok}" ng-repeat="data in view.page.contentList" >
									<th>
										<label style="margin-bottom: 0px;"><input type="checkbox" ng-model="data.checkbok"><span class="text"></span></label>
									</th>
									<td ng-dblclick="openDetailsModal()" ng-click="clickAddActive(data)">{{data.keyRoleId}}</td>
									<td ng-click="clickAddActive(data)">{{homePagesObjI18n[data.keyRoleId]}}</td>
									<td ng-dblclick="openDetailsModal()" ng-click="clickAddActive(data)">
										<span ng-repeat="resource in view.resources">
											<br ng-if="resource.parent && !$first">  <%--目录的话,换行效果 --%>
											<span ng-if="!resource.parent" style="min-width:120px;display: inline-block;">
												<%--判断用户是否有这个资源的权限样式切换--%>
												<i style="width:12px;" class=" fa" ng-class="{'fa-check text-success':data.auths[resource.name]['all'],'fa-times role_gray':!data.auths[resource.name],'fa-ellipsis-h':data.auths[resource.name]['half']}" ></i>
												<span ng-class="{'role_gray':!data.auths[resource.name]}">{{resource.nameRs}}</span>
											</span>
										</span>
									</th>
								</tr>
								</tbody>
							</table>
						</div>
						<div class="row DTTTFooter">
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


<div class="modal fade bs-example-modal-lg in modal-primary" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<form class="form-horizontal">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" ng-class="{'text-info':form.copyData.actionName==i18n('details'),'text-success':form.copyData.actionName==i18n('new'),'text-primary':form.copyData.actionName==i18n('edit')}">
						<i class="fa" ng-class="{'fa-bullseye':form.copyData.actionName==i18n('details'),'fa-plus':form.copyData.actionName==i18n('new'),'fa-edit':form.copyData.actionName==i18n('edit')}"></i>
						{{form.copyData.actionName}}
					</h4>
				</div>
				<div class="modal-body" style="overflow: auto;">
					<div ng-if="form.copyData.actionName==i18n('details')" style="position:absolute;width:90%;height:90%;z-index:999;"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label" ><spring:message code="page.index.role"/>：</label>
						<div class="col-sm-9">
							<input class="form-control input-sm"  ng-disabled="form.copyData.actionName==i18n('edit')" name="name" ng-model="form.copyData.keyRoleId" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" ><spring:message code="page.index.homepage"/>：</label>
						<div class="col-sm-9">
						<select id="homePage">
							<option ng-repeat="role in homePageList" value={{role[0]}} ng-selected="role[0]==homePagesObj[form.copyData.keyRoleId]">{{role[1]}}</option>
						</select>
							<!-- div class="from-group" ng-repeat="role in homePageList">
								<div class="col-sm-4">
									<input class="homePageRadio" type="radio" name="homePage" value={{role[0]}} ng-checked="role[0]==homePagesObj[form.copyData.keyRoleId]"></input>
									<label>{{role[1]}}</label>
								</div>
							</div-->
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" ><spring:message code="statue.frame.role.permission"/>：</label>
						<div class="col-sm-9">
							<!-- ng-disabled="form.copyData.keyRoleId=='admin' && resource.topMenuRs=='系统管理'"	admin的系统管理权限不允许修改 @autor gya -->
							<table class="table table-bordered table-condensed" style="width: 100%;white-space: nowrap;">
								<tbody>
								<tr class="menu-tr" ng-repeat="resource in view.resources" ng-if="resource.parent">
									<td>
										<label style="margin-bottom: 0;" ng-if="resource.parent">
											<input type="checkbox" ng-model="resource.isAllCheck" ng-click="parentGroupAllCheck(resource)"
												ng-disabled="form.copyData.keyRoleId=='admin' && resource.topMenuRs=='系统管理'">
											<span class="text">{{resource.topMenuRs}}</span>
										</label>
									</td>
									<td>
										<div class="hover-child-show" ng-repeat="rsChild in view.resources" ng-if="!rsChild.parent && rsChild.topMenu==resource.topMenu">
											<label style="margin-bottom: 0;" >
												<input type="checkbox" ng-model="form.copyData.auths[rsChild.name]['all']" ng-click="authGroupAllCheck($event,rsChild.name,'all')" 
												ng-disabled="form.copyData.keyRoleId=='admin' && resource.topMenuRs=='系统管理'"/>
												<span class="text" style="width:120px;display: inline-block;">{{rsChild.nameRs}}</span>
											</label>
											
											<span class="hover-child">

												<label style="margin-bottom:0;" ng-repeat="at in authTypesOpera">
													<input type="checkbox" ng-model="form.copyData.auths[rsChild.name][at]" ng-click="authGroupAllCheck($event,rsChild.name,at)" 
													ng-disabled="form.copyData.keyRoleId=='admin' && resource.topMenuRs=='系统管理'"/>
													<span class="text" style="font-size:12px;">[{{at}}] &nbsp;&nbsp;</span>
												</label>

											</span>

										</div>

									</td>
								</tr>
								</tbody>
							</table>


						</div>
					</div>

				</div>
				<div class="modal-footer" ng-if="form.copyData.actionName!=i18n('details')">
					<button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="cancel"/></button>
					<button type="submit" class="btn btn-primary"><spring:message code="save"/></button>
				</div>
			</form>
		</div>
	</div>
</div>




