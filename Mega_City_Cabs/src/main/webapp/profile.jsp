<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="CSS/register.css">
</head>
<body>
<c:set var = "cus" value="${customer}"/>
    <div class="container">
        <div class="form-container">
            <input type="text" name = "name" value="${cus.c_name }" placeholder="Name">
            <input type="text" name = "nic" value="${cus.c_nic }" placeholder="NIC">
            <input type="text" name = "phone" value="${cus.c_phone }" placeholder="Contact Number">
            <input type="text" name = "address" value="${cus.c_address }" placeholder="Address">
            <input type="email" name = "email" value="${cus.c_email }" placeholder="Email (Your Username)">
            <input type="password" name = "password" value="${cus.c_password }" placeholder="Password">
            <input type="password" name = "cpassword" value="${cus.c_cpassword }" placeholder="Confirm Password">
            <button type = "submit" value="Update">Update</button>
            
            
    <form action="profile_update.jsp" method="post">
    <input type="hidden" name="name" value="${cus.c_name }">
    <input type="hidden" name="nic" value="${cus.c_nic }">
    <input type="hidden" name="phone" value="${cus.c_phone }">
    <input type="hidden" name="address" value="${cus.c_address }">
    <input type="hidden" name="email" value="${cus.c_email }">
    <input type="hidden" name="password" value="${cus.c_password }">
    <input type="hidden" name="cpassword" value="${cus.c_cpassword }">
    
    
    </form>   
            
        </div>
        <div class="info-container">
            My Profile
        </div>
    </div>
    
    


</body>
</html>