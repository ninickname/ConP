package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "newArticleServlet",urlPatterns={"/newArticleServlet"})
public class newArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User)request.getSession().getAttribute("user");

        Article article = new Article();
        article.setTitle(request.getParameter("title"));
        article.setContent(request.getParameter("content"));
        article.setImg_url(request.getParameter("img_url"));
        article.setCreated_by(currentUser);

        Article.saveArticle(article);

        response.sendRedirect("index.jsp?content=articles");
    }
}
