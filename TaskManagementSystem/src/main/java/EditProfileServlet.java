

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
 * Servlet implementation class EditProfileServlet
 */
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "update users set userName = ? , password = ? where id = ?";
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id =(Integer) session.getAttribute("userId");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1,  userName);
			pd.setString(2,  password);
			pd.setInt(3, id);
			pd.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		response.sendRedirect("success.jsp");
	}

}
