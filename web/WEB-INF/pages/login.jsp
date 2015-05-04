<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" ng-controller="loginController">
    <div class="col-md-6">
        <legend>Login Form:</legend>
        <div class="well">
            <form method="post" action="LoginServlet" name="loginForm">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="text" class="form-control" name="name" ng-model="name" placeholder="Please enter email" required/>
                    <span style="color:red" ng-show="loginForm.name.$dirty && loginForm.name.$error.required">Username is required.</span>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" ng-model="password" placeholder="Please password" required>
                    <span style="color:red" ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
                          <span ng-show="loginForm.password.$error.required">Email is required.</span>
                          <span ng-show="loginForm.password.$error.email">Invalid email address.</span>
                    </span>
                </div>
                <button type="submit" ng-disabled="loginForm.$invalid " class="btn btn-default">Submit
                </button>
            </form>
            <%
                if(null!=request.getAttribute("errorMessage"))
                {
                    %>
            <div class="alert alert-danger">

                <a href="#" class="close" data-dismiss="alert">&times;</a>

                <strong>Warning!</strong> <%  out.println(request.getAttribute("errorMessage")); %>

            </div>

            <%
                }
            %>





        </div>
    </div>
</div>