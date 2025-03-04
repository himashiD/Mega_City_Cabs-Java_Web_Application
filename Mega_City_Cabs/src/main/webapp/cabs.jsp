<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cabs</title>
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
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
                            class="nav-img" 
                            alt="dashboard">
                        <h3> Dashboard</h3>
                    </div>

                    <div class="option2 nav-option">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183322/9.png"
                            class="nav-img" 
                            alt="articles">
                        <h3> Admin</h3>
                    </div>

                    <div class="nav-option option3">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183320/5.png"
                            class="nav-img" 
                            alt="report">
                        <h3> Customers</h3>
                    </div>

                    <div class="nav-option option4">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/6.png"
                            class="nav-img" 
                            alt="institution">
                        <h3> Cabs</h3>
                    </div>

                    <div class="nav-option option5">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183323/10.png"
                            class="nav-img" 
                            alt="blog">
                        <h3> Drivers</h3>
                    </div>

                    <div class="nav-option option6">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183320/4.png"
                            class="nav-img" 
                            alt="settings">
                        <h3> Bookings</h3>
                    </div>
                    
                    <div class="nav-option option7">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183320/4.png"
                            class="nav-img" 
                            alt="settings">
                        <h3> Chats</h3>
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
        
        <div class="report-container">
                <div class="report-header">
                    <h1 class="recent-Articles">Manage Cabs</h1>
                    <form action="" method="post">
                    <button type="submit" class="view">View All</button>
                    </form>
                </div>
                <div class="report-body">
                <a href="addVehical.jsp"><button type="submit" class="view2">Add</button>
                </a>
                    <table>
                       <tr>
                           <th>ID</th>
                           <th>Vehicle No</th>
                           <th>Type</th>
                           <th>Model</th>
                           <th>Image</th>
                           <th>Seats</th>
                           <th>Action</th>
                      </tr>
                      

                    <c:forEach var="veh" items="${vehList}">
                        <tr>
                            <td>${veh.v_id}</td>
                            <td>${veh.v_number}</td>
                            <td>${veh.v_type}</td>
                            <td>${veh.v_model}</td>
                            <td>${veh.v_seat}</td>
                            <td>
                                <%-- Display Vehicle Image --%>
                                <c:if test="${not empty veh.v_image}">
                                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(veh.v_image)}" width="100" height="100">
                                </c:if>
                                <c:if test="${empty veh.v_image}">
                                    No Image
                                </c:if>
                            </td>
                            <td class="button-container">
                                <!-- Update Form -->
                                <form action="updatevehicals.jsp" method="post">
                                    <input type="hidden" name="vnumber" value="${veh.v_number}">
                                    <input type="hidden" name="vtype" value="${veh.v_type}">
                                    <input type="hidden" name="vmodel" value="${veh.v_model}">
                                    <input type="hidden" name="vseat" value="${veh.v_seat}">
                                    <input type="hidden" name="vimage" value="${veh.v_image}">
                                    <button class="edit-btn"><i class="fas fa-edit"></i> Update</button>
                                </form>

                                <!-- Delete Form -->
                                <form action="deleteVehicals" method="post">
                                    <input type="hidden" name="vnumber" value="${veh.v_number}">
                                    <button type="submit" class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
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
    document.querySelector(".option2").addEventListener("click", function () {
         window.location.href = "admins.jsp";
         });
     });
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option3").addEventListener("click", function () {
         window.location.href = "customers.jsp";
         });
    });
    
    document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".option4").addEventListener("click", function () {
         window.location.href = "cabs.jsp";
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
    document.querySelector(".option7").addEventListener("click", function () {
         window.location.href = "chats.jsp";
         });
     });
    </script>
</body>
</html>