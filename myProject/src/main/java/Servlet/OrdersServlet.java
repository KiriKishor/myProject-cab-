package Servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.BookingBean;

@WebServlet("/OrdersServlet")
public class OrdersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BookingBean> bookings = new ArrayList<>();

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");

            // Fetch bookings from database
            String sql = "SELECT * FROM bookings";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                BookingBean booking = new BookingBean();
                booking.setBookingNumber(rs.getInt("booking_number"));
                booking.setUsername(rs.getString("username"));
                booking.setMobileNo(rs.getString("mobile_no"));
                booking.setStartingPoint(rs.getString("starting_point"));
                booking.setFinishingPoint(rs.getString("finishing_point"));
                booking.setDistance(rs.getDouble("distance"));

                bookings.add(booking);
            }

            // Close connections
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set data and forward to JSP
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}
