package tokbox;

import sitePackage.User;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import com.opentok.OpenTok;
import com.opentok.Session;
import com.opentok.exception.OpenTokException;

import static tokbox.TokBoxApi.*;

public class SessionOb {

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    private Boolean isActive;
    private User client;
    //tokbox
    public String sessionId;

    public static List<SessionOb> currentSessions = new ArrayList<SessionOb>();

    public SessionOb(User client , String sessionId , Boolean isActive)
    {
        this.client = client;
        this.sessionId = sessionId;
        this.isActive = isActive;

        SessionOb.addNewSession(this);
    }

    public static void addNewSession(SessionOb ses)
    {
        currentSessions.add(ses);
    }

    public static String getToken(String sessionId) {

        String token = "";
        try {

            // Generate token for sessionId
            token = opentok.generateToken(sessionId);

        } catch (OpenTokException e) {
            e.printStackTrace();
            token = "error!";
        }

        return token;
    }



}
