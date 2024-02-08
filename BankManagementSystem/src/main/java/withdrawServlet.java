

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

/**
 * Servlet implementation class withdrawServlet
 */
public class withdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from users where id = ?";
	private static final String query1 = "update users set amount = ? where id = ?";
	private static final String query2 = "insert into transaction (sender, reciever, senderAccount, recieverAccount, amount, date, userId) values (?, ? ,?, ?, ?, ?, ?)";
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		float amount = Float.parseFloat(request.getParameter("amount"));
		String account = request.getParameter("account");
		HttpSession session = request.getSession();
		String currentAccount = (String) session.getAttribute("account");
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
		return;
		}
		int userId = (Integer) session.getAttribute("userId");
		
		if(!currentAccount.equals(account)) {
			String error = "Invalid Request";
			session.setAttribute("errorMessage",  error);
			response.sendRedirect("error.jsp");
		}
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, userId);
			ResultSet rs = pd.executeQuery();
			
			if(rs.next()) {
				float currentAmount = rs.getFloat("amount");
				String name = rs.getString("name");
				
				if(currentAmount < amount) {
					String error = "Insufficient balance";
					session.setAttribute("errorMessage", error);
					con.close();
					response.sendRedirect("error.jsp");
				}
				
				PreparedStatement pd1 = con.prepareStatement(query1);
				pd1.setFloat(1,  currentAmount - amount);
				pd1.setInt(2, userId);
				pd1.executeUpdate();
				
				Date currentDate = new Date(System.currentTimeMillis());
				PreparedStatement pd2 = con.prepareStatement(query2);
				pd2.setString(1,  name);
				pd2.setString(2,  name);
				pd2.setString(3,  account);
				pd2.setString(4,  "Incash");
				pd2.setFloat(5,  amount);
				pd2.setDate(6, currentDate);
				pd2.setInt(7, userId);
				pd2.executeUpdate();
			}
			
			
			String uniqueID = UUID.randomUUID().toString();
			session.setAttribute("uniqueId", uniqueID);
			response.sendRedirect("ticket.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
