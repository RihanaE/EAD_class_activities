

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

/**
 * Servlet implementation class transferServlet
 */
public class transferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from users where accountNumber = ?";
	private static final String query1 = "select * from users where id = ?";
	private static final String query2 = "insert into transaction (sender, reciever, senderAccount, recieverAccount, amount, date, userId) values (?, ?, ?, ?, ?, ?, ?)";
	private static final String query3 = "update users set amount = ? where id = ?";
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recieverAccount = request.getParameter("account");
		float moneyTransfer = Float.parseFloat(request.getParameter("amount"));
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
		return;
		}
		int userId = (Integer) session.getAttribute("userId");
		
		try {
//			retrive inf about the reciever
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1,  recieverAccount);
			ResultSet rs = pd.executeQuery();
			
			if (!rs.next()) {
				String error = "The Account Number you entered does not exist.";
				session.setAttribute("errorMessage", error);
				response.sendRedirect("error.jsp");
				
			}
			int recieverId = rs.getInt("id");
			String reciever = rs.getString("name");
			float recieverAmount = rs.getFloat("amount");
//			System.out.println("success first");
			
//			the sender 
			float amount = (float) 0.0;
			String sender = "";
			String senderAccount = "";
			
			try {
			PreparedStatement pd1 = con.prepareStatement(query1);
			pd1.setInt(1,  userId);
			ResultSet rs1 = pd1.executeQuery();
			if (rs1.next()) {
				amount = rs1.getFloat("amount");
				sender = rs1.getString("name");
				senderAccount = rs1.getString("accountNumber");
//				System.out.println(amount +" "+ moneyTransfer + "here");
				if(amount < moneyTransfer) {
					String error = "You do not have sufficient balance.";
					session.setAttribute("errorMessage", error);
					response.sendRedirect("error.jsp");
					con.close();
				} else if (senderAccount.equals(recieverAccount)) {
					String error = "Invalid Transfer";
					session.setAttribute("errorMessage", error);
					response.sendRedirect("error.jsp");
					con.close();
				}
			}
			
			Date currentDate = new Date(System.currentTimeMillis());
			
//			System.out.println("success second");
//			insert into transaction
			try {
			PreparedStatement pd2 = con.prepareStatement(query2);
			pd2.setString(1, sender);
			pd2.setString(2,  reciever);
			pd2.setString(3,  senderAccount);
			pd2.setString(4,  recieverAccount);
			pd2.setFloat(5, moneyTransfer);
			pd2.setDate(6, currentDate);
			pd2.setInt(7,  userId);
			pd2.executeUpdate();
			
//			update the amount in both account
//					update the reciever
			try {
			PreparedStatement pd3 = con.prepareStatement(query3);
			
			pd3.setFloat(1,  moneyTransfer + recieverAmount);
			pd3.setInt(2,  recieverId);
			pd3.executeUpdate();
			
//				update the sender
			
			try {
				
			
			
			PreparedStatement pd4 = con.prepareStatement(query3);
			pd4.setFloat(1, amount - moneyTransfer);
			pd4.setInt(2,  userId);
			pd4.executeUpdate();
			response.sendRedirect("transferSuccess.jsp");
			}catch(SQLException e) {
				e.printStackTrace();
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
