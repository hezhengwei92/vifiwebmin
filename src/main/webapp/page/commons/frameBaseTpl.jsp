<script>
    try {
        g_var.view = JSON.parse('${view}' || '{"permissions":[]}');
    } catch (e) {
        throw new Error("js视图数据,解析错误,请检测!~!");
    }
    var permi = g_var.view.permissions;
    if (!permi || permi.length < 4) {
        g_var.view.permissions = ['1', '1', '1', '1'];
    }
</script>
<style>
	.tpl_gray{
		color:gray;
	}
</style>
<div class="bs-example">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget no-margin-bottom">
                <div class="widget-body no-padding">
                    <div id="searchable_wrapper" class="dataTables_wrapper form-inline">
                        <ul class="nav nav-tabs">
                            <c:if test="${param.graphViewEx!=null}">
                                <li ng-class="{active:graphViewShow}">
                                    <a href="javascript:" ng-click="graphViewShow=true">
                                        <i class="fa fa-th font14"></i><spring:message code="state"/>
                                    </a>
                                </li>
                            </c:if>
                            <li ng-class="{active:!graphViewShow}" class="margin-right-5">
                                <a href="javascript:" ng-click="graphViewShow=false">
                                    <i class="fa fa-list font14"></i><spring:message code="list"/>
                                </a>
                            </li>
                            <li ng-show="!graphViewShow" class="head-tools-r navbar-right">
                            	<div class="pull-left">
                                        <div class="btn blue f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-disabled="isDsbDtlBtn()" ng-if="view.permissions[0]=='0'" ng-click="openDetailsModal()">
                                            <i class="fa fa-list-alt" ng-class="{'tpl_gray':isDsbDtlBtn()}"></i>
                                            <div class="f-t-tips"><spring:message code="details"/></div>
                                        </div>
                                        <div class="btn success f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-if="view.permissions[1]=='0'" ng-click="openAddModal()">
                                            <i class="fa fa-plus"></i>
                                            <div class="f-t-tips"><spring:message code="new"/></div>
                                        </div>
                                        <div class="btn primary f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-disabled="isDsbEditBtn()" ng-if="view.permissions[2]=='0'" ng-click="openEditModal()">
                                            <i class="fa fa-edit" ng-class="{'tpl_gray':isDsbDtlBtn()}"></i>
                                            <div class="f-t-tips"><spring:message code="edit"/></div>
                                        </div>
                                        <div class="btn danger f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-disabled="form.selNumber==0" ng-if="view.permissions[3]=='0'" ng-click="delete()">
                                            <i class="fa fa-trash-o" ng-class="{'tpl_gray':form.selNumber==0}"></i>
                                            <div class="f-t-tips"><spring:message code="delete"/></div>
                                         </div>&nbsp;&nbsp;
                                        <%-- 功能操作区域,待子模板扩充 --%>
                                        ${param.actionScopeEx}
		                                <div class="viewcfg-dropdown f-p-tips" style="display:inline-block;">
                                    		<a class="btn purple dropdown-toggle" style="font-size: 14px;padding: 4px 12px;"  
                                    			data-toggle="dropdown" href="javascript:" aria-expanded="false"><i class="fa fa-gear"></i>
                                    			<div class="f-t-tips"><spring:message code="setting"/></div>
                                    		</a>	
											<ul class="dropdown-menu dropdown-blue">
											<li style="border-bottom: 1px solid #00A2E9;height:30px;" onclick="event.stopPropagation()">
												<div class="pull-left">
													<label style="margin: 0 0 0 20px;"><input type="checkbox" ng-model="viewCfg.allShow" ng-change="viewCfg.fields.setBatch('show',viewCfg.allShow)" ng-click="refreshTBodyData()"><span class="text"></span></label>
													{{tbIsAllShow()?'<spring:message code="check_adverse"/>':'<spring:message code="check_all"/>'}}
												</div>
												<button class="btn btn-info pull-right" style="padding:0 3px;margin: 0 5px 0 0;" ng-click="reDefHeadShowCfg()"><i class="fa fa-refresh"></i><spring:message code="restore"/></button>
											</li>
											<li ng-repeat="vc in viewCfg.fields" ng-if="vc.show!==0" onclick="event.stopPropagation()">
												<label style="margin: 0 0 0 20px;"><input type="checkbox" ng-model="vc.show" ng-click="refreshTBodyData()"><span class="text"></span></label>
												{{::vc.title || vc.name}}
											</li>
										</ul>
										</div>
		                                <div id="adv-search" class="btn warning f-p-tips" style="font-size: 14px;padding: 4px 12px;"  ng-if="viewCfg.isAdvQry" aria-expanded="false">
		                                    <i class="fa fa-search-plus"></i><i class="fa fa-search-minus"></i>
		                                    <div class="f-t-tips"><spring:message code="search"/></div>
		                                </div>
		                                
                                </div>
                            </li>
                        </ul>

                        <div class="tab-content tabs-flat no-padding" style="border-radius:0;">
                            <%--列表视图--%>
                            <div ng-show="!graphViewShow">
                                <%--高级搜索--%>
                                <div class="collapse" id="collapse-adv-search" ng-if="::viewCfg.isAdvQry">
                                    <div class="panel-body">
                                        <div class="row margin-bottom-5" ng-repeat="advQryGroup in ::viewCfg.advQryList">
                                            <div class="col-md-4" ng-repeat="aq in ::advQryGroup"
                                                 ng-init="cxMark='cx_'+aq.operator+'-|-'+aq.vc.name;pla=aq.vc.help || aq.vc.title || aq.vc.name">

										<span class="adv-name">
											{{::aq.vc.title || aq.vc.name}}:
										</span>

                                                <div ng-switch="aq.vc.comType" class="adv-value">
                                                    <div ng-switch-when="select" class="input-sm no-border no-padding" style="min-width:154px;">
                                                        <div ng-my-select2="params[cxMark],aq.vc.comData,,,pla"></div>
                                                    </div>
                                                    <div ng-switch-when="area" class="input-sm no-border no-padding" style="min-width:154px;">
                                                        <div ng-my-select2="params[cxMark],aq.vc.comData,,,pla"></div>
                                                    </div>
                                                    <div ng-switch-default>
                                                        <div ng-if="aq.operator=='GTE'" class="adv-range">
                                                            <input type="text" class="input-sm" placeholder="{{::pla}}" ng-click="aq.vc.type=='D'&&laydate(params,'cx_GTE-|-'+aq.vc.name,$event)"
                                                                   ng-model="params['cx_GTE-|-'+aq.vc.name]"
                                                            />-<input type="text" class="input-sm" placeholder="{{::pla}}" ng-click="aq.vc.type=='D'&&laydate(params,'cx_LTE-|-'+aq.vc.name,$event)"
                                                                      ng-model="params['cx_LTE-|-'+aq.vc.name]"/>
                                                        </div>

                                                        <%-- 按照约定查询条件规则绑定数据名--%>
                                                        <input ng-if="aq.operator!='GTE'" type="text" class="input-sm" placeholder="{{::pla}}" ng-click="aq.vc.type=='D'&&laydate(params,cxMark,$event)"
                                                               ng-model="params[cxMark]"/>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 adv-opt text-right">
                                                <button class="btn btn-success" ng-click="search()"><i class="fa fa-search"></i><spring:message code="search"/></button>
                                                <button class="btn btn-darkorange" ng-click="clearSearch()"><i class="fa fa-undo"></i><spring:message code="page.clear_search"/></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- 表格数据 --%>
                                <div id="my-data-table">
                                    <div class="data-thead" style="height:34px;" onmousemove="g_var.resizeTbMove(event)" >
                                        <table class="table table-bordered table-striped dataTable"
                                               role="grid" aria-describedby="searchable_info">
                                            <thead class="flip-content">
                                            <tr role="row">
                                                <th aria-controls="searchable">
                                                    <label class="no-margin-bottom"><input type="checkbox" ng-model="form.allCheckbox" ng-change="allCheckbox()"><span class="text"></span></label>
                                                </th>
                                                <th class="{{['sorting','sorting_asc','sorting_desc'][vc.sort||0]}}" tabindex="0" aria-controls="searchable"
                                                    data-repe-inx="{{$index}}" ng-mousedown="resizeTbBegin($event,vc)"
                                                    ng-repeat="vc in viewCfg.fields" ng-if="vc.show" ng-click="changeSort(vc)">
                                                    <div class="table-data" ng-style="{width: vc.width}" draggable="true" ondragstart="g_var.theadDragstart(event)" ondrop="g_var.theadDrop(event)">{{::vc.title || vc.name}}</div>
                                                </th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div class="data-tbody data-tbody-height">
                                        <div>
                                            <table class="table table-bordered table-hover table-striped"
                                                   role="grid" aria-describedby="searchable_info">
                                                <%-- 表格数据展示 --%>
                                                <tbody class="page-data-tbody"></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="stati-info">
                                    <%-- 统计区域,待子模板扩充 --%>
                                    ${param.statiInfoScopeEx }
                                </div>
                                <%--底部 功能,分页--%>
                                <div class="row foot-tools" style="height:43px;">
                                <!--  
                                    <div class="pull-left">

                                        <a class="btn btn-info btn-circle f-p-tips" ng-disabled="isDsbDtlBtn()" ng-if="view.permissions[0]=='0'" ng-click="openDetailsModal()">
                                            <i class="fa fa-list-alt"></i>
                                            <div class="f-t-tips"><spring:message code="details"/></div>
                                        </a>
                                        <a class="btn btn-success btn-circle f-p-tips" ng-if="view.permissions[1]=='0'" ng-click="openAddModal()">
                                            <i class="fa fa-plus"></i>
                                            <div class="f-t-tips"><spring:message code="new"/></div>
                                        </a>
                                        <a class="btn btn-primary btn-circle f-p-tips" ng-disabled="isDsbEditBtn()" ng-if="view.permissions[2]=='0'" ng-click="openEditModal()">
                                            <i class="fa fa-edit"></i>
                                            <div class="f-t-tips"><spring:message code="edit"/></div>
                                        </a>
                                        <a class="btn btn-danger btn-circle f-p-tips" ng-disabled="form.selNumber==0" ng-if="view.permissions[3]=='0'" ng-click="delete()">
                                            <i class="fa fa-trash-o"></i>
                                            <div class="f-t-tips"><spring:message code="delete"/></div>
                                        </a>
                                        <%-- 功能操作区域,待子模板扩充 --%>
                                        ${param.actionScopeEx}
                                    </div>-->
                                    <div class="pull-right table-page-tools position-relative">
                                        <div class="pagetools"></div>
                                        <select class="form-control" ng-model="view.pageSize" ng-options="size as size for size in [25,50,100]"></select>
                                    </div>
                                </div>

                            </div>


                            <c:if test="${param.graphViewEx!=null}">
                                <div ng-show="graphViewShow" ng-init="graphViewShow=true">
                                        <%-- 图形展示待扩充 --%>
                                        ${param.graphViewEx }
                                </div>
                            </c:if>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<%-- 详情层 --%>
