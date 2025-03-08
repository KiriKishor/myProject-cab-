<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Admin - View Messages</title>
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
            background: #28a745;
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
            background: #0056b3;
        }
        
    </style>
</head>
<body>

<div class="container">
    <h2>Admin - View Help Messages</h2>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Message</th>
            <th>Received At</th>
        </tr>

        <%
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "123456789");

                // Fetch all messages
                String sql = "SELECT * FROM help_messages";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                // Display messages in table
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("message") %></td>
                        <td><%= rs.getTimestamp("created_at") %></td>
                    </tr>
        <%
                }
                // Close connections
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <tr><td colspan="4" style="color:red;">Error fetching messages. Check database connection.</td></tr>
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
