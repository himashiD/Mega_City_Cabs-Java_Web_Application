<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/nav_footer.css">
<link rel="stylesheet" href ="CSS/contact.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">
      <i class="fas fa-car"></i> MEGA CITY CABS
    </div>
    <ul class="nav-links">
      <li><a href="customer_home.jsp"><i class="fas fa-home"></i> Home</a></li>
      <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About</a></li>
      <li><a href="services.jsp"><i class="fas fa-concierge-bell"></i> Services</a></li>
      <li><a href="terms_condition.jsp"><i class="fas fa-file-alt"></i> Terms and Condition</a></li>
      <li><a href="contact.jsp"><i class="fa-regular fa-address-book"></i> Contact</a></li>
    </ul>
    <a href="login.jsp">
    <button class="login-button"><i class="fas fa-sign-in-alt"></i> Login</button>
    </a>
  </nav>
  

<div class="contact-section">
    <div class="contact-container">
        <!-- Contact Info Section -->
        <div class="contact-info">
            <h2>Contact Mega City Cab Service</h2>
            <p>Have questions? Need assistance? Reach out to us anytime!</p>
            
            <div class="contact-details">
                <div class="contact-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <p>123 Mega City, Main Street, Colombo</p>
                </div>
                <div class="contact-item">
                    <i class="fas fa-phone"></i>
                    <p>01122563255</p>
                    <p>01122563256</p>
                </div>
                <div class="contact-item">
                    <i class="fas fa-envelope"></i>
                    <p>support@megacitycab.com</p>
                </div>
                <div class="contact-item">
                    <i class="fas fa-clock"></i>
                    <p>24/7 Customer Support</p>
                </div>
            </div>
        </div>

        <!-- Contact Form Section -->
        <div class="contact-form">
            <h3>Send Us a Message</h3>
            <form action="#">
                <input type="text" placeholder="Full Name" required>
                <input type="email" placeholder="Email Address" required>
                <input type="text" placeholder="Subject" required>
                <textarea placeholder="Your Message" rows="5" required></textarea>
                <button type="submit" class="contact-button">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Google Map Section -->
    <div class="map-container">
        <h3>Find Us on the Map</h3>
        <iframe src="https://www.google.com/maps/embed?..." 
            width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</div>


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
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="terms_condition.jsp">Terms Conditions</a></li>
                <li><a href="contact.jsp">Contact</a></li>
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

</body>
</html>