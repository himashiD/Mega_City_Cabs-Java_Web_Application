<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle</title>
    <link rel="stylesheet" href="CSS/add_vehical.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="form-container">
        <!-- Left Side (Vehicle Image) -->
        <div class="form-image">
            <img id="vehiclePreview" src="image/default_car.jpg" alt="Vehicle Image">
        </div>

        <!-- Right Side (Form) -->
        <div class="form-content">
            <h2><i class="fas fa-car"></i> Add Vehicle</h2>
            <br>

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
                    <label for="vprice"><i class="fas fa-dollar-sign"></i> Price (Per Km)</label>
                    <input type="text" name="vprice" id="vprice" placeholder="Enter price per km" required>
                </div>

                <!-- Driver Selection Dropdown -->
                <div class="input-group">
                    <label for="d_id"><i class="fas fa-user"></i> Select Driver</label>
                    <select name="d_id" id="d_id" required>
                        <option value="">-- Select Driver --</option>
                        <%
                            Connection conn = null;
                            PreparedStatement stmt = null;
                            ResultSet rs = null;
                            try {
                                conn = DBConnect.getConnection();
                                String sql = "SELECT d_id, d_name FROM driver WHERE d_status = 'Not Assigned'";
                                stmt = conn.prepareStatement(sql);
                                rs = stmt.executeQuery();

                                if (!rs.isBeforeFirst()) { 
                        %>
                                    <option value="">No Available Drivers</option>
                        <%
                                } else {
                                    while (rs.next()) {
                                        int driverId = rs.getInt("d_id");
                                        String driverName = rs.getString("d_name");
                        %>
                                    <option value="<%= driverId %>"><%= driverName %> (ID: <%= driverId %>)</option>
                        <%
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                        %>
                                <option value="">Error loading drivers</option>
                        <%
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="input-group">
                    <label for="vimage"><i class="fas fa-image"></i> Upload Image</label>
                    <input type="file" name="vimage" id="vimage" accept="image/*" onchange="previewImage(event)">
                </div>

                <br>

                <button type="submit" class="submit-btn"><i class="fas fa-save"></i> Add Vehicle</button>
            </form>
        </div>
    </div>
    
    <script>
        function previewImage(event) {
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function () {
                    document.getElementById('vehiclePreview').src = reader.result;
                };
                reader.readAsDataURL(file);
            } else {
                document.getElementById('vehiclePreview').src = "image/default_car.jpg"; // Reset to default if no file is chosen
            }
        }
    </script>

</body>
</html>