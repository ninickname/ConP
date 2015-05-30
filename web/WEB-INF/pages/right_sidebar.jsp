<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article,sitePackage.Article.*" %>
<div class="well">
    <legend>News and sales</legend>
    <%
        for(int i=0; i < Article.getArticles().size();i++)
        {
    %>
    <div class="media">
        <a class="pull-left" href="#">
            <% if (Article.getArticles().get(i).getImg_url() == null) {%>
            <img class="img-rounded img-thumbnail"
                 src="http://www.hidekik.com/imdl/imdl/files/sample.jpg"/>
            <%} else { %>
            <img class="img-rounded img-thumbnail"
                 src="<%=Article.getArticles().get(i).getImg_url()%>"/>
            <%}%>
        </a>
        <div class="media-body">
            <a href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=Article.getArticles().get(i).getId()%>"><%=Article.getArticles().get(i).getTitle()%></a>
            <rating ng-init="rate<%=Article.getArticles().get(i).getId()%>=<%=Article.getArticleRate(Article.getArticles().get(i).getId())%>" ng-model="rate<%=Article.getArticles().get(i).getId()%>"
                    max="5" readonly="true" class="pull-right"></rating>
        </div>
    </div>

    <%
        }
    %>
    <ul class="list-group">
        <li class="list-group-item">
            <a href="${pageContext.request.contextPath}/index.jsp?content=articles">Show All</a>
        </li>
    </ul>

</div>