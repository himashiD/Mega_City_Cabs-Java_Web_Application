<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/nav_footer.css">
<link rel="stylesheet" href ="CSS/customer_home.css">

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
      <li><a href="terms_condition.jsp"><i class="fas fa-file-alt"></i> Terms</a></li>
    </ul>
    <a href="login.jsp">
    <button class="login-button"><i class="fas fa-sign-in-alt"></i> Login</button>
    </a>
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <img src="image/home_1.jpg" alt="Italian Trulli">
    <div class="hero-content">
      <h1>Your Reliable Cab Service</h1>
      <p>Book a ride with us and enjoy a comfortable and safe journey.</p>
      <button class="book-now-button">Book Now </button>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <p>&copy; MEGA Cab Service</p>
  </footer>

  <script>
  //Add interactivity if needed
  document.querySelector('.login-button').addEventListener('click', () => {
    alert('Login functionality coming soon!');
  });
  </script>

</body>
</html>