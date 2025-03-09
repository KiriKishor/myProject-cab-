<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="Bean.DriverBean" %>
<%@ page import="Bean.CabBean" %>

<%
    if (request.getAttribute("drivers") == null || request.getAttribute("cabs") == null) {
        response.sendRedirect("MenuServlet");
        return;
    }
%>


<html>
<head>
    <title>Menu Page</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
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
        
        h2 {
            color: #007bff;
            margin-top: 30px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #415999;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        img {
            width: 100px;
            height: auto;
            border-radius: 8px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }
        	
        	.footer {
    background-color: #415999;
    color: Black;
    text-align: center;
    padding: 10px;
    margin-top: 30px;
    position: relative;
    bottom: 0;
    width: 100%;
	}

		.footer p {
    font-size: 16px;
    margin: 0;
    color: white;
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
    
    <h2>Drivers List</h2>
    <%
        // Ensure drivers list is never null to prevent NullPointerException
        List<DriverBean> drivers = (List<DriverBean>) request.getAttribute("drivers");
        if (drivers == null) {
            drivers = new ArrayList<>();
        }
    %>
    <table border="1">
        <tr><th>Name</th><th>Address</th><th>NIC</th><th>Image</th></tr>
        <% for (DriverBean d : drivers) { %>
            <tr>
                <td><%= d.getName() %></td>
                <td><%= d.getAddress() %></td>
                <td><%= d.getNicNo() %></td>
                <td><img src="<%= request.getContextPath() %>/<%= d.getImage() %>" width="100"></td>
            </tr>
        <% } %>
    </table>

    <h2>Cabs List</h2>
    <%
        // Ensure cabs list is never null to prevent NullPointerException
        List<CabBean> cabs = (List<CabBean>) request.getAttribute("cabs");
        if (cabs == null) {
            cabs = new ArrayList<>();
        }
    %>
    <table border="1">
        <tr><th>Model</th><th>Cab Number</th><th>Seats</th><th>Image</th></tr>
        <% for (CabBean c : cabs) { %>
            <tr>
                <td><%= c.getModel() %></td>
                <td><%= c.getCabNumber() %></td>
                <td><%= c.getSeats() %></td>
                <td><img src="<%= request.getContextPath() %>/<%= c.getImage() %>" width="100"></td>
            </tr>
        <% } %>
    </table>
    
    	<div class="footer">
    <p>&copy; Mega City Cab, 2015</p>
	</div>
    
</body>
</html>
