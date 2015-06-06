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
import java.util.Date;

@WebServlet(name = "videoSessionServlet",urlPatterns={"/videoSessionServlet"})
public class videoSessionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SessionOb ses = SessionOb.getSessionById(Integer.parseInt(request.getParameter("id")));
        ses.setAborted_at(new Date());
        SessionOb.saveSession(ses);

        response.sendRedirect("index.jsp?content=createFeedback&session_id="+ses.getId()+"");
    }
}
