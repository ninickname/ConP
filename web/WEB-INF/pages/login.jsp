<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-6">
        <legend>Login Form:</legend>
        <div class="well">
            <form method="post" action="LoginServlet">
                <div class="form-group">
                    <label>User Name:</label>
                    <input type="text" class="form-control" name="user_name" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label >Password:</label>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </div>
</div>