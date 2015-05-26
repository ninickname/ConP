package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LogoutServlet",urlPatterns={"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }
}