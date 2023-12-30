

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
	private static String query = "select id from users where userName = ? AND password = ?";
	
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
		String name = request.getParameter("userName");
		String password = request.getParameter("password");
		
		try(
				Connection con = DatabaseConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				){
			
			ps.setString(1, name);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				String uName = name;
				int userID =rs.getInt("id");
				
				
				
				HttpSession session= request.getSession(true);
				
				session.setAttribute("userId", userID);
				session.setAttribute("userName", uName);
				
				
				response.sendRedirect("dashboard.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
