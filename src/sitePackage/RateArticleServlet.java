package sitePackage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RateArticleServlet",urlPatterns={"/RateArticleServlet"})
public class RateArticleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User)(request.getSession().getAttribute("user"));

        if(currentUser==null)
            response.sendRedirect("index.jsp");

        HttpSession session = request.getSession(true);
        User user = (User) request.getSession().getAttribute("user");

        System.out.println(request.getParameterNames().toString());
        Article.addRate(Integer.parseInt(
                request.getParameter("article_id")),
                Integer.parseInt(request.getParameter("rate")),
                (int)user.getId());

        String forwardTo= request.getParameter("forwardTo");
        RequestDispatcher view = getServletContext().getRequestDispatcher(forwardTo);
        view.forward(request, response);
    }
}
