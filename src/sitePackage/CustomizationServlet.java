package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomizationServlet", urlPatterns={"/CustomizationServlet"})
public class CustomizationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String company_name = request.getParameter("company_name");

        Customization cus = new Customization();

        cus.getData();

        cus.setCompanyName(company_name);

        cus.saveData();

        response.sendRedirect("index.jsp?content=home&cmp="+company_name);

    }
}
