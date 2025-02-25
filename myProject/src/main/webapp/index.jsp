<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Mega City Cab</title>
    <style>
        /* Styles remain the same */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: #ffffff;
            padding: 30px;
            width: 350px;
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
            background: #0072ff;
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
            background: #005bb5;
        }

        .register-text {
            margin-top: 20px;
            font-size: 14px;
        }

        .register-text a {
            color: #0072ff;
            text-decoration: none;
            font-weight: bold;
        }

        .register-text a:hover {
            text-decoration: underline;
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
        <h2>Login to Mega City Cab</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-message"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="LoginServlet" method="post">
            <input type="text" name="username" class="input-field" placeholder="Enter Username" required><br>
            <input type="password" name="password" class="input-field" placeholder="Enter Password" required><br>
            <button type="submit" class="btn">Login</button>
        </form>

        <p class="register-text">If you do not have a username or password, please <a href="register.jsp">Register</a>.</p>
    </div>
</body>
</html>
