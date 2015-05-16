package tokbox;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;


@WebServlet(name = "tokboxServlet",urlPatterns={"/tokboxServlet"})
public class tokboxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // inside a class or method...
        int apiKey = 45238382; // YOUR API KEY
        String apiSecret = "b94b18893ae6661e08d14729315543717472cc33";

        OpenTok opentok = new OpenTok(apiKey, apiSecret);

//        int apiKey = 45238382; // YOUR API KEY
//        String apiSecret = "Secret: b94b18893ae6661e08d14729315543717472cc33";
//        try {
//            OpenTok opentok = new OpenTok(apiKey, apiSecret);
//        }
//        catch (Exception e) {
//            e.printStackTrace();
//        }

//        https://api.opentok.com/session/create
//        Session session=null;
//        try {
//            session  = opentok.createSession();
//        } catch (OpenTokException e) {
//            e.printStackTrace();
//        }
//
//        String sessionId = session.getSessionId();
//        System.out.println("Got an session id "+sessionId);
//        SessionOb sessionp = new SessionOb(null,sessionId,true);

        response.sendRedirect("index.jsp?content=client/clientPage&apiKey=123&sessionId=123&token=123");
    }
}
