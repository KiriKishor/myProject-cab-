package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/HelpMessageServlet")
public class HelpMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the help page if accessed via GET
        response.sendRedirect("help.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String message = request.getParameter("message");

        // Check if both fields are filled
        if (name == null || name.isEmpty() || message == null || message.isEmpty()) {
            request.setAttribute("error", "Both fields are required!");
            request.getRequestDispatcher("help.jsp").forward(request, response);
            return;
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");

            // SQL query to insert message
            String sql = "INSERT INTO help_messages (name, message) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, message);
            stmt.executeUpdate();

            // Close resources
            stmt.close();
            conn.close();

            // Redirect to help page with success message
            response.sendRedirect("help.jsp?success=Message Sent Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database Error! Please try again.");
            request.getRequestDispatcher("help.jsp").forward(request, response);
        }
    }
}
