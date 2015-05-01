package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet",urlPatterns={"/LoginServlet"})
public class LoginServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try
        {

            User user = new User();
            user.setUserName(request.getParameter("user_name"));
            user.setPassword(request.getParameter("password"));

            user = UserDAO.login(user);

            if (user.isValid())
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentUser",user);

                // Check role of the user
                int role = 1;
                switch(role)
                {
                    case 0:
                        break;
                    case 1:
                        response.sendRedirect("index.jsp?content=client/clientPage");
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    default:
                        response.sendRedirect("index.jsp");
                        break;
                }
            }

            else
                response.sendRedirect("index.jsp?content=login"); //error page
        }


        catch (Throwable theException)
        {
            System.out.println(theException);
        }

        PrintWriter writer = response.getWriter();
        writer.println("This is sparta!");
    }
}
