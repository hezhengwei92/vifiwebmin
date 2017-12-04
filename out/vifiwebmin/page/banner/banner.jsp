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
                                <li class="flag-tabs-btn active" id="bannerBtn1">
                                    <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('bannerTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.banner_banner"/></a>
                                </li>
                                <!-- tab2-工具按钮组 -->
                                <li class="head-tools-r navbar-right flag-tools" id="bannerTool1"></li>
                            </ul>
                            <!-- tab页面组 -->
                            <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                                <div id="bannerTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


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

    /***************************************   活动管理          ******************/

    var tableItem_banner = {
        tableKey: "keyId", i18nPrefix: "db.tbBanner.", trs: [
            {name: "keyId", vali:{stringLength:64,digits:true}, width: 60},
            {name: "title", width:80},
            {name: "description", vali: {maxlength: 32},width:150},
            {name: "imgUrl",vali:{url:true},width:220},
            {name: "linkUrl",vali:{url:true},width:220},
            {name: "status",comType: "select", width:80},
            {name: "type",comType: "select", width:70},
            {name: "crtTm",  type: "D", hideEdit: "A",width:140}
        ]};

    var bannerUrl = "/banner/banner/";
    InitTableMoudle("bannerTab1", "bannerTool1", bannerUrl, tableItem_banner, permi, "1");


</script>
</body>
