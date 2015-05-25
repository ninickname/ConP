<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User" %>


<div class="well">
    <form action="CustomizationServlet" class="form-horizontal"  method="POST">
        <legend>Body css:</legend>
        <div class="form-group">
            <!-- Username -->
            <label class="form-label col-md-2" for="body_css_background">Background:</label>
            <div class="col-lg-4">
                <input type="text" id="body_css_background" name="body_css.background-color" ng-model="body_css.background" placeholder="Enter css code" class="form-control" >
            </div>
        </div>
        <legend>Navbar css:</legend>
        <div class="form-group">
            <!-- Username -->
            <label class="form-label col-md-2" for="navbar_css_background">Background:</label>
            <div class="col-lg-4">
                <input type="text" id="navbar_css_background" name="navbar_css.background-color" ng-model="navbar_css.background" placeholder="Enter css code" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <!-- Username -->
            <label class="form-label col-md-2" for="navbar_css_border">border:</label>
            <div class="col-lg-4">
                <input type="text" id="navbar_css_border" name="navbar_css.border" ng-model="navbar_css.border" placeholder="Enter css code" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <!-- Button -->
            <div class="controls">
                <button class="btn btn-success" ng-disabled="RegForm.$invalid">Save</button>
            </div>
        </div>
    </form>
</div>

