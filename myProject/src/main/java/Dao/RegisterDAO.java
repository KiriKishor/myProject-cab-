package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import Bean.RegisterBean;

public class RegisterDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/?user=root"; // Change DB name
    private static final String USER = "root";  // Change username if needed
    private static final String PASSWORD = "123456789";  // Change password if set

    public boolean saveUser(RegisterBean user) {
        boolean status = false;
        Connection conn = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish Connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Insert Query
            String query = "INSERT INTO users (username, address, nic_no, mobile_no, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getNicNo());
            ps.setString(4, user.getMobileNo());
            ps.setString(5, user.getPassword()); // Encrypt password in a real application

            // Execute Query
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                status = true;
            }

            // Close Connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
