package Servlet;

import Bean.BookingBean;
import Dao.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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

        BookingBean booking = new BookingBean(username, mobileNo, startingPoint, finishingPoint, distance);
        BookingDAO dao = new BookingDAO();

        if (dao.saveBooking(booking)) {
            response.sendRedirect("home.jsp?bookingSuccess=Booking successful! Booking Number: " + booking.getBookingNumber());
        } else {
            response.sendRedirect("booking.jsp?error=Booking failed. Please try again.");
        }
    }
}
