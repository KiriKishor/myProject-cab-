<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Admin View Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .table-container {
            width: 100%;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #28a745;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
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
        <h2>Driver Details</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>NIC Number</th>
                    <th>Image</th>
                </tr>
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM drivers");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("nic_no") %></td>
                    <td><img src="<%= rs.getString("image") %>" alt="Driver Image"></td>
                </tr>
                <% 
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </div>
    
    <div class="container">
        <h2>Cab Details</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Model</th>
                    <th>Cab Number</th>
                    <th>Seats</th>
                    <th>Image</th>
                </tr>
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM cabs");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("model") %></td>
                    <td><%= rs.getString("cab_number") %></td>
                    <td><%= rs.getInt("seats") %></td>
                    <td><img src="<%= rs.getString("image") %>" alt="Cab Image"></td>
                </tr>
                <% 
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
               
    </div>
    
    	<div class="back-button">
        <button onclick="window.location.href='adminDashboard.jsp'">Back to Dashboard</button>
    </div>
    
</body>
</html>
