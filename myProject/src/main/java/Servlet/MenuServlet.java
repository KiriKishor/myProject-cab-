package Servlet;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import Bean.CabBean;
import Bean.DriverBean;

public class MenuServlet extends HttpServlet {
    // Override the doGet method
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hardcoded driver details
        List<DriverBean> drivers = new ArrayList<>();
        drivers.add(new DriverBean("John Doe", "1234 Elm Street", "NIC123456789", "images/driver1.jpg"));
        drivers.add(new DriverBean("Jane Smith", "5678 Oak Street", "NIC987654321", "images/driver2.jpg"));
        drivers.add(new DriverBean("Alex Johnson", "9101 Pine Street", "NIC123459876", "images/driver3.jpg"));
        drivers.add(new DriverBean("Sarah Lee", "1122 Maple Street", "NIC12344321", "images/driver4.jpg"));
        drivers.add(new DriverBean("Michael Brown", "1314 Birch Street", "NIC765432109", "images/driver5.jpg"));

        // Hardcoded cab details
        List<CabBean> cabs = new ArrayList<>();
        cabs.add(new CabBean("Toyota Camry", "CAB001", 4, "images/cab1.jpg"));
        cabs.add(new CabBean("Honda Accord", "CAB002", 4, "images/cab2.jpg"));
        cabs.add(new CabBean("Ford Mustang", "CAB003", 2, "images/cab3.jpg"));
        cabs.add(new CabBean("Chevrolet Malibu", "CAB004", 4, "images/cab4.jpg"));
        cabs.add(new CabBean("BMW 3 Series", "CAB005", 4, "images/cab5.jpg"));

        // Set the hardcoded data as attributes
        request.setAttribute("drivers", drivers);
        request.setAttribute("cabs", cabs);

        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
        dispatcher.forward(request, response);
    }
}
