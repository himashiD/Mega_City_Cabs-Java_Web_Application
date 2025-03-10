<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.util.Base64, model.vehical, controller.DBConnect" %>

<%
    String vehicleNumber = request.getParameter("vehicleNumber");
    vehical veh = null;

    if (vehicleNumber != null) {
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                 "SELECT v.*, d.d_name, d.d_phone FROM vehical v " +
                 "LEFT JOIN driver d ON v.d_id = d.d_id WHERE v.v_number = ?")) {
            
            stmt.setString(1, vehicleNumber);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                veh = new vehical();
                veh.setV_number(rs.getString("v_number"));
                veh.setV_model(rs.getString("v_model"));
                veh.setV_type(rs.getString("v_type"));
                veh.setV_seat(rs.getString("v_seat"));
                veh.setV_price(rs.getString("v_price"));
                veh.setD_name(rs.getString("d_name"));
                veh.setD_phone(rs.getInt("d_phone"));
                veh.setV_image(rs.getBytes("v_image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    request.setAttribute("veh", veh);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Vehicle</title>
    <link rel="stylesheet" href="CSS/booking_form.css">
</head>
<body>

    <section class="booking-container">
        <h2>Book Your Ride</h2>

        <c:choose>
            <c:when test="${not empty veh}">
                <div class="booking-details">
                    <c:choose>
                        <c:when test="${not empty veh.v_image}">
                            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(veh.v_image)}" 
                                 alt="Vehicle Image" class="booking-image">
                        </c:when>
                        <c:otherwise>
                            <img src="images/no-image.jpg" alt="No Image Available" class="booking-image">
                        </c:otherwise>
                    </c:choose>
                    
                    <h3>${veh.v_model} - ${veh.v_type}</h3>
                    <p><strong>Vehicle No:</strong> ${veh.v_number}</p>
                    <p><strong>Seats:</strong> ${veh.v_seat}</p>
                    <p><strong>Price:</strong> $${veh.v_price}/day</p>
                    <p><strong>Driver:</strong> ${veh.d_name}</p>
                    <p><strong>Driver Contact:</strong> ${veh.d_phone}</p>
                </div>
            </c:when>
            <c:otherwise>
                <p class="error-message">❌ No vehicles available at the moment.</p>
            </c:otherwise>
        </c:choose>

        <!-- Booking Form -->
        <form action="bookVehicle" method="post">
            <input type="hidden" name="vehicleNumber" value="${veh.v_number}">

            <label for="customerName">Full Name:</label>
            <input type="text" id="customerName" name="customerName" 
                   value="${not empty loggedInCustomer ? loggedInCustomer.c_name : ''}" required>

            <label for="customerEmail">Email:</label>
            <input type="email" id="customerEmail" name="customerEmail" 
                   value="${not empty loggedInCustomer ? loggedInCustomer.c_email : ''}" required>

            <label for="customerPhone">Phone Number:</label>
            <input type="text" id="customerPhone" name="customerPhone" 
                   value="${not empty loggedInCustomer ? loggedInCustomer.c_phone : ''}" required>

            <label for="pickupLocation">Pickup Location:</label>
            <input type="text" id="pickupLocation" name="pickupLocation" required>
            
            <label for="dropLocation">Drop Location:</label>
            <input type="text" id="dropLocation" name="dropLocation" required>

            <label for="pickupDate">Pickup Date and Time:</label>
            <input type="datetime-local" id="pickupDate" name="pickupDate" required>

            <input type="hidden" name="bookingStatus" value="Request">

            <button type="submit" class="submit-btn">Book Now</button>
        </form>
    </section>

</body>
</html>
