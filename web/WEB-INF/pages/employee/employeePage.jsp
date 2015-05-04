<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User"%>

<label>
    <% User currentUser =  (User)(session.getAttribute("currentUser"));
        if(currentUser == null ){response.sendRedirect("index.jsp");}
    %>

    Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
</label>