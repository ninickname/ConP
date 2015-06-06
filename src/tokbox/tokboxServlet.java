package tokbox;

import com.opentok.OpenTok;
import com.opentok.Session;
import com.opentok.exception.OpenTokException;
import sitePackage.Configuration;
import sitePackage.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "tokboxServlet",urlPatterns={"/tokboxServlet"})
public class tokboxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // TODO: prevent from more then two users connect to the same session
        // TODO: get current user

        User currentUser = (User)(request.getSession().getAttribute("user"));

        if(currentUser==null)
            response.sendRedirect("index.jsp");

        int apiKey = Configuration.apiKey;
        String apiSecret = Configuration.apiSecret;

        String sessionId = null;
        String token = null;

        try {
            OpenTok opentok = new OpenTok(apiKey, apiSecret);

        Session session = null;
        try {
            // Create new session
            session  = opentok.createSession();

            // Get session id
            sessionId = session.getSessionId();

            // Generate token for sessionId
            token = opentok.generateToken(sessionId);

        } catch (OpenTokException e) {
            e.printStackTrace();
        }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        // client - sessionId - isActive
        SessionOb sessionp = new SessionOb(currentUser,null,sessionId);

        SessionOb New_sessionp = SessionOb.saveSession(sessionp);

        response.sendRedirect("index.jsp?content=video_call&id="+New_sessionp.getId());
    }

}
