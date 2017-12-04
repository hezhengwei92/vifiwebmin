<!-- tab1标签页 -->
<div class="row" style="margin-top: 20px;">
    <%--col-lg-4 col-md-2 col-sm-12 col-xs-12--%>
    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
         <div class="widget radius-bordered">
             <div class="widget-header">
                 <span class="widget-caption"><spring:message code="status.cdrNew.info1"/></span>
             </div>
             <div class="widget-body">
                 <table style="width: 100%">
                     <tr>
                         <td><B style="font-size: 14PX"><spring:message code="status.cdrNew.info21"/>:</B></td>
                         <td style="width: 33%"></td>
                         <td style="width: 33%"></td>
                     </tr>
                     <tr style="height: 6px"></tr>
                     <tr style="width: 100%;">
                         <td>
                             <p><spring:message code="status.smsNew.info.smsGetWay"/> :&nbsp; <a
                                     href="#/user/user"><span id="smsGatewayCount"></span></a>&nbsp;
                                 <spring:message code="status.cdrNew.info3"/></p>
                             <p><spring:message code="status.smsNew.info.getWayStatus"/> :&nbsp; <a
                                     href="#/uuwifi/viFiDevice"><span id="smsGatewayNormarlCount"></span></a>&nbsp;
                                 <spring:message code="status.cdrNew.info3"/></p>
                             <p><spring:message code="status.smsNew.info.surplus"/> :&nbsp; <a
                                     href="#/user/user"><span id="emaySMSCount"></span></a>&nbsp; <spring:message
                                     code="status.smsNew.unit2"/></p>
                             <!--
                          <p><spring:message code="status.cdrNew.info15"/> <span id="outLineInfo15">:&nbsp;0</span><spring:message code="status.cdrNew.info3"/> </p>
                           -->
                         </td>
                         <td style="width: 33%">
                             <p><spring:message code="status.smsNew.info.totalDaily"/> :&nbsp;<a
                                     href="javaScript:void(0)" onclick="onClickRedirectURL()"><span
                                     id="smsCountDaily"></span></a>&nbsp; <spring:message
                                     code="status.smsNew.unit2"/></p>
                             <p><spring:message code="status.smsNew.info.totalMonthly"/> :&nbsp;<a
                                     href="javaScript:void(0)" onclick="onClickRedirectURL()"><span
                                     id="smsCountMonthly"></span></a>&nbsp; <spring:message
                                     code="status.smsNew.unit2"/></p>
                             <p><spring:message code="status.smsNew.info.sendTotal"/> :&nbsp;<span
                                     id="smsTotal"></span> &nbsp; <spring:message code="status.smsNew.unit2"/>
                             </p>
                             <!--
                          <p><spring:message code="status.cdrNew.info8"/> :&nbsp;<span id="todayInfo8"></span>   </p>
                           -->
                         </td>
                         <td style="width: 33%">
                             <p><spring:message code="status.smsNew.info.successPercent"/> :&nbsp;<a
                                     href="javaScript:void(0)" onclick="onClickRedirectURL()"><span
                                     id="sendSuccessPercent"></span></a>&nbsp; <spring:message
                                     code="status.cdrNew.info3"/></p>
                             <p><spring:message code="status.smsNew.info.failPercent"/> :&nbsp;<a
                                     href="javaScript:void(0)" onclick="onClickRedirectURL()"><span
                                     id="sendFailPercent"></span></a>&nbsp; <spring:message
                                     code="status.cdrNew.info5"/></p>
                             <p><spring:message code="status.smsNew.info.timeCostAverage"/> :&nbsp;<span
                                     id="smsTimeusedAvg"></span> &nbsp; <spring:message
                                     code="status.smsNew.unit3"/></p>
                             <!--
                          <p><spring:message code="status.cdrNew.info8"/> :&nbsp;<span id="monthInfo8"></span>   </p>
                           -->
                         </td>
                     </tr>
                 </table>
             </div>
             <div class="widget radius-bordered" style="padding-top: 20px;">
                 <div class="widget-header">
                     <span class="widget-caption"><spring:message code="status.smsNew.info.latestRecord"/></span>
                 </div>
                 <div class="widget-body" style="padding-top: 0px;">
                     <table class="table table-condensed table-striped" style="width: 100%;border-top: hidden;">
                         <%--<thead>--%>
                         <%--<tr>--%>
                             <%--<th><p><spring:message code="db.tbSMS.keySMSId"/></p></th>--%>
                             <%--<th><p><spring:message code="db.tbSMS.idxPhoneNumber"/></p></th>--%>
                             <%--<th><p><spring:message code="db.tbSMS.message"/></p></th>--%>
                             <%--<th><p><spring:message code="db.tbSMS.state"/></p></th>--%>
                             <%--<th><p><spring:message code="status.smsNew.info.sendTime"/></p></th>--%>
                         <%--</tr>--%>
                         <%--</thead>--%>
                         <tbody id="myTbody_querySMSDetails">

                         </tbody>
                     </table>
                     <div class="databox-row row-6 padding-10" style="height: 33px;">
                         <button class="btn btn-palegreen btn-sm pull-right"><spring:message code="status.smsNew.info.showMore" /></button>
                     </div>
                 </div>
             </div>
         </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="widget radius-bordered">
            <div class="widget-header">
                <span class="widget-caption"> <spring:message code="status.smsNew.info.typeName"/></span>
            </div>
            <div class="widget-body no-padding" style="height: 384px;">
                <div class="databox databox-xxlg databox-vertical databox-shadowed bg-white radius-bordered padding-5" style="height: 384px;">
                    <div class="databox-bottom">
                        <div class="databox-row row-10">
                            <div class="databox-cell cell-7 text-center  padding-5">
                                <echart data-options="smsCountByType" class="chart"></echart>
                            </div>
                            <div id="smsCountByTypeDetails"
                                 class="databox-cell cell-5 text-center no-padding-left padding-bottom-30">
                                <div class="databox-row row-2 bordered-bottom bordered-ivory padding-10">
                                    <span class="databox-text sonic-silver pull-left no-margin"><spring:message
                                            code="status.smsNew.info.sendType"/></span>
                                    <span class="databox-text sonic-silver pull-right no-margin uppercase"><spring:message
                                            code="status.smsNew.info.number"/></span><!-- status.smsNew.info.percent 百分比 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 col-sm-12 col-xs-12">
        <div class="widget radius-bordered">
            <div class="widget-header">
                <span class="widget-caption"><spring:message code="status.smsNew.info.name"/></span>
            </div>
            <div class="widget-body no-padding">
                <div class="task-container">
                    <div class="row">
                        <div class="col-lg-12 chart-container">
                            <%--<div id="dashboard-chart-visits-smsCount_month" class="chart chart-lg no-margin"></div>--%>
                            <echart data-options="smsCountMonthInfo" class="chart chart-lg no-margin"></echart>
                        </div>
                    </div>
                </div>
            </div><!--Widget Body-->
        </div>

    </div>
