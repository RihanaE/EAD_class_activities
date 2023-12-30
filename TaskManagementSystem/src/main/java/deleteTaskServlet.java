

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
 * Servlet implementation class deleteTaskServlet
 */
public class deleteTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "delete from tasks where id = ?";
 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("taskId");
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			
			pd.setInt(1, id);
			pd.executeUpdate();
		} catch (SQLException se ) {
			se.printStackTrace();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("success.jsp");
	}

}
