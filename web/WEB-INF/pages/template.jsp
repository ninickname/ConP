<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/WEB-INF/pages/header.jsp"/>
<div class="container-fluid">
    <div class="col-md-2">
        <jsp:include page="${param.content != 'home' ? '/WEB-INF/pages/left_sidebar.jsp' : ''}"/>

    </div>
    <div class="col-md-8">
        <jsp:include page="/WEB-INF/pages/${param.content}.jsp"/>
    </div>
    <div class="col-md-2">
       <jsp:include page="/WEB-INF/pages/right_sidebar.jsp"/>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
