<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customers</title>
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
        
        
        
        <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Manage Customer</h1>
                    <form action="manageCustomer" method="post">
                    <button type="submit" class="view">View All</button>
                    </form>
                </div>
                <div class="report-body">

                    <table>
                       <tr>
                           <th>ID</th>
                           <th>Name</th>
                           <th>NIC</th>
                           <th>Phone</th>
                           <th>Address</th>
                           <th>Email</th>
                           <th>Action</th>
                      </tr>
                      <c:forEach var="cus" items="${customer}">
                      <tr>
                           <td>${cus.c_id }</td>
                           <td>${cus.c_name }</td>
                           <td>${cus.c_nic }</td>
                           <td>${cus.c_phone }</td>
                           <td>${cus.c_address }</td>
                           <td>${cus.c_email }</td>
                           <td>
                           
                           <form action="deleteCustomer" method="post">
                              <input type="hidden" name="email" value="${cus.c_email }">
                              <button type="submit" class="btn delete-btn"><i class="fas fa-trash"></i>Delete</button>
                           </form>
                           
                           </td>
                     </tr>
                     </c:forEach>
                      
                 </table>
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