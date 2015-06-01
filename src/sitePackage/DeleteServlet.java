package sitePackage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            User user = new User();
            user.setUserName(request.getParameter("user_name"));
            user.setPassword(request.getParameter("password"));

            user = UserDAO.login(user);

            if (user.isValid()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                String role = user.getRole();
                if (role.equals("User")) {
                    response.sendRedirect("index.jsp?content=client/clientPage");
                } else if (role.equals("Employee")) {
                    response.sendRedirect("index.jsp?content=employee/employeePage");
                } else if (role.equals("Manager")) {
                    response.sendRedirect("index.jsp?content=notImplemented");

                } else if (role.equals("Admin")) {
                    response.sendRedirect("index.jsp?content=notImplemented");
                } else if (role.equals("Unregistered")) {
                    response.sendRedirect("index.jsp?content=notImplemented");

                } else {
                    response.sendRedirect("index.jsp?content=notImplemented");
                }
            } else {
                // response.sendRedirect("index.jsp?content=login&errorMessage=popop"); //error page
                HttpSession session = request.getSession(true);
                session.invalidate();
                request.setAttribute("errorMessage", "Invalid user name or password");
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?content=login");
                rd.forward(request, response);


            }
        } catch (Throwable theException) {
            System.out.println(theException);
        }
    }
}
