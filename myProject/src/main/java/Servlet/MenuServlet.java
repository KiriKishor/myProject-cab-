package Servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.DriverBean;
import Bean.CabBean;
import Dao.MenuDAO;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DriverBean> drivers = MenuDAO.getDrivers();
        List<CabBean> cabs = MenuDAO.getCabs();
        request.setAttribute("drivers", drivers);
        request.setAttribute("cabs", cabs);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
