<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/nav_footer_dash.css">
<link rel="stylesheet" href ="CSS/customer_home.css">
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
  
<!-- Hero Section -->
  <section class="hero">
    <img src="image/home1.png" class="img" alt="Italian Trulli">
    <div class="hero-content">
      <h1>Your Reliable Cab Service</h1>
      <p>Book a ride with us and enjoy a comfortable and safe journey.</p>
      <a href="customer_booking.jsp" ><button class="book-now-button">Book Now </button></a>
    </div>
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