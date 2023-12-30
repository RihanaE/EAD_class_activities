

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
 * Servlet implementation class createTaskServlet
 */
public class createTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private static final String query = "INSERT INTO tasks (userId, title, des, dueDate, priority, status) values (?, ?, ?, ?, ?, ?)";
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String taskTitle = request.getParameter("taskTitle");
		String desc = request.getParameter("desc");
		String dueDate = request.getParameter("dueDate");
		String priority = request.getParameter("priority");
		HttpSession session = request.getSession();
		int userID = (int) session.getAttribute("userId");
		
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, userID);
			pd.setString(2, taskTitle);
			pd.setString(3,  desc);
			pd.setString(4, dueDate);
			pd.setString(5, priority);
			pd.setString(6, "incomplete");
			
			pd.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		session.setAttribute("page", "Task is created");
		response.sendRedirect("success.jsp");
		
	}

	/*
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
