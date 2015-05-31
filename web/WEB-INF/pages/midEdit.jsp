<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="sitePackage.*" %>

<legend class="">Edit :</legend>
<div class="well">
    <form action='MidEditServlet' method="post" class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">User Id:</label>

            <div class="col-md-4">
                <select name="id" class="form-control ">
                    <%

                        User user = (User) (session.getAttribute("user"));
                      try{
                        System.out.println(user.getRole());

                        ArrayList<Long> UsersList = UserDAO.getIdsWithLowerRole(user);

                        for (Long id : UsersList) {%>

                    <option><%= id %>
                    </option>
                    <%}
                    }catch (NullPointerException ull){

                        %>
                    <script>

                        $.post("ErrorServlet",{},function(){
                        })


                    </script>

                    <%
                    }%>


                </select>
            </div>
        </div>
        <input type="submit" id = "submit" value="Submit" class="btn btn-success col-md-offset-2">
    </form>
</div>