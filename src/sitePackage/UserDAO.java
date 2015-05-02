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
                        + "' AND password='"
                        + password
                        + "'";

        // "System.out.println" prints in the console; Normally used to trace the process
        System.out.println("Your user name is " + username);
        System.out.println("Your password is " + password);
        System.out.println("Query: "+searchQuery);

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
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Date created = rs.getDate("created");

                System.out.println("Welcome " + firstName);
                bean.setFirstName(firstName);
                bean.setLastName(lastName);
                bean.setValid(true);
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

        String first_name = user.getFirstName();
        String last_name = user.getLastName();
        String username = user.getUsername();
        String password = user.getPassword();

        //preparing some objects for connection
        Statement stmt = null;
        PreparedStatement psmtp = null;

        // Check for same username
        String sqlQuery ="select * from users where user_name='"+ username+ "'";

            //connect to DB
            connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

        rs = stmt.executeQuery(sqlQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to true
            if (!more)
            {
                sqlQuery = "INSERT INTO users (first_name,last_name,user_name,password) VALUES (?, ?, ?, ?)";
                psmtp = connection.prepareStatement(sqlQuery);
                psmtp.setString(1, user.getFirstName());
                psmtp.setString(2, user.getLastName());
                psmtp.setString(3, user.getUsername());
                psmtp.setString(4, user.getPassword());
                psmtp.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return true;

    }
}