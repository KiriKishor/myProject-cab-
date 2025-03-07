<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #007bff, #6610f2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-container {
            background: #ffffff;
            padding: 30px;
            width: 400px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            width: 100%;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background: #0056b3;
        }
        .login-text {
            margin-top: 20px;
            font-size: 14px;
        }
        .login-text a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .success-message {
            color: green;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create Your Account</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-message"><%= request.getParameter("error") %></p>
        <% } %>
        <% if (request.getParameter("success") != null) { %>
            <p class="success-message"><%= request.getParameter("success") %> <a href="index.jsp">Login Here</a></p>
        <% } %>

        <form action="RegisterServlet" method="post">
            <input type="text" name="username" class="input-field" placeholder="Enter Username" required><br>
            <input type="text" name="address" class="input-field" placeholder="Enter Address" required><br>
            <input type="text" name="nic_no" class="input-field" placeholder="Enter NIC No" required><br>
            <input type="text" name="mobile_no" class="input-field" placeholder="Enter Mobile No" required><br>
            <input type="password" name="password" class="input-field" placeholder="Enter Password (8+ chars)" required><br>
            <button type="submit" class="btn">Register</button>
        </form>
        <p class="login-text">Already have an account? <a href="index.jsp">Login</a>.</p>
    </div>
</body>
</html>
