<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article,sitePackage.Article.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Article article = Article.getArticleById(id);

    if(article == null)
    {
        response.sendRedirect("index.jsp?content=articles");
    }

    System.out.println(article.getTitle());
%>
<div class="well">
    <legend><%=article.getTitle()%></legend>
    <small><%=article.getCreated_by().getFirstName()%>|<%=article.getCreated_at()%></small>
    <p<%=article.getContent()%>></p>
</div>