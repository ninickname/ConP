package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MidEditServlet",urlPatterns={"/MidEditServlet"})
public class MidEditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null){
            response.sendRedirect("index.jsp");
        }
        User userToEdit = UserDAO.getUserById( new Long(request.getParameter("id").trim()) );
        request.getSession().setAttribute("userToEdit" , userToEdit );
        response.sendRedirect("index.jsp?content=editPage");
    }
}