<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/driver_css/driver_login.css">
</head>
<body>
<div class="login-container">
        <div class="image-section">
            <img src="image/driver_image.jpg" alt="Admin Image">
        </div>
        <div class="form-section">
            <h2>Driver Login</h2>
            <form action="driverlogin" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="email" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>