<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, Bean.BookingBean" %>
<html>
<head>
    <title>Booking</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f7f7f7;
            padding: 20px;
        }

        
        /* Navbar Styles */
        .navbar {
            background-color: #415999;
            overflow: hidden;
            padding: 10px 0;
            text-align: center;
        }

        .navbar a {
            display: inline-block;
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 18px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .navbar a:hover {
            background-color: #005bb5;
        }

        .navbar-right {
            float: right;
        }

        .container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn {
            background: #415999;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        .btn:hover {
            background: #005bb5;
        }

        .bill {
            margin-top: 20px;
            padding: 15px;
            background: #f1f1f1;
            border-radius: 5px;
        }

        .bill h3 {
            color: #333;
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
<br><br><br>
<div class="container">
    <h2>Booking Form</h2>
    <h3> You can book here...</h3>
    
    <br><br><br>
    
    <form action="BookingServlet" method="post">
        <input type="text" name="username" class="input-field" placeholder="Username" required><br>
        <input type="text" name="mobile_no" class="input-field" placeholder="Mobile Number" required><br>
        <input type="text" name="starting_point" class="input-field" placeholder="Starting Point" required><br>
        <input type="text" name="finishing_point" class="input-field" placeholder="Finishing Point" required><br>
        <input type="number" name="distance" class="input-field" placeholder="Distance (in km)" required><br>
        <button type="submit" class="btn">Book Now</button>
    </form>

    <%
        List<BookingBean> bookings = (List<BookingBean>) request.getAttribute("bookings");
        if (bookings != null && !bookings.isEmpty()) {
    %>
    <h2>Your Bookings</h2>
    <%
        for (BookingBean booking : bookings) {
            double totalAmount = booking.getDistance() * 100;
    %>
        <div class="bill">
            <h3>Booking Number: <%= booking.getBookingNumber() %></h3>
            <p><strong>Username:</strong> <%= booking.getUsername() %></p>
            <p><strong>Mobile No:</strong> <%= booking.getMobileNo() %></p>
            <p><strong>Starting Point:</strong> <%= booking.getStartingPoint() %></p>
            <p><strong>Finishing Point:</strong> <%= booking.getFinishingPoint() %></p>
            <p><strong>Distance:</strong> <%= booking.getDistance() %> km</p>
            <p><strong>Total Amount:</strong> Rs <%= totalAmount %></p>
        </div>
    <%
        }
    %>
    <%
        } else {
    %>
       <h3></h3>
    <%
        }
    %>
</div>

</body>
</html>
