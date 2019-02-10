package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author Rubzer
 */

public class MyConnection {
    
    private String JDBC_DRIVER_CLASS = "com.mysql.jdbc.Driver";
    private String server = "jdbc:mysql://localhost/students";
    private String user = "root";
    private String password = "";
    private Connection connection = null;
    
    public MyConnection(){
        try{
            Class.forName(JDBC_DRIVER_CLASS);
            connection = DriverManager.getConnection(server, user, password);
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
    }

    public Connection getConnection() {
        return connection;
    }
}
