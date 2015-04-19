<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <title>${param.title}</title>
</head>
<body>
<!-- Static navbar -->
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Project name</a>
    </div>
    <div class="navbar-collapse collapse">

        <!-- Left nav -->
        <ul class="nav navbar-nav">
            <li class="${( param.content == 'home') ? 'active' : param.content}"><a href="${pageContext.request.contextPath}/index.jsp" >Home</a></li>
            <li class="${( param.content == 'service') ? 'active' : param.content}"><a href="#">Service</a></li>
            <li class="${( param.content == 'about') ? 'active' : param.content}"><a href="${pageContext.request.contextPath}/index.jsp?content=about">About</a></li>
            <li class="${( param.content == 'bootstrapping') ? 'active' : param.content}"><a href="${pageContext.request.contextPath}/index.jsp?content=bootstrapping">NickRape</a></li>
            <li><a href="#">Dropdown</a>
                <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">A long sub menu</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="disabled"><a class="disabled" href="#">Disabled item</a></li>
                                    <li><a href="#">One more link</a></li>
                                    <li><a href="#">Menu item 1</a></li>
                                    <li><a href="#">Menu item 2</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Another link</a></li>
                            <li><a href="#">One more link</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- Right nav -->
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/index.jsp?content=login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp?content=registration">Register</a></li>
        </ul>
    </div><!--/.nav-collapse -->
</div>