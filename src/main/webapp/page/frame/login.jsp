<%@ page import="com.frame.commons.utils.CommonUtils" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title><spring:message code="page.login.page_title"/></title>

    <meta name="description" content="login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">

    <script src="${path}/assets/bundle/commons.js"></script>
    <script src="${path}/assets/bundle/beyond.bundle.js"></script>

    <script>
        // 判断是否被嵌套,防止超时时子页面显示 登陆页面
        if (window.VERSION) {
            $("body").html("");
            location.href = "${path}";
        }
        // 语言设置
        var LANG_COOKIE_KEY = "language";

        function saveLang(language) {
            // 放入cookie
            var exp = new Date(new Date().getTime() + 31536000000);// cookie中存储一年.
            document.cookie = LANG_COOKIE_KEY + "=" + language + ";expires=" + exp.toGMTString();
        }

        $(function () {
        	//设置高度
        	var clientHeight = document.documentElement.clientHeight;
        	var marginVertial = (clientHeight -289 -40 -10)/2;
        	//var clientWidth = document.documentElement.clientWidth;
        	//document.getElementById("loginContainer").style.height = (clientHeight+20)+"px";
        	document.getElementById("loginbox").style.margin = marginVertial+"px auto";
        	
            // cookie中取出 language
            var arr, reg = new RegExp("(^| )" + LANG_COOKIE_KEY + "=([^;]*)(;|$)");
            var langOld = ( arr = document.cookie.match(reg) ) ? arr[2] : null;
            if (!langOld) {
                saveLang(langOld = "zh_CN");
            }
            $("#language").val(langOld).change(function () {
                saveLang($(this).val());
                location.reload();
            });
        });
    </script>

    <style>
        body {
            font-family: '微软雅黑', 'Microsoft YaHei', 'Microsoft Yahei Font', 'Open Sans', 'Segoe UI' !important;
        }
        .loginBackground{
			background:url(././assets/images/login_background.jpg);
			background-size: 100%;
		}
		#bodyBgcolor{
			width:100%;
			background:#065CC1;
		}
		.copyright{
			padding-bottom:30px;
			text-align:center;
			line-height:40px;
			font-size:14px;
			color:#fff;
			font-family:微软雅黑;
			opacity: 0.7;
		}
    </style>

</head>
<body>
<div id="loginContainer" class="login-container animated fadeInDown loginBackground">
	<div style="line-height:1px;"><span>&nbsp;</span></div>
    <div id="loginbox" class="loginbox bg-white" style="opacity: 0.9;border-radius:10px;">
        <form action="" method="post" id="login_form">
            <div class="loginbox-title" style="margin-bottom:20px;"><spring:message code="page.login.title"/></div>
            <!-- div class="loginbox-social">
                <div class="social-title "><spring:message code="page.login.tips"/></div>
            </div-->
            <div class="loginbox-textbox">
                <input type="text" name="username" id="username" class="form-control" autofocus="autofocus"
                       placeholder="<spring:message code="page.login.username"/>"/>
            </div>
            <div class="loginbox-textbox">
                <input type="password" name="password" id="password" class="form-control"
                       placeholder="<spring:message code="page.login.password"/>"/>
            </div>
            <div class="loginbox-textbox">
                <!-- label for="language"><spring:message code="language"/>:</label-->
                <select name="language" id="language" class="form-control">
                    <option selected="selected" value="zh_CN">中文(简)</option>
                    <option value="zh_TW">中文(繁)</option>
                    <option value="en_US">English</option>
                    <option value="jp_JP">日本語</option>
                    <option value="ko_KR">한국어</option>
                </select>
            </div>
            <div class="loginbox-forgot">
                <c:if test="${errorMsg != null}">
                    <b class="red">${errorMsg}</b>
                </c:if>

                <c:if test="${msg != null}">
                    <p style="color: red; margin-left: 10px;">${msg }</p>
                </c:if>
            </div>
            <div class="loginbox-submit">
                <input type="submit" class="btn btn-primary btn-block" value="<spring:message code="page.login.login"/>"
                       name="submit">
            </div>
        </form>
    </div>
    <div class="copyright"><span>Copyright © 2016, 杭州瀚隆, All Rights Reserved </span></div>
</div>
</body>
</html>
<!-- Version： v1.2.2278 -->
