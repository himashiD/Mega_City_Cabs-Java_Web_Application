<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.driver"%>

<%
    HttpSession sessionObj = request.getSession(false);

    // Redirect to login if session is invalid
    if (sessionObj == null || sessionObj.getAttribute("loggedInDriver") == null) {
        response.sendRedirect("driverlogin.jsp");
        return;
    }

    driver loggedInDriver = (driver) sessionObj.getAttribute("loggedInDriver");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Profile</title>
    <link rel="stylesheet" href="CSS/driver_css/driver_dashboard.css">
    <link rel="stylesheet" href="CSS/driver_css/driverprofile.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- for header part -->
    <header>

        <div class="logosec">
            <div class="logo">MEGA City Cabs</div>
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png"
                class="icn menuicn" 
                id="menuicn" 
                alt="menu-icon">
        </div>


        <div class="message">
            <h3>Driver</h3>
            <div class="dp">
              <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png"
                    class="dpicn" 
                    alt="dp">
            </div>
        </div>

    </header>

    <div class="main-container">
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <div class="nav-option option1">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
                         class="nav-img" 
                         alt="dashboard">
                    <h3> Dashboard</h3>
                </div>

                <div class="option2 nav-option">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183322/9.png"
                         class="nav-img" 
                         alt="profile">
                    <h3> My Profile</h3>
                </div>

                <div class="nav-option option3">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/6.png"
                         class="nav-img" 
                         alt="booking">
                    <h3> Booking</h3>
                </div>

                <div class="nav-option logout">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/7.png"
                         class="nav-img" 
                         alt="logout">
                    <h3>Logout</h3>
                </div>

                </div>
            </nav>
        </div>
        
        


          <div class="profile-container">
          
            <div class="profile-card">
            <h1 class="recent-Articles">My Profile</h1>
                <i class="fas fa-user-circle profile-icon"></i>
                <h3><%= loggedInDriver.getD_name() %></h3>
                <p>Email: <%= loggedInDriver.getD_email() %></p>
                <p>Phone: <%= loggedInDriver.getD_phone() %></p>
                <p>Status: <%= loggedInDriver.getD_status() %></p>
                
                <form action="updatedriverProfile" method="post">
                    <label for="d_phone">Phone:</label>
                    <input type="text" id="d_phone" name="d_phone" value="<%= loggedInDriver.getD_phone() %>">

                    <label for="d_password">New Password:</label>
                    <input type="password" id="d_password" name="d_password" placeholder="Enter new password">
                    
                    <button type="submit" class="update-btn">Update Profile</button>
                </form>
            </div>
        </div>


        
   </div>
        

    

<script>
document.querySelector(".menuicn").addEventListener("click", function () {
    document.querySelector(".navcontainer").classList.toggle("navclose");
});

document.querySelector(".option1").addEventListener("click", function () {
    window.location.href = "driver_dashboard.jsp";
});

document.querySelector(".option2").addEventListener("click", function () {
    window.location.href = "driverupdateProfile.jsp";
});

document.querySelector(".option3").addEventListener("click", function () {
    window.location.href = "driver_booking.jsp";
});


</script>

</body>
</html>