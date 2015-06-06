package Article;

import Article.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditArticleServlet", urlPatterns = {"/EditArticleServlet"})
public class EditArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null){
            response.sendRedirect("index.jsp");
        }
        Article article = Article.getArticleById(Integer.parseInt(request.getParameter("id")));
        article.setTitle(request.getParameter("title"));
        article.setContent(request.getParameter("content"));
        article.setImg_url(request.getParameter("img_url"));

        Article.updateArticle(article);

        response.sendRedirect("index.jsp?content=article&id="+article.getId());
    }
}
