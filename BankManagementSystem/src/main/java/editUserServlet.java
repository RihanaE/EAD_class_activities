

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
 * Servlet implementation class editUserServlet
 */
public class editUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String query = "update users set name = ? , email = ?, phoneNumber = ?, accountNumber = ? , amount = ?, password = ? where id = ?";
    private static final String query1 = "update transaction set sender = ? where senderAccount = ?";
    private static final String query2 = "update transaction set reciever = ? where recieverAccount = ?";
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
		return;
		}
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String account = request.getParameter("account");
//		float 
		float amount;
		String password = request.getParameter("password");
		int userId = (Integer) session.getAttribute("editId");
		if (request.getParameter("amount") == null) {
			amount = 0;
		} else {
			amount = Float.parseFloat(request.getParameter("amount"));
		}
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1,  name);
			pd.setString(2,  email);
			pd.setString(3,  phone);
			pd.setString(4,  account);
			pd.setFloat(5,  amount);
			pd.setString(6, password);
			pd.setInt(7, userId);
			pd.executeUpdate();
			
			try {
			PreparedStatement pd1 = con.prepareStatement(query1);
			pd1.setString(1, name);
			pd1.setString(2, account);
			pd1.executeUpdate();
			
			try {
			PreparedStatement pd2 = con.prepareStatement(query2);
			pd2.setString(1,  name);
			pd2.setString(2,  account);
			pd2.executeUpdate();
			
			response.sendRedirect("successEdit.jsp");
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
