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
                                    <li class="flag-tabs-btn active" id="taskBtn1">
                                        <a data-toggle="tab" href="javaScript:void(0)" onclick="switchTabAndTools('taskTab1','')"><i class="fa fa-th font14"></i><spring:message code="menu.new_task"/></a>
                                    </li>
                                    <!-- tab2-工具按钮组 -->
                                    <li class="head-tools-r navbar-right flag-tools" id="taskTool1"></li>
                                </ul>
                                <!-- tab页面组 -->
                                <div class="tab-content no-padding tabs-flat " style="border-radius:0;">
                                    <div id="taskTab1" class="flag-tabs tab-pane  in active summary-tab  no-padding"></div>

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

        var tableItem_task = {
            tableKey: "taskID", i18nPrefix: "db.tbTask.", trs: [
                {name: "taskID", disabled: "E", vali:{stringLength:64}, width: 120, advQry:["LIKE"]},
                {name: "taskType", vali:{stringLength:64}, width: 150, advQry:["LIKE"], comType:"select"},
                {name: "taskName", vali:{stringLength:64}, width: 100, advQry:["LIKE"]},
                {name: "image", vali:{stringLength:64}, width: 100},
                {name: "taskDesc", vali:{stringLength:512}, width: 180},
                {name: "taskLink", vali:{stringLength:512}, width: 180},
                {name: "taskData", vali:{stringLength:64}, width: 120},
                {name: "identifier", vali:{stringLength:64}, width: 120},
                {name: "drawType", vali:{stringLength:64}, width: 120},
                {name: "category", vali:{stringLength:64}, width: 150, advQry:["LIKE"], comType:"select"},
                {name: "mdfTm", hideEdit: "A", width: 130},
                {name: "mdfBy", hideEdit: "A", width: 130, show:false},
                {name: "crtTm", hideEdit: "A", width: 130, show:false},
                {name: "crtBy", hideEdit: "A", width: 130, show:false}
            ]};
        var taskUrl = "/task/task/";
        InitTableMoudle("taskTab1", "taskTool1", taskUrl, tableItem_task, permi, "1");


    </script>
    </body>
