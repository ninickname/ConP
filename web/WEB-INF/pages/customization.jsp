<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User" %>


<div class="well">
    <form action="CustomizationServlet" class="form-horizontal"  method="POST">
        <legend>Company Name:</legend>
        <div class="form-group">
            <!-- Username -->
            <label class="form-label col-md-2" for="company_name">Company name:</label>
            <div class="col-lg-4">
                <input type="text" id="company_name" name="company_name" ng-model="company_name" placeholder="Enter company name" class="form-control" >
            </div>
        </div>
        <legend>Body css:</legend>
        <div class="form-group">
            <!-- Username -->
            <label class="form-label col-md-2" for="background">Background:</label>
            <div class="col-lg-4">
                <input type="text" id="background" name="background" ng-model="background" placeholder="Enter css code" class="form-control" >
            </div>
        </div>
        <legend>Navbar css:</legend>
        <div class="form-group">
            <!-- Button -->
            <div class="controls">
                <button class="btn btn-success" ng-disabled="RegForm.$invalid">Save</button>
            </div>
        </div>
    </form>
</div>
