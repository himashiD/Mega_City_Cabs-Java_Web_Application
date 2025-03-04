<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle</title>
    <link rel="stylesheet" href="CSS/admin_css/add_vehicle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

       
        <div class="container">
        
        <div class="image-section">
           <img id="vehiclePreview" src="image/default_car.jpg" alt="Vehicle Image">

        
        </div>
        <div class="form-section">
            <h2><i class="fas fa-user-plus"></i> Add Vehicle</h2>
            

            <form action="addVehical" method="post" enctype="multipart/form-data">
                <div class="input-group">
                    <label for="vnumber"><i class="fas fa-hashtag"></i> Vehicle Number</label>
                    <input type="text" name="vnumber" id="vnumber" placeholder="Enter vehicle number" required>
                </div>

                <div class="input-group">
                    <label for="vtype"><i class="fas fa-car-side"></i> Vehicle Type</label>
                    <input type="text" name="vtype" id="vtype" placeholder="Enter vehicle type" required>
                </div>

                <div class="input-group">
                    <label for="vmodel"><i class="fas fa-car"></i> Vehicle Model</label>
                    <input type="text" name="vmodel" id="vmodel" placeholder="Enter vehicle model" required>
                </div>

                <div class="input-group">
                    <label for="vseat"><i class="fas fa-chair"></i> Number of Seats</label>
                    <input type="text" name="vseat" id="vseat" placeholder="Enter number of seats" required>
                </div>

                <div class="input-group">
                    <label for="vimage"><i class="fas fa-image"></i> Upload Image</label>
                    <input type="file" name="vimage" id="vimage" accept="image/*" required>
                </div>

                <br>

                <button type="submit" class="btn"><i class="fas fa-save"></i> Add Vehicle</button>
            </form>
        </div>
      </div>
  
<script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function () {
                document.getElementById('vehiclePreview').src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>