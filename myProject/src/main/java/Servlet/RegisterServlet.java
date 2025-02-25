package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String URL = "jdbc:mysql://localhost:3306/cab"; // Change DB name
    private static final String USER = "root";  // Change username if needed
    private static final String PASSWORD = "123456789";  // Change password if set

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String nicNo = request.getParameter("nic_no");
        String mobileNo = request.getParameter("mobile_no");
        String password = request.getParameter("password");

        // Password validation
        if (password.length() < 8) {
            response.sendRedirect("register.jsp?error=Password must be at least 8 characters long.");
            return;
        }

        Connection conn = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Insert Query
            String query = "INSERT INTO users (username, address, nic_no, mobile_no, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, address);
            ps.setString(3, nicNo);
            ps.setString(4, mobileNo);
            ps.setString(5, password); // Encrypt password in a real application

            // Execute Query
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("register.jsp?success=Registration successful! Please login.");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed! Try again.");
            }

            // Close Connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Something went wrong. Please try again.");
        }
    }
}
