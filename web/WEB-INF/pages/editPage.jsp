<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.UserDAO" import="sitePackage.User" %>
<%@ page import="java.util.ArrayList" %>

<legend class="">Edit :</legend>
<div class="well">
    <!-- form for the dropdown list -->


    <%
        System.out.printf("rape");
        User user = (User) (request.getSession().getAttribute("user"));

    %>

    <!-- form for the editing -->
    <script>
        // create angular controller
        app.controller('editUserController', function ($scope) {
            $scope.last_name = "<%=user.getLastName()%>";
            $scope.first_name = "<%=user.getFirstName()%>";
            $scope.user_name = "<%=user.getUserName()%>";
            $scope.email = "<%=user.getEmail()%>";
            $scope.id = "<%=user.getId()%>";

            $scope.password = "<%=user.getPassword()%>";
            $scope.password_confirm = "<%=user.getPassword()%>";


        });
    </script>
    <form class="form-horizontal"
          action='EditServlet'
          method="POST"
          name="RegForm"
          ng-controller="editUserController">

        <div class="form-group">
            <!-- first name -->
            <label class="form-label col-md-2" for="first_name">First name:</label>

            <div class="col-lg-4">
                <input type="text" id="first_name" name="first_name" ng-model="first_name"
                       placeholder="Enter first name"
                       class="form-control" required>
                        <span style="color:red"
                              ng-show="RegForm.first_name.$dirty && RegForm.first_name.$error.required">first name is required.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- last name -->
            <label class="form-label col-md-2" for="last_name">Last name:</label>

            <div class="col-lg-4">
                <input type="text" id="last_name" name="last_name" ng-model="last_name"
                       placeholder="Enter last name"
                       class="form-control" required>

                <span style="color:red" ng-show="RegForm.last_name.$dirty && RegForm.last_name.$error.required">last name is required.</span>
            </div>
        </div>


        <div class="form-group">
            <!-- ID -->
            <label class="form-label col-md-2" for="id">ID</label>

            <div class="col-lg-4">
                <input type="text" id="id" name="id" ng-model="id" placeholder="Enter ID"
                       class="form-control" required>
                <span style="color:red" ng-show="RegForm.id.$dirty && RegForm.id.$error.required">ID is required.</span>
                <!-- add number check-->
            </div>
        </div>
        <div class="form-group">
            <!-- Username -->
            <label class="form-label col-md-2" for="user_name">Username</label>

            <div class="col-lg-4">
                <input type="text" id="user_name" name="user_name" ng-model="user_name"
                       placeholder="Enter user name"
                       class="form-control" required >
                <span style="color:red" ng-show="RegForm.user_name.$dirty && RegForm.user_name.$error.required">user name is required.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- E-mail -->
            <label class="form-label col-md-2" for="email">E-mail</label>

            <div class="col-lg-4">
                <input type="email" id="email" name="email" ng-model="email" placeholder="enter email"
                       class="form-control"
                       required>
                <span style="color:red" ng-show="RegForm.email.$dirty && RegForm.email.$error.required">email is required.</span>
                <span style="color:red"
                      ng-show="RegForm.email.$dirty && RegForm.email.$invalid">email is invalid.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- Password-->
            <label class="form-label col-md-2" for="password">Password</label>

            <div class="col-lg-4">
                <input type="password" id="password" name="password" ng-model="password"
                       placeholder="enter password"
                       class="form-control" required>
                <span style="color:red" ng-show="RegForm.password.$dirty && RegForm.password.$error.required">password is required.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- Password -->
            <label class="form-label col-md-2" for="password_confirm">Password (Confirm)</label>

            <div class="col-lg-4">
                <input type="password" id="password_confirm" name="password_confirm" ng-model="password_confirm"
                       placeholder="reenter the password "
                       class="form-control" required>
                        <span style="color:red"
                              ng-show="RegForm.password_confirm.$dirty && RegForm.password_confirm.$error.required">password is required.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- Button -->
            <div class="controls">
                <button class="btn btn-success" ng-disabled="RegForm.$invalid && password == password_confirm ">
                    Register
                </button>
                <span style="color:red"
                      ng-show="password != password_confirm ">password and confirm are not the same!.</span>

            </div>
        </div>
    </form>
</div>