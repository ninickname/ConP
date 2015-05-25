package sitePackage;


import javax.servlet.http.Cookie;
import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
    public static String[] Roles = {"Admin", "User", "Manager", "Employee" , "Unregistered"};
    static String salt = "$2a$10$TqhxPqaGssU/Ft9lrUssIu";
    //NOTE hardcoded salt for the cookie :D

    static Connection connection = null;
    static ResultSet rs = null;

    public static User login(User bean) {

        //preparing some objects for connection
        Statement stmt = null;

        String username = bean.getUserName();

        String searchQuery =
                "select * from users where user_name='" + username + "'";

        try {
            //connect to DB
            connection = ConnectionManager.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to false
            if (!more) {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                bean.setValid(false);
            }

            //if user exists set the isValid variable to true
            else if (more) {
                bean.setSalt(rs.getString("salt"));
                String hashed = BCrypt.hashpw(bean.getPassword(), bean.getSalt());
                // salt from the database and the password from the input ;


                if (hashed.contentEquals(rs.getString("password"))) {
                    bean.setFirstName(rs.getString("first_name"));
                    bean.setLastName(rs.getString("last_name"));
                    bean.setId(rs.getLong("id"));
                    bean.setEmail(rs.getString("email"));
                    bean.setRole(rs.getString("role"));

                    System.out.println("Welcome " + bean.getFirstName() + "your role is " + bean.getRole());

                    bean.setValid(true);
                } else {
                    bean.setValid(false);
                }
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        //some exception handling
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
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
        String sqlQuery = "select * from users where user_name='" + user.getUserName() + "'";

        //connect to DB
        connection = ConnectionManager.getConnection();
        try {
            stmt = connection.createStatement();

            rs = stmt.executeQuery(sqlQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to true
            if (!more) {
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
                MailClass.send(user.getEmail(), MailClass.welcome);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }

    public static ArrayList<Long> getIdsWithLowerRole(User bean) {

        //preparing some objects for connection
        Statement stmt = null;

        String role = bean.getRole();
        String roles = null;

        System.out.println("USER DAO ROLE " + role);
        if (role.equals("Employee")) {
            roles = "'User' or role = 'Unregistered'";
        } else if (role.equals("Manager")) {
            roles = "'User' or role = 'Employee' or role = 'Unregistered'";
        } else if (role.equals("Admin")) {
            roles = "'User' or role = 'Employee' or role = 'Manager' or role = 'Unregistered'";
        }

        String searchQuery =
                "select * from users where role =" + roles;

        ArrayList<Long> ret = new ArrayList<Long>();

        try {
            //connect to DB
            connection = ConnectionManager.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();


            //if user exists set the isValid variable to true

            while (more) {
                ret.add(rs.getLong("id"));
                more = rs.next();

            }


        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        //some exception handling
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
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
        return ret;
    }

    public static String getRoleFromCookie(Cookie cook) {
        String hashed = cook.getValue();

        for (String role : UserDAO.Roles) {
            String hashedRole = BCrypt.hashpw(role, UserDAO.salt);
            if (hashed.equals(hashedRole)) {
                return role;
            }
        }
        return "Unregistered";
    }

    public static User getUserById(long id) {

        //preparing some objects for connection
        Statement stmt = null;

        User bean = new User();
        String searchQuery =
                "select * from users where id='" + id + "'";

        try {
            //connect to DB
            connection = ConnectionManager.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to false
            if (!more) {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
            }

            //if user exists set the isValid variable to true
            else if (more) {
                bean.setFirstName(rs.getString("first_name"));
                bean.setLastName(rs.getString("last_name"));
                bean.setId(rs.getLong("id"));
                bean.setEmail(rs.getString("email"));
                bean.setRole(rs.getString("role"));
                bean.setUserName(rs.getString("user_name"));
                bean.setPassword(rs.getString("password"));

                System.out.println("now we will edit  " + bean.getFirstName());
            }
        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        //some exception handling
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
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

    public static boolean updateUser(User user, User oldUser, boolean samePassword) {

        if (samePassword) {
            user.setSalt(oldUser.getSalt());
            user.setPassword(oldUser.getPassword());
        } else {
            String salt = BCrypt.gensalt();
            String hashed = BCrypt.hashpw(user.getPassword(), salt);
            user.setPassword(hashed);
            user.setSalt(salt);
        }


        //preparing some objects for connection
        Statement stmt = null;
        PreparedStatement psmtp = null;


        //connect to DB
        connection = ConnectionManager.getConnection();
        try {

            System.out.println("before querry");
            String sqlQuery = "UPDATE users  SET first_name = ? ,last_name = ? ,user_name = ? ,password = ? ,salt = ? ,email = ?  , id = ? WHERE id= ?";

            System.out.println(sqlQuery);

            psmtp = connection.prepareStatement(sqlQuery);

            psmtp.setString(1, user.getFirstName());
            psmtp.setString(2, user.getLastName());
            psmtp.setString(3, user.getUserName());
            psmtp.setString(4, user.getPassword());
            psmtp.setString(5, user.getSalt());
            psmtp.setString(6, user.getEmail());
            psmtp.setString(7, new Long(user.getId()).toString());
            psmtp.setString(8, new Long(oldUser.getId()).toString());


            psmtp.executeUpdate();

            MailClass.send(user.getEmail(), MailClass.changed);
            if (!user.getEmail().equals(oldUser.getEmail())) {
                MailClass.send(oldUser.getEmail(), "the user of id " + oldUser.getEmail() + " now will be sending emails to " + user.getEmail() + " and not to this mail from now on.");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return true;
    }
}