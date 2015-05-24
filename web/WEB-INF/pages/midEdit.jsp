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
                    //TODO TEMPORARY
                    //TODO COOKIES NEED TO BE IMPLEMENTED !!!
                    String role = null;
                    for (Cookie cook : request.getCookies()) {
                        if (cook.getName().equals("role")) {
                            role = UserDAO.getRoleFromCookie(cook);

                            //TODO  REMOVE THIS IF WHEN DONE DEBUGNING
                            if (role.equals("Unregistered") ){
                                role = "Admin";
                            }

                        }
                    }

                    User user = new User();
                    user.setId(321321321);
                    user.setRole(role);
                    System.out.println(role);


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