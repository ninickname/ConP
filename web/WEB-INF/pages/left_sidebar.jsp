<%--<div class="well">--%>
    <%--<legend>Control panel</legend>--%>
    <%--<ul class="list-group">--%>
        <%--<li class="list-group-item">Cras justo odio</li>--%>
        <%--<li class="list-group-item">Dapibus ac facilisis in</li>--%>
        <%--<li class="list-group-item">Morbi leo risus</li>--%>
        <%--<li class="list-group-item">Porta ac consectetur ac</li>--%>
        <%--<li class="list-group-item">Vestibulum at eros</li>--%>
        <%--<li class="list-group-item">--%>
            <%--<span class="badge">14</span>--%>
            <%--waiting users--%>
        <%--</li>--%>
    <%--</ul>--%>
    <%--<hr>--%>
    <%--<ul class="list-group">--%>
        <%--<li class="list-group-item"><a href="#">Change personal data</a></li>--%>
        <%--<li class="list-group-item"><a href="#">Change personal data</a></li>--%>
        <%--<li class="list-group-item"><a href="#">Change personal data</a></li>--%>
        <%--<li class="list-group-item"><a href="#">Change personal data</a></li>--%>
        <%--<li class="list-group-item"><a href="#">Change personal data</a></li>--%>
    <%--</ul>--%>
<%--</div>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="Article.Article,Article.Article.*" %>
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