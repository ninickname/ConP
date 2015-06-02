<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.User" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,
      initial-scale=1" />
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/angular.min.js"></script>
    <script src="/js/app.js"></script>
    <script src="/js/ui-bootstrap-tpls-0.13.0.min.js"></script>


    <title>${param.title}</title>

</head>
<%--"body_css"--%>
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
            <% User currentUser =  (User)(session.getAttribute("user"));%>
            <li class="${( param.content == 'home') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li class="${( param.content == 'about') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=about">About</a></li>
            <li class="${( param.content == 'articles') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=articles">Articles</a></li>

            <% if (currentUser != null && (currentUser.getRole().equals("Admin")||currentUser.getRole().equals("Manager"))){ %>
            <li class="${( param.content == 'customization') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=customization">Customization</a></li>
            <% } if (currentUser != null && (currentUser.getRole().equals("Admin")||currentUser.getRole().equals("Manager")||currentUser.getRole().equals("Employee"))){ %>
            <li class="${( param.content == 'midEdit') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=midEdit">Manage users</a></li>
            <%} if (currentUser != null && (currentUser.getRole().equals("Employee"))){%>
            <li class="${( param.content == 'callPool') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=callPool">Open sessions</a></li>
            <%} if (currentUser != null && (currentUser.getRole().equals("User"))){%>
            <li class="${( param.content == 'video_call') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=video_call">Open session</a></li>
            <%} if (currentUser != null && (currentUser.getRole().equals("Admin")||currentUser.getRole().equals("Manager"))){%>
            <li class="${( param.content == 'admin/adminPage') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=admin/adminPage">Administration</a></li>
            <%} if (currentUser != null && (currentUser.getRole().equals("User"))){%>
            <li class="${( param.content == 'client/clientPage') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=client/clientPage">Create session</a></li>
            <%} if (currentUser != null && (currentUser.getRole().equals("Employee"))){%>
            <li class="${( param.content == 'client/clientPage') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=employee/employeePage">My Employee page</a></li>
            <%} if (currentUser != null && (currentUser.getRole().equals("Manager"))){%>
            <li class="${( param.content == 'client/clientPage') ? 'active' : param.content}"><a
                    href="${pageContext.request.contextPath}/index.jsp?content=manager/managerPage">My Manager page</a></li>
            <%}%>

        </ul>

        <!-- Right nav -->
        <form name="logoutForm" method="POST" action="${pageContext.request.contextPath}/LogoutServlet">
            <ul class="nav navbar-nav navbar-right">
                <% if (currentUser != null) {%>
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