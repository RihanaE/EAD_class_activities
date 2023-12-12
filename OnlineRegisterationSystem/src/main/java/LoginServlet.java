

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
	
public class LoginServlet extends HttpServlet {
//	
//private static final String DB_URL = "jdbc:mysql:///usersdb";
//
//private static final String DB_USER = "root";
//private static final String DB_PASSWORD = "harun123!";


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
		Connection conn = DatabaseConnection.getConnection();
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		String query = "select name from users where email = ? AND password = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			//authentication successful
//			conn.close();
			String uName = rs.getString("name");
			HttpSession session = request.getSession(true);
			session.setAttribute("name", uName);
			response.sendRedirect("welcome.jsp");
			}else {
			//authentication failed
//			conn.close();
			response.sendRedirect("login.jsp");
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		}
}