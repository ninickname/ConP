package tokbox;

import com.opentok.OpenTok;
import com.opentok.Session;


/**
 * Created by AP on 16/05/2015.
 */


public class TokBoxApi {


    public static final int apiKey = 45238382; // YOUR API KEY
    public static final String apiSecret = "Secret: b94b18893ae6661e08d14729315543717472cc33";
    private static int sessionTimeout =1*60*60; //7 * 24 * 60 * 60;
    public static OpenTok opentok = null;


    public static String getTokBoxSession()
    {
        String sessionToReturn=null;
        System.out.println("Getting Session");
        try
        {
            if (opentok == null )
                opentok = new OpenTok(apiKey, apiSecret);


            // A session that uses the OpenTok Media Router:
//            Session session = opentok.createSession(new SessionProperties.Builder()
//                    .mediaMode(MediaMode.ROUTED)
//                    .build());
            Session session = opentok.createSession();

            sessionToReturn =  session.getSessionId();
        }
        catch(Exception ex){
            System.out.println(ex);
        }

        return sessionToReturn;
    }

    public static String getTokenForSession(String sessionId)
    {
        String tokenToReturn  = null;

        try {
//            tokenToReturn = opentok.generateToken(sessionId, new TokenOptions.Builder()
//                    .role(Role.MODERATOR)
//                    .expireTime((System.currentTimeMillis() / 1000L) + (sessionTimeout)) // in one week
//                    .data("name=Johnny")
//                    .build());
            tokenToReturn= opentok.generateToken(sessionId);
        }
        catch(Exception ex){}
        System.out.println("Got an session id "+sessionId+" token is : "+tokenToReturn);
        return tokenToReturn;
    }

}
