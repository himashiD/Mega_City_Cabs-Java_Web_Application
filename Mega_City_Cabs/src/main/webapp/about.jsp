<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/nav_footer.css">
<link rel="stylesheet" href ="CSS/customer_home.css">
<link rel="stylesheet" href ="CSS/about.css">
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


    <!-- About Section -->
    <section class="about-section">
        <div class="about-container">
            <div class="about-image">
                <img src="image/about2.png" alt="Mega City Cab Service">
            </div>
            <div class="about-content">
                <h2>About Mega City Cab</h2>
                <p>
                    Welcome to <strong>Mega City Cab</strong>, your trusted and reliable transportation service. 
                    We take pride in offering a safe, comfortable, and affordable ride experience to our customers. 
                    Whether you're heading to work, traveling to the airport, or exploring the city, we ensure you 
                    reach your destination hassle-free.
                </p>
                <p>
                    With a commitment to quality service and customer satisfaction, Mega City Cab has built a strong reputation in the transportation industry. 
                    Our modern fleet, professional drivers, and easy booking system make us the preferred choice for many riders across the city.
                </p>
                <a href="services.jsp" class="about-button">Explore Our Services</a>
            </div>
        </div>
    </section>

    <!-- Our Mission Section -->
    <section class="mission-section">
        <div class="mission-container">
            <h2>Our Mission</h2>
            <p>
                At Mega City Cab, our mission is to provide safe, efficient, and comfortable transportation services to our customers. 
                We strive to redefine urban mobility by combining technology, convenience, and professionalism.
            </p>
            <p>
                We believe in making transportation affordable and accessible for everyone while maintaining the highest standards of safety and service excellence.
            </p>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="why-choose">
        <div class="why-container">
            <h2>Why Choose Mega City Cab?</h2>
            <div class="why-grid">
                <div class="why-box">
                    <i class="fas fa-user-shield"></i>
                    <h3>Safety First</h3>
                    <p>We ensure the highest safety standards with trained drivers and regularly maintained vehicles.</p>
                </div>
                <div class="why-box">
                    <i class="fas fa-clock"></i>
                    <h3>24/7 Availability</h3>
                    <p>We are available round the clock to serve your travel needs anytime, anywhere.</p>
                </div>
                <div class="why-box">
                    <i class="fas fa-car"></i>
                    <h3>Modern Fleet</h3>
                    <p>We offer a wide range of well-maintained vehicles, including economy, business, and luxury options.</p>
                </div>
                <div class="why-box">
                    <i class="fas fa-mobile-alt"></i>
                    <h3>Easy Booking</h3>
                    <p>Book your ride easily via our website, mobile app, or phone call.</p>
                </div>
                <div class="why-box">
                    <i class="fas fa-wallet"></i>
                    <h3>Affordable Pricing</h3>
                    <p>Enjoy transparent and budget-friendly fares without hidden charges.</p>
                </div>
                
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials">
        <h2>What Our Customers Say</h2>
        <div class="testimonial-container">
            <div class="testimonial-box">
                <p>"Mega City Cab provides exceptional service! Their cars are always clean, and the drivers are professional and polite."</p>
                <h4>- Sarah M.</h4>
            </div>
            <div class="testimonial-box">
                <p>"Affordable pricing and on-time pickups make Mega City Cab my go-to transportation choice!"</p>
                <h4>- James T.</h4>
            </div>
            <div class="testimonial-box">
                <p>"The best cab service I have used so far. Easy booking and great customer support!"</p>
                <h4>- Lisa R.</h4>
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