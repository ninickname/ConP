package tokbox;

import com.opentok.OpenTok;
import com.opentok.Session;
import sitePackage.Configuration;

public class TokBoxApi {


    public static final int apiKey = Configuration.apiKey; // YOUR API KEY
    public static final String apiSecret = Configuration.apiSecret;

    public static OpenTok opentok;

    static {
        opentok = new OpenTok(apiKey, apiSecret);
    }

    public static String getTokBoxSession()
    {
        String sessionToReturn=null;

        try
        {
            if (opentok == null )
                opentok = new OpenTok(apiKey, apiSecret);

            Session session = opentok.createSession();

            sessionToReturn =  session.getSessionId();
        }
        catch(Exception ex){
            System.out.println(ex);
            return "error";
        }

        return sessionToReturn;
    }

    public static String getTokenForSession(String sessionId)
    {
        String tokenToReturn  = null;

        try {
            tokenToReturn= opentok.generateToken(sessionId);
        }
        catch(Exception ex){
            System.out.println(ex);
            return "error";
        }
        return tokenToReturn;
    }
}
