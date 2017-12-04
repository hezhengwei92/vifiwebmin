<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
	<c:param name="statiInfoScopeEx">
		<div class="row">
			<div class="col-md-3"><spring:message code="page.cdr.callNum"/> : <b>{{view.page.statisInfo.callCount}}</b></div>
			<div class="col-md-3"><spring:message code="page.cdr.callDuration"/> : <b>{{view.page.statisInfo.callDuration}}</b></div>
			<div class="col-md-3"><spring:message code="page.cdr.billingDuration"/> : <b>{{view.page.statisInfo.billingDuration}}</b></div>
			<div class="col-md-3"><spring:message code="page.cdr.comboDuration"/> : <b>{{view.page.statisInfo.comboDuration}}</b></div>
		</div>
		<div class="row">
			<div class="col-md-3"><spring:message code="page.cdr.callIncome"/> : <b>-</b></div>
			<div class="col-md-3"><spring:message code="page.cdr.callCost"/> : <b>-</b></div>
			<div class="col-md-3"><spring:message code="page.cdr.comboCost"/> : <b>-</b></div>
			<div class="col-md-3"><spring:message code="page.cdr.profitTotal"/> : <b>-</b></div>
		</div>

	</c:param>
</c:import>