</div>
</div>

<!-- 列表页签 tab -->
<div id="list" class="tab-pane" style="border-radius:0;">
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

</div>

<!-- 状态页签 tab -->
<div id="list2_tab" class="tab-pane" style="border-radius:0;">
    <!-- 搜索条件区域 -->
    <div class="collapse" id="collapse-adv-search8">
        <div class="panel-body">

            <div class="row ng-scope">
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"><spring:message code="db.tbCountDaily3.idxUserId"/>:</span>
                    <div class="adv-value">
                        <div class="ng-scope">
                            <input type="text" id="idxUserId2" style="width: 700px"
                                   class="input-sm ng-pristine ng-valid ng-scope ng-touched"
                                   placeholder="<spring:message code="db.tbCountDaily3.idxUserId.help"/>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ng-scope">
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"><spring:message code="db.tbCDR.beginTime"/>:</span>
                    <div class="adv-value">
                        <div class="ng-scope">
                            <input type="text" id="beginTime" name="beginTime"
                                   placeholder="<spring:message code="db.tbCDR.beginTime.help"/>"
                                   class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm "
                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"><spring:message code="db.tbCDR.endTime"/>:</span>
                    <div class="adv-value">
                        <div class="ng-scope">
                            <input type="text" id="endTime" name="endTime"
                                   placeholder="<spring:message code="db.tbCDR.endTime.help"/>"
                                   class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm "
                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 margin-bottom-3 ng-scope">
                    <span class="adv-name ng-binding"></span>
                    <div class="adv-value">
                        <div class="ng-scope">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"></span>
                    <div class="adv-value">
                        <div class="ng-scope text-right">
                            <button class="btn btn-success" onclick="dosearch8('1')"><i
                                    class="fa fa-search"></i><spring:message code="search"/></button>
                            <button class="btn btn-darkorange" onclick="myclearSearch8()"><i
                                    class="fa fa-undo"></i><spring:message code="clear"/></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 搜索和清除按钮 -->
            <!-- <div class="row">
                          <div class="col-md-12 adv-opt text-right">
                            <button class="btn btn-success" onclick="dosearch('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                            <button class="btn btn-darkorange" onclick="myclearSearch()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                          </div>
                        </div>  -->
        </div>
    </div>

    <!-- 列表表头 -->
    <div id="my-data-table8">
        <div class="data-thead data-thead8"
             style="background-color: #F7F7F7;border-top: 1px solid #ddd;border-bottom: 1px solid #00A2E9;">
            <table class="table table-bordered table-striped dataTable">
                <thead class="flip-content">
                <tr role="row" id="html_thead8">

                    <!-- 循环体 -->

                </tr>
                </thead>
            </table>
        </div>

        <!-- 列表内容 -->
        <div class="data-tbody data-tbody8">
            <div>
                <table class="table table-bordered table-hover table-striped">
                    <tbody class="page-data-tbody" id="html_tdata8">

                    <!-- 循环体 -->

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 分页 -->
    <div class="row foot-tools" id="foot_page_tools8">
        <div class="pull-right table-page-tools position-relative">
            <div class="pagetools" id="toolsPage8">
                <!-- 分页内容 -->
            </div>


            <select id="pagesizeSelect8" onchange="changePageSize8()" class="form-control">
                <option label="25" value="25">25</option>
                <option label="50" value="50">50</option>
                <option label="100" value="100">100</option>
            </select>
        </div>
    </div>

