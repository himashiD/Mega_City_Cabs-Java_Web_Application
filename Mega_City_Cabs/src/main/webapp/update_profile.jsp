<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="addCustomer">
    <div class="container">
        <div class="form-container">
            <input type="text" name = "name" value="${param.c_name }" >
            <input type="text" name = "nic" value="${param.c_nic }">
            <input type="text" name = "phone" value="${param.c_phone }">
            <input type="text" name = "address" value="${param.c_address }">
            <input type="email" name = "email" value="${param.c_email }">
            <input type="password" name = "password" value="${param.c_password }">
            <input type="password" name = "cpassword" value="${param.c_cpassword }">
            <button type = "submit">Sign up</button>
            
        </div>
        <div class="info-container">
            Join with us
        </div>
     </div>
</form>
</body>
</html>