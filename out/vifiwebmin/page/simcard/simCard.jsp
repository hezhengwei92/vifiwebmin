<c:import url="/page/commons/frameCommonTpl.jsp" charEncoding="UTF-8">
    <c:param name="graphViewEx">

        <div class="tab-content coverage">
            <div role="tabpanel" ng-repeat="(continent,areaList) in form.areaMap">
                <h3 class="title">{{::Utils.getSelVal(i18n("continent.comData"),continent)}}</h3>
                <div class="row" ng-repeat="areas in areaList">
                    <div class="col-sm-4" ng-repeat="area in areas" >
                        <div class="databox radius-bordered databox-shadowed databox-graded">
                            <div class="databox-left bg-palegreen">
                                <div class="databox-piechart">
                                    <div class="icon country-icon-{{::area.areaName}}"></div>
                                </div>
                            </div>
                            <div class="databox-right">
                                <span class="databox-number green">{{::area.simcardCount}}</span>
                                <div class="databox-text darkgray">{{::i18n("country.area."+area.areaName) }}</div>
                                <div class="databox-stat bg-palegreen radius-bordered">
                                    <div class="stat-text">{{::Utils.getSelVal(i18n("db.tbSimCard.status.comData"),"0")}}:{{::area.statusCountMap["0"]}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </c:param>


</c:import>
