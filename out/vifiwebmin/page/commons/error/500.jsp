<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%response.setStatus(200);%>

<%
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    Throwable ex = null;
    if (exception != null)
        ex = exception;
    if (request.getAttribute("javax.servlet.error.exception") != null)
        ex = (Throwable) request.getAttribute("javax.servlet.error.exception");

    //记录日志
    Logger LogUtils = LoggerFactory.getLogger("500.jsp");
    LogUtils.error(ex.getMessage(), ex);
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>Error 500</title>

    <meta name="description" content="Error 500"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">
    <script src="${path}/assets/bundle/commons.js"></script>
    <script src="${path}/assets/bundle/beyond.bundle.js"></script>
</head>
<body class="body-500">
<div class="error-header"></div>
<div class="container ">
    <section class="error-container text-center">
        <h1>500</h1>

        <div class="error-divider">
            <h2>ooops!!</h2>

            <p class="description">SOMETHING WENT WRONG.</p>

            <%
                for (StackTraceElement ste : exception.getStackTrace()) {
                    out.print(ste.toString() + "<br>");
                }
            %>
            <br>-----------
            <%=exception.getMessage()%>

        </div>
        <a href="<c:url value="/index"/>" class="return-btn"><i class="fa fa-home"></i>Home</a>
    </section>
</div>

</body>
</html>



