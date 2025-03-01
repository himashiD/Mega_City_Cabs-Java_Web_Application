<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/driver_css/add_driver.css">
</head>
<body>
    <div class="container">
        <div class="image-section"></div>

            <h2>Driver Profile</h2>
            <c:set var = "cus" value="${customer}"/>
                <div class="input-group">
                    <label for="name">Full Name</label>
                    <i class="fa fa-user"></i>
                    <input type="text" id="name" name = "name" value="${dri.name }">
                </div>
                <div class="input-group">
                    <label for="nic">NIC</label>
                    <i class="fa fa-id-card"></i>
                    <input type="text" id="nic" name = "nic"  value="${dri.nic }">
                </div>
                <div class="input-group">
                    <label for="phone">Phone</label>
                    <i class="fa fa-phone"></i>
                    <input type="text" id="phone" name = "phone" value="${dri.phone }">
                </div>
                <div class="input-group">
                    <label for="address">Address</label>
                    <i class="fa fa-home"></i>
                    <input type="text" id="address" name = "address" value="${dri.address }">
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <i class="fa fa-envelope"></i>
                    <input type="email" id="email" name = "email" value="${dri.email }">
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <i class="fa fa-lock"></i>
                    <input type="text" id="password" name = "password" value="${dri.password }">
                </div>
                

        </div>
<form action="update.jsp" method="post">
<input type="hidden" name="name" value="${dri.name }">
<input type="hidden" name="age" value="${dri.age }">
<input type="hidden" name="email" value="${dri.email }">
<input type="hidden" name="password" value="${dri.password }">

<input type="submit" class="btn" value="Update">
</form>
</body>
</html>