<div class="modal fade modal-primary" id="detailModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" ng-style="{'width':(form.dtlShow.sg?viewCfg.dtlLayout[2]||90:90)+'vw'}">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title text-info">
                    <i class="fa" ng-class="{'fa-list-alt':form.dtlShow.sg,'fa-bar-chart-o':!form.dtlShow.sg}"></i>
                    {{form.dtlShow.sg?'<spring:message code="details"/>':'<spring:message code="statistics"/>'}}
                </h4>
            </div>
            <div class="modal-body bg-white no-padding">
                <div ng-show="form.dtlShow.tb">
                    <%-- 表数据概要,待子模板扩充 --%>
                    ${param.detailModalTbEx }
                </div>

                <div ng-show="form.dtlShow.sg" id="sg-dtl">
                    <div class="col-sm-{{::viewCfg.dtlLayout[0]}}">
                        <div>
                            <table class="table table-striped table-bordered  detailTable">
                                <tbody>
                                <tr ng-repeat="vc in viewCfg.fields">
                                    <td class="text-right" style="width:150px;">{{vc.title || vc.name}}</td>
                                    <td class="right-border-none">
                                        <div class="f-p-tips" style="word-wrap:break-word;word-break:break-all;" ng-bind-html="getTbDataVal(form.curData,vc)|html"></div>
                                    </td>
                                </tr>
                                <tr ng-repeat="vc in viewCfg.fillDtlTr">
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-{{::viewCfg.dtlLayout[1]}}" ng-if="::viewCfg.dtlLayout[1]">
                        <%-- 单个数据概要,待子模板扩充 --%>
                        ${param.detailModalSingleEx }
                    </div>
                </div>

                <div ng-show="form.dtlShow.mul">
                    <%-- 多个数据概要,待子模板扩充 --%>
                    ${param.detailModalMultiEx }
                </div>
            </div>
            <div class="modal-footer">
            <div class="btn primary f-p-tips" style="font-size: 14px;padding: 4px 12px;float:left;" ng-disabled="isDsbEditBtn()" ng-if="view.permissions[2]=='0'" 
            	ng-click="skip2EditModal()">
            	<i class="fa fa-edit" ng-class="{'tpl_gray':isDsbDtlBtn()}"></i><div class="f-t-tips"><spring:message code="edit"/></div>
            </div>
           	<button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
            </div>
        </div>
    </div>
