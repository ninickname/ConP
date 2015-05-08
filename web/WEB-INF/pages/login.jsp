<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("value") == null) {
        response.sendRedirect("/index.jsp?content=home");
    }

%>

<div class="row" ng-controller="loginController">
        <legend>Login Form:</legend>
        <div class="well">
            <form method="post" action="LoginServlet" name="loginForm" class="form-horizontal">
                <div class="form-group">
                    <label class="form-label col-md-2">User Name</label>

                    <div class="col-lg-4">
                        <input type="text" class="form-control" name="user_name" ng-model="user_name"
                               placeholder="Please enter User Name" required/>
                        <span style="color:red"
                              ng-show="loginForm.user_name.$dirty && loginForm.user_name.$error.required">Username is required.</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label col-md-2">Password</label>

                    <div class="col-lg-4">
                        <input type="password" class="form-control" name="password" ng-model="password"
                               placeholder="Please enter Password" required>
                    <span style="color:red" ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
                          <span ng-show="loginForm.password.$error.required">password is required.</span>
                          <span ng-show="loginForm.password.$error.email">Invalid password.</span>
                    </span>
                    </div>
                </div>
                <button type="submit" ng-disabled="loginForm.$invalid " class="btn btn-default">Submit
                </button>
            </form>
            <%
                if (null != request.getAttribute("errorMessage")) {
            %>
            <div class="alert alert-danger">

                <a href="#" class="close" data-dismiss="alert">&times;</a>

                <strong>Warning!</strong> <% out.println(request.getAttribute("errorMessage")); %>

            </div>

            <%
                }
            %>


        </div>
</div>