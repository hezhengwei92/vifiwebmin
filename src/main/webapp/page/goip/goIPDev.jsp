<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
    <c:param name="graphViewEx">
        <div class="text-center">
            <div class="goip-dev-shelf">
                <div>
                    <div class="margin-bottom-20" ng-repeat="dev in view.graphView">
                        <div class="text-left padding-5"><a class="fa-lg" href="javascript:" ng-click="openGoIPDevDtl(dev)">{{::dev.devName}}</a></div>
                        <div class="goip-dev" >
                            <table>
                                <tr class="simp-row" ng-repeat="row in dev.portInfoArray">
                                    <td ng-repeat="port in row" ng-click="openGoIPPortDtl(port,dev)">
                                        <div class="goip-col-num">{{::port.portNum}}</div>
                                        <div class="margin-left-10 f-p-tips img-fmt goip-port-sta-{{::port.state||0}}">
                                            <i class="f-tips" style="top:26px;">{{::Utils.getSelVal(i18n("db.tbGoIPPort.status.comData"),(port.state||0)+"")}}</i>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:param>


    <c:param name="detailModalTbEx">
        <div class="sta-bar-table">
            <table class="table table-bordered table-striped">
                <tr ng-repeat="dev in view.tbDetails.devices">
                    <td><spring:message code="device"/>{{dev.id}}:</td>
                    <td width="1025">
                        <div class="f-p-tips">
                            <div class="sta-bar goip-port-color-sta-{{sta[0]}}"
                                 ng-style="{width:sta[1]*16}"
                                 ng-repeat="sta in dev.status">{{sta[1]}}</div>
                            <div class="f-tips">
                                <div><spring:message code="device"/>{{dev.id}}:</div>
                                <div ng-repeat="sta in dev.status">
                                    <div class="sta-round goip-port-color-sta-{{sta[0]}}"></div>:
                                    {{sta[1]}}
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr style="border-top: 3px solid #00A2E9;">
                    <td><spring:message code="page.deviceSum"/>: </td><td>{{view.tbDetails.devCount}}</td>
                </tr>
                <tr><td><spring:message code="page.portSum"/>:</td><td>{{view.tbDetails.portSum||0}}</td></tr>
                <tr ng-repeat="sta in view.tbDetails.portStatusCount">
                    <td>{{Utils.getSelVal(i18n("db.tbGoIPPort.status.comData"),sta.status)}}:<div class="sta-round goip-port-color-sta-{{sta.status}}"></div></td>
                    <td>{{sta.count||0}}</td>
                </tr>
            </table>
        </div>

    </c:param>

    <c:param name="detailModalSingleEx">
        <div class="padding-10">
            <table>
                <tr class="simp-row" ng-repeat="row in view.sgDetails.portList">
                    <td ng-repeat="port in row" >
                        <div class="goip-col-num no-padding">{{port.idxportNum}}</div>
                        <div class="f-p-tips margin-left-10 img-fmt goip-port-sta-{{port.status||0}}">
                            <i class="f-tips" style="top:26px;">
                                <spring:message code="page.port"/> : {{port.idxportNum}}<br>
                                <spring:message code="page.uuwifiState"/> : {{Utils.getSelVal(i18n("db.tbViFiDevice.devState.comData"),port.vStatus)}}<br>
                                <spring:message code="page.uuwifiCOS"/> : {{Utils.getSelVal(i18n("db.tbViFiDevice.debugIdt.comData"),port.vCos)}}<br>
                            </i>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="margin-top-40">
                <div ng-repeat="(sta,count) in view.sgDetails.statusCount" >
                    <div class="img-fmt goip-port-sta-{{sta}}"></div> {{Utils.getSelVal(i18n("db.tbGoIPPort.status.comData"),sta)}}: {{count.count}}
                </div>
            </div>
        </div>
    </c:param>


    <c:param name="detailModalMultiEx" >
        <div class="sta-bar-table">
            <table class="table table-bordered table-striped">
                <tr ng-repeat="dev in view.tbDetails.devices">
                    <td><spring:message code="device"/>{{dev.id}}:</td>
                    <td width="1025">
                        <div class="f-p-tips">
                            <div class="sta-bar goip-port-color-sta-{{sta[0]}}"
                                 ng-style="{width:sta[1]*16}"
                                 ng-repeat="sta in dev.status">{{sta[1]}}</div>
                            <div class="f-tips">
                                <div><spring:message code="device"/>{{dev.id}}:</div>
                                <div ng-repeat="sta in dev.status">
                                    <div class="sta-round goip-port-color-sta-{{sta[0]}}"></div>:
                                    {{sta[1]}}
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr style="border-top: 3px solid #00A2E9;">
                    <td><spring:message code="page.deviceSum"/>: </td><td>{{view.tbDetails.devCount}}</td>
                </tr>
                <tr><td><spring:message code="page.portSum"/>:</td><td>{{view.tbDetails.portStatusCount["all"]||0}}</td></tr>
                <tr ng-repeat="sta in view.tbDetails.portStatusCount">
                    <td>{{Utils.getSelVal(i18n("db.tbGoIPPort.status.comData"),sta.status)}}:<div class="sta-round goip-port-color-sta-{{sta.status}}"></div></td>
                    <td>{{sta.count||0}}</td>
                </tr>
            </table>
        </div>

    </c:param>

    <c:param name="footScopeEx">

        <%-- simPPort 信息 --%>
        <div class="modal fade modal-primary" id="goIPPortDtlModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title text-info">
                            <i class="fa fa-list-alt"></i>&nbsp;{{form.goIPPortInfo.goIPDevName}}-{{form.goIPPortInfo.idxportNum}}-<spring:message code="details"/>
                        </h4>
                    </div>
                    <div class="modal-body bg-white no-padding">
                        <table class="table table-striped table-bordered">
                            <tbody>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.keyID"/></td>
                                <td>{{form.goIPPortInfo.keyID}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.idxGoIPDevID"/></td>
                                <td>{{form.goIPPortInfo.idxGoIPDevID}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.idxportNum"/></td>
                                <td>{{form.goIPPortInfo.idxportNum}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.status"/></td>
                                <td class="f-p-tips">
                                    <i class="img-fmt goip-port-sta-{{form.goIPPortInfo.status}}" style="position:static;"></i>
                                    <i class="f-tips">{{Utils.getSelVal(i18n("db.tbGoIPPort.status.comData"),form.goIPPortInfo.status+"")}}</i>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.idxViFiID"/></td>
                                <td>{{form.goIPPortInfo.idxViFiID}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.uuIccid"/></td>
                                <td>{{form.goIPPortInfo.uuIccid}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.uuImsi"/></td>
                                <td>{{form.goIPPortInfo.uuImsi}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.userAct"/></td>
                                <td>{{form.goIPPortInfo.userAct}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.usage"/></td>
                                <td>{{form.goIPPortInfo.usage}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.duration"/></td>
                                <td>{{form.goIPPortInfo.duration}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.tbGoIPPort.remarks"/></td>
                                <td>{{form.goIPPortInfo.remarks}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.common.mdfTm"/></td>
                                <td>{{form.goIPPortInfo.mdfTm}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.common.mdfBy"/></td>
                                <td>{{form.goIPPortInfo.mdfBy}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.common.crtTm"/></td>
                                <td>{{form.goIPPortInfo.crtTm}}</td>
                            </tr>
                            <tr>
                                <td class="text-right"><spring:message code="db.common.crtBy"/></td>
                                <td>{{form.goIPPortInfo.crtBy}}</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" aria-label="Close"><spring:message code="close"/></button>
                    </div>
                </div>
            </div>
        </div>

    </c:param>


</c:import>
