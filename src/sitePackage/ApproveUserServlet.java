package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Statement;

/**
 * Created by Yuval on 18/05/2015.
 */
@WebServlet(name = "ApproveUserServlet",urlPatterns={"/ApproveUserServlet"})
public class ApproveUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        User user = new User();
        user.setId(new Long(request.getParameter("text")));
        boolean check=UserDAO.Validclient(user);
        if (check)
             response.sendRedirect("index.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)(request.getSession().getAttribute("user"));

        if(currentUser==null)
            response.sendRedirect("index.jsp");

        else if(currentUser.getRole().equals("User") ||currentUser.getRole().equals("Unregistered"))
            response.sendRedirect("index.jsp");

        request.setAttribute("UsersList", UserDAO.ListClients());
        getServletContext().getRequestDispatcher("/WEB-INF/pages/list_clients.jsp").forward(request, response);
    }

}
