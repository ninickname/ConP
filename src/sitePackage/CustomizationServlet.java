package sitePackage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet(name = "CustomizationServlet", urlPatterns={"/CustomizationServlet"})
public class CustomizationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String company_name = request.getParameter("company_name");
        LinkedHashMap<String, String[]> keys_tovalues =  new LinkedHashMap<String, String[]>( request.getParameterMap() ) ;
        Customization cus = new Customization();

        for(Map.Entry<String , String[]>  element : keys_tovalues.entrySet()){
            System.out.println("KEY:");
            System.out.println(element.getKey());
            System.out.println("value");
            System.out.println(element.getValue()[0]);
        }

        cus.getData();

        cus.setCompanyName(company_name);

        cus.saveData();

        response.sendRedirect("index.jsp?content=home&cmp="+company_name);

    }
}
