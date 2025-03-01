<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/login.css">

</head>
<body>
<form action="login" method="post">
    <div class="login-container">
        <h2>Login</h2>
        <input type="email" name="email" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <button type="submit">Login</button>
        <p>Don't have an account? <a href="register.jsp">Sign up here</a></p>
    </div>
   </form>
</body>
</html>