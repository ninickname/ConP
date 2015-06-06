package Feedback;

import sitePackage.User;
import tokbox.SessionOb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "newFeedbackServlet",urlPatterns={"/newFeedbackServlet"})
public class newFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User currentUser = (User)request.getSession().getAttribute("user");

        Feedback feedback = new Feedback();

        feedback.setTitle(request.getParameter("title"));
        feedback.setContent(request.getParameter("content"));

        SessionOb sob = SessionOb.getSessionById(Integer.parseInt(request.getParameter("session_id")));

        feedback.setSession(sob);

        if(sob.getClient().getId() != currentUser.getId())
            feedback.setWritten_on(sob.getClient());
        else
            feedback.setWritten_on(sob.getEmployee());
        feedback.setCreated_by(currentUser);

        Feedback.saveFeedback(feedback);

        response.sendRedirect("index.jsp?content=feedbacks");
    }
}
