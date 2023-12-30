

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
 * Servlet implementation class searchTaskServlet
 */
public class searchTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String query = "select * from tasks where userId = ? and title = ?";
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String title = request.getParameter("taskTitle");
		List <Task>tasks = new ArrayList<>();
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1,  userId);
			pd.setString(2,  title);
			ResultSet rs = pd.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String titleTask = rs.getString("title");
				String desc = rs.getString("des");
				String dueDate = rs.getString("dueDate");
				String priority = rs.getString("priority");
				String status = rs.getString("status");
				Task task = new Task(id, titleTask, desc, dueDate, priority, status);
				tasks.add(task);
			}
			Collections.sort(tasks, Comparator.comparing(Task::getDueDate));
			session.setAttribute("tasksSearched", tasks);
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("searchTask.jsp");
	}

}
