package Dao;

import java.sql.*;

public class UserDAO {
    // Database Connection Details
    private static final String URL = "jdbc:mysql://localhost:3306/cab"; // Replace with your database name
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";  // Change to your DB password

    // Establish Database Connection
    private Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Validate Login
    public boolean validateUser(String username, String password) {
        Connection conn = connect();
        if (conn == null) return false;

        try {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            boolean isValid = rs.next();
            conn.close();
            return isValid;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
