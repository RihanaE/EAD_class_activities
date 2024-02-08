

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
 * Servlet implementation class adminTransactionHistoryServlet
 */
public class adminTransactionHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from transaction";
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
			return;
		}
		List <Transaction> usersDetail = new ArrayList<>();
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			ResultSet rs = pd.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String sender = rs.getString("sender");
				String reciever = rs.getString("reciever");
				String senderAccount = rs.getString("senderAccount");
				String recieverAccount = rs.getString("recieverAccount");
				float amount = rs.getFloat("amount");
				Date date = rs.getDate("date");
				int userId = rs.getInt("userId");
				
				Transaction user = new Transaction(id, sender, reciever, senderAccount, recieverAccount, amount,date, userId);
				usersDetail.add(user);
			}
			
			session.setAttribute("usersDetail", usersDetail);
			
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

}
