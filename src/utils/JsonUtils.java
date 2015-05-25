package utils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.FileReader;

/**
 * Created by maxim on 18/05/2015.
 */
public class JsonUtils {

    public static String JsonFileToString(String pathToJson) {
        assert pathToJson != null;
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try{
            //System.getProperty("user.dir")
            Object obj = parser.parse(new FileReader(pathToJson));
            jsonObject = (JSONObject)obj;
        }
        catch (Exception ex){
            System.out.println("Error while opening json file at "+ pathToJson +" "+ ex);
        }

        assert jsonObject != null;
        return jsonObject.toString();
    }
}
