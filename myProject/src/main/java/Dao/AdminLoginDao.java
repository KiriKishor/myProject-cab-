package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Bean.AdminLoginBean;

public class AdminLoginDao {
    private static final String URL = "jdbc:mysql://localhost:3306/cab"; // ✅ Add your database name here
    private static final String USER = "root";  
    private static final String PASSWORD = "123456789";  

    public boolean validate(AdminLoginBean admin) {
        boolean status = false;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // ✅ Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ✅ Establish Connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // ✅ SQL Query to check username and password
            String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());

            // ✅ Execute Query
            rs = ps.executeQuery();

            // ✅ Debugging Statements
            System.out.println("Entered Username: " + admin.getUsername());
            System.out.println("Entered Password: " + admin.getPassword());

            if (rs.next()) { // ✅ If record exists, login is successful
                status = true;
                System.out.println("Login Successful! Admin found in database.");
            } else {
                System.out.println("Login Failed! No matching record found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return status;
    }
}
