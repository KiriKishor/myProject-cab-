package Servlet;

import Bean.BookingBean;
import Dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String mobileNo = request.getParameter("mobile_no");
        String startingPoint = request.getParameter("starting_point");
        String finishingPoint = request.getParameter("finishing_point");
        double distance = Double.parseDouble(request.getParameter("distance"));

        BookingBean booking = new BookingBean(0, username, mobileNo, startingPoint, finishingPoint, distance);
        BookingDAO dao = new BookingDAO();
        
        // Save new booking
        dao.saveBooking(booking);

        // Retrieve all bookings of this user
        List<BookingBean> userBookings = dao.getBookingsByUsername(username);
        
        // Pass data to JSP
        request.setAttribute("bookings", userBookings);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }
}
