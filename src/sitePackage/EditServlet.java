package sitePackage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "EditServlet",urlPatterns={"/EditServlet"})
public class EditServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try
        {

            for (Cookie cook :request.getCookies() ) {
                System.out.println(cook.toString());
            }


        }
        catch (Throwable theException)
        {
            System.out.println(theException);
        }
    }
}
