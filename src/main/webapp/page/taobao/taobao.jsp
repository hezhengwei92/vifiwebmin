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
                                    <li class="flag-tabs-btn active" id="taobaoBtn1">
                                        <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('taobaoTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.new_taobao"/></a>
                                    </li>
                                    <!-- tab2-工具按钮组 -->
                                    <li class="head-tools-r navbar-right flag-tools" id="taobaoTool1"></li>
                                </ul>
                                <!-- tab页面组 -->
                                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                                    <div id="taobaoTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>

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

        /***************************************   淘宝支持          ******************/

        var tableItem_taobao= {
            tableKey: "keyID", i18nPrefix: "db.tbTaobao.", trs: [
                {name: "keyID", type: "I", pk: true, hideEdit: "A", vali: {maxlength: 11},show:false,advQry:["LIKE"]},
                {name: "taobaoId",hideEdit: "A",vali:{stringLength:64,required:false}, width: 100, advQry:["LIKE"]},
                {name: "orderId",hideEdit: "A", vali:{stringLength:150}, width: 100, advQry:["LIKE"]},
                {name: "status", vali:{stringLength:16}, width: 180, advQry:["LIKE"], comType:"select"},
                {name: "giveStatus",hideEdit: "A", vali:{stringLength:16}, width: 180, advQry:["LIKE"], comType:"select"},
                {name: "crtTm", hideEdit: "A", width: 130, show:false}
            ]};
        var taobaoUrl = "/taobao/taobao/";
        InitTableMoudle("taobaoTab1", "taobaoTool1", taobaoUrl, tableItem_taobao, permi, "1");


    </script>
    </body>
