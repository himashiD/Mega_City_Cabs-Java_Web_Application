<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking - Mega City Cab</title>
    <link rel="stylesheet" href="CSS/customer_booking.css">
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
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Exit</a>
      </div>
    </div>
  </nav>

    <!-- Page Banner -->
    <section class="about-banner">
        <h1>Book Your Ride</h1>
        <p><a href="customerhome.jsp">Home</a> ||  Booking</p>
    </section>

    <br>

    <c:if test="${empty vehList}">
        <jsp:forward page="customerDisplayvehical" />
    </c:if>

    <!-- Vehicle List Section -->
    <section class="vehicle-container">
        <h2>Available Vehicles</h2>

       <div class="search-bar">
		    <input type="text" id="searchInput" placeholder="Search vehicles by model, type, number, or driver name..." onkeyup="searchVehicles()">
		    <button class="search-btn"><i class="fa-solid fa-search"></i> Search</button>
		</div>
		
		<div>
           <button onclick="window.location.href='viewbooking.jsp'" class="view-btn">View Bookings</button>
		</div>


        <div class="vehicle-grid" id="vehicleGrid">
        

        <c:choose>
            <c:when test="${not empty vehList}">
                <c:forEach var="veh" items="${vehList}">
				    <div class="vehicle-card">
				        <div class="vehicle-img">
				            <c:if test="${not empty veh.v_image}">
				                <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(veh.v_image)}" alt="Vehicle Image">
				            </c:if>
				            <c:if test="${empty veh.v_image}">
				                <img src="images/no-image.jpg" alt="No Image Available">
				            </c:if>
				        </div>
				        <div class="vehicle-details">
				            <h3>${veh.v_model} - ${veh.v_type}</h3>
				            <p><strong>Vehicle No:</strong> ${veh.v_number}</p>
				            <p><strong>Seats:</strong> ${veh.v_seat}</p>
				            <p><strong>Price:</strong> $${veh.v_price}/day</p>
				            <p><strong>Driver:</strong> ${veh.d_name}</p>
				            <p><strong>Driver Contact:</strong> ${veh.d_phone}</p> 
				            <a href="booking_form.jsp?vehicleNumber=${veh.v_number}" class="book-btn">Book Now</a>


				        </div>
				    </div>
				</c:forEach>
            </c:when>
            <c:otherwise>
                <p class="no-vehicles">No vehicles available at the moment.</p>
            </c:otherwise>
        </c:choose>

        </div>
    </section>

    <br>


<!-- Footer part -->

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Company</h3>
            <ul>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="">Booking</a></li>
                <li><a href="terms_condition.jsp">Terms Conditions</a></li>
            </ul>
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
	    function searchVehicles() {
	        var input, filter, cards, details, i, txtValue;
	        input = document.getElementById("searchInput");
	        filter = input.value.toUpperCase();
	        cards = document.getElementsByClassName("vehicle-card");
	
	        for (i = 0; i < cards.length; i++) {
	            let vehicleTitle = cards[i].querySelector("h3"); // Vehicle Model & Type
	            let vehicleNumber = cards[i].querySelector("p:nth-of-type(1)"); // Vehicle No
	            let driverName = cards[i].querySelector("p:nth-of-type(5)"); // Driver Name
	
	            let match = false;
	
	            if (vehicleTitle && vehicleTitle.innerText.toUpperCase().indexOf(filter) > -1) {
	                match = true;
	            }
	            if (vehicleNumber && vehicleNumber.innerText.toUpperCase().indexOf(filter) > -1) {
	                match = true;
	            }
	            if (driverName && driverName.innerText.toUpperCase().indexOf(filter) > -1) {
	                match = true;
	            }
	
	            cards[i].style.display = match ? "" : "none";
	        }
	    }

    </script>

</body>
</html>