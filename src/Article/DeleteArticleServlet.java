package Article;

import Article.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteArticleServlet", urlPatterns = {"/DeleteArticleServlet"})
public class DeleteArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null){
            response.sendRedirect("index.jsp");
        }
        Article article = Article.getArticleById(Integer.parseInt(request.getParameter("article_idd")));

        Article.deleteArticle(article);

        response.sendRedirect("index.jsp?content=articles");
    }
}
