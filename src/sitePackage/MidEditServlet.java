package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MidEditServlet",urlPatterns={"/MidEditServlet"})
public class MidEditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User bean = UserDAO.getUserById(Long.parseLong(request.getParameter("dd_ID").trim().toString()));


        request.getSession().setAttribute("user", bean);

        request.getCookies();
        try {

            for (Cookie cook : request.getCookies()) {
                System.out.println(cook.toString());
            }


        } catch (Throwable theException) {
            System.out.println(theException);
        }
        response.sendRedirect("index.jsp?content=editPage");

    }
}