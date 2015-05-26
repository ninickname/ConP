package sitePackage;

import java.sql.*;

/**
 * Created by User on 25/05/2015.
 */
class FeedbackDAO {

    static Connection connection = null;
    static ResultSet rs = null;

    public static boolean register(Feedback feedback) {

        //preparing some objects for connection
        Statement stmt = null;
        PreparedStatement psmtp = null;
        String sqlQuery;

        //connect to DB
        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            System.out.println("before querry");
            sqlQuery = "INSERT INTO feedback (id,sender_id,receiver_id,rate,content) VALUES (?, ?, ?, ?,?)";
            System.out.println(sqlQuery);

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, new Long(feedback.getId()).toString());
            psmtp.setString(2, new Long(feedback.getSender_id()).toString());
            psmtp.setString(3, new Long(feedback.getReceiver_id()).toString());
            psmtp.setString(4, new Long(feedback.getRate()).toString());
            psmtp.setString(5, feedback.getContent());

            psmtp.executeUpdate();

        } catch (SQLException e1) {
            e1.printStackTrace();
        }

        return true;
    }


}
