<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="controller.DBConnect" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Vehicle</title>
    <link rel="stylesheet" href="CSS/add_vehical.css">
    <script defer src="JS/update_vehicles.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="form-container">
        <!-- Left Side (Vehicle Image) -->
        <div class="form-image">
            <%
                // Fetch the vehicle image
                byte[] imageBytes = (byte[]) request.getAttribute("vimage");
                String base64Image = (imageBytes != null) ? Base64.getEncoder().encodeToString(imageBytes) : null;
                String imageSrc = (base64Image != null) ? "data:image/jpeg;base64," + base64Image : "image/default_car.jpg";
            %>
            <img id="vehiclePreview" src="<%= imageSrc %>" alt="Vehicle Image">
        </div>

        <!-- Right Side (Form) -->
        <div class="form-content">
            <h2><i class="fas fa-car"></i> Update Vehicle</h2>
            <br>

            <form method="post" action="updateVehical" enctype="multipart/form-data">
                <input type="hidden" name="v_id" value="${param.v_id}">

                <div class="input-group">
                    <label for="vnumber"><i class="fas fa-hashtag"></i> Vehicle Number</label>
                    <input type="text" name="vnumber" id="vnumber" value="${param.vnumber}" required readonly>
                </div>

                <div class="input-group">
                    <label for="vtype"><i class="fas fa-car-side"></i> Vehicle Type</label>
                    <input type="text" name="vtype" id="vtype" value="${param.vtype}" required>
                </div>

                <div class="input-group">
                    <label for="vmodel"><i class="fas fa-car"></i> Vehicle Model</label>
                    <input type="text" name="vmodel" id="vmodel" value="${param.vmodel}" required>
                </div>

                <div class="input-group">
                    <label for="vseat"><i class="fas fa-chair"></i> Number of Seats</label>
                    <input type="text" name="vseat" id="vseat" value="${param.vseat}" required>
                </div>
                
                <div class="input-group">
                    <label for="vprice"><i class="fas fa-dollar-sign"></i> Price (Per Km)</label>
                    <input type="text" name="vprice" id="vprice" value="${param.vprice}" required>
                </div>

                <!-- Driver Selection Dropdown -->
				<div class="input-group">
				    <label for="d_id"><i class="fas fa-user"></i> Assign New Driver (Optional)</label>
				    <select name="d_id" id="d_id">
				        <option value="-1">-- Keep Current Driver --</option>
				        <%
				            Connection conn = null;
				            PreparedStatement stmt = null;
				            ResultSet rs = null;
				            int selectedDriverId = (request.getAttribute("d_id") != null) ? Integer.parseInt(request.getAttribute("d_id").toString()) : -1;
				
				            try {
				                conn = DBConnect.getConnection();
				                String sql = "SELECT d_id, d_name FROM driver WHERE d_status = 'Not Assigned' OR d_id = ?";
				                stmt = conn.prepareStatement(sql);
				                stmt.setInt(1, selectedDriverId);
				                rs = stmt.executeQuery();
				
				                while (rs.next()) {
				                    int driverId = rs.getInt("d_id");
				                    String driverName = rs.getString("d_name");
				                    boolean isSelected = (driverId == selectedDriverId);
				        %>
				                    <option value="<%= driverId %>" <%= isSelected ? "selected" : "" %>><%= driverName %> (ID: <%= driverId %>)</option>
				        <%
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
                    <label for="vimage"><i class="fas fa-image"></i> Upload New Image (Optional)</label>
                    <input type="file" name="vimage" id="vimage" accept="image/*" onchange="previewImage(event)">
                </div>
                
                <br>

                <button type="submit" class="submit-btn"><i class="fas fa-save"></i> Update</button>
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
            }
        }
    </script>

</body>
</html>