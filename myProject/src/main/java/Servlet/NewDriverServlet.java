package Servlet;

import java.io.IOException;
import Dao.NewDriverDAO;
import Bean.NewDriverBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/NewDriverServlet")
public class NewDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        NewDriverBean driver = new NewDriverBean();
        driver.setUsername(username);
        driver.setPassword(password);

        NewDriverDAO dao = new NewDriverDAO();
        if (dao.validateDriver(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("drivername", username);
            response.sendRedirect("driverHome.jsp");
        } else {
            response.sendRedirect("newdriver.jsp?error=Invalid Username or Password");
        }
    }
}
