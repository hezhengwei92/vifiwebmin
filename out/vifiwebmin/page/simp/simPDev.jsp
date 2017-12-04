<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
    <c:param name="graphViewEx">
        <div class="text-center" ng-if="::view.graphView.length>0">
            <div class="simp-dev-shelf">
                <div>
                    <div class="margin-bottom-20" ng-repeat="dev in ::view.graphView">
                        <div class="text-left padding-5"><a class="fa-lg" href="javascript:" ng-click="openSimPDevDtl(dev)">{{::dev.devName}}</a></div>
                        <div class="simp-dev">
                            <table>
                                <tr class="simp-row" ng-repeat="row in dev.portInfoArray">
                                    <td class="f-p-tips" ng-repeat="port in row" ng-click="openSimPPortDtl(port,dev)">
                                        <div class="simp-col-num">{{::port.portNum}}</div>
                                        <div class="simp-col-sta{{::port.state||0}}"></div>
                                        <i class="f-tips" style="top:26px;left:12px;">{{::Utils.getSelVal(i18n("db.tbSimPPort.status.comData"),(port.state||0)+"")}}</i>
                                        <div class="simp-col-split">*</div>
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
                    <td><spring:message code="device"/>{{dev.keySimPDevID}}:</td>
                    <td width="1025">
                        <div class="f-p-tips">
                            <div class="sta-bar simp-port-color-sta-{{sta[0]}}"
                                 ng-style="{width:sta[1]*8}"
                                 ng-repeat="sta in dev.status">{{sta[1]}}</div>
                            <div class="f-tips">
                                <div><spring:message code="device"/>{{dev.keySimPDevID}}:</div>
                                <div ng-repeat="sta in dev.status">
                                    <div class="sta-round simp-port-color-sta-{{sta[0]}}"></div>:
                                    {{sta[1]}}
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr style="border-top: 3px solid #00A2E9;">
                    <td><spring:message code="page.deviceSum"/>:</td><td>{{view.tbDetails.devCount}}</td>
                </tr>
                <tr><td><spring:message code="page.portSum"/>:</td><td>{{view.tbDetails.portSum||0}}</td></tr>
                <tr ng-repeat="sta in view.tbDetails.portStatusCount">
                    <td>{{Utils.getSelVal(i18n("db.tbSimPPort.status.comData"),sta.status)}}:<div class="sta-round simp-port-color-sta-{{sta.status}}"></div></td>
                    <td>{{sta.count||0}}</td>
                </tr>
            </table>
        </div>
    </c:param>

    <c:param name="detailModalSingleEx">
        <div class="padding-10">
            <table class="simp-sta-table">
                <tr ng-repeat="values in view.sgDetails.portList">
                    <td ng-repeat="val in values" class="f-p-tips">
                        <div class="text-center">{{val.idxSlotNum}}</div>
                        <div class="img-fmt simp-port-sta-{{val.status}}" ng-class="{'margin-right-10':val.idxSlotNum%8==0}">
                        </div>
                        <div class="f-tips">
                            <spring:message code="page.cardSlot"/>:{{val.idxSlotNum}}<br>
                            <spring:message code="page.simCardNumber"/>:{{val.cNumber}}<br>
                            <spring:message code="page.simCardState"/>:{{Utils.getSelVal(i18n("db.tbSimCard.status.comData"),val.cStatus)}}<br>
                            <spring:message code="page.simCardBalance"/>:{{val.cBalance}}<br>
                            ------------------<br>
                            <spring:message code="page.uuwifiState"/>:{{Utils.getSelVal(i18n("db.tbViFiDevice.devState.comData"),val.vStatus)}}<br>
                            <spring:message code="page.uuwifiCOS"/>:{{Utils.getSelVal(i18n("db.tbViFiDevice.debugIdt.comData"),val.vCos) }}<br>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="margin-top-40">
                <div ng-repeat="(sta,count) in view.sgDetails.statusCount" >
                    <div class="img-fmt simp-port-sta-{{sta}}"></div> {{Utils.getSelVal(i18n("db.tbSimPPort.status.comData"),sta)}}: {{count.count}}
                </div>
            </div>

        </div>
    </c:param>

    <c:param name="detailModalMultiEx" >
        <div class="sta-bar-table">
            <table class="table table-bordered table-striped">
                <tr ng-repeat="dev in view.tbDetails.devices">
                    <td><spring:message code="device"/>{{dev.keySimPDevID}}:</td>
                    <td width="1025">
                        <div class="f-p-tips">
                            <div class="sta-bar simp-port-color-sta-{{sta[0]}}"
                                 ng-style="{width:sta[1]*8}" ng-repeat="sta in dev.status">{{sta[1]}}</div>
                            <div class="f-tips">
                                <div><spring:message code="device"/>{{dev.keySimPDevID}}:</div>
                                <div ng-repeat="sta in dev.status">
                                    <div class="sta-round simp-port-color-sta-{{sta[0]}}" ></div>:
                                    {{sta[1]}}
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr style="border-top: 3px solid #00A2E9;">
                    <td><spring:message code="page.deviceSum"/>:</td><td>{{view.tbDetails.devCount}}</td>
                </tr>
                <tr><td><spring:message code="page.portSum"/>:</td><td>{{view.tbDetails.portSum||0}}</td></tr>
                <tr ng-repeat="sta in view.tbDetails.portStatusCount">
                    <td>{{Utils.getSelVal(i18n("db.tbSimPPort.status.comData"),sta.status)}}:<div class="sta-round simp-port-color-sta-{{sta.status}}"></div></td>
                    <td>{{sta.count||0}}</td>
                </tr>
            </table>
        </div>
    </c:param>


    <c:param name="footScopeEx">

        <%-- simPPort 信息 --%>
        <div class="modal fade modal-primary" id="simpPortDtlModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title text-info">
                            <i class="fa fa-list-alt"></i>&nbsp;{{form.simPPortInfo.simpDevName}}-{{form.simPPortInfo.idxSlotNum}}-<spring:message code="details"/>
                        </h4>
                    </div>
                    <div class="modal-body bg-white no-padding">
                        <table class="table table-striped table-bordered">
                            <tbody>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.keyID"/></td>
                                    <td>{{form.simPPortInfo.keyID}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.idxSimPDevID"/></td>
                                    <td>{{form.simPPortInfo.idxSimPDevID}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.idxSlotNum"/></td>
                                    <td>{{form.simPPortInfo.idxSlotNum}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.status"/></td>
                                    <td class="f-p-tips">
                                        <i class="img-fmt simp-port-sta-{{form.simPPortInfo.status}}" style="position:static;"></i>
                                        <i class="f-tips">{{Utils.getSelVal(i18n("db.tbSimPPort.status.comData"),form.simPPortInfo.status+"")}}</i>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.idxIccid"/></td>
                                    <td>{{form.simPPortInfo.idxIccid}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.idxViFiId"/></td>
                                    <td>{{form.simPPortInfo.idxViFiId}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.usage"/></td>
                                    <td>{{form.simPPortInfo.usage}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.duration"/></td>
                                    <td>{{form.simPPortInfo.duration}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.tbSimPPort.remarks"/></td>
                                    <td>{{form.simPPortInfo.remarks}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.common.mdfTm"/></td>
                                    <td>{{form.simPPortInfo.mdfTm}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.common.mdfBy"/></td>
                                    <td>{{form.simPPortInfo.mdfBy}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.common.crtTm"/></td>
                                    <td>{{form.simPPortInfo.crtTm}}</td>
                                </tr>
                                <tr>
                                    <td class="text-right"><spring:message code="db.common.crtBy"/></td>
                                    <td>{{form.simPPortInfo.crtBy}}</td>
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
