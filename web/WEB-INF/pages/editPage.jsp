<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.UserDAO" import="sitePackage.User" %>
<%@ page import="java.util.ArrayList" %>

<legend class="">Edit :</legend>
<div class="well">
    <!-- form for the dropdown list -->


    <%
        User user = (User) (request.getSession().getAttribute("userToEdit"));
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
            $scope.role = "<%=user.getRole()%>"

        });
    </script>


    <form class="form-horizontal"
          action='EditServlet'
          method="POST"
          name="editUserController"
          ng-controller="editUserController">

        <div class="form-group">
            <!-- first name -->
            <label class="form-label col-md-2" for="first_name">First name:</label>

            <div class="col-lg-4">
                <input type="text" id="first_name" name="first_name" ng-model="first_name"
                       placeholder="Enter first name"
                       class="form-control" required>
                        <span style="color:red"
                              ng-show="editUserController.first_name.$dirty && editUserController.first_name.$error.required">first name is required.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- last name -->
            <label class="form-label col-md-2" for="last_name">Last name:</label>

            <div class="col-lg-4">
                <input type="text" id="last_name" name="last_name" ng-model="last_name"
                       placeholder="Enter last name"
                       class="form-control" required>

                <span style="color:red" ng-show="editUserController.last_name.$dirty && editUserController.last_name.$error.required">last name is required.</span>
            </div>
        </div>


        <div class="form-group">
            <!-- ID -->
            <label class="form-label col-md-2" for="id">ID</label>

            <div class="col-lg-4">
                <input type="text"  id="id" name="id" ng-model="id" placeholder="Enter ID"
                       class="form-control" required>
                <span style="color:red" ng-show="editUserController.id.$dirty && editUserController.id.$error.required ">ID is required.</span>
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
                <span style="color:red" ng-show="editUserController.user_name.$dirty && editUserController.user_name.$error.required">user name is required.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- E-mail -->
            <label class="form-label col-md-2" for="email">E-mail</label>

            <div class="col-lg-4">
                <input type="email" id="email" name="email" ng-model="email" placeholder="enter email"
                       class="form-control"
                       required>
                <span style="color:red" ng-show="editUserController.email.$dirty && editUserController.email.$error.required">email is required.</span>
                <span style="color:red"
                      ng-show="editUserController.email.$dirty && editUserController.email.$invalid">email is invalid.</span>
            </div>
        </div>
        <div class="form-group">
            <!-- Password-->
            <label class="form-label col-md-2" for="password">New Password</label>

            <div class="col-lg-4">
                <input type="password" id="password" name="password" ng-model="password"
                       placeholder="enter password"
                       class="form-control" >
                <span style="color:red" ng-show="editUserController.password">fill in in case you want to update the password.</span>
            </div>
        </div>

        <div class="form-group">
            <!-- Password-->
            <label class="form-label col-md-2" for="role">Role</label>

            <div class="col-lg-4">

                <select class="form-control" ng-model="role" name="role" id="role">
                    <% for (String role :UserDAO.Roles){
                        %><option value="<%=role%>"><%=role%></option><%
                    }
                    %>

                </select>
            </div>
        </div>
        <div class="form-group">
            <!-- Button -->
            <div class="controls col-md-offset-2">
                <button class="btn btn-success" ><!-- ng-disabled="editUserController.$invalid "     -->
                    Update
                </button>
            </div>
        </div>
    </form>
</div>