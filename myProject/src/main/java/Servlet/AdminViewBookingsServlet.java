package Servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Dao.AdminViewBookingsDAO;
import Bean.AdminViewBookingsBean;

@WebServlet("/AdminViewBookingsServlet")
public class AdminViewBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminViewBookingsBean> bookings = AdminViewBookingsDAO.getAllBookings();

        // Debugging: Print fetched bookings to console
        if (bookings.isEmpty()) {
            System.out.println("❌ No bookings found in database.");
        } else {
            System.out.println("✅ Bookings successfully retrieved.");
            for (AdminViewBookingsBean booking : bookings) {
                System.out.println("Booking ID: " + booking.getBookingNumber() + ", User: " + booking.getUsername());
            }
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("adminViewBookings.jsp").forward(request, response);
    }
}
