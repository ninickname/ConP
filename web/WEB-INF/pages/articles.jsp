<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article" %>
<%@ page import="sitePackage.User" %>
<div class="well">
    <div class="row clearfix">
        <%
            Object ob = request.getSession().getAttribute("user");
            String role = ob == null ? "none" : ((User) ob).getRole();

            if (role.equals("Admin") || role.equals("Manager")) {
        %>
        <div class="col-md-12 ">
            <a class="btn btn-success pull-right" href="${pageContext.request.contextPath}/index.jsp?content=newArticle">Create new
                article</a>
        </div>
        <%
            }
        %>
        <div class="col-md-12">
            <ul class="list-group">
                <%
                    for (int i = 0; i < Article.getArticles().size(); i++) {
                %>
                <li class="list-group-item clearfix">
                    <div class="row">
                        <div class="col-md-2">
                            <% if(Article.getArticles().get(i).getImg_url() == null){%>
                            <img class="img-rounded img-thumbnail"
                                 src="http://www.hidekik.com/imdl/imdl/files/sample.jpg"/>
                            <%} else { %>
                            <img class="img-rounded img-thumbnail"
                                 src="<%=Article.getArticles().get(i).getImg_url()%>"/>
                            <%}%>
                        </div>
                        <div class="col-md-10">
                            <label><a href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=Article.getArticles().get(i).getId()%>">
                                    <%=Article.getArticles().get(i).getTitle()%></a>
                            </label><br>
                            <small><%=Article.getArticles().get(i).getCreated_by().getFirstName()%> <%=Article.getArticles().get(i).getCreated_by().getLastName()%>
                                | <%=Article.getArticles().get(i).getCreated_at()%>
                            </small>
                            <% String content = Article.getArticles().get(i).getContent();%>
                            <p><%=content.substring(0, Math.min(content.length(), 300))%> ...</p>
                            <div class="btn-group">
                            <%  User currentUser =  (User)(session.getAttribute("user"));
                                if (currentUser != null && (currentUser.getRole().equals("Admin")||currentUser.getRole().equals("Manager"))){ %>
                            <a class="btn btn-danger"
                               href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=Article.getArticles().get(i).getId()%>">Delete</a>
                            <a class="btn btn-warning "
                               href="${pageContext.request.contextPath}/index.jsp?content=editArticle&id=<%=Article.getArticles().get(i).getId()%>">Edit</a>
<%}%>
                            <a class="btn btn-success"
                               href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=Article.getArticles().get(i).getId()%>">Read
                                Article..</a>
</div>
                        </div>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</div>