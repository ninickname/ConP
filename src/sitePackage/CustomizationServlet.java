package sitePackage;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet(name = "CustomizationServlet", urlPatterns={"/CustomizationServlet"})
public class CustomizationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String company_name = request.getParameter("company_name");
        LinkedHashMap<String, String[]> requesParameterstDict =  new LinkedHashMap<>( request.getParameterMap() ) ;
        String pathToJson = this.getServletContext().getRealPath("/data/conf_main.json");

        String s = JsonUtils.JsonFileToString(pathToJson);
        JSONObject obj = (JSONObject)JSONValue.parse(s);

        for(Map.Entry<String , String[]>  element : requesParameterstDict.entrySet()){
            String keyOfCurelement = element.getKey().split("\\.")[0];
            String subEelementKey = element.getKey().split("\\.")[1];
            String value;
            if (obj.containsKey(keyOfCurelement)) {
                value = element.getValue()[0];
                ((HashMap<String, String>) obj.get(keyOfCurelement)).put(subEelementKey, value);
            }
        }

        try {
            Writer writer = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(pathToJson), "utf-8"));
            writer.write(obj.toJSONString());
            writer.flush();
            writer.close();
        }

        catch (Exception ignored){}


        response.sendRedirect("index.jsp?content=home&cmp="+company_name);

    }
}