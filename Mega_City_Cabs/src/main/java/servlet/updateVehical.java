package servlet;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.vehical;
import services.vehicalService;

@WebServlet("/updateVehical")
@MultipartConfig
public class updateVehical extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateVehical() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        vehical veh = new vehical();
        vehicalService vehService = new vehicalService();

        veh.setV_number(request.getParameter("vnumber"));
        veh.setV_type(request.getParameter("vtype"));
        veh.setV_model(request.getParameter("vmodel"));
        veh.setV_seat(request.getParameter("vseat"));
        veh.setV_price(request.getParameter("vprice"));

        // Handle driver selection
        String driverIdParam = request.getParameter("d_id");
        if (driverIdParam != null && !driverIdParam.isEmpty() && !driverIdParam.equals("-1")) {
            veh.setD_id(Integer.parseInt(driverIdParam)); // Set new driver if selected
        } else {
            veh.setD_id(-1); // Keep current driver
        }

        // Handle image upload
        Part filePart = request.getPart("vimage");
        byte[] carImage = null;

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                carImage = inputStream.readAllBytes();
            }
        } else {
            carImage = vehService.getVehicleImage(veh.getV_number()); // Keep existing image
        }

        veh.setV_image(carImage);

        // Call vehicle service to update
        boolean success = vehService.updateVehical(veh);

        if (success) {
            response.sendRedirect("managevehicals.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update vehicle.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatevehicals.jsp");
            dispatcher.forward(request, response);
        }
    }
}