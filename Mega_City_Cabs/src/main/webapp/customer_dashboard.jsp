<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/nav_footer_dash.css">
<link rel="stylesheet" href ="CSS/customer_home.css">

</head>

<body>
  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">
      <i class="fas fa-car"></i> MEGA City Cabs
    </div>
    <ul class="nav-links">
      <li><a href="customer_home.jsp"><i class="fas fa-home"></i> Home</a></li>
      <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About</a></li>
      <li><a href="services.jsp"><i class="fas fa-concierge-bell"></i> Services</a></li>
      <li><a href="customer_booking.jsp"><i class="fas fa-info-circle"></i> Book Ride</a></li>
      <li><a href="terms_condition.jsp"><i class="fas fa-file-alt"></i> Terms</a></li>
    </ul>
    <div class="profile-dropdown">
      <img src="image/profile.jpg" alt="Profile" class="profile-image" onclick="toggleDropdown()">
      <div class="dropdown-content" id="profileDropdown">
                  <form action="update_customer_profile.jsp" method="post">
                              <input type="hidden" name= "name" value="${cus.c_name}">
                              <input type="hidden" name= "nic" value="${cus.c_nic}">
                              <input type="hidden" name= "phone" value="${cus.c_phone}">
                              <input type="hidden" name= "address" value="${cus.c_address}">
                              <input type="hidden" name= "email" value="${cus.c_email}">
                              <input type="hidden" name= "password" value="${cus.c_password}">
                              <input type="hidden" name= "password" value="${cus.c_cpassword}">
                              <button type= "submit" class="btn edit-btn">Edit Profile</button>
                  </form>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Exit</a>
      </div>
    </div>
  </nav>
  
  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <h1>Your Reliable Cab Service</h1>
      <p>Book a ride with us and enjoy a comfortable and safe journey.</p>
      <button class="book-now-button">Book Now</button>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <p>&copy; MEGA Cab Service</p>
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
  </script>
</body>
</html>