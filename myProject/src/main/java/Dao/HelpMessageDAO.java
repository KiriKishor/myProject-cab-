package Dao;

import Bean.HelpMessageBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class HelpMessageDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/cab";
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";

    public boolean saveMessage(HelpMessageBean message) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "INSERT INTO help_messages (name, message) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, message.getName());
            stmt.setString(2, message.getMessage());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
