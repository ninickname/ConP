package Feedback;

import sitePackage.ConnectionManager;
import sitePackage.User;
import tokbox.SessionOb;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class Feedback {

    private int rate;
    private String title;
    private String content;
    private SessionOb sob;

    static Connection connection = null;
    static ResultSet rs = null;

    public Feedback() {
        this.rate = 0;
        this.title = null;
        this.content = null;
        this.sob = null;
    }

    public Feedback(int rate, String title,String content,SessionOb sob) {
        this.rate = rate;
        this.title = title;
        this.content = content;
        this.sob = sob;

        saveFeedback(this);
    }

    /***
     * Save Session
     * @param sob
     */
    public static void saveFeedback(Feedback fb) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "INSERT INTO feedbacks (rate,title,content,session_id) VALUES (?,?,?,?)";
            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setInt(1, fb.getRate());
            psmtp.setString(2, fb.getTitle());
            psmtp.setString(3, fb.getContent());
            psmtp.setInt(4, Integer.parseInt(fb.getSob().getSessionId()));

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

                sob.setRate(rs.getInt("rate"));
                sob.setTitle(rs.getString("title"));
                sob.setContent(rs.getString("content"));
                sob.setSessionById(rs.getInt("session_id"));

                feedbacks.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return feedbacks;
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

                sob.setRate(rs.getInt("rate"));
                sob.setTitle(rs.getString("title"));
                sob.setContent(rs.getString("content"));
                sob.setSessionById(rs.getInt("session_id"));

                feedbacks.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return feedbacks;
    }

    //  get avg rate feedback for client by client id
    //  get avg rate feedback for employee by employee id



    public static Long avfRateFeedback(User bean) {

        PreparedStatement psmtp = null;

        Long ret = null;

        connection = ConnectionManager.getConnection();

        try {

            String sqlQuery;

            if(bean.getRole() =="User") {
                sqlQuery = "SELECT  AVG(rate) FROM feedbacks WHERE session_id in  (SELECT id FROM sessions WHERE client_id = ?)" ; // tested and working
            }
            else if(bean.getRole() =="Employee"){
                sqlQuery = "SELECT  AVG(rate) FROM feedbacks where session_id in (SELECT id FROM sessions WHERE employee_id = ?)";//tested and working
            }else {
                return null;
            }
            psmtp = connection.prepareStatement(sqlQuery);
            psmtp.setLong(1, bean.getId());






            rs = psmtp.executeQuery(sqlQuery);

            ret = Long.valueOf(rs.toString());
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return ret;
    }



    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

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
}
