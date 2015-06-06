<%@ page contentType="text/html;charset=UTF-8" language="java" import="Article.Article,Article.Article.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Article articleItem = Article.getArticleById(id);

    if (articleItem == null) {
        response.sendRedirect("index.jsp?content=articles");
    }

    System.out.println(articleItem.getTitle());
%>
<div class="well">
    <legend><%=articleItem.getTitle()%>
    </legend>
    <form id="rateForm<%=articleItem.getId()%>" action="RateArticleServlet"  method="POST" ng-submit="submit()">
        <rating ng-init="rate<%=articleItem.getId()%>=<%=Article.getArticleRate(articleItem.getId())%>" ng-model="rate<%=articleItem.getId()%>"
                max="5" readonly="<%=session.getAttribute("user") == null%>" onclick="if(<%=session.getAttribute("user") != null%>){$('#rateForm<%=articleItem.getId()%>').submit()};"></rating>
        <input type="text" id="article_id" name="article_id" value="<%=articleItem.getId()%>" hidden="hidden">
        <input type="text" id="rate" name="rate" ng-model="rate<%=articleItem.getId()%>" hidden="hidden">
        <input type="hidden" name="forwardTo" value="${pageContext.request.servletPath}?content=articles" />
    </form>
    <small><%=articleItem.getCreated_by().getFirstName()%> | <%=articleItem.getCreated_at()%>
    </small>
    <br>
    <div class="row">
        <div class="col-md-2">
            <% if (articleItem.getImg_url() == null) {%>
            <img class="img-rounded img-thumbnail pull-left"
                 src="http://www.hidekik.com/imdl/imdl/files/sample.jpg"/>
            <%}%>
            <% if (articleItem.getImg_url() != null) { %>
            <img class="img-rounded img-thumbnail" src="<%=articleItem.getImg_url()%>"/>
            <%}%>
        </div>
            <div class="col-md-10">
            <p><%=articleItem.getContent()%>
            </p>
        </div>
    </div>
</div>