<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form</title>
    <link rel="stylesheet" href ="CSS/register.css">
</head>
<body>
   <form method="post" action="addCustomer">
    <div class="container">
        <div class="form-container">
            <input type="text" name = "name" placeholder="Name">
            <input type="text" name = "nic" placeholder="NIC">
            <input type="text" name = "phone" placeholder="Contact Number">
            <input type="text" name = "address" placeholder="Address">
            <input type="email" name = "email" placeholder="Email (Your Username)">
            <input type="password" name = "password" placeholder="Password">
            <input type="password" name = "cpassword" placeholder="Confirm Password">
            <button type = "submit">Sign up</button>
            <p>Already have an account? <a href="login.jsp">Sign in here</a></p>
        </div>
        <div class="info-container">
            Join with us
        </div>
    </div>
   </form>
</body>
</html>
