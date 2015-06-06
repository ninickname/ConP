<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User"%>

<label>
    <% User currentUser =  (User)(session.getAttribute("user"));
        if(currentUser == null ){response.sendRedirect("index.jsp");}
    %>

    Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>






</label>


<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.UserDAO" %>
<%@ page import="sitePackage.User" %>
<%@ page import="java.util.List" %>
<legend class="">List of Clients who unregistered, click on id to approve his as user :</legend>
<div class="well">
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-lg-4">
                <% List<User> UsersList = UserDAO.ListClients();
                    for(User user : UsersList){%>

                <div class="controls">
                    <form class="form-horizontal" action='ApproveUserServlet' method="POST" name="ListForm" >
                        <input type="text" value="<%=user.getId()%>" name='text' id='text' hidden="hidden">
                        <button class="btn btn-success" ng-disabled="ListForm.$invalid "> <td><%=user.getId()%></td></button>
                    </form>
                </div>

                <%}%>
            </div>
        </div>
        <div class="form-group">
        </div>
    </div>
</div>