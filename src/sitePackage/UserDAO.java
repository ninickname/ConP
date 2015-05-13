package sitePackage;


import java.sql.*;

public class UserDAO
{
    static Connection connection = null;
    static ResultSet rs = null;

    public static User login(User bean) {

        //preparing some objects for connection
        Statement stmt = null;

        String username = bean.getUserName();

        String searchQuery =
                "select * from users where user_name='" + username + "'";

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


                if (hashed.contentEquals( rs.getString("password") ) ){
                    bean.setFirstName(rs.getString("first_name"));
                    bean.setLastName(rs.getString("last_name") );
                    bean.setId(rs.getLong("id"));
                    bean.setEmail(rs.getString("email"));
                    bean.setRole(rs.getString("role"));

                    System.out.println("Welcome " + bean.getFirstName() + "your role is " + bean.getRole());

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

        String salt = BCrypt.gensalt();
        String hashed = BCrypt.hashpw(user.getPassword(), salt);
        user.setPassword(hashed);
        user.setSalt(salt);

        //preparing some objects for connection
        Statement stmt = null;
        PreparedStatement psmtp = null;

        // Check for same username
        String sqlQuery ="select * from users where user_name='"+ user.getUserName()+ "'";

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
                sqlQuery = "INSERT INTO users (first_name,last_name,user_name,password,salt,email , id ) " +
                                                "VALUES (?, ?, ?, ?,?,? , ?)";
                System.out.println(sqlQuery);

                psmtp = connection.prepareStatement(sqlQuery);

                psmtp.setString(1, user.getFirstName());
                psmtp.setString(2, user.getLastName());
                psmtp.setString(3, user.getUserName());
                psmtp.setString(4, user.getPassword());// currently the old password
                psmtp.setString(5, user.getSalt());
                psmtp.setString(6, user.getEmail());
                psmtp.setString(7, new Long(user.getId()).toString());

                psmtp.executeUpdate();
                MailClass.send( user.getEmail() , MailClass.welcome );

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }
}