

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
 * Servlet implementation class EditTaskServlet
 */
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "update tasks set title = ?, des = ?, dueDate = ?, priority = ?, status = ? where id = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("taskTitle");
		String desc = request.getParameter("desc");
		String dueDate = request.getParameter("dueDate");
		String priority = request.getParameter("priority");
		String status = request.getParameter("status");
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("taskId");
		
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			
			pd.setString(1, title);
			pd.setString(2,  desc);
			pd.setString(3,  dueDate);
			pd.setString(4,  priority);
			pd.setString(5, status);
			pd.setInt(6,  id);
			
			pd.executeUpdate();
			response.sendRedirect("success.jsp");
		} catch(SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("error.jsp");
			
		}
		

}
	}
