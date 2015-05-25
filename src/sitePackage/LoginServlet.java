package sitePackage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            User user = new User();
            user.setUserName(request.getParameter("user_name"));
            user.setPassword(request.getParameter("password"));

            user = UserDAO.login(user);

            if (user.isValid()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentUser", user);

                // Check role of the user
                String role = user.getRole();

                System.out.println("request = [" + request + "], response = [" + response + "]");
                System.out.println("role is " + role);
                Cookie a = new Cookie("role", "empty");

                a.setValue(BCrypt.hashpw(user.getRole(), UserDAO.salt));

                role = UserDAO.getRoleFromCookie(a);

                response.addCookie(a);

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