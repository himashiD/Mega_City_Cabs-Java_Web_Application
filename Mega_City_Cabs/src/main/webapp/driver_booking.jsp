<%@page import="model.driver"%>
<%@page import="java.util.List"%>
<%@page import="model.booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Retrieve bookings from request
    List<booking> driverBookings = (List<booking>) request.getAttribute("driverBookings");

    // Debugging output
    System.out.println("🔍 JSP Loaded: Checking driverBookings list");
    if (driverBookings != null) {
        System.out.println("✅ Bookings in JSP: " + driverBookings.size());
        for (booking bk : driverBookings) {
            System.out.println("🟢 Booking: " + bk.getB_id() + " - " + bk.getV_number());
        }
    } else {
        System.out.println("❌ driverBookings is NULL in JSP.");
    }
    
    // Retrieve logged-in driver from session
    driver loggedInDriver = (driver) session.getAttribute("loggedInDriver");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Bookings</title>
    <link rel="stylesheet" href="CSS/admin_css/admin_dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<!-- Header Section -->
<header>
    <div class="logosec">
        <div class="logo">MEGA City Cabs</div>
        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png"
             class="icn menuicn" 
             id="menuicn" 
             alt="menu-icon">
    </div>
    <div class="message">
        <h3>Driver</h3>
        <div class="dp">
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png"
                 class="dpicn" 
                 alt="profile">
        </div>
    </div>
</header>

<!-- Sidebar Navigation -->
<div class="main-container">
    <div class="navcontainer">
        <nav class="nav">
            <div class="nav-upper-options">
                <div class="nav-option option1">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
                         class="nav-img" 
                         alt="dashboard">
                    <h3> Dashboard</h3>
                </div>

                <div class="option2 nav-option">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183322/9.png"
                         class="nav-img" 
                         alt="profile">
                    <h3> My Profile</h3>
                </div>

                <div class="nav-option option3">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/6.png"
                         class="nav-img" 
                         alt="booking">
                    <h3> Booking</h3>
                </div>

                <div class="nav-option logout">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/7.png"
                         class="nav-img" 
                         alt="logout">
                    <h3>Logout</h3>
                </div>
            </div>
        </nav>
    </div>

    
    <!-- Bookings Table -->
<div class="report-container">
    <div class="report-header">
        <h1 class="recent-Articles">Booking Details</h1>
        <form action="driverBooking" method="post">
            <button type="submit" class="view">
                <i class="fas fa-sync-alt"></i> View All
            </button>
        </form>
    </div>

    
    <c:choose>
        <c:when test="${not empty driverBookings}">
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Phone</th>
                        <th>Vehicle No.</th>
                        <th>Pick-up Location</th>
                        <th>Drop Location</th>
                        <th>Date Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${driverBookings}">
                        <tr>
                            <td>${booking.b_id}</td>
                            <td>${booking.c_name}</td>
                            <td>${booking.c_phone}</td>
                            <td>${booking.v_number}</td>
                            <td>${booking.pickup_location}</td>
                            <td>${booking.drop_location}</td>
                            <td>${booking.pickup_date}</td>
                            <td class="status-${booking.booking_status.toLowerCase().replaceAll(' ', '-')}">
                                ${booking.booking_status}
                            </td>
                            <td>
                                <form action="updateBooking" method="post" class="status-update-form">
                                            <input type="hidden" name="bookingId" value="${booking.b_id}">
                                            <select name="status">
                                                <option value="Pending" <c:if test="${booking.booking_status == 'Pending'}">selected</c:if>>Pending</option>
                                                <option value="Confirmed" <c:if test="${booking.booking_status == 'Confirmed'}">selected</c:if>>Confirmed</option>
                                                <option value="On Ride" <c:if test="${booking.booking_status == 'On Ride'}">selected</c:if>>On Ride</option>
                                                <option value="Completed" <c:if test="${booking.booking_status == 'Completed'}">selected</c:if>>Completed</option>
                                                <option value="Cancelled" <c:if test="${booking.booking_status == 'Cancelled'}">selected</c:if>>Cancelled</option>
                                            </select>
                                            <button type="submit" class="status-btn">Update</button>
                                        </form>                            
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p class="no-bookings">❌ No bookings found.</p>
        </c:otherwise>
    </c:choose>
  </div>
</div>




<!-- JavaScript for Sidebar Navigation -->
<script>
document.querySelector(".menuicn").addEventListener("click", function () {
    document.querySelector(".navcontainer").classList.toggle("navclose");
});

document.querySelector(".option1").addEventListener("click", function () {
    window.location.href = "driver_dashboard.jsp";
});

document.querySelector(".option2").addEventListener("click", function () {
    window.location.href = "driverupdateProfile.jsp";
});

document.querySelector(".option3").addEventListener("click", function () {
    window.location.href = "driver_booking.jsp";
});
document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".logout").addEventListener("click", function () {
         window.location.href = "driverlogout.jsp";
         });
     });

</script>

</body>
</html>
