package Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteFeedbackServlet", urlPatterns = {"/DeleteFeedbackServlet"})
public class DeleteFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null){
            response.sendRedirect("index.jsp");
        }
        Feedback feedback = Feedback.getFeedbackById(Integer.parseInt(request.getParameter("id")));

        Feedback.deleteFeedback(feedback);

        response.sendRedirect("index.jsp?content=feedbacks");
    }
}