<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href ="CSS/nav_footer.css">
<link rel="stylesheet" href ="CSS/customer_home.css">
<link rel="stylesheet" href ="CSS/service.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
<!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">
      <i class="fas fa-car"></i> MEGA Cabs
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
  
  
  <!-- Services Section -->
    <section class="services-section">
        <div class="services-container">
            <h2>🚖 Our Premium Cab Services</h2>
            <p>We offer reliable, affordable, and professional cab services tailored to your needs.</p>

            <div class="services-grid">
                <!-- Service 1 -->
                <div class="service-box">
                    <i class="fas fa-taxi"></i>
                    <h3>City Taxi Service</h3>
                    <p>Fast and convenient taxi service across the city, available 24/7.</p>
                </div>

                <!-- Service 2 -->
                <div class="service-box">
                    <i class="fas fa-business-time"></i>
                    <h3>Corporate Travel</h3>
                    <p>Premium cabs for business meetings, corporate travel, and VIP transportation.</p>
                </div>

                <!-- Service 3 -->
                <div class="service-box">
                    <i class="fas fa-plane"></i>
                    <h3>Airport Transfers</h3>
                    <p>Hassle-free pickups and drop-offs to and from the airport, on time, every time.</p>
                </div>

                <!-- Service 4 -->
                <div class="service-box">
                    <i class="fas fa-car"></i>
                    <h3>Luxury Car Rental</h3>
                    <p>Exclusive luxury cars for special occasions, weddings, and premium rides.</p>
                </div>

                <!-- Service 5 -->
                <div class="service-box">
                    <i class="fas fa-bus"></i>
                    <h3>Outstation Trips</h3>
                    <p>Book a cab for long-distance travel with safety, comfort, and experienced drivers.</p>
                </div>

                <!-- Service 6 -->
                <div class="service-box">
                    <i class="fas fa-user-shield"></i>
                    <h3>Safe Rides for Women</h3>
                    <p>Special safety features and trained drivers for secure rides for women travelers.</p>
                </div>

                <!-- Service 7 -->
                <div class="service-box">
                    <i class="fas fa-wheelchair"></i>
                    <h3>Accessible Cabs</h3>
                    <p>Wheelchair-friendly cabs for senior citizens and passengers with disabilities.</p>
                </div>

                <!-- Service 8 -->
                <div class="service-box">
                    <i class="fas fa-hand-holding-usd"></i>
                    <h3>Affordable and Transparent Pricing</h3>
                    <p>Upfront pricing, no hidden costs, and budget-friendly cab options for all.</p>
                </div>
            </div>
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


  <script>
  //Add interactivity if needed
  document.querySelector('.login-button').addEventListener('click', () => {
    alert('Login functionality coming soon!');
  });
  </script>
</body>
</html>