</div>


<div id="list3_tab" class="tab-pane" style="border-radius:0;">
    <!-- 搜索条件区域 -->
    <div class="collapse" id="collapse-adv-search9">
        <div class="panel-body">

            <div class="row ng-scope">
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"><spring:message code="db.UUWiFiCountDaily.idxViFiID"/>:</span>
                    <div class="adv-value">
                        <div class="ng-scope">
                            <input type="text" id="idxViFiID_uuwifi" style="width: 700px"
                                   class="input-sm ng-pristine ng-valid ng-scope ng-touched"
                                   placeholder="<spring:message code="db.UUWiFiCountDaily.idxViFiID.help"/>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ng-scope">
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"><spring:message code="db.tbCDR.beginTime"/>:</span>
                    <div class="adv-value">
                        <div class="ng-scope">
                            <input type="text" id="beginTime_uuwifi" name="beginTime"
                                   placeholder="<spring:message code="db.tbCDR.beginTime.help"/>"
                                   class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm "
                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"><spring:message code="db.tbCDR.endTime"/>:</span>
                    <div class="adv-value">
                        <div class="ng-scope">
                            <input type="text" id="endTime_uuwifi" name="endTime"
                                   placeholder="<spring:message code="db.tbCDR.endTime.help"/>"
                                   class="form-control input-sm layer-date ng-pristine ng-valid ng-scope ng-touched laydate-icon input-sm "
                                   onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 margin-bottom-3 ng-scope">
                    <span class="adv-name ng-binding"></span>
                    <div class="adv-value">
                        <div class="ng-scope">
                        </div>
                    </div>
                </div>
                <div class="col-md-3 margin-bottom-5 ng-scope">
                    <span class="adv-name ng-binding"></span>
                    <div class="adv-value">
                        <div class="ng-scope text-right">
                            <button class="btn btn-success" onclick="dosearch9('1')"><i
                                    class="fa fa-search"></i><spring:message code="search"/></button>
                            <button class="btn btn-darkorange" onclick="myclearSearch9()"><i
                                    class="fa fa-undo"></i><spring:message code="clear"/></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 搜索和清除按钮 -->
            <!-- <div class="row">
                          <div class="col-md-12 adv-opt text-right">
                            <button class="btn btn-success" onclick="dosearch('1')"><i class="fa fa-search"></i><spring:message code="search"/></button>
                            <button class="btn btn-darkorange" onclick="myclearSearch()"><i class="fa fa-undo"></i><spring:message code="clear"/></button>
                          </div>
                        </div>  -->
        </div>
    </div>

    <!-- 列表表头 -->
    <div id="my-data-table9">
        <div class="data-thead data-thead8"
             style="background-color: #F7F7F7;border-top: 1px solid #ddd;border-bottom: 1px solid #00A2E9;">
            <table class="table table-bordered table-striped dataTable">
                <thead class="flip-content">
                <tr role="row" id="html_thead9">

                    <!-- 循环体 -->

                </tr>
                </thead>
            </table>
        </div>

        <!-- 列表内容 -->
        <div class="data-tbody data-tbody8">
            <div>
                <table class="table table-bordered table-hover table-striped">
                    <tbody class="page-data-tbody" id="html_tdata9">

                    <!-- 循环体 -->

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 分页 -->
    <div class="row foot-tools" id="foot_page_tools9">
        <div class="pull-right table-page-tools position-relative">
            <div class="pagetools" id="toolsPage9">
                <!-- 分页内容 -->
            </div>


            <select id="pagesizeSelect9" onchange="changePageSize9()" class="form-control">
                <option label="25" value="25">25</option>
                <option label="50" value="50">50</option>
                <option label="100" value="100">100</option>
            </select>
        </div>
    </div>


