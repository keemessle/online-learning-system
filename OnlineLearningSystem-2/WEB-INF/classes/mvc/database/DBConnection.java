package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        String url = "jdbc:mysql://localhost:3306/lms_db";
        String username = "root";
        String password = "1234";
        
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }
    
}