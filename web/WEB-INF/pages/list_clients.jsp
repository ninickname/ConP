<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.UserDAO" %>
<%@ page import="sitePackage.User" %>
<%@ page import="java.util.List" %>
<legend class="">List of Clients who unregistered:</legend>
<div class="well">
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-lg-4">
                <% List<User> UsersList = UserDAO.ListClients();
                    for(int i=0 ; i< UsersList.size();i++){%>
                    <% User user = new User();%>
                    <% user = UsersList.get(i);%>
                <td><%=user.getId()%></td>
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