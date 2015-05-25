package tokbox;

import com.opentok.OpenTok;
import com.opentok.Session;
import com.opentok.exception.OpenTokException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "tokboxServlet",urlPatterns={"/tokboxServlet"})
public class tokboxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // inside a class or method...
        int apiKey = 45238382; // YOUR API KEY
        String apiSecret = "b94b18893ae6661e08d14729315543717472cc33";
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
        SessionOb sessionp = new SessionOb(null,sessionId,true);
        response.sendRedirect("index.jsp?content=video_call&sessionId="+sessionId+"&token="+token);
    }
}
