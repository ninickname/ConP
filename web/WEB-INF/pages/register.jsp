<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="legend">
    <legend class="">Registration:</legend>
</div>
<form class="form-horizontal" action='RegisterServlet' method="POST">
    <div class="form-group">
        <!-- Username -->
        <label class="form-label col-md-2" for="first_name">First name:</label>

        <div class="col-lg-4">
            <input type="text" id="first_name" name="first_name" placeholder="" class="form-control">
            <p class="help-block">Username can contain any letters or numbers, without spaces</p>
        </div>
    </div>
    <div class="form-group">
        <!-- Username -->
        <label class="form-label col-md-2" for="last_name">Last name:</label>

        <div class="col-lg-4">
            <input type="text" id="last_name" name="last_name" placeholder="" class="form-control">
            <p class="help-block">Username can contain any letters or numbers, without spaces</p>
        </div>
    </div>
    <div class="form-group">
        <!-- Username -->
        <label class="form-label col-md-2" for="user_name">Username</label>

        <div class="col-lg-4">
            <input type="text" id="user_name" name="user_name" placeholder="" class="form-control">
            <p class="help-block">Username can contain any letters or numbers, without spaces</p>
        </div>
    </div>
    <div class="form-group">
        <!-- E-mail -->
        <label class="form-label col-md-2" for="email">E-mail</label>

        <div class="col-lg-4">
            <input type="text" id="email" name="email" placeholder="" class="form-control">

            <p class="help-block">Please provide your E-mail</p>
        </div>
    </div>
    <div class="form-group">
        <!-- Password-->
        <label class="form-label col-md-2" for="password">Password</label>

        <div class="col-lg-4">
            <input type="password" id="password" name="password" placeholder="" class="form-control">

            <p class="help-block">Password should be at least 4 characters</p>
        </div>
    </div>
    <div class="form-group">
        <!-- Password -->
        <label class="form-label col-md-2" for="password_confirm">Password (Confirm)</label>

        <div class="col-lg-4">
            <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="form-control">

            <p class="help-block">Please confirm password</p>
        </div>
    </div>
    <div class="form-group">
        <!-- Button -->
        <div class="controls">
            <button class="btn btn-success">Register</button>
        </div>
    </div>
</form>