<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Driver Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
        }

        .container {
            margin-top: 50px;
        }

        h2 {
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .logout-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: red;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .logout-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

<%
    // Check if the driver is logged in
    String drivername = (String) session.getAttribute("drivername");
    if (drivername == null) {
        response.sendRedirect("newdriver.jsp");
        return;
    }
%>

<div class="container">
    <h2>Welcome, <%= drivername %>!</h2>
    <p>Here are the current bookings:</p>

    <table>
        <tr>
            <th>Booking Number</th>
            <th>Username</th>
            <th>Mobile No</th>
            <th>Starting Point</th>
            <th>Finishing Point</th>
            <th>Distance (km)</th>
        </tr>

        <%
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");

                // Fetch bookings
                String query = "SELECT * FROM bookings";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("booking_number") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("mobile_no") %></td>
            <td><%= rs.getString("starting_point") %></td>
            <td><%= rs.getString("finishing_point") %></td>
            <td><%= rs.getDouble("distance") %></td>
        </tr>
        <%
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Database error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>

    <a href="driverlogout.jsp" class="logout-btn">Logout</a>
</div>

</body>
</html>
