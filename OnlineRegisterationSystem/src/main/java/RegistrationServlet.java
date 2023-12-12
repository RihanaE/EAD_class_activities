import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/register") // Modify this URL pattern as per your requirement
public class RegistrationServlet extends HttpServlet {
	private final static String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
//    private static final String DB_URL = "jdbc:mysql:///usersdb";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "harun123!";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || email == null || password == null || name.isEmpty() || email.isEmpty() || password.isEmpty()) {
            // Handle empty or null inputs
//            response.sendRedirect("error.jsp"); // Redirect to an error page or handle appropriately
            return;
        }

       
         
        try (
        		Connection conn = DatabaseConnection.getConnection();
        	PreparedStatement pstmt = conn.prepareStatement(query);){
        	
        	pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.executeUpdate();
            } catch (SQLException se) {
                se.printStackTrace(); // Log the exception properly using a logging framework
//              response.sendRedirect("error.jsp"); // Redirect to an error page or handle appropriately
          } catch(Exception e) {
        	e.printStackTrace();
        }
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//        } catch (Exception e) {
//        	e.printStackTrace();
//        }
//        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//        		PreparedStatement pstmt = con.prepareStatement(query);
//        		) {
//       
//            
//            pstmt.setString(1, name);
//            pstmt.setString(2, email);
//            pstmt.setString(3, password);
//            pstmt.executeUpdate();
//            } catch (SQLException se) {
//                se.printStackTrace(); // Log the exception properly using a logging framework
////              response.sendRedirect("error.jsp"); // Redirect to an error page or handle appropriately
//          } catch (Exception e) {
//  			e.printStackTrace();
//  		} 
//        

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);

            // Not sure what the intention of userList is, you may use it for further processing

            response.sendRedirect("confirmation.jsp");
         
    }
}
