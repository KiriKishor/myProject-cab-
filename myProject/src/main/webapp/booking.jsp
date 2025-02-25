<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking - Mega City Cab</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f7f7f7;
            padding: 20px;
        }

        .booking-container {
            background: white;
            padding: 30px;
            width: 400px;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .booking-container h2 {
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn {
            background: #0072ff;
            color: white;
            border: none;
            padding: 10px 20px;
            width: 100%;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        .btn:hover {
            background: #005bb5;
        }
    </style>
</head>
<body>

    <div class="booking-container">
        <h2>Booking Form</h2>
        
        <form action="BookingServlet" method="post">
            <input type="text" name="username" class="input-field" placeholder="Username" required><br>
            <input type="text" name="mobile_no" class="input-field" placeholder="Mobile Number" required><br>
            <input type="text" name="starting_point" class="input-field" placeholder="Starting Point" required><br>
            <input type="text" name="finishing_point" class="input-field" placeholder="Finishing Point" required><br>
            <input type="number" name="distance" class="input-field" placeholder="Distance (in km)" required><br>
            <button type="submit" class="btn">Book Now</button>
        </form>
    </div>

</body>
</html>
