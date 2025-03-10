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
                    <li><a href="customer_booking.jsp" class="active">Booking</a></li>
                    <li><a href="customer_about.jsp">About</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="logout.html">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Page Banner -->
    <section class="about-banner">
        <h1>Book a Vehicle</h1>
        <p><a href="customerhome.jsp">Home</a> → Booking</p>
    </section>

    <br>

    <!-- 🚀 Auto-fetch Vehicles from Servlet -->
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
           <button onclick="window.location.href='viewbooking.jsp'">View Bookings</button>
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

    <!-- 🔎 JavaScript for Search Function -->
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