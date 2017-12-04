<!-- 搜索条件区域 -->
<div class="collapse" id="collapse-adv-search">
    <div class="panel-body">

        <div class="row ng-scope">
            <div class="col-md-3 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxUserId"/>:</span>
                <div class="adv-value">
                    <div class="ng-scope">
                        <input type="text" id="idxUserId" class="input-sm ng-pristine ng-valid ng-scope ng-touched"
                               placeholder="<spring:message code="db.tbCDR.idxUserId.help"/>">
                    </div>
                </div>
            </div>
            <div class="col-md-3 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxSupplierId"/>:</span>
                <div class="adv-value">
                    <div class="ng-scope">
                        <input type="text" id="idxSupplierId"
                               class="input-sm ng-pristine ng-valid ng-scope ng-touched"
                               placeholder="<spring:message code="db.tbCDR.idxSupplierId.help"/>">
                    </div>
                </div>
            </div>
            <div class="col-md-3 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxSimCardID"/>:</span>
                <div class="adv-value">
                    <div class="ng-scope">
                        <input type="text" id="idxSimCardID"
                               class="input-sm ng-pristine ng-valid ng-scope ng-touched"
                               placeholder="<spring:message code="db.tbCDR.idxSimCardID.help"/>">
                    </div>
                </div>
            </div>
            <div class="col-md-3 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"><spring:message code="db.tbCDR.idxSimPID"/>:</span>
                <div class="adv-value">
                    <div class="ng-scope">
                        <input type="text" id="idxSimPID" class="input-sm ng-pristine ng-valid ng-scope ng-touched"
                               placeholder="<spring:message code="db.tbCDR.idxSimPID.help"/>">
                    </div>
                </div>
            </div>
        </div>
        <div class="row ng-scope">
            <div class="col-md-3 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"><spring:message code="db.tbCDR.beginTime"/>:</span>
                <div class="adv-value">
                    <div class="ng-scope">
                        <input type="text" id="beginTime_cdr" name="beginTime"
                               placeholder="<spring:message code="db.tbCDR.beginTime.help"/>"
                               class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm "
                               onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss',start: laydate.now(0, 'YYYY-MM-DD hh:mm:ss')})">
                    </div>
                </div>
            </div>
            <div class="col-md-3 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"><spring:message code="db.tbCDR.endTime"/>:</span>
                <div class="adv-value">
                    <div class="ng-scope">
                        <input type="text" id="endTime_cdr" name="endTime"
                               placeholder="<spring:message code="db.tbCDR.endTime.help"/>"
                               class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm "
                               onclick="laydate({istime: true, format: 'YYYY-MM-DD  hh:mm:ss',start: laydate.now(0, 'YYYY-MM-DD hh:mm:ss')})">
                    </div>
                </div>
            </div>
            <div class="col-md-6 margin-bottom-5 ng-scope">
                <span class="adv-name ng-binding"></span>
                <div class="adv-value">
                    <div class="ng-scope text-right">
                        <button class="btn btn-success" onclick="dosearch('1')"><i
                                class="fa fa-search"></i><spring:message code="search"/></button>
                        <button class="btn btn-darkorange" onclick="myclearSearch()"><i
                                class="fa fa-undo"></i><spring:message code="clear"/></button>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<!-- 列表表头 -->
<div id="my-data-table">
    <div class="data-thead">
        <table class="table table-bordered table-striped dataTable">
            <thead class="flip-content">
            <tr role="row" id="html_thead">

                <!-- 循环体 -->

            </tr>
            </thead>
        </table>
    </div>

    <!-- 列表内容 -->
    <div class="data-tbody">
        <div>
            <table class="table table-bordered table-hover table-striped">
                <tbody class="page-data-tbody" id="html_tdata">

                <!-- 循环体 -->

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 分页 -->
<div class="row foot-tools" id="foot_page_tools">
    <div class="pull-right table-page-tools position-relative">
        <div class="pagetools" id="toolsPage">
            <!-- 分页内容 -->
        </div>


        <select id="pagesizeSelect" onchange="changePageSize()" class="form-control">
            <option label="25" value="25">25</option>
            <option label="50" value="50">50</option>
            <option label="100" value="100">100</option>
        </select>
    </div>
</div>