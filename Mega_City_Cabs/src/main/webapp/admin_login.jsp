<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="CSS/admin_css/admin_login.css">
</head>
<body>
<div class="login-container">
        <div class="image-section">
            <img src="image/admin_image.png" alt="Admin Image">
        </div>
        <div class="form-section">
            <h2>Admin Login</h2>
            <form action="adminlogin" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>