package sitePackage;

import java.sql.*;
import java.sql.Connection;
import java.util.*;
public class ConnectionManager {

    static Connection con;
    static String url;

    public static Connection getConnection()
    {

        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/JDB";

            try
            {
                con = DriverManager.getConnection(url,"root","");
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }

        catch(ClassNotFoundException e)
        {
            System.out.println(e);
        }

        return con;
    }
}