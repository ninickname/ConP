package tokbox;

import sitePackage.User;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class SessionOb {

    private Boolean isActive;
    private User client;
    //tokbox
    private String sessionId;

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

}
