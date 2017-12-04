<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">


    <c:param name="actionScopeEx">
        <%--导入--%>
        <%--<input type="file" id="import-csv" class="hidden" accept="text/csv" />
        <a class="btn darkorange f-p-tips" style="font-size: 14px;padding: 4px 12px;" onclick="$('#import-csv').click()">
            <i class="fa fa-upload"></i>
            <div class="f-t-tips"><spring:message code="import"/></div>
        </a>--%>
        <%--导出--%>
        <a class="btn darkorange f-p-tips" style="font-size: 14px;padding: 4px 12px;" ng-click="exportRateCsv($event)">
            <i class="fa fa-download"></i>
            <div class="f-t-tips"><spring:message code="export"/></div>
        </a>&nbsp;&nbsp;

    </c:param>

</c:import>
