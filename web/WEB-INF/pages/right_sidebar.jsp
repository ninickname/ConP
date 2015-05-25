<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.UserDAO,javax.servlet.http.Cookie" %>
<%@ page import="static sitePackage.UserDAO.*" %>
<%@ page import="tokbox.SessionOb" %>

<%
    String role = null;
    Cookie cookie = null;
    Cookie[] cookies;
    cookies = request.getCookies();
    if( cookies != null)
    {
        for (Cookie cooky : cookies) {
            cookie = cooky;
            String b = cookie.getName();
            if(b.equals("role")){
                role = getRoleFromCookie(cookie);
                break;
            }
        }
    }

%>
<%

    if(role != null && role.equals("Admin"))
    {%>

<div class="well">
    <legend>System data</legend>
    <ul class="list-group">
        <li class="list-group-item"><span class="badge"><%= SessionOb.getAllRunningSessions().size()%></span>running calls: </li>
        <li class="list-group-item"><span class="badge"><%= UserDAO.getUnregisteredClientsList().size()%></span>waiting for approval: </li>
    </ul>
    <hr>
    <ul class="list-group">
        <li class="list-group-item"><a href="#">Change personal data</a></li>
        <li class="list-group-item"><a href="#">Change personal data</a></li>
        <li class="list-group-item"><a href="#">Change personal data</a></li>
        <li class="list-group-item"><a href="#">Change personal data</a></li>
        <li class="list-group-item"><a href="#">Change personal data</a></li>
    </ul>
</div>

<%
    }
%>