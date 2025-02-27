package Dao;

import Bean.BookingBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/cab";
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";  // Change to your actual DB password

    private Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Insert a new booking into the database
    public boolean saveBooking(BookingBean booking) {
        Connection conn = connect();
        if (conn == null) return false;

        try {
            String sql = "INSERT INTO bookings (username, mobile_no, starting_point, finishing_point, distance) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, booking.getUsername());
            stmt.setString(2, booking.getMobileNo());
            stmt.setString(3, booking.getStartingPoint());
            stmt.setString(4, booking.getFinishingPoint());
            stmt.setDouble(5, booking.getDistance());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    booking.setBookingNumber(rs.getInt(1));  // Set the generated booking number
                }
                conn.close();
                return true;
            }
            conn.close();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve all bookings of a specific username
    public List<BookingBean> getBookingsByUsername(String username) {
        List<BookingBean> bookings = new ArrayList<>();
        Connection conn = connect();
        if (conn == null) return bookings;

        try {
            String sql = "SELECT * FROM bookings WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                BookingBean booking = new BookingBean(
                        rs.getInt("booking_number"),
                        rs.getString("username"),
                        rs.getString("mobile_no"),
                        rs.getString("starting_point"),
                        rs.getString("finishing_point"),
                        rs.getDouble("distance")
                );
                bookings.add(booking);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Retrieve all bookings (for admin or report purposes)
    public List<BookingBean> getAllBookings() {
        List<BookingBean> bookings = new ArrayList<>();
        Connection conn = connect();
        if (conn == null) return bookings;

        try {
            String sql = "SELECT * FROM bookings";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                BookingBean booking = new BookingBean(
                        rs.getInt("booking_number"),
                        rs.getString("username"),
                        rs.getString("mobile_no"),
                        rs.getString("starting_point"),
                        rs.getString("finishing_point"),
                        rs.getDouble("distance")
                );
                bookings.add(booking);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
