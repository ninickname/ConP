package sitePackage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "RegisterServlet",urlPatterns={"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        User user = new User();
        user.setFirstName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setUserName(request.getParameter("user_name"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));

        boolean ans = UserDAO.register(user);

        if (ans) {
            response.sendRedirect("index.jsp");
        } else {
            HttpSession session = request.getSession(true);
            session.invalidate();
            request.setAttribute("errorMessage", "the user is exist!!!");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?content=register");
            rd.forward(request, response);
        }
    }
}
