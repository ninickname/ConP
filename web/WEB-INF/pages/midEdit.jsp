<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.UserDAO" import="sitePackage.User" %>
<%@ page import="java.util.ArrayList" %>

<legend class="">Edit :</legend>
<div class="well">
    <form action='MidEditServlet' method="post" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">User Id:</label>

            <div class="col-md-4">
                <select name="dd_ID" class="form-control ">
                    <%

                        User user = (User) (session.getAttribute("user"));
                        System.out.println(user.getRole());

                        ArrayList<Long> UsersList = UserDAO.getIdsWithLowerRole(user);

                        for (Long id : UsersList) {%>

                    <option><%= id %>
                    </option>
                    <%}%>

                </select>
            </div>
        </div>
        <input type="submit" value="Submit" class="btn btn-success col-md-offset-2">
    </form>
</div>