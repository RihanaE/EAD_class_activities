

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

import org.apache.tomcat.jakartaee.commons.lang3.StringUtils;

/**
 * Servlet implementation class registerServlet
 */
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "insert into users (name, email, password, phoneNumber, accountNumber, role, amount) values (?, ?, ?, ?, ?, ?, ?)";
    private static final String query2 = "select * from users";
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phone");
		String account = request.getParameter("account");
		String role = "client";
		float amount = 0;
		HttpSession session = request.getSession();
		
		if (password.length() < 4) {
			String error = "Password length must have a length more than 3.";
			session.setAttribute("errorMessage",  error);
//			response.sendRedirect("loginError.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
		} else if(account.length() != 13 || !StringUtils.isNumeric(account)) {
			String error = "Account number is invalid.";
			session.setAttribute("errorMessage",  error);
//			response.sendRedirect("loginError.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
		}else {
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd1 = con.prepareStatement(query2);
			ResultSet rs = pd1.executeQuery();
			
			while (rs.next()) {
				if (rs.getString("accountNumber") == account) {
					String error = "Account Number already exist";
					session.setAttribute("errorMessage",  error);
//					response.sendRedirect("loginError.jsp");
					RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
	                dispatcher.forward(request, response);
//	                System.out.println("hiiii");
	                return;
					
				}
			}
			
			
			
			try {
				PreparedStatement pd = con.prepareStatement(query);
				pd.setString(1,  name);
				pd.setString(2,  email);
				pd.setString(3,  password);
				pd.setString(4,  phoneNumber);
				pd.setString(5,  account);
				pd.setString(6, role);
				pd.setFloat(7, amount);
				pd.executeUpdate();
				response.sendRedirect("successRegistered.jsp");
				
			}catch(SQLException e) {
				e.printStackTrace();
				String error = "Email or Account Number is duplicated";
				session.setAttribute("errorMessage",  error);
//				response.sendRedirect("loginError.jsp");
				RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
                return;
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
			String error = "Email or Account Number is duplicated";
			session.setAttribute("errorMessage",  error);
//			response.sendRedirect("loginError.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
	}

}
