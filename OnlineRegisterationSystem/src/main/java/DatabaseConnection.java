import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	
	public static Connection getConnection() {
		
			try {
				
				String url = "jdbc:mysql:///usersdb";
				String userName = "root";
				String password = "harun123!";
						
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, userName, password);
				return con;
			} catch(SQLException se) {
				se.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
			
		}
	}

