<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.4
Version: 1.4
Purchase: http://wrapbootstrap.com
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <meta charset="utf-8" />
    <title>ViFiAdmin</title>
    <meta name="description" content="Dashboard" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">
    
<style>
   /* 编辑层 */
#myeditModal div[data-input] > * {
    padding-left: 0;
    padding-right: 0;
}

#myeditModal label .required {
    color: red;
    margin: 0 5px 0 10px;
    width: 8px;
    display: inline-block;
}

#myeditModal .modal-lg .modal-body {
    padding-right: 30px;
}

/* *** 详细层..*/
#mydetailModal .modal-body {
    overflow-y: auto;
    max-height: 80vh;
}

#mydetailModal #sg-dtl > div:last-child {
    border-left: 1px solid #ccc;
}

#mydetailModal table td {
    padding: 6px; 
}

#mydetailModal .modal-body #sg-dtl > div {
    padding: 0;
    background-color: #FFF;
}
.loginTitleBackground{
	background:url(././assets/images/login_title_bg.png) no-repeat;
	background-size: contain;
}

</style>

    <style>
         <%-- angular,代码遮羞  --%>
        .ng-cloak-load{display:none}
        .ng-cloak .ng-cloak-load{display:block;position:absolute;top:0;left:0;width:100%;height:100%;background-color:#00A2E9;z-index:9999;}
        .ng-cloak-load div{position:absolute;top:47%;left:47%;}
    </style>

    <script>
        window.VERSION = "${VERSION}";// 软件版本号 V1.2.18.160202
        window.DOMAIN = "${DOMAIN}";// 域名  http://localhost:8080
        window.PATH = "${path}";// vifiwebmin
        window.LANGUAGE = "${language}";//zh_CN
        window.jsBaseUrl = window.PATH + '/assets/js/'; // js 目录
        var g_var = g_var || {};
		g_var.homeMenu = ${homeMenu};
        //设置页面属性，不执行默认拖放处理
        document.ondragend = document.ondrop = document.ondragover = function(e){e.preventDefault();};
    </script>

</head>
<!-- /Head -->
<!-- Body -->
<body class="ng-cloak" ng-app="default.module">
<!-- Loading Container -->
<!-- angular代码遮羞 -->
<div class="ng-cloak-load"><div><img src="${path}/assets/js/libs/layer/skin/default/loading-2.gif"/></div></div>
<!--  /Loading Container -->

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-inner loginTitleBackground">
        <div class="navbar-container">
            <!-- Navbar Barnd -->
            <div class="navbar-header pull-left" id="sidebar-collapse">
                <a href="javascript:void(0)" class="navbar-brand" style="line-height:36px;">
                    <i><img src="${path}/assets/images/vifi.png" style="width: 40px;height: 37px;"/></i> <spring:message code="page.companyName"/>
                </a>
            </div>
            <!-- /Navbar Barnd -->

            <!-- Account Area and Settings --->
            <div class="navbar-header pull-right" >
                <div class="navbar-account">
                    <ul class="account-area" style="right:1px;">
                        <!-- li>
                            <div class="sidebar-collapse" id="">
                                <i class="collapse-icon fa fa-bars"></i>
                            </div>

                        </li-->


                        <!-- li>
                            <a class="dropdown-toggle" data-toggle="dropdown" title="Message" href="javascript:" aria-expanded="true">
                                <i class="icon fa fa-bell"></i>
                                <span class="badge">0</span>
                            </a>
                            <ul class="pull-right dropdown-menu dropdown-tasks dropdown-arrow ">
                                <li class="dropdown-header bordered-darkorange">
                                    <i class="fa fa-bell"></i>
                                    0 <spring:message code="message"/>
                                </li>
                                <li>
                                    <a href="javascript:"></a>
                                </li>
                            </ul>
                        </li-->
                        <%--<li>--%>
                            <%--<a class="dropdown-toggle" data-toggle="dropdown" title="Config" href="javascript:" aria-expanded="true">--%>
                                <%--<i class="icon fa fa-gear"></i>--%>
                            <%--</a>--%>
                            <%--<!--Tasks Dropdown-->--%>
                            <%--<ul class="pull-right dropdown-menu dropdown-tasks dropdown-arrow ">--%>
                                <%--<li class="dropdown-header bordered-darkorange">--%>
                                    <%--<i class="fa fa-gear"></i>--%>
                                    <%--<spring:message code="config"/>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="javascript:">--%>
                                        <%--<div class="clearfix">--%>
                                            <%--<span class="pull-left">language</span>--%>
                                        <%--</div>--%>
                                        <%--<div>--%>
                                            <%--language config--%>
                                        <%--</div>--%>
                                    <%--</a>--%>
                                <%--</li>--%>

                            <%--</ul>--%>
                        <%--</li>--%>
                        <li>
                            <a class="login-area dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="padding-top: 11px;background:#2759a5 !important;">
                                <div class="navbar-brand" style="font-size: 12px;margin-right: 25px;">
                                    <i class="glyphicon glyphicon-user"></i>&nbsp;<span><shiro:principal property="userName" /></span>
                                    <i class="fa fa-sort-down"></i>
                                </div>
                            </a>
                            <!--Login Area Dropdown-->
                            <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area" style="box-shadow: 0 2px 10px rgba(0, 0, 0, .8);">
                                <li class="dropdown-header bordered-darkorange">
                                    <i class="glyphicon glyphicon-user"></i>
                                    <spring:message code="page.index.current_user"/>
                                </li>

                                <li class="bordered-darkorange">
                                    <a href="javascript:">
                                        <div class="clearfix">
                                            <div class="col-md-7 no-padding text-right"><spring:message code="page.index.acount"/>&nbsp;:&nbsp;</div>
                                            <div class="col-md-5 no-padding text-left"><shiro:principal property="userName"/></div>
                                        </div>
                                    </a>
                                    <a href="javascript:">
                                        <div class="clearfix">
                                            <div class="col-md-7 no-padding text-right"><spring:message code="page.index.role"/>&nbsp;:&nbsp;</div>
                                            <div class="col-md-5 no-padding text-left"><shiro:principal property="role"/></div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="clearfix">
                                        <a href="${path}/logout" class="btn btn-darkorange btn-sm pull-right padding-5 margin-bottom-10" style="top:5px;"><spring:message code="logout"/></a>
                                    </div>
                                </li>
                            </ul>
                            <!--/Login Area Dropdown-->
                        </li>
                        <li>
                            <a id="help-link" title="Help" href="javascript:" ng-click="goHelpPage(childPage)">
                                <i class="icon fa fa-question-circle"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /Account Area -->
                    <!--Note: notice that setting div must start right after account area list.
                    no space must be between these elements-->

                </div>
            </div>
            <!-- /Account Area and Settings -->
        </div>
    </div>
</div>
<!-- /Navbar -->
<!-- Main Container -->
<div class="main-container container-fluid">


    <!-- Page Container -->
    <div class="page-container">

        <!-- Page Sidebar -->
        <div class="page-sidebar" id="sidebar" style="z-index:199;">

            <!-- /Page Sidebar Header -->
            <!-- Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <li class="menu-l1">
                    <a href="#/home">
                        <i class="menu-icon glyphicon glyphicon-home"></i>
                        <span class="text-nowrap menu-text"> <spring:message code="menu.home"/> </span>
                    </a>
                </li>

                <li ng-repeat="oneMenu in ::homeMenu" style="position: relative;" class="menu-l1">
                    <a href="javascript:" class="menu-dropdown">
                        <i class="menu-icon {{::oneMenu.iconClass}}"></i>
                            <span class="text-nowrap menu-text">{{::oneMenu.name}}</span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu" >
                        <li ng-repeat="twoMenu in ::oneMenu.twoMenu">
                            <a href="{{::'#'+twoMenu.url}}">
                                <span class="text-nowrap menu-text">{{::twoMenu.name}}</span>
                            </a>
                        </li>
                    </ul>
                </li>


            </ul>
            <!-- /Sidebar Menu -->
        </div>
        <!-- /Page Sidebar -->


            <!-- Help Bar -->
        <div class="page-help">
            <div class="margin-10">
                <i class="fa fa fa-home font-150 clickable-bg" ng-click="goHelpPage('')"></i>
                {{helpPath}}
            </div>
            <div class="help-contacts">
                <div ng-show="isHomeHelp">
                    <div ng-repeat="oneMenu in homeMenu">
                        <i class="{{::oneMenu.iconClass}}"></i>
                        <span class="menu-text">{{::oneMenu.name}}</span>

                        <%--首页的全局搜索帮助--%>
                        <ul>
                            <li ng-repeat="twoMenu in oneMenu.twoMenu">
                                <!--   <a href="javascript:" ng-click="goHelpPage(twoMenu.url)">{{::twoMenu.name+' - '+twoMenu.url}}</a>  更改首页帮助-->
                                <a href="javascript:" ng-click="goHelpPage(twoMenu.url)">{{::twoMenu.name}}</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="help-html" ng-show="!isHomeHelp"></div>
            </div>
        </div>
        <!-- /Help Bar -->

        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb my-breadcrumb">
                    <li>
                        <a href="#/home">
                            <i class="fa fa-home clickable-bg"></i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:"></a>
                    </li>
                    <li>
                        <a href="javascript:"></a>
                    </li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->


            <!-- Page Body 子菜单内显示的内容 通过路由配置,得到页面 templateUrl: PATH + (cfg.url || cfg.path) -->
            <div class="page-body ng-cloak" ng-view></div>
            <!-- /Page Body -->

        </div>
        <!-- /Page Content -->

    </div>
    <!-- /Page Container -->
    <!-- Main Container -->

</div>


<%--调整table宽度的,提示线条 一条直线--%>
<div id="datagrid-resize-proxy"></div>
</body>
<!--  /Body -->

<script src="${path}/assets/bundle/commons.js"></script>
<script src="${path}/assets/bundle/beyond.bundle.js"></script>
<script src="${path}/assets/bundle/index.bundle.js?version=${VERSION}"></script>
<script src="${path}/assets/js/libs/echarts/echarts.min.js"></script> 
<script src="${path}/assets/js/libs/echarts/map/world.js"></script> 

<script src="${path}/assets/assets/js/mycommen.js"></script>  
<script src="${path}/assets/assets/js/tableModelVer.js"></script>  
<script src="${path}/assets/assets/js/wowTable.js"></script>
<script src="${path}/assets/assets/js/bootstrapValidator.js"></script>  
<script src="${path}/assets/beyond/js/charts/sparkline/jquery.sparkline.js"></script>
<script src="${path}/assets/beyond/js/charts/sparkline/sparkline-init.js"></script>
<script src="${path}/assets/assets/js/beyond.min.js"></script>
</html>
