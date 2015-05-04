<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("value") == null){
        response.sendRedirect("/index.jsp?content=home");
    }

%>

<div class="row" ng-controller="loginController">
    <div class="col-md-6">
        <legend>Login Form:</legend>
        <div class="well">
            <form method="post" action="LoginServlet" name="loginForm">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="text" class="form-control" name="name" ng-model="name" placeholder="Enter email" required/>
                    <span style="color:red" ng-show="loginForm.name.$error.required">Username is required.</span>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" ng-model="password" placeholder="password" required>
                    <span style="color:red" ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
                          <span ng-show="loginForm.password.$error.required">Email is required.</span>
                          <span ng-show="loginForm.password.$error.email">Invalid email address.</span>
                    </span>
                </div>
                <button type="submit" ng-disabled="loginForm.$invalid " class="btn btn-default">Submit
                </button>
            </form>
        </div>
    </div>
</div>