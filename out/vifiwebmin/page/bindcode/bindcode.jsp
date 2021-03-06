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
                                    <li class="flag-tabs-btn active" id="bindcodeBtn1">
                                        <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('bindcodeTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.new_bindcode"/></a>
                                    </li>
                                    <!-- tab2-工具按钮组 -->
                                    <li class="head-tools-r navbar-right flag-tools" id="bindcodeTool1"></li>
                                </ul>
                                <!-- tab页面组 -->
                                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                                    <div id="bindcodeTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>

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

        /***************************************   随机绑定码管理          ******************/

        var tableItem_bindcode = {
            tableKey: "keyID", i18nPrefix: "db.tbBindcode.", trs: [
                {name: "keyID", type: "I", pk: true, hideEdit: "A", vali: {maxlength: 11},show:false,advQry:["LIKE"]},
                {name:"num",vali:{stringLength:20, required:false}, width: 130, show:false},
                {name:"month",vali:{stringLength:20, required:false}, width: 130},
                {name: "dataSize", vali:{stringLength:20}, width: 150, advQry:["LIKE"]},
                {name: "code", vali:{stringLength:8}, hideEdit: "A", width: 100, advQry:["LIKE"]},
                {name: "status", vali:{stringLength:1}, width: 100, advQry:["LIKE"], comType:"select"},
                {name: "respType", vali:{stringLength:1}, width: 180, advQry:["LIKE"], comType:"select"},
                {name: "updateTime", hideEdit: "A", width: 130},
                {name: "crtTm", hideEdit: "A", width: 130}
            ]};
        var bindcodeUrl = "/bindcode/bindcode/";
        InitTableMoudle("bindcodeTab1", "bindcodeTool1", bindcodeUrl, tableItem_bindcode, permi, "1");


    </script>
    </body>
