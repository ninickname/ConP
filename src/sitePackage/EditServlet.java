package sitePackage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
public class EditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = new User();
        user.setFirstName(request.getParameter("first_name"));
        user.setLastName(request.getParameter("last_name"));
        user.setUserName(request.getParameter("user_name"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setId(new Long(request.getParameter("id")));
        //before the change // request.getSession().getAttribute("user")
        //after the change // user
        boolean ans = UserDAO.updateUser(user , ((User) (request.getSession().getAttribute("user"))) , user.getPassword().equals("") );//TODO
        /*WTF , why there is if and else if they do the same ?  #Nick */
        if (true) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }

    }

}
