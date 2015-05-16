package sitePackage;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Customization {

    private String company_name;

    public Customization(){
        this.company_name = null;
    }

    public Customization(String company_name){
        this.company_name = company_name;
    }

    public Customization(Customization cus)
    {
        this.company_name = cus.company_name;
    }

    public void setCompanyName(String company_name) {

        this.company_name = company_name;
    }

    public void getData()
    {

        JSONParser parser = new JSONParser();
        try {
            Object obj = parser.parse(new FileReader("../data/conf_main.json"));

            JSONObject jsonObject = (JSONObject) obj;

            this.company_name = (String) jsonObject.get("company_name");
            System.out.println("Name Of Country: "+this.company_name);

//            System.out.println("States are :");
//            JSONArray listOfStates = (JSONArray) jsonObject.get("States");
//            Iterator<String> iterator = listOfStates.iterator();
//            while (iterator.hasNext()) {
//                System.out.println(iterator.next());
//            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public void saveData()
    {

    }
}
