package tokbox;

import sitePackage.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.opentok.OpenTok;
import com.opentok.Session;
import com.opentok.exception.OpenTokException;
import static tokbox.TokBoxApi.*;

public class SessionOb {

    private User client;
    private User employee;
    private String sessionId;
    private Date created_at;
    private Date aborted_at;

    static Connection connection = null;
    static ResultSet rs = null;

    public SessionOb() {
        this.client = null;
        this.employee = null;
        this.sessionId = null;
        this.created_at = null;
        this.aborted_at = null;

        saveSession(this);
    }

    public SessionOb(User client, User employee, String sessionId, Boolean isActive, Date created_at, Date aborted_at) {
        this.employee = employee;
        this.created_at = created_at;
        this.aborted_at = aborted_at;
        this.client = client;
        this.sessionId = sessionId;

        saveSession(this);
    }

    public SessionOb(User client, User employee, String sessionId) {
        this.employee = employee;
        this.created_at = new Date();
        this.aborted_at = null;
        this.client = client;
        this.sessionId = sessionId;

        saveSession(this);
    }

    public SessionOb(SessionOb sob) {
        this.employee = sob.getEmployee();
        this.created_at = sob.getCreated_at();
        this.aborted_at = sob.getAborted_at();
        this.client = sob.getClient();
        this.sessionId = sob.getSessionId();

        saveSession(this);
    }

    public static String getToken(String sessionId) {

        String token = "";
        try {

            // Generate token for sessionId
            token = opentok.generateToken(sessionId);

        } catch (OpenTokException e) {
            e.printStackTrace();
            token = "error!";
        }

        return token;
    }

    /***
     * Save Session
     * @param sob
     */
    public static void saveSession(SessionOb sob) {
        Statement stmt = null;
        PreparedStatement psmtp = null;

        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            String sqlQuery = "INSERT INTO sessions (client_id,employee_id,sessionId) VALUES (?,?,?)";

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setInt(1, (int) sob.getClient().getId());
            psmtp.setInt(2, (int) sob.getEmployee().getId());
            psmtp.setString(3, sob.getSessionId());

            psmtp.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // TODO: update session

    // TODO: delete session

    /***
     * Get Sessions
     * @return List<SessionOb>
     */
    public static List<SessionOb> getSessions() {

        List<SessionOb> sessions = new ArrayList<SessionOb>();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from sessions";

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {

                SessionOb sob = new SessionOb();

                sob.setClientById(rs.getInt("client_id"));
                sob.setEmployeeById(rs.getInt("employee_id"));
                sob.setSessionId(rs.getString("sessionId"));
                sob.setCreated_at(rs.getDate("created_at"));
                sob.setAborted_at(rs.getDate("aborted_at"));

                sessions.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return sessions;
    }

    /***
     * Get Active Sessions
     * @return List<SessionOb>
     */
    public static List<SessionOb> getActiveSessions() {

        List<SessionOb> sessions = new ArrayList<SessionOb>();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from sessions where aborted_at = NULL";

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {

                SessionOb sob = new SessionOb();

                sob.setClientById(rs.getInt("client_id"));
                sob.setEmployeeById(rs.getInt("employee_id"));
                sob.setSessionId(rs.getString("sessionId"));
                sob.setCreated_at(rs.getDate("created_at"));
                sob.setAborted_at(rs.getDate("aborted_at"));

                sessions.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return sessions;
    }

    /***
     * Get Sessions By Id
     * @param id
     * @return List<SessionOb>
     */
    public static SessionOb getSessionById(int id) {

        SessionOb session = null;
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from sessions where id = "+id;

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {
                session.setClientById(rs.getInt("client_id"));
                session.setEmployeeById(rs.getInt("employee_id"));
                session.setSessionId(rs.getString("sessionId"));
                session.setCreated_at(rs.getDate("created_at"));
                session.setAborted_at(rs.getDate("aborted_at"));

            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return session;
    }

    /***
     * Get Sessions By Client Id
     * @param id
     * @return List<SessionOb>
     */
    public static List<SessionOb> getSessionsByClientId(int id) {

        List<SessionOb> sessions = new ArrayList<SessionOb>();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from sessions where client_id = "+id;

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {

                SessionOb sob = new SessionOb();

                sob.setClientById(rs.getInt("client_id"));
                sob.setEmployeeById(rs.getInt("employee_id"));
                sob.setSessionId(rs.getString("sessionId"));
                sob.setCreated_at(rs.getDate("created_at"));
                sob.setAborted_at(rs.getDate("aborted_at"));

                sessions.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return sessions;
    }

    /***
     * Get Sessions By Employee Id
     * @param id
     * @return List<SessionOb>
     */
    public static List<SessionOb> getSessionsByEmployeeId(int id) {

        List<SessionOb> sessions = new ArrayList<SessionOb>();
        Statement stmt = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "select * from sessions where employee_id = "+id;

            rs = stmt.executeQuery(searchQuery);

            while (rs.next()) {

                SessionOb sob = new SessionOb();

                sob.setClientById(rs.getInt("client_id"));
                sob.setEmployeeById(rs.getInt("employee_id"));
                sob.setSessionId(rs.getString("sessionId"));
                sob.setCreated_at(rs.getDate("created_at"));
                sob.setAborted_at(rs.getDate("aborted_at"));

                sessions.add(sob);
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return sessions;
    }

    /***
     * Return average time of session in minutes.
     * @return long
     */
    public static Long getAverageSessionTime() {

        Statement stmt = null;

        Long avgTimeInMin = null;

        connection = ConnectionManager.getConnection();

        try {

            stmt = connection.createStatement();

            String searchQuery = "SELECT AVG(DATEDIFF(n, created_at, aborted_at)*1.0) AS avgDate" +
                    "    FROM sessions";

            rs = stmt.executeQuery(searchQuery);

            avgTimeInMin = Long.valueOf(rs.toString());
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        return avgTimeInMin;
    }

    // Getters & Setters
    public Date getAborted_at() {
        return aborted_at;
    }

    public void setAborted_at(Date aborted_at) {
        this.aborted_at = aborted_at;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public User getEmployee() {
        return employee;
    }

    public void setEmployee(User employee) {
        this.employee = employee;
    }

    public User getClient() {
        return client;
    }

    public void setClient(User client) {
        this.client = client;
    }

    public void setClientById(int user_id) {
        this.client = UserDAO.getUserById(user_id);
    }

    public void setEmployeeById(int user_id) {
        this.employee = UserDAO.getUserById(user_id);
    }

    public boolean isActive() {
        return this.aborted_at != null;
    }
}
