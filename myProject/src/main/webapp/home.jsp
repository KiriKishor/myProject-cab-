<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to Mega City Cab</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #0072ff;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 18px;
        }

        .navbar a:hover {
            background-color: #005bb5;
            color: white;
        }

        .navbar-right {
            float: right;
        }

        .container {
            padding: 20px;
            text-align: center;
        }

        .container h1 {
            margin-bottom: 20px;
        }

        .welcome-message {
            font-size: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="booking.jsp">Booking</a>
        <a href="help.jsp">Help</a>
        <a href="LogoutServlet" class="navbar-right">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
        <p class="welcome-message">You are logged in.</p>
    </div>

</body>
</html>
