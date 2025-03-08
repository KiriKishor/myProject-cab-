package Dao;

import jakarta.servlet.ServletException;
import java.sql.*;

public class NewDriverDAO {
    public boolean validateDriver(String username, String password) throws ServletException {
        boolean status = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");

            String query = "SELECT * FROM newdrivers WHERE username = ? AND password = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }
        } catch (Exception e) {
            throw new ServletException("Database error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                throw new ServletException("Error closing resources: " + e.getMessage());
            }
        }
        return status;
    }
}
