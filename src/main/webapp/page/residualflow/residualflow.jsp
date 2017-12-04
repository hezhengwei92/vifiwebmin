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
                                    <li class="flag-tabs-btn active" id="residualflowBtn1">
                                        <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('residualflowTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.new_residualflow"/></a>
                                    </li>
                                    <!-- tab2-工具按钮组 -->
                                    <li class="head-tools-r navbar-right flag-tools" id="residualflowTool1"></li>
                                </ul>
                                <!-- tab页面组 -->
                                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                                    <div id="residualflowTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>

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

        /***************************************   任务管理          ******************/

        var tableItem_residualflow = {
            tableKey: "keyId", i18nPrefix: "db.tbResidualflow.", trs: [
                {name: "keyId", type: "I", pk: true, hideEdit: "A", vali: {maxlength: 11},show:false,advQry:["LIKE"]},
                {name: "idxOrderID", vali:{stringLength:64}, width: 120},
                {name: "idxUserID", vali:{stringLength:64}, width: 120,advQry:["LIKE"]},
                {name: "residualflow", vali:{stringLength:64}, width: 180},
                {name: "status", vali:{stringLength:64}, width: 180,comType:"select",advQry:["LIKE"]},
                {name: "priority",width: 150, advQry:["LIKE"], comType:"select"},
                {name: "pkgType", width:100, comType:"select", advQry:["LIKE"]},
                {name: "effectiveTm", width: 130},
                {name: "crtTm", hideEdit: "A", width: 130, show:false}
            ]};
        var residualflowUrl = "/residualflow/residualflow/";
        InitTableMoudle("residualflowTab1", "residualflowTool1", residualflowUrl, tableItem_residualflow, permi, "1");


    </script>
    </body>
