<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
    <c:param name="detailModalTbEx">

        <div>
            <echart data-options="tbEOp" style="height:35vh;width:85vw;"></echart>
        </div>

        <%-- --%>
        <div style="padding:15px 60px 300px 60px;">
            <div class="simp-explain">
                <spring:message code="page.simpPortState"/>:
            </div>

            <table class="simp-sta-table" >
                <tr ng-repeat="values in view.tbDetails.portStatus">
                    <td ng-repeat="val in values" class="f-p-tips">
                        <div class="img-fmt simp-port-sta-{{val.status}}"></div>
                        <div class="f-tips">
                            <spring:message code="page.cardSlot"/>:{{val.idxSlotNum}}<br>
                            <spring:message code="page.simCardNumber"/>:{{val.cNumber}}<br>
                            <spring:message code="page.simCardState"/>:{{val.cStatus}}<br>
                            <spring:message code="page.simCardBalance"/>:{{val.cBalance}}<br>
                            ------------------<br>
                            <spring:message code="page.uuwifiState"/>:{{val.vStatus}}<br>
                            <spring:message code="page.uuwifiCOS"/>:{{val.vCos}}<br>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </c:param>

    <c:param name="detailModalSingleEx">
        <div>
            <div id="sg-dtl-echarts" style="height:70vh;width:29vw;"></div>
        </div>
    </c:param>

    <c:param name="detailModalMultiEx" >
        <div style="padding:15px;">
            <table class="simp-sta-table">
                <tr ng-repeat="values in view.mulDetails.portStatus">
                    <td ng-repeat="val in values" class="f-p-tips">
                        <div class="img-fmt simp-port-sta-{{val.status}}">
                        </div>
                        <div class="f-tips">
                            <spring:message code="page.cardSlot"/>:{{val.idxSlotNum}}<br>
                            <spring:message code="page.simCardNumber"/>:{{val.cNumber}}<br>
                            <spring:message code="page.simCardState"/>:{{val.cStatus}}<br>
                            <spring:message code="page.simCardBalance"/>:{{val.cBalance}}<br>
                            ------------------<br>
                            <spring:message code="page.uuwifiState"/>:{{val.vStatus}}<br>
                            <spring:message code="page.uuwifiCOS"/>:{{val.vCos}}<br>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="margin-top-40">
                <div ng-repeat="(sta,count) in view.mulDetails.statusCount" >
                    <div class="img-fmt simp-port-sta-{{sta}}"></div> {{Utils.getSelVal(i18n("db.tbGoIPPort.status.comData"),sta)}}: {{count.count}}
                </div>
            </div>

        </div>
    </c:param>


</c:import>
