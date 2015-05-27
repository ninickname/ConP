<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article,sitePackage.Article.*" %>
<div class="well">
    <legend>News and sales</legend>
    <ul class="list-group">
        <%
            for(int i=0; i < Article.getArticles().size();i++)
            {
        %>
        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=Article.getArticles().get(i).getId()%>"><%=Article.getArticles().get(i).getTitle()%></a>
        </li>
        <%
            }
        %>
    </ul>
    <ul class="list-group">
        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/index.jsp?content=articles">Show All</a>
        </li>
    </ul>

</div>