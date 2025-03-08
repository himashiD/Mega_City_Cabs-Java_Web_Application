package servlet;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.vehical;
import services.vehicalService;

@WebServlet("/addVehical")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB max file size for vehicle image
public class addVehical extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    public addVehical() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Create a Vehicle object
            vehical veh = new vehical();
            
            // Get form data
            veh.setV_number(request.getParameter("vnumber"));
            veh.setV_type(request.getParameter("vtype"));
            veh.setV_model(request.getParameter("vmodel"));
            veh.setV_seat(request.getParameter("vseat"));
            veh.setV_price(request.getParameter("vprice"));

            // Handle driver ID
            String driverIdStr = request.getParameter("d_id"); // Match JSP field name
            if (driverIdStr == null || driverIdStr.trim().isEmpty()) {
                showError(response, "Please select a valid driver.");
                return;
            }
            try {
                veh.setD_id(Integer.parseInt(driverIdStr));
            } catch (NumberFormatException e) {
                showError(response, "Invalid Driver ID. Please select a valid driver.");
                return;
            }

            // Handle file upload for the vehicle image
            Part filePart = request.getPart("vimage");
            byte[] carImage = null;

            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream()) {
                    carImage = inputStream.readAllBytes();
                }
            }
            veh.setV_image(carImage); // Set image as byte array

            // Pass the Vehicle object to the service layer
            vehicalService vehService = new vehicalService();
            boolean isRegistered = vehService.registerCar(veh);

            // Redirect based on success or failure
            if (isRegistered) {
                showSuccess(response, "Vehicle addition is successful, and driver status is updated.", "managevehicals.jsp");
            } else {
                showError(response, "Vehicle addition failed or driver status update failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            showError(response, "An error occurred. Please try again.");
        }
    }

    // Helper method to show error message and redirect
    private void showError(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = 'addVehical.jsp';");
        response.getWriter().println("</script>");
    }

    // Helper method to show success message and redirect
    private void showSuccess(HttpServletResponse response, String message, String redirectUrl) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = '" + redirectUrl + "';");
        response.getWriter().println("</script>");
    }
}