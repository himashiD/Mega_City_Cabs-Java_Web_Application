<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.util.*, model.booking, services.bookingService, controller.DBConnect" %>


<%
    model.customer loggedInCustomer = (model.customer) session.getAttribute("loggedInCustomer");

    if (loggedInCustomer == null) {
        System.out.println("❌ loggedInCustomer is NULL! Redirecting to login page.");
        response.sendRedirect("login.jsp");
        return;
    }

    System.out.println("✅ Logged-in Customer ID: " + loggedInCustomer.getC_id());

    bookingService bookingService = new bookingService();
    List<booking> customerBookings = bookingService.getCustomerBookings(loggedInCustomer.getC_id());

    if (customerBookings == null) {
        System.out.println("❌ customerBookings is NULL! Initializing as empty list.");
        customerBookings = new ArrayList<>();
    } else {
        System.out.println("✅ Total Bookings Retrieved: " + customerBookings.size());
    }

    request.setAttribute("customerBookings", customerBookings);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Mega City Cab</title>
    <link rel="stylesheet" href="CSS/viewbooking.css">
    <script defer src="JS/customer_booking.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <!-- Navbar -->
    <header>
        <div class="navbar">
            <a href="customerhome.jsp" class="logo"><i class="fa-solid fa-taxi"></i> Mega City Cab</a>
            <nav>
                <ul class="nav-menu">
                    <li><a href="customerhome.jsp">Home</a></li>
                    <li><a href="customer_booking.jsp">Booking</a></li>
                    <li><a href="customer_about.jsp">About</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Page Banner -->
    <section class="about-banner">
        <h1>My Bookings</h1>
        <p><a href="customerhome.jsp">Home</a> → View Bookings</p>
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
                <p class="no-bookings">❌ No bookings found.</p>
            </c:otherwise>
        </c:choose>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">Jobs</a></li>
                    <li><a href="#">Brand Assets</a></li>
                    <li><a href="#">Investor Relations</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Features</h3>
                <ul>
                    <li><a href="#">Taxi Booking</a></li>
                    <li><a href="#">Corporate Travel</a></li>
                    <li><a href="#">Luxury Rides</a></li>
                    <li><a href="#">Customer Support</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>Resources</h3>
                <ul>
                    <li><a href="#">Guides</a></li>
                    <li><a href="#">Research</a></li>
                    <li><a href="#">Experts</a></li>
                    <li><a href="#">Agencies</a></li>
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
            <div class="footer-column">
                <h3>Newsletter</h3>
                <p>Stay updated with our latest news</p>
                <div class="newsletter">
                    <input type="email" placeholder="Enter Email" id="newsletter-email">
                    <button id="newsletter-btn"><i class="fa-solid fa-paper-plane"></i></button>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 All rights reserved | Mega City Cab</p>
        </div>
    </footer>

</body>
</html>