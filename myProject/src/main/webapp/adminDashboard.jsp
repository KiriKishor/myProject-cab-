<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    String adminUser = (session1 != null) ? (String) session1.getAttribute("adminUser") : null;
    
    if (adminUser == null) {
        response.sendRedirect("adminLogin.jsp?error=Please login first!");
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 100px;
        }
        h1 {
            color: #343a40;
        }
        .btn {
            display: block;
            width: 200px;
            padding: 10px;
            margin: 10px auto;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            color: white;
        }
        .btn-bookings {
            background-color: #007bff;
        }
        .btn-messages {
            background-color: #28a745;
        }
        .btn-logout {
            background-color: red;
        }
        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= adminUser %>!</h1>
        <p>You have successfully logged in to the Admin Dashboard.</p>

        <!-- Updated Booking Button to call Servlet -->
        <a href="adminViewBookings.jsp" class="btn btn-bookings">Bookings</a>
        <a href="adminViewMessages.jsp" class="btn btn-messages">Messages</a>
        <a href="adminLogout.jsp" class="btn btn-logout">Logout</a>
    </div>
</body>
</html>
