<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article" %>
<%@ page import="sitePackage.User" %>
<div class="well">
    <div class="row">
    <%
        Object ob = request.getSession().getAttribute("user");
        String role = ob == null? "none" : ((User)ob).getRole();

        if(role.equals("Admin")|| role.equals("Manager"))
        {
    %>
        <div class="col-md-6">
            <a class="btn btn-success" href="${pageContext.request.contextPath}/index.jsp?content=newArticle">Create new article</a>
        </div>
    <%
        }
    %>
    <div class="col-md-12">
    <ul class="list-group">
        <%
            for(int i=0; i < Article.getArticles().size();i++)
            {
        %>
        <li class="list-group-item clearfix">
            <label><%=Article.getArticles().get(i).getTitle()%></label>
            <small><%=Article.getArticles().get(i).getCreated_by().getFirstName()%>|<%=Article.getArticles().get(i).getCreated_at()%></small>
            <a class="btn btn-success pull-right" href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=Article.getArticles().get(i).getId()%>">Read Article..</a>
        </li>
        <%
            }
        %>
    </ul>
    </div>
    </div>
</div>