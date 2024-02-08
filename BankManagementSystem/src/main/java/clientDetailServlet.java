

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

/**
 * Servlet implementation class clientDetailServlet
 */
public class clientDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from users where id = ?";
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
		return;
		}
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
		int id = (int) session.getAttribute("userId");
		String role = session.getAttribute("role").toString();
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, id);
			ResultSet rs = pd.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String account = rs.getString("accountNumber");
				float amount = rs.getFloat("amount");
				String phone = rs.getString("phoneNumber");
				
				Client cl = new Client(id, name, email, phone, account, amount, role);
				session.setAttribute("clientDetail", cl);
				
			}
//			response.sendRedirect("accountDetail.jsp");
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
