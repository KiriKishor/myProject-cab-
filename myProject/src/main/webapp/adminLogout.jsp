<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin != null) {
        sessionAdmin.invalidate();
    }
    response.sendRedirect("adminLogin.jsp?error=You have been logged out.");
%>
