

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
import java.util.List;

/**
 * Servlet implementation class usersDetailServlet
 */
public class usersDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String query = "select * from users";
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId") == null){response.sendRedirect("login.jsp");
		return;
		}
		List<Client> usersDetails = new ArrayList<>();
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pd = con.prepareStatement(query);
			ResultSet rs = pd.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phoneNumber");
				String account = rs.getString("accountNumber");
				String role = rs.getString("role");
				float amount = rs.getFloat("amount");
				
				Client detail = new Client(id, name, email, phone, account, amount, role);
				usersDetails.add(detail);
			}
			session.setAttribute("usersDetail", usersDetails);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
