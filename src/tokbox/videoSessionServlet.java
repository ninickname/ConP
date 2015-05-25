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

@WebServlet(name = "videoSessionServlet",urlPatterns={"/endVideoCall"})
public class videoSessionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // client - sessionId - isActive
        for (SessionOb ses : SessionOb.currentSessions)
        {
            if(ses.sessionId.equals(request.getParameter("sessionId"))){
                //SessionOb.currentSessions.remove(ses);
                ses.setIsActive(false);

                break;
                
            }
        }


    }
}
