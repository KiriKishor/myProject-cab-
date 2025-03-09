<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px 0;
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
            width: 60%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.1);
        }
        
        h2 {
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        p {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
            text-align: left;
            margin-bottom: 20px;
        }

        .guideline-text {
            color: #333;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .error, .success {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        form {
            margin-top: 30px;
            text-align: left;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            height: 120px;
        }

        button {
            background: #415999;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background: #218838;
        }
        
        /* Footer Styles */
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

<div class="container">
    <h2>Help & Support</h2>

    <p class="guideline-text">
        Here are some guidelines to help you navigate through the Mega City Cab system:
    </p>

    <p class="guideline-text">
        1. You can check your <strong>bills</strong> on the Home Page.
    </p>

    <p class="guideline-text">
        2. There is a form on the Home Page where you can <strong>join as a driver</strong> with us.
    </p>

    <p class="guideline-text">
        3. You can easily <strong>book your ride</strong> in the Booking Page.
    </p>

    <p class="guideline-text">
        4. Customers should be able to <strong>book a cab</strong> easily by selecting pickup and drop-off locations, preferred cab type, and scheduling rides in advance.
    </p>

    <p class="guideline-text">
        5. The system should maintain a list of registered <strong>drivers</strong> with details like name, address, NIC number, and assigned cabs, ensuring proper verification and management.
    </p>

	<br><br><br><br><br>
	
	<p> You can send any Messages to us... <p>
	
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

	<div class="footer">
    <p>&copy; Mega City Cab, 2015</p>
	</div>
	

</body>
</html>
