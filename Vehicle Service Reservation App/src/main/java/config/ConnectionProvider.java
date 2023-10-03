package config;
import java.sql.*;
public class ConnectionProvider {
	public static Connection getCon() {
		try {
			// Load the JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Use the Config class to get configuration parameters
            String url = Config.getDatabaseURL();
            String username = Config.getDatabaseUsername();
            String password = Config.getDatabasePassword();
            
            // Establish the connection
			Connection con = DriverManager.getConnection(url, username, password);
			return con;
		}
		catch(Exception e){
			System.out.print(e);
			return null;
		} 
	}
}
