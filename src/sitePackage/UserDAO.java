package sitePackage;


import java.sql.*;
import java.util.Date;


public class UserDAO
{
    static Connection connection = null;
    static ResultSet rs = null;

    public static User login(User bean) {

        //preparing some objects for connection
        Statement stmt = null;

        String username = bean.getUsername();
        String password = bean.getPassword();

        String searchQuery =
                "select * from users where user_name='"
                        + username
                        //+ "' AND password='"
                        //+ password
                        + "'";

        // "System.out.println" prints in the console; Normally used to trace the process
        //System.out.println("Your user name is " + username);
        //System.out.println("Your password is " + password);
        //System.out.println("Query: "+searchQuery);

        try
        {
            //connect to DB
            connection = ConnectionManager.getConnection();
            stmt=connection.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to false
            if (!more)
            {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                bean.setValid(false);
            }

            //if user exists set the isValid variable to true
            else if (more)
            {
                bean.setSalt(rs.getString("salt"));
                String hashed = BCrypt.hashpw(bean.getPassword(), bean.getSalt());
                // salt from the database and the password from the input ;
                ;

                if (hashed.contentEquals( rs.getString("password") ) ){
                    bean.setFirstName(rs.getString("first_name"));
                    bean.setLastName(rs.getString("last_name") );

                    System.out.println("Welcome " + bean.getFirstName());

                bean.setValid(true);
                }
                else {
                    bean.setValid(false);
                }
            }
        }

        catch (Exception ex)
        {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        //some exception handling
        finally
        {
            if (rs != null)	{
                try {
                    rs.close();
                } catch (Exception e) {}
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {}
                stmt = null;
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                }

                connection = null;
            }
        }

        return bean;

    }

    public static boolean register(User user) {


        /*
    // Hash a password for the first time
    String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

    // gensalt's log_rounds parameter determines the complexity
// the work factor is 2**log_rounds, and the default is 10
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));

// Check that an unencrypted password matches one that has
// previously been hashed
        if (BCrypt.checkpw(candidate, hashed))
            System.out.println("It matches");
        else
            System.out.println("It does not match");
*/
        String salt = BCrypt.gensalt();
        String hashed = BCrypt.hashpw(user.getPassword(), salt);
        user.setPassword(hashed);
        user.setSalt(salt);

        //preparing some objects for connection
        Statement stmt = null;
        PreparedStatement psmtp = null;

        // Check for same username
        String sqlQuery ="select * from users where user_name='"+ user.getUsername()+ "'";

            //connect to DB
            connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

        rs = stmt.executeQuery(sqlQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to true
            if (!more)
            {
                System.out.println("before querry");
                sqlQuery = "INSERT INTO users (first_name,last_name,user_name,password,salt,email) VALUES (?, ?, ?, ?,?,?)";
                psmtp = connection.prepareStatement(sqlQuery);
                psmtp.setString(1, user.getFirstName());
                psmtp.setString(2, user.getLastName());
                psmtp.setString(3, user.getUsername());
                psmtp.setString(4, user.getPassword());// currently the old password
                psmtp.setString(5, user.getSalt().toString());
                psmtp.setString(6, user.getEmail());
                psmtp.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return true;

    }

}