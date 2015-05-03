<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/WEB-INF/pages/header.jsp"/>
<div class="container">
<jsp:include page="/WEB-INF/pages/${param.content}.jsp"/>
</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
