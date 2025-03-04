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
@MultipartConfig // Enables handling file uploads
public class addVehical extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    public addVehical() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Check if the admin session is still valid
        
        

        // Create a Car object
        vehical veh = new vehical();
        veh.setV_number(request.getParameter("vnumber"));
        veh.setV_type(request.getParameter("vtype"));
        veh.setV_model(request.getParameter("vmodel"));
        veh.setV_seat(request.getParameter("vseat"));
        
        // Handle file upload for the car image
        Part filePart = request.getPart("vimage");
        byte[] carImage = null;

        // Check if a file was uploaded
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                carImage = inputStream.readAllBytes();
            }
        }

        // Set the image as a byte array in the Car object
        veh.setV_image(carImage);

        // Pass the Car object to the service layer
        vehicalService carService = new vehicalService();
        boolean isRegistered = carService.registerCar(veh);

        // Generate JavaScript response
        response.setContentType("text/html");
        if (isRegistered) {
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Cab Addition is Successful and Driver Status is Updated');");
            response.getWriter().println("window.location.href = 'cabs.jsp';");
            response.getWriter().println("</script>");
        } else {
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("alert('Car Addition Failed or Driver Status Update Failed');");
            response.getWriter().println("window.location.href = 'addVehical.jsp';");
            response.getWriter().println("</script>");
        }
    }

}