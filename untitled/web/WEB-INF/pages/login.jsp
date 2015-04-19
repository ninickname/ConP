<%--
  Created by IntelliJ IDEA.
  User: AP
  Date: 14/03/2015
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-6">
        <legend>Sample Form:</legend>
        <div class="well">
            <form action="DemoServlet">
                <div class="form-group">
                    <label >Email address</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label >Password</label>
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