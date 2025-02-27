package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Bean.AdminViewBookingsBean;

public class AdminViewBookingsDAO {

    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/cab"; // Change to your database name
    private static final String USER = "root"; // Change to your MySQL username
    private static final String PASSWORD = "123456789"; // Change to your MySQL password

    // Method to establish a connection
    private static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Database connected successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Database connection failed!");
        }
        return con;
    }

    // Method to fetch all booking details from the database
    public static List<AdminViewBookingsBean> getAllBookings() {
        List<AdminViewBookingsBean> bookings = new ArrayList<>();

        try (Connection con = getConnection()) {
            if (con == null) {
                System.out.println("❌ Connection is NULL. Cannot fetch bookings.");
                return bookings;
            }

            String query = "SELECT * FROM bookings";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AdminViewBookingsBean booking = new AdminViewBookingsBean();
                booking.setBookingNumber(rs.getInt("booking_number"));
                booking.setUsername(rs.getString("username"));
                booking.setMobileNo(rs.getString("mobile_no"));
                booking.setStartingPoint(rs.getString("starting_point"));
                booking.setFinishingPoint(rs.getString("finishing_point"));
                booking.setDistance(rs.getDouble("distance"));
                bookings.add(booking);
            }

            System.out.println("✅ Total bookings fetched: " + bookings.size());

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Error fetching bookings!");
        }

        return bookings;
    }
}
