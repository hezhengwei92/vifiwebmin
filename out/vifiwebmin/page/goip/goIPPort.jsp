<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
    <c:param name="detailModalTbEx">
        <div>
            <echart data-options="tbEOp" style="height:35vh;width:85vw;"></echart>
        </div>

        <div style="padding:15px 60px 300px 60px;">
            <div class="simp-explain">
                <spring:message code="page.goIPPortState"/>:
            </div>
            <table class="simp-sta-table">
                <tr ng-repeat="values in view.tbDetails.staDtlList">
                    <td ng-repeat="val in values" class="f-p-tips">
                        <div class="img-fmt goip-port-sta-{{val.status}}"></div>
                        <div class="f-tips">
                            <spring:message code="page.port"/>: {{val.idxportNum}}<br>
                            <div><spring:message code="page.uuwifiState"/>: {{val.vStatus}}</div>
                            <div><spring:message code="page.uuwifiCOS"/>: {{val.vCos}}</div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </c:param>

    <c:param name="detailModalSingleEx">
    </c:param>

    <c:param name="detailModalMultiEx" >
        <div class="padding-20">
            <table class="simp-sta-table">
                <tr ng-repeat="values in view.mulDetails.staDtlList">
                    <td ng-repeat="val in values" class="f-p-tips">
                        <div class="img-fmt goip-port-sta-{{val.status}}"></div>
                        <div class="f-tips">
                            <spring:message code="page.port"/>: {{val.idxportNum}}<br>
                            <div><spring:message code="page.uuwifiState"/>: {{val.vStatus}}</div>
                            <div><spring:message code="page.uuwifiCOS"/>: {{val.vCos}}</div>
                        </div>
                    </td>
                </tr>
            </table>

        </div>

    </c:param>


</c:import>
