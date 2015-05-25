<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User" %>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/angular.min.js"></script>
    <script src="/js/app.js"></script>

    <title>${param.title}</title>
</head>
<body ng-app="conPApp" id="body_css">
<!-- Static navbar -->
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"  id="company_name"></a>
    </div>
    <div class="navbar-collapse collapse">

        <!-- Left nav -->
        <ul class="nav navbar-nav">
            <li class="${( param.content == 'home') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li class="${( param.content == 'service') ? 'active' : param.content}"><a href="#">Service</a></li>

            <li class="${( param.content == 'about') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=about">About</a></li>
            <li class="${( param.content == 'customization') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=customization">Customization</a></li>
            <li class="${( param.content == 'midEdit') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=midEdit">edit</a></li>
        </ul>

        <!-- Right nav -->
        <form name="logoutForm" method="POST" action="${pageContext.request.contextPath}/LogoutServlet">
            <ul class="nav navbar-nav navbar-right">
                <% User currentUser = (User) (session.getAttribute("currentUser"));
                    if (currentUser != null) {
                %>
                <li>
                    <a>Welcome <%= currentUser.getFirstName() + " " + currentUser.getLastName() %>
                    </a>
                </li>
                <li >
                    <p class="navbar-btn">
                        <input type="submit" class="btn btn-warning" value="Logout" />
                    </p>
                </li>
                <% } else { %>
                <li><a href="${pageContext.request.contextPath}/index.jsp?content=login">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp?content=register">Register</a></li>
                <% } %>
            </ul>
        </form>
    </div>
    <!--/.nav-collapse -->
</div>