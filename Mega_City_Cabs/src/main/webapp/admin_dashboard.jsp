<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="CSS/admin_css/admin_dashboard.css">
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
            <h3>Admin</h3>
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
                        <img src="image/image1.svg"
                            class="nav-img" 
                            alt="dashboard">
                        <h3> Dashboard</h3>
                    </div>

                    <div class="nav-option option3">
                        <img src="image/image2.svg"
                            class="nav-img" 
                            alt="institution">
                        <h3> Customers</h3>
                    </div>

                    <div class="nav-option option4">
                        <img src="image/image3.svg"
                            class="nav-img" 
                            alt="institution">
                        <h3> Vehicles</h3>
                    </div>

                    <div class="nav-option option5">
                        <img src="image/image4.svg"
                            class="nav-img" 
                            alt="blog">
                        <h3> Drivers</h3>
                    </div>

                    <div class="nav-option option6">
                        <img src="image/image5.svg"
                            class="nav-img" 
                            alt="settings">
                        <h3> Bookings</h3>
                    </div>


                    <div class="nav-option logout">
                        <img src="image/image6.svg"
                            class="nav-img" 
                            alt="logout">
                        <h3>Logout</h3>
                    </div>

                </div>
            </nav>
        </div>
        <div class="main">

            

            <div class="box-container">

                <div class="box box1">
                    <div class="text">
                        <h2 class="topic-heading">60.5k</h2>
                        <h2 class="topic">Customers</h2>
                    </div>

                    <img src="image/image22.svg"
                        alt="Views">
                </div>

                <div class="box box2">
                    <div class="text">
                        <h2 class="topic-heading">30</h2>
                        <h2 class="topic">Cabs</h2>
                    </div>

                    <img src="image/image33.svg" 
                         alt="likes">
                </div>

                <div class="box box3">
                    <div class="text">
                        <h2 class="topic-heading">45</h2>
                        <h2 class="topic">Drivers</h2>
                    </div>

                    <img src="image/image44.svg"
                        alt="comments">
                </div>

                <div class="box box4">
                    <div class="text">
                        <h2 class="topic-heading">1100</h2>
                        <h2 class="topic">Booking</h2>
                    </div>

                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210185029/13.png" 
                    alt="published">
                </div>
            </div>
        </div>
    </div>

    <script>
    let menuicn = document.querySelector(".menuicn");
    let nav = document.querySelector(".navcontainer");

    menuicn.addEventListener("click", () => {
        nav.classList.toggle("navclose");
    })
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option1").addEventListener("click", function () {
        window.location.href = "admin_dashboard.jsp";
        });
    });
    
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option3").addEventListener("click", function () {
         window.location.href = "customers.jsp";
         });
    });
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option4").addEventListener("click", function () {
         window.location.href = "managevehicals.jsp";
         });
    });
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option5").addEventListener("click", function () {
         window.location.href = "drivers.jsp";
         });
     });
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option6").addEventListener("click", function () {
         window.location.href = "bookings.jsp";
         });
     });
    
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelector(".logout").addEventListener("click", function () {
             window.location.href = "adminlogout.jsp";
             });
         });
        
    

 </script>

</body>
</html>