

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class changePasswordServlet
 */
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "update users set password = ? where id = ?";
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
			return;
		}
		int userId = (Integer) session.getAttribute("userId");
		String password = request.getParameter("password");
		
		if (password.length() < 4) {
			String error = "Password length must be more than 3.";
			session.setAttribute("errorMessage", error);
			response.sendRedirect("error.jsp");
		} else {
		
			try {
				Connection con = DatabaseConnection.getConnection();
				PreparedStatement pd = con.prepareStatement(query);
				pd.setString(1, password);
				pd.setInt(2,  userId);
				pd.executeUpdate();
				response.sendRedirect("changePasswordSuccess.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
