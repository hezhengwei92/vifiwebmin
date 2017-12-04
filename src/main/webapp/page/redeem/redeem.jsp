<body>
<div class="bs-example">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget no-margin-bottom">
                <div class="widget-body no-padding">
                    <div id="searchable_wrapper">
                        <div class="tabbable">
                            <ul class="nav nav-tabs">
                                <!-- tab标签组 -->
                                <li class="flag-tabs-btn active" id="redeemBtn1">
                                    <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('redeemTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.redeem_redeem"/></a>
                                </li>
                                <!-- tab2-工具按钮组 -->
                                <li class="head-tools-r navbar-right flag-tools" id="redeemTool1"></li>
                            </ul>
                            <!-- tab页面组 -->
                            <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                                <div id="redeemTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--
<script>
    g_var.view = ${view};
    try {
        var permissionInfo = JSON.parse('${view}' || '{"permissions":[]}');
    } catch (e) {
        throw new Error("js视图数据,解析错误,请检测!~!");
    }
    var permi = permissionInfo.permissions;
    if (!permi || permi.length < 4) {
        selectPermissionsInfo.permissions = ['1', '1', '1', '1'];
        permi = ['1', '1', '1', '1'];
    }

    /***************************************   APP管理          ******************/

    var tableItem_redeem = {
        tableKey: "exchangeId", i18nPrefix: "db.tbRedeem.", trs:
                [
            {name: "exchangeId",type:"I", vali:{digits:true }, width: 60},
            {name: "integral",type:"I",vali:{digits:true }, width:80},
            {name: "exContent", type:"I",vali:{digits:true },width:80},
            {name: "introduction", width:180},
            {name: "method", width:180},
            {name: "contentType",comType: "select", width:80},
            {name: "effectiveTm",type: "D", vali:{date:true},width:150},//输入有效时间 2009-06-23，1998/01/22 date:true
            {name: "activityTm", type: "D",vali:{date:true},width:150},
            {name: "image", width:180},
            {name: "bigImage", width:180},
            {name: "exchangeTimes",type:"I",vali:{digits:true }, width:80},
            {name: "crtTm", type: "D", hideEdit: "A",width:140}
        ]};

    var redeemUrl = "/redeem/redeem/";
    InitTableMoudle("redeemTab1", "redeemTool1", redeemUrl, tableItem_redeem, permi, "1");


</script>--%>
</body>
