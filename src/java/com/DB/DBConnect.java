
package com.DB;

/**
 *
 * @author Rajarshi
 */

import java.sql.*;

public class DBConnect {
    private static Connection conn;
    
    public static Connection getConn()
    {
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app","root","root");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
}