</div>


<%-- 编辑层 --%>
<div class="modal fade modal-primary" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" ng-class="{'modal-lg':viewCfg.isSplit}">
        <div class="modal-content">
            <form class="form-horizontal">
                <div class="modal-header">
                    <button type="button" class="close" ng-click="cancelEdit()"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" ng-class="{'text-success':!isEditAct(),'text-primary':isEditAct()}">
                        <i class="fa" ng-class="{'fa-plus':!isEditAct(),'fa-edit':isEditAct()}"></i>
                        {{form.copyData.actionName}}
                    </h4>
                </div>
                <div class="modal-body">
                    <%-- 编辑窗口body,待子模板扩充 --%>
                    ${param.editModalBodyEx }
                </div>
                <div class="modal-footer">
                	<div class="btn blue f-p-tips" style="font-size: 14px;padding: 4px 12px;float:left;" ng-disabled="isDsbDtlBtn()" ng-if="view.permissions[0]=='0'"
                		ng-click="skip2DetailsModal()"><i class="fa fa-list-alt" ng-class="{'tpl_gray':isDsbDtlBtn()}"></i>
                    <div class="f-t-tips"><spring:message code="details"/></div></div>
                    <button type="submit" class="btn btn-primary"><spring:message code="save"/></button>
                    <a class="btn btn-danger" ng-click="cancelEdit()"><spring:message code="cancel"/></a>
                </div>
            </form>
        </div>
    </div>
</div>


<%-- 底部区域,待子模板扩充 --%>
${param.footScopeEx }


