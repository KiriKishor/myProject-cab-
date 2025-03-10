<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Bean.BookingBean" %>

<%
    if (request.getAttribute("bookings") == null) {
        response.sendRedirect("OrdersServlet");
        return;
    }
%>

<html>
<head>
    <title>Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 80%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
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
            background: #1e7e34;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Orders (Bookings)</h2>
    
    <table>
        <tr>
            <th>Booking No</th>
            <th>Username</th>
            <th>Mobile No</th>
            <th>Starting Point</th>
            <th>Finishing Point</th>
            <th>Distance (km)</th>
        </tr>

        <%
            List<BookingBean> bookings = (List<BookingBean>) request.getAttribute("bookings");
            for (BookingBean b : bookings) {
        %>
                <tr>
                    <td><%= b.getBookingNumber() %></td>
                    <td><%= b.getUsername() %></td>
                    <td><%= b.getMobileNo() %></td>
                    <td><%= b.getStartingPoint() %></td>
                    <td><%= b.getFinishingPoint() %></td>
                    <td><%= b.getDistance() %></td>
                </tr>
        <%
            }
        %>
    </table>

    <!-- Back Button -->
    <div class="back-button">
        <button onclick="window.location.href='adminDashboard.jsp'">Back to Dashboard</button>
    </div>
</div>

</body>
</html>
