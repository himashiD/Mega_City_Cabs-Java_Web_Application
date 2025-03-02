<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="services.vehicleService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.driver" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vehicle</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="CSS/admin_css/add_vehicle.css">
</head>

<body>
    <div class="container">
        <div class="image-section">
            <img src="image/vehicle_image.png" alt="Vehicle Image" width="410px" height="700px">
        </div>
        <div class="form-section">
            <h2>Add Vehicle</h2>
            <form method="post" action="addVehicle" enctype="multipart/form-data">
                <div class="input-group">
                    <label for="vehicle_no">Vehicle Number</label>
                    <i class="fa fa-car"></i>
                    <input type="text" id="vehicle_no" name="vehicle_no" placeholder="Enter Vehicle Number" required>
                </div>
                <div class="input-group">
                    <label for="vehicle_type">Vehicle Type</label>
                    <i class="fa fa-list"></i>
                    <select id="vehicle_type" name="vehicle_type" required>
                        <option value="">Select Vehicle Type</option>
                        <option value="Car">Car</option>
                        <option value="Van">Van</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="vehicle_model">Vehicle Model</label>
                    <i class="fa fa-cogs"></i>
                    <input type="text" id="vehicle_model" name="vehicle_model" placeholder="Enter Vehicle Model" required>
                </div>
                <div class="input-group">
                    <label for="vehicle_image">Vehicle Image</label>
                    <i class="fa fa-image"></i>
                    <input type="file" id="vehicle_image" name="vehicle_image" accept="image/*" required>
                </div>
                <div class="input-group">
                    <label for="vehicle_seat">Number of Seats</label>
                    <i class="fa fa-chair"></i>
                    <input type="number" id="vehicle_seat" name="vehicle_seat" placeholder="Enter Number of Seats" required>
                </div>
                <div class="input-group">
                    <label for="vehicle_driver">Select Driver</label>
                    <i class="fa fa-user"></i>
                    <select id="vehicle_driver" name="vehicle_driver" >
                        <option value="">Select Driver</option>
                        
                    </select>
                </div>
                <button type="submit" class="btn">Add Vehicle</button>
            </form>
        </div>
    </div>
</body>
</html>
