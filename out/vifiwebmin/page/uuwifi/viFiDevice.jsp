<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
	<c:param name="actionScopeEx">
		<input type="file" id="import-csv" class="hidden" accept="text/csv" />

        <a class="btn darkorange f-p-tips" style="font-size: 14px;padding: 4px 12px;" onclick="$('#import-csv').click()">
            <i class="fa fa-upload"></i>
            <div class="f-t-tips"><spring:message code="import"/></div>
        </a>
        <a class="btn darkorange f-p-tips" style="font-size: 14px;padding: 4px 12px;"  ng-click="exportCsv($event)">
            <i class="fa fa-download"></i>
            <div class="f-t-tips"><spring:message code="export"/></div>
        </a>&nbsp;&nbsp;

	</c:param>

	<c:param name="detailModalSingleEx">
        <table class="table table-striped table-bordered table-condensed">
            <tr>
                <th><spring:message code="page.simpDevName"/></th>
                <th><spring:message code="page.simpPortNum"/></th>
                <th><spring:message code="page.simpPortState"/></th>
                <th><spring:message code="page.simpPortUseCount"/></th>
                <th><spring:message code="page.simpPortUseDur"/></th>
                <th><spring:message code="page.simCardNumber"/></th>
                <th><spring:message code="page.simCardState"/></th>
                <th><spring:message code="page.simCardBalance"/></th>
                <th><spring:message code="page.goIPDevName"/></th>
                <th><spring:message code="page.goIPPortNum"/></th>
                <th><spring:message code="page.goIPPortState"/></th>
            </tr>
            <tr ng-repeat="d in view.sgDetails.devState">
                <td>{{d.simpDevName}}</td>
                <td>{{d.simpPortSlotNum}}</td>
                <td>{{d.simpPortState}}</td>
                <td>{{d.simpPortUsage}}</td>
                <td>{{d.simpPortDuration}}</td>
                <td>{{d.simCardNumber}}</td>
                <td>{{d.simpCardState}}</td>
                <td>{{d.simpCardBalance}}</td>
                <td>{{d.goIPDevName}}</td>
                <td>{{d.goIPPortNum}}</td>
                <td>{{d.goIPState}}</td>
            </tr>
        </table>
	</c:param>
</c:import>