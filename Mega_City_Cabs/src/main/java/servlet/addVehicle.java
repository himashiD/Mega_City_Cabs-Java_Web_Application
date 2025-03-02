package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehicle;
import services.vehicleService;


@WebServlet("/addVehicle")
public class addVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addVehicle() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		vehicle veh = new vehicle();
        veh.setV_number(request.getParameter("vehicle_no"));
        veh.setV_type(request.getParameter("vehicle_type"));
        veh.setV_model(request.getParameter("vehicle_model"));
        veh.setV_image(request.getParameter("vehicle_image"));
        veh.setV_seat(Integer.parseInt(request.getParameter("vehicle_seat")));
        veh.setV_driver(request.getParameter("vehicle_driver"));
        
        vehicleService service = new vehicleService();
        service.addVehicle(veh);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("cabs.jsp");
        dispatcher.forward(request, response);
	}

}
