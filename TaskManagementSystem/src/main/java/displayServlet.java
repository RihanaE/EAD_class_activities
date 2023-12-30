

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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Servlet implementation class displayServlet
 */
public class displayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from tasks where userId = ?";
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		List <Task> tasks = new ArrayList<>();
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			
			pd.setInt(1,  userId);
		
			ResultSet rs = pd.executeQuery();
			
			while(rs.next()) {
			
			int id = rs.getInt("id");
			String title = rs.getString("title");
			String desc = rs.getString("des");
			String dueDate = rs.getString("dueDate");
			String priority = rs.getString("priority");
			String status = rs.getString("status");
			
			Task task = new Task(id, title, desc, dueDate, priority, status);
			tasks.add(task);
			
			}
			Collections.sort(tasks, Comparator.comparing(Task::getDueDate));
			session.setAttribute("tasks", tasks);
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		response.sendRedirect("showTask.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
