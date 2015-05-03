<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/pages/template.jsp">
    <jsp:param name="content" value="${(empty param.content) ? 'home' : param.content}"/>
    <jsp:param name="title" value="${param.content}"/>
</jsp:include>



