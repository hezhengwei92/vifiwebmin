<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%
    final String VERSION = com.frame.commons.utils.VersionTool.getVersion();
    final String DOMAIN = com.frame.commons.utils.ActionUtils.getDomain();
    final String path = request.getContextPath();
    final String basePath = DOMAIN + path + "/";
    final String pathURI = path + "/";

    // 把变量放入 pageContext,以便jstl的 ${}标签可以直接访问变量.   (ps:个人觉得jsp页面< %= 难看, ${}精简好看)
    pageContext.setAttribute("DOMAIN", DOMAIN);
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
    pageContext.setAttribute("pathURI", pathURI);
    pageContext.setAttribute("VERSION", VERSION);
%>
<%-- 这样我们就可以像struts2 一样直接用标签  ${requset} ,访问几大作用域了,最好不要用,,,用spring mvc 规范!好维护--%>
<c:set var="requset" value="${requsetScope }"></c:set>
<c:set var="response" value="${responseScope }"></c:set>
<c:set var="session" value="${sessionScope }"></c:set>
<c:set var="application" value="${applicationScope }"></c:set>
<%-- 当前url --%>
<c:set var="requestUrl" value="${requestScope['javax.servlet.forward.request_uri']}"></c:set>
