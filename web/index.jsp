<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User"%>

<%
    Object ob = request.getSession().getAttribute("user");
    String role = ob == null? "none" : ((User)ob).getRole();
    System.out.println(role);
    String contentPage = User.checkPageRole(request.getParameter("content"),role);

%>


<jsp:include page="/WEB-INF/pages/template.jsp">
    <jsp:param name="content" value="<%= contentPage %>"/>
    <jsp:param name="title" value="<%= contentPage %>"/>
</jsp:include>



