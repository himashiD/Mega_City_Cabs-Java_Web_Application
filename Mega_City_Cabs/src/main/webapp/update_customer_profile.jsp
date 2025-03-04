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
        <form method="post" action="updateCustomer">
            <input type="text" name = "name" value="${param.name }" placeholder="Name">
            <input type="text" name = "nic" value="${param.nic }" placeholder="NIC">
            <input type="text" name = "phone" value="${param.phone }" placeholder="Contact Number">
            <input type="text" name = "address" value="${param.address }" placeholder="Address">
            <input type="email" name = "email" value="${param.email }" placeholder="Email (Your Username)">
            <input type="password" name = "password" value="${param.password }" placeholder="Password">
            <input type="password" name = "cpassword" value="${param.cpassword }" placeholder="Confirm Password">
            <button type = "submit" value="Update">Update</button>
            
          </form>  
   
            
        </div>
        <div class="info-container">
            My Profile
        </div>
    </div>
    
    


</body>
</html>