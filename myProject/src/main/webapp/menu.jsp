<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, Bean.DriverBean, Bean.CabBean" %>
<html>
<head>
    <title>Menu Page</title>
</head>
<body>
    <h1>Driver Details</h1>
    <c:forEach var="driver" items="${drivers}">
        <p>Name: ${driver.name}</p>
        <p>Address: ${driver.address}</p>
        <p>NIC: ${driver.nicNo}</p>
        <img src="${driver.imagePath}" alt="Driver Image" width="100"/>
    </c:forEach>

    <h1>Cab Details</h1>
    <c:forEach var="cab" items="${cabs}">
        <p>Model: ${cab.model}</p>
        <p>Cab Number: ${cab.cabNumber}</p>
        <p>Seats: ${cab.numSeats}</p>
        <img src="${cab.imagePath}" alt="Cab Image" width="100"/>
    </c:forEach>
</body>
</html>
