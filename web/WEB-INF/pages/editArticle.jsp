<%@ page contentType="text/html;charset=UTF-8" language="java" import="sitePackage.Article,sitePackage.Article.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Article article = Article.getArticleById(id);

    if (article == null) {
        response.sendRedirect("index.jsp?content=articles");
    }

%>
<!-- form for the editing -->

<legend class="">Edit article:</legend>
<div class="well">
    <script>
        // create angular controller
        app.controller('editArticleController', function ($scope) {
            $scope.title = "<%=article.getTitle()%>";
            $scope.content = "<%=article.getContent()%>";
            $scope.img_url = "<%=article.getImg_url()%>";
        });
    </script>

    <form class="form-horizontal" action='newArticleServlet' method="POST" name="ArtForm" id="ArtForm" ng-controller="editArticleController">
        {{img_url}}
        <div class="form-group">
            <label class="form-label col-md-2" for="title">Title:</label>

            <div class="col-lg-4">
                <input type="text" id="title" name="title" ng-model="title"
                       placeholder="Enter title"
                       class="form-control" required>
                <span style="color:red" ng-show="ArtForm.title.$dirty && ArtForm.title.$error.required">Title is required.</span>
            </div>
        </div>
        <div class="form-group">
            <label class="form-label col-md-2" for="content">Content:</label>

            <div class="col-lg-4">
                <textarea id="content" name="content" ng-model="content" placeholder="Enter content"
                          class="form-control" required></textarea>
                <span style="color:red" ng-show="ArtForm.content.$dirty && ArtForm.content.$error.required">Content is required.</span>
            </div>
        </div>
        <div class="form-group">
            <label class="form-label col-md-2" for="title">Title:</label>

            <div class="col-lg-4">
                <input type="text" id="img_url" name="img_url" ng-model="img_url"
                       placeholder="Enter image url"
                       class="form-control" required>
                <span style="color:red" ng-show="ArtForm.img_url.$dirty && ArtForm.img_url.$error.required">Image url is required.</span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <img ng-src="{{img_url}}" class="img-rounded img-responsive col-md-6">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-success" ng-disabled="RegForm.$invalid && password == password_confirm ">
                    Create
                </button>
            </div>
        </div>
    </form>
</div>