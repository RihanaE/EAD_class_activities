

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
 * Servlet implementation class createAccountServlet
 */
public class createAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "insert into users (name, email, password, phoneNumber, accountNumber, role, amount) values (?, ?, ?, ?, ?, ?, ?)";
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String account = request.getParameter("account");
		String role = request.getParameter("role");
		float amount = Float.parseFloat(request.getParameter("amount"));
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
		return;
		}
		
		if (password.length() < 4) {
			String error = "Password must have a length greater than 3";
			session.setAttribute("errorMessage", error);
			response.sendRedirect("error.jsp");
			
		}
		
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1,  name);
			pd.setString(2,  email);
			pd.setString(3,  password);
			pd.setString(4,  phone);
			pd.setString(5,  account);
			pd.setString(6, role);
			pd.setFloat(7, amount);
			pd.executeUpdate();
			response.sendRedirect("successRegisteredAdmin.jsp");
			
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
