package testing;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import Dao.BookingDAO;
import Bean.BookingBean;

public class BookingDAOTest {

    @Test
    public void testSaveBooking() {
        BookingDAO dao = new BookingDAO();
        BookingBean booking = new BookingBean(0, "testuser", "1234567890", "Location A", "Location B", 10.5);
        boolean result = dao.saveBooking(booking); // Try saving a booking
        assertTrue(result); // Check if saving was successful
    }

    @Test
    public void testGetBookingsByUsername() {
        BookingDAO dao = new BookingDAO();
        List<BookingBean> bookings = dao.getBookingsByUsername("testuser"); // Retrieve bookings by username
        
    }
}
