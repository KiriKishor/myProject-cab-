<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.AdminViewBookingsBean" %>

<%
    // Redirect to the servlet if bookings are not found in the request
    if (request.getAttribute("bookings") == null) {
        response.sendRedirect("AdminViewBookingsServlet");
        return; // Ensure no further execution
    }
%>

<html>
<head>
    <title>Admin - View Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #28a745;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .no-data {
            color: red;
            font-size: 18px;
            margin-top: 20px;
        }
        
        .back-button {
            margin-top: 20px;
        }
        .back-button button {
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        .back-button button:hover {
            background: #0056b3;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <h2>Booking Details</h2>

        <%
            Object bookingsObj = request.getAttribute("bookings");
            List<AdminViewBookingsBean> bookings = null;

            if (bookingsObj instanceof List<?>) {
                bookings = (List<AdminViewBookingsBean>) bookingsObj;
            }

            if (bookings != null && !bookings.isEmpty()) {
        %>
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
                for (AdminViewBookingsBean booking : bookings) {
            %>
            <tr>
                <td><%= booking.getBookingNumber() %></td>
                <td><%= booking.getUsername() %></td>
                <td><%= booking.getMobileNo() %></td>
                <td><%= booking.getStartingPoint() %></td>
                <td><%= booking.getFinishingPoint() %></td>
                <td><%= booking.getDistance() %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } else {
        %>
        <p class="no-data">❌ No bookings found.</p>
        <%
            }
        %>
        
        <!-- Back Button -->
    <div class="back-button">
        <button onclick="window.location.href='adminDashboard.jsp'">Back to Dashboard</button>
    </div>
        
    </div>
</body>
</html>
