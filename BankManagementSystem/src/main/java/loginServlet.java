

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class loginServlet
 */
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from users where accountNumber = ? AND password = ?";
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			
			pd.setString(1,  account);
			pd.setString(2, password);
			ResultSet rs = pd.executeQuery();
			
			if (!rs.next()) {
				String error = "Account Number or Password is incorrect";
				session.setAttribute("errorMessage", error);
//				response.sendRedirect("loginError.jsp");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
			}
			
			String role = rs.getString("role");
			int id = rs.getInt("id");
			
			session.setAttribute("account", account);
			session.setAttribute("role", role);
			session.setAttribute("userId",  id);
			
			if ("admin".equals(role)) {
				response.sendRedirect("adminDashboard.jsp");
			} else {
				response.sendRedirect("clientDashboard.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		
	}

}
