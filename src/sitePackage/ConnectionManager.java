package sitePackage;

import java.sql.*;
import java.sql.Connection;
import java.util.*;
public class ConnectionManager {

    static Connection con;
    static String url;

    public static Connection getConnection()
    {

        if(con == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");

                String url = Configuration.connectionURL;

                try {
                    con = DriverManager.getConnection(url, Configuration.userName, Configuration.password);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            } catch (ClassNotFoundException e) {
                System.out.println(e);
            }
        }

        return con;
    }
}