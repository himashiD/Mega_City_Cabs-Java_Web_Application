<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/nav_footer.css">
<link rel="stylesheet" href ="CSS/themscondition.css">
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
      <li><a href="terms_condition.jsp"><i class="fas fa-file-alt"></i> Terms & Condition</a></li>
      <li><a href="contact.jsp"><i class="fa-regular fa-address-book"></i> Contact</a></li>

    </ul>
    <a href="login.jsp">
    <button class="login-button"><i class="fas fa-sign-in-alt"></i> Login</button>
    </a>
  </nav>


<!-- Terms & Conditions Section -->
    <section class="terms-section">
        <div class="terms-container">
            <h2>📜 Terms & Conditions</h2>
            <p>By using Mega City Cab Service, you agree to the following terms and conditions.</p>

            <div class="terms-content">
                <h3>1. General Terms</h3>
                <p>
                    Mega City Cab Service operates a professional taxi and ride-hailing service. By booking a ride, you agree to comply with our policies and guidelines.
                </p>

                <h3>2. Booking & Cancellation Policy</h3>
                <p>
                    - Bookings can be made via our website, mobile app, or customer service hotline.<br>
                    - Cancellations must be made at least 30 minutes before the scheduled pickup time to avoid cancellation fees.<br>
                    - No-show customers will be charged the full fare.
                </p>

                <h3>3. Fare & Payment</h3>
                <p>
                    - Fares are calculated based on distance, duration, and service type.<br>
                    - Additional charges apply for waiting time, tolls, and peak-hour bookings.<br>
                    - Payments can be made via cash, credit/debit cards, or digital wallets.
                </p>

                <h3>4. Safety & Conduct</h3>
                <p>
                    - Seatbelts must be worn at all times.<br>
                    - Smoking, alcohol consumption, and illegal activities are strictly prohibited inside the vehicle.<br>
                    - Any misconduct towards the driver or damage to the vehicle will result in penalties and potential legal action.
                </p>

                <h3>5. Driver & Vehicle Responsibilities</h3>
                <p>
                    - Our drivers undergo background checks and training to ensure passenger safety.<br>
                    - Vehicles are maintained regularly for a safe and comfortable ride.<br>
                    - If a vehicle breakdown occurs, we will arrange an alternative ride at no extra cost.
                </p>

                <h3>6. Liability & Disclaimers</h3>
                <p>
                    - Mega City Cab Service is not responsible for any lost items left in the vehicle.<br>
                    - We are not liable for delays due to traffic, weather conditions, or unforeseen circumstances.<br>
                    - Customers must ensure they provide accurate pickup and drop-off details.
                </p>

                <h3>7. Privacy Policy</h3>
                <p>
                    - Personal data collected during bookings is kept confidential and used solely for service improvement.<br>
                    - We do not share customer information with third parties without consent.
                </p>

                <h3>8. Updates to Terms & Conditions</h3>
                <p>
                    - We reserve the right to update these terms at any time. Customers are encouraged to review them regularly.<br>
                    - Continued use of our service constitutes acceptance of the updated terms.
                </p>

                <h3>9. Contact Information</h3>
                <p>
                    If you have any questions or concerns regarding these terms, please contact us at:<br>
                    📧 Email: support@megacitycabs.com<br>
                    📞 Phone: +123-456-7890
                </p>
            </div>
        </div>
    </section>
    

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


  <script>
  //Add interactivity if needed
  document.querySelector('.login-button').addEventListener('click', () => {
    alert('Login functionality coming soon!');
  });
  </script>
</body>
</html>