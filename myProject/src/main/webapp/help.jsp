<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
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
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
        form {
            margin-top: 20px;
        }
        input, textarea {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
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

<div class="container">
    <h2>Help & Support</h2>
    <p>Guide Lines <br> <br> User-Friendly Booking Interface <br><br>

Customers should be able to book a cab easily by selecting pickup and drop-off locations, preferred cab type, and scheduling rides in advance.
<br><br><br>
Driver and Cab Management
<br><br>
The system should maintain a list of registered drivers with details like name, address, NIC number, and assigned cabs, ensuring proper verification and management.
<br><br><br>
Real-Time Ride Tracking
<br><br>
Implement a tracking system where customers can view the live location of their booked cab and estimated arrival time.
<br><br><br>
Secure Payment and Fare Estimation
<br><br>
Provide multiple payment options, including online payments, and display estimated fares before booking confirmation to ensure transparency.
<br><br><br>
Customer Support and Feedback System
<br><br>
Include a help page with guidelines, FAQs, and a messaging system for customer queries, as well as a feedback system for users to rate and review their ride experience.</p>
 <br><br>   
    

    <%-- Display error message if present --%>
    <% if (request.getParameter("error") != null) { %>
        <p class="error"><%= request.getParameter("error") %></p>
    <% } %>

    <%-- Display success message if present --%>
    <% if (request.getParameter("success") != null) { %>
        <p class="success"><%= request.getParameter("success") %></p>
    <% } %>

    <form action="HelpMessageServlet" method="post">
        <input type="text" name="name" placeholder="Your Name" required><br>
        <textarea name="message" placeholder="Your Message" rows="5" required></textarea><br>
        <button type="submit">Send Message</button>
    </form>
</div>

</body>
</html>
