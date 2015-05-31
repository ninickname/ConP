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
            <a class="btn btn-success pull-right"
               href="${pageContext.request.contextPath}/index.jsp?content=newArticle">Create new
                article</a>
        </div>
        <%
            }
        %>
        <div class="col-md-12">
            <ul class="list-group">
                <%
                    for (int i = 0; i < Article.getArticles().size(); i++) {
                        Article articleItem = Article.getArticles().get(i);
                %>
                <li class="list-group-item clearfix">
                    <div class="row">
                        <div class="col-md-2">
                            <% if (articleItem.getImg_url() == null) {%>
                            <img class="img-rounded img-thumbnail"
                                 src="http://www.hidekik.com/imdl/imdl/files/sample.jpg"/>
                            <%} else { %>
                            <img class="img-rounded img-thumbnail"
                                 src="<%=articleItem.getImg_url()%>"/>
                            <%}%>
                        </div>
                        <div class="col-md-10">
                            <label><a
                                    href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=articleItem.getId()%>">
                                <%=articleItem.getTitle()%>
                            </a>
                            </label><br>
                            <form id="rateForm<%=articleItem.getId()%>" action="RateArticleServlet"  method="POST" ng-submit="submit()">
                                <rating ng-init="rate<%=articleItem.getId()%>=<%=Article.getArticleRate(articleItem.getId())%>" ng-model="rate<%=articleItem.getId()%>"
                                        max="5" readonly="<%=session.getAttribute("user") == null%>" onclick="if(<%=session.getAttribute("user") != null%>){$('#rateForm<%=articleItem.getId()%>').submit()};"></rating>
                                <input type="text" id="article_id" name="article_id" value="<%=articleItem.getId()%>" hidden="hidden">
                                <input type="text" id="rate" name="rate" ng-model="rate<%=articleItem.getId()%>" hidden="hidden">
                                <input type="hidden" name="forwardTo" value="${pageContext.request.servletPath}?content=articles" />
                            </form>
                            <small><%=articleItem.getCreated_by().getFirstName()%> <%=articleItem.getCreated_by().getLastName()%>
                                | <%=articleItem.getCreated_at()%>
                            </small>
                            <% String content = articleItem.getContent();%>
                            <p><%=content.substring(0, Math.min(content.length(), 300))%> ...</p>

                            <div class="btn-group">
                                <% User currentUser = (User) (session.getAttribute("user"));
                                    if (currentUser != null && (currentUser.getRole().equals("Admin") || currentUser.getRole().equals("Manager"))) { %>
                                <a class="btn btn-danger"
                                   href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=articleItem.getId()%>">Delete</a>
                                <a class="btn btn-warning "
                                   href="${pageContext.request.contextPath}/index.jsp?content=editArticle&id=<%=articleItem.getId()%>">Edit</a>
                                <%}%>
                                <a class="btn btn-success"
                                   href="${pageContext.request.contextPath}/index.jsp?content=article&id=<%=articleItem.getId()%>">Read
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