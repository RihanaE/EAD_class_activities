import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection getConnection() throws ClassNotFoundException {
		String url ="jdbc:mysql:///BankManagement";
		String userName = "root";
		String password = "harun123!";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, userName, password);
			return con;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
