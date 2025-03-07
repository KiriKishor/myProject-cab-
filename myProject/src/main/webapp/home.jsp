<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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
            text-align: center;
            padding: 40px;
        }

        .welcome-message {
            font-size: 22px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Button Styles */
        .btn-bills {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-bills:hover {
            background-color: #218838;
        }

        /* Bills Table */
        .bills-table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .bills-table th, .bills-table td {
            padding: 15px;
            text-align: center;
        }

        .bills-table th {
            background-color: #007bff;
            color: white;
            font-size: 18px;
        }

        .bills-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .bills-table tr:hover {
            background-color: #ddd;
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
        <p class="welcome-message">Check your latest cab bookings and their billing details below.</p>
        
        <!-- Your Bills Button -->
        <a href="#billsSection" class="btn-bills">View Your Bills</a>
    </div>

    <!-- Bills Section -->
    <div id="billsSection">
        <h2 style="text-align: center; margin-top: 40px;">Your Bills</h2>

        <table class="bills-table">
            <tr>
                <th>Booking Number</th>
                <th>Username</th>
                <th>Mobile No</th>
                <th>Starting Point</th>
                <th>Finishing Point</th>
                <th>Distance (km)</th>
                <th>Amount (Rs)</th>
            </tr>

            <%
                String loggedInUser = (String) session.getAttribute("username");
                if (loggedInUser != null) {
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");

                        String query = "SELECT * FROM bookings WHERE username = ?";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, loggedInUser);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            int bookingNo = rs.getInt("booking_number");
                            String username = rs.getString("username");
                            String mobileNo = rs.getString("mobile_no");
                            String start = rs.getString("starting_point");
                            String end = rs.getString("finishing_point");
                            double distance = rs.getDouble("distance");
                            double amount = distance * 100; // Calculate Amount

                            out.println("<tr>");
                            out.println("<td>" + bookingNo + "</td>");
                            out.println("<td>" + username + "</td>");
                            out.println("<td>" + mobileNo + "</td>");
                            out.println("<td>" + start + "</td>");
                            out.println("<td>" + end + "</td>");
                            out.println("<td>" + distance + " km</td>");
                            out.println("<td>Rs. " + amount + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    }
                }
            %>
        </table>
    </div>

</body>
</html>
