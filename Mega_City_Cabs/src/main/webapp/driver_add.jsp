<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<link rel="stylesheet" href="CSS/driver_css/add_driver.css">
</head>
<body>
    <div class="container">
        <div class="image-section">
        <img src="image/driver_image2.png" alt="Description of image" width="410px" height= "750px">
        </div>
        <div class="form-section">
            <h2>Add Drivers</h2>
            <form method="post" action="addDriver">
                <div class="input-group">
                    <label for="name">Full Name</label>
                    <i class="fa fa-user"></i>
                    <input type="text" id="name" name = "name" placeholder="Enter Driver Name" required>
                </div>
                <div class="input-group">
                    <label for="nic">NIC</label>
                    <i class="fa fa-id-card"></i>
                    <input type="text" id="nic" name = "nic" placeholder="Enter NIC" required>
                </div>
                <div class="input-group">
                    <label for="phone">Phone</label>
                    <i class="fa fa-phone"></i>
                    <input type="text" id="phone" name = "phone" placeholder="Enter Phone" required>
                </div>
                <div class="input-group">
                    <label for="address">Address</label>
                    <i class="fa fa-home"></i>
                    <input type="text" id="address" name = "address" placeholder="Enter Address" required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <i class="fa fa-envelope"></i>
                    <input type="email" id="email" name = "email" placeholder="Enter Email" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="password" id="password" name = "password" placeholder="Enter Password" required>
                </div>
                <button type="submit" class="btn">Add</button>
            </form>
        </div>
    </div>
</body>
</html>