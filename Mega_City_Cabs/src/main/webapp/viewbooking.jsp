<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.util.*, model.booking, services.bookingService, controller.DBConnect" %>


<%
    model.customer loggedInCustomer = (model.customer) session.getAttribute("loggedInCustomer");

    if (loggedInCustomer == null) {
        System.out.println("loggedInCustomer is NULL! Redirecting to login page.");
        response.sendRedirect("login.jsp");
        return;
    }

    System.out.println("Logged-in Customer ID: " + loggedInCustomer.getC_id());

    bookingService bookingService = new bookingService();
    List<booking> customerBookings = bookingService.getCustomerBookings(loggedInCustomer.getC_id());

    if (customerBookings == null) {
        System.out.println(" customerBookings is NULL! Initializing as empty list.");
        customerBookings = new ArrayList<>();
    } else {
        System.out.println("Total Bookings Retrieved: " + customerBookings.size());
    }

    request.setAttribute("customerBookings", customerBookings);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Mega City Cab</title>
    <link rel="stylesheet" href="CSS/viewbookings.css">
    <link rel="stylesheet" href ="CSS/nav_footer_dash.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

</head>
<body>

<!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">
      <i class="fas fa-car"></i> MEGA CITY CABS
    </div>
    <ul class="nav-links">
      <li><a href="customer_dashboard.jsp"><i class="fas fa-home"></i> Home</a></li>
      <li><a href="customer_booking.jsp"><i class="fas fa-info-circle"></i> Book Ride</a></li>
    </ul>
    <div class="profile-dropdown">
      <img src="image/profile.jpg" alt="Profile" class="profile-image" onclick="toggleDropdown()">
      <div class="dropdown-content" id="profileDropdown">
        <a href="update_customer_profile.jsp"><i class="fa-solid fa-file-invoice"></i> My Profile</a>
        <a href="customerlogout.jsp"><i class="fas fa-sign-out-alt"></i> Exit</a>
      </div>
    </div>
  </nav>

    <!-- Page Banner -->
    <section class="about-banner">
        <h1>My Bookings</h1>
        <p><a href="customer_dashboard.jsp">Home</a> ||  View Bookings</p>
    </section>

    <!-- Booking Table Section -->
    <section class="booking-table-container">
        <h2>My Bookings</h2>

        <c:choose>
            <c:when test="${not empty customerBookings}">
                <table class="booking-table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Customer ID</th>
                            <th>Customer Name</th>
                            <th>Phone</th>
                            <th>Vehicle No.</th>
                            <th>Pick-up Location</th>
                            <th>Drop Location</th>
                            <th>Date Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${customerBookings}">
                            <tr>
                                <td>${booking.b_id}</td>
                                <td>${booking.c_id}</td>
                                <td>${booking.c_name}</td>
                                <td>${booking.c_phone}</td>
                                <td>${booking.v_number}</td>
                                <td>${booking.pickup_location}</td>
                                <td>${booking.drop_location}</td>
                                <td>${booking.pickup_date}</td>
                                <td class="${booking.booking_status eq 'Pending' ? 'status-pending' : 
                                            booking.booking_status eq 'Confirmed' ? 'status-confirmed' : 
                                            booking.booking_status eq 'Cancelled' ? 'status-cancelled' :
                                            booking.booking_status eq 'On Ride' ? 'status-onride' : 'status-completed'}">
                                    ${booking.booking_status}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-bookings"> No bookings found.</p>
            </c:otherwise>
        </c:choose>
    </section>


<!-- Footer part -->

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Company</h3>
            <h5>Mega City Cabs is your reliable ride partner, offering safe, affordable, and luxurious transport solutions. From everyday commutes to corporate rides, we ensure comfort and punctuality with our premium fleet. 🚖✨</h5>
        </div>
        <div class="footer-column">
            <h3>Services</h3>
            <ul>
                <li><a href="customer_dashboard.jsp">Home</a></li>
                <li><a href="customer_booking.jsp">Booking Ride</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Services</h3>
            <ul>
                <li><a href="#">Ride Booking</a></li>
                <li><a href="#">Corporate Services</a></li>
                <li><a href="#">Luxury Rides</a></li>
                <li><a href="#">Customer Support</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Follow Us</h3>
            <div class="footer-social">
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-linkedin"></i></a>
            </div>
        </div>
        <div class="footer-column newsletter-column">
            <h3>Subscribe</h3>
            <p>Stay updated with Mega City Cabs</p>
            <div class="newsletter">
                <input type="email" placeholder="Enter your email" id="newsletter-email">
                <button id="newsletter-btn"><i class="fa-solid fa-paper-plane"></i></button>
            </div>
        </div>
    </div>
    <div class="">
        <p>2025 Mega City Cabs. All rights reserved.</p>
    </div>
</footer>

<script>
    function toggleDropdown() {
      var dropdown = document.getElementById("profileDropdown");
      dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }
    window.onclick = function(event) {
      if (!event.target.matches('.profile-image')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.style.display === "block") {
            openDropdown.style.display = "none";
          }
        }
      }
    }
    
    
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelector(".logout").addEventListener("click", function () {
             window.location.href = "customerlogout.jsp";
             });
         });
  </script>
</body>
</html>