<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
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
        .login-container {
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
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        
        <% if (request.getParameter("error") != null) { %>
            <p class="error-message"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="AdminLoginServlet" method="post">
            <input type="text" name="username" class="input-field" placeholder="Enter Username" required><br>
            <input type="password" name="password" class="input-field" placeholder="Enter Password" required><br>
            <button type="submit" class="btn">Login</button>
        </form>
    </div>
</body>
</html>
