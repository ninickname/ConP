<%--
  Created by IntelliJ IDEA.
  User: AP
  Date: 01/05/2015
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User"%>
<html>
<head>
    <title>User Logged Successfully!</title>
</head>
<body>
    <label>
        <% User currentUser =  (User)(session.getAttribute("currentUser"));
            if(currentUser == null ){response.sendRedirect("index.jsp");}
        %>

        Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
    </label>
</body>
</html>
