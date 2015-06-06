package Feedback;

import sitePackage.ConnectionManager;
import sitePackage.User;
import sitePackage.UserDAO;
import tokbox.SessionOb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class Feedback {

    private int id;
    private String title;
    private String content;
    private SessionOb sob;
    private User created_by;
    private User written_on;

    static Connection connection = null;
    static ResultSet rs = null;

    public Feedback() {
        this.title = null;
        this.content = null;
        this.sob = null;
        this.created_by = null;
        this.written_on = null;
    }

    public Feedback(String title,String content,SessionOb sob, User created_by, User written_on) {
        this.title = title;
        this.content = content;
        this.sob = sob;
        this.created_by = created_by;
        this.written_on = written_on;
    }

    /***
     * Save Session
     * @param fb
     */
    public static void saveFeedback(Feedback fb) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "INSERT INTO feedbacks (title,content,session_id,created_by,written_on) VALUES (?,?,?,?,?)";
            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, fb.getTitle());
            psmtp.setString(2, fb.getContent());
            psmtp.setInt(3, (int) fb.getSob().getId());
            psmtp.setInt(4, (int) fb.getCreated_by().getId());
            psmtp.setInt(5, (int) fb.getWritten_on().getId());

            psmtp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Update existing Feedback
     *
     * @param feedback
     */
    public static void updateFeedback(Feedback feedback) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {

            String sqlQuery = "UPDATE feedbacks SET title = ? , content = ? ,session_id = ?, created_by = ?, written_on = ? WHERE id= ?";

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, feedback.getTitle());
            psmtp.setString(2, feedback.getContent());
            psmtp.setInt(3, (int) feedback.getSob().getId());
            psmtp.setInt(4, (int) feedback.getCreated_by().getId());
            psmtp.setInt(5, (int) feedback.getWritten_on().getId());
            psmtp.setInt(6, feedback.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Delete existing Feedback
     *
     * @param feedback
     */
    public static void deleteFeedback(Feedback feedback) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "DELETE FROM feedbacks WHERE id = ?";

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setInt(1, feedback.getId());

            psmtp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /***
     * Get Sessions
     * @return List<SessionOb>
     */
    public static List<Feedback> getFeedbacks() {

        List<Feedback> feedbacks = new ArrayList<Feedback>();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from feedbacks";

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {

                Feedback sob = new Feedback();

                sob.setId(Integer.parseInt(rs.getString("id")));
                sob.setTitle(rs.getString("title"));
                sob.setContent(rs.getString("content"));
                sob.setSessionById(rs.getInt("session_id"));
                sob.setCreatedByById(rs.getInt("created_by"));
                sob.setWrittenOnById(rs.getInt("written_on"));

                feedbacks.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return feedbacks;
    }

    private void setCreatedByById(int created_by) {
        this.created_by = UserDAO.getUserById((long)created_by);
    }

    private void setWrittenOnById(int written_on) {
        this.written_on = UserDAO.getUserById((long)written_on);
    }

    // get feedback by client id

    /**
     * works for both employee and client
     *
     * @param bean - object of user class , either an employee or a client
     * @return list of the feedback by the same user  or employee , in case the user is not iether of them, the function will return null
     */
    public static List<Feedback> getFeedbacks(User bean) {

        List<Feedback> feedbacks = new ArrayList<Feedback>();

        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();
            String sqlQuery = null;
            if(bean.getRole() =="User") {
                sqlQuery = "select * from feedbacks where session_id in (SELECT id FROM sessions WHERE client_id = ?)";
            }
            else if(bean.getRole() =="Employee"){
                sqlQuery = "select * from feedbacks where session_id in (SELECT id FROM sessions WHERE employee_id = ?)";
            }else {
                return null;
            }
            psmtp = connection.prepareStatement(sqlQuery);
            psmtp.setLong(1, bean.getId());

            rs = psmtp.executeQuery();

            while (rs.next()) {

                Feedback sob = new Feedback();

                sob.setTitle(rs.getString("title"));
                sob.setContent(rs.getString("content"));
                sob.setSessionById(rs.getInt("session_id"));
                sob.setCreatedByById(rs.getInt("created_by"));
                sob.setWrittenOnById(rs.getInt("written_on"));

                feedbacks.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return feedbacks;
    }

    //  get avg rate feedback for client by client id
    //  get avg rate feedback for employee by employee id


    /***
     * Get Articles By Id
     * @param id
     * @return List<Article>
     */
    public static Feedback getFeedbackById(int id) {

        Feedback feedback = new Feedback();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from feedbacks where id = "+id;

            rs = stmt.executeQuery(searchQuery);

            if (rs.next()) {
                feedback.setId(rs.getInt("id"));
                feedback.setTitle(rs.getString("title"));
                feedback.setContent(rs.getString("content"));
                feedback.setSessionById(rs.getInt("session_id"));
                feedback.setCreatedByById(rs.getInt("created_by"));
                feedback.setWrittenOnById(rs.getInt("written_on"));
            }
            else{
                return null;
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return feedback;
    }

//    public static Long avfRateFeedback(User bean) {
//
//        PreparedStatement psmtp = null;
//
//        Long ret = null;
//
//        connection = ConnectionManager.getConnection();
//
//        try {
//
//            String sqlQuery;
//
//            if(bean.getRole() =="User") {
//                sqlQuery = "SELECT  AVG(rate) FROM feedbacks WHERE session_id in  (SELECT id FROM sessions WHERE client_id = ?)" ; // tested and working
//            }
//            else if(bean.getRole() =="Employee"){
//                sqlQuery = "SELECT  AVG(rate) FROM feedbacks where session_id in (SELECT id FROM sessions WHERE employee_id = ?)";//tested and working
//            }else {
//                return null;
//            }
//            psmtp = connection.prepareStatement(sqlQuery);
//            psmtp.setLong(1, bean.getId());
//
//
//
//
//
//
//            rs = psmtp.executeQuery(sqlQuery);
//
//            ret = Long.valueOf(rs.toString());
//        } catch (Exception ex) {
//            System.out.println("Log In failed: An Exception has occurred! " + ex);
//        }
//
//        return ret;
//    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public SessionOb getSob() {
        return sob;
    }

    public void setSession(SessionOb sob) {
        this.sob = sob;
    }

    public void setSessionById(int sessionById) {
        this.sob = SessionOb.getSessionById(sessionById);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getCreated_by() {
        return created_by;
    }

    public void setCreated_by(User created_by) {
        this.created_by = created_by;
    }

    public User getWritten_on() {
        return written_on;
    }

    public void setWritten_on(User written_on) {
        this.written_on = written_on;
    }
}
