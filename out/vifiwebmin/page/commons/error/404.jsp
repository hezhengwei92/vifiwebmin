<%response.setStatus(HttpServletResponse.SC_NOT_FOUND);%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>Error 404 - Page Not Found</title>

    <meta name="description" content="Error 404 - Page Not Found"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">
    <script src="${path}/assets/bundle/commons.js"></script>
    <script src="${path}/assets/bundle/beyond.bundle.js"></script>
</head>
<body class="body-404">
<div class="error-header"></div>
<div class="container ">
    <section class="error-container text-center">
        <h1>404</h1>

        <div class="error-divider">
            <h2>page not found</h2>

            <p class="description">We Couldn’t Find This Page</p>
        </div>
        <a href="<c:url value="/index"/>" class="return-btn"><i class="fa fa-home"></i>Home</a>
    </section>
</div>

</body>
</html>
