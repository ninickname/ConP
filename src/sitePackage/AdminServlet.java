package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"} )
public class AdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.getWriter().write("<h1> this is an admin page </h1>");
        response.getWriter().write("<h2>current time is " + new Date().toString() +" </h2>");
        response.getWriter().write("<h2>this is a secure admin page with basic login , works even when db is down.</h2>");
        try {
            ConnectionManager.getConnection().equals( "a");
        }catch (NullPointerException ex) {
            response.getWriter().write("<h2>Currently the db is down! </h2>");

        }
        response.getWriter().flush();

    }
}
