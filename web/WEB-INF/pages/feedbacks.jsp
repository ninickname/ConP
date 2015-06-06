<%@ page contentType="text/html;charset=UTF-8" language="java" import="Feedback.*" %>
<%@ page import="sitePackage.User" %>
<div class="well">
    <div class="row clearfix">
        <%
            Object ob = request.getSession().getAttribute("user");
            String role = ob == null ? "none" : ((User) ob).getRole();
        %>
        <div class="col-md-12">
            <ul class="list-group">
                <%
                    for (int i = 0; i < Feedback.getFeedbacks().size(); i++) {
                        Feedback feedbackItem = Feedback.getFeedbacks().get(i);
                %>
                <li class="list-group-item clearfix">
                    <div class="row">
                        <div class="col-md-10">
                            <label><%=feedbackItem.getTitle()%></label><br>
                            <% String content = feedbackItem.getContent();%>
                            <p><%=content.substring(0, Math.min(content.length(), 300))%> ...</p>
                            <form id="DeleteFormArticle<%=feedbackItem.getId()%>" action="DeleteFeedbackServlet"
                                  method="POST" ng-submit="submit()">
                                <input type="text" id="article_idd" name="article_idd"
                                       value="<%=feedbackItem.getId()%>" hidden="hidden">
                                <div class="btn-group">
                                    <% User currentUser = (User) (session.getAttribute("user"));
                                        if (currentUser != null && (currentUser.getRole().equals("Admin") || currentUser.getRole().equals("Manager"))) { %>
                                    <form id="DeleteFormArticle<%=feedbackItem.getId()%>" action="DeleteFeedbackServlet"
                                          method="POST" >
                                        <input type="text" id="id" name="id"
                                               value="<%=feedbackItem.getId()%>" hidden="hidden">
                                    <button class="btn btn-danger"
                                            type="submit">Delete</button>
                                        </form>

                                    <%}%>

                                </div>
                            </form>
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