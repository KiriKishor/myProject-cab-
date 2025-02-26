package Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.AdminLoginBean;
import Dao.AdminLoginDao;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminLoginBean admin = new AdminLoginBean();
        admin.setUsername(username);
        admin.setPassword(password);

        AdminLoginDao dao = new AdminLoginDao();
        if (dao.validate(admin)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);
            response.sendRedirect("adminDashboard.jsp"); // Redirect to Admin Dashboard
        } else {
            response.sendRedirect("adminLogin.jsp?error=Invalid username or password!");
        }
    }
}
	