

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
import java.util.Date;
import java.util.List;

/**
 * Servlet implementation class transactionHistoryServlet
 */
public class transactionHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from transaction where userId = ?";
	

       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
			return;
			}
		
		int userId = (Integer) session.getAttribute("userId");
		List<Transaction> history = new ArrayList<>();
		
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, userId);
			ResultSet rs = pd.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String sender = rs.getString("sender");
				String reciever = rs.getString("reciever");
				String senderAccount = rs.getString("senderAccount");
				String recieverAccount = rs.getString("recieverAccount");
				float amount = rs.getFloat("amount");
				Date date = rs.getDate("date");
				
				Transaction t = new Transaction(id, sender, reciever, senderAccount, recieverAccount, amount, date, userId);
				history.add(t);
			}
			session.setAttribute("transactionHistory", history);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

}
