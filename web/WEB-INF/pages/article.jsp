<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article,sitePackage.Article.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Article article = Article.getArticleById(id);

    if (article == null) {
        response.sendRedirect("index.jsp?content=articles");
    }

    System.out.println(article.getTitle());
%>
<div class="well">
    <legend><%=article.getTitle()%>
    </legend>
    <small><%=article.getCreated_by().getFirstName()%> | <%=article.getCreated_at()%>
    </small>
    <br>

    <div class="row">
        <div class="col-md-2">
            <% if (article.getImg_url() == null) {%>
            <img class="img-rounded img-thumbnail pull-left"
                 src="http://www.hidekik.com/imdl/imdl/files/sample.jpg"/>
            <%}%>
            <% if (article.getImg_url() != null) { %>
            <img class="img-rounded img-thumbnail" src="<%=article.getImg_url()%>"/>
            <%}%>
        </div>
            <div class="col-md-10">
            <p><%=article.getContent()%>
            </p>
        </div>
    </div>
</div>