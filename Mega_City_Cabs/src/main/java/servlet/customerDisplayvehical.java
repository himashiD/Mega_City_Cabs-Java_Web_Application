package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehical;
import services.vehicalService;

@WebServlet("/customerDisplayvehical")
public class customerDisplayvehical extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public customerDisplayvehical() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        vehicalService vehicalservice = new vehicalService();
        ArrayList<vehical> vehList = vehicalservice.displayAllVehical();

        // Debugging: Print vehicle list size
        System.out.println("🚗 Retrieved Vehicles: " + vehList.size());

        // Print each vehicle's details in the console
        for (vehical veh : vehList) {
            System.out.println("🔹 Vehicle No: " + veh.getV_number() + 
                               " | Model: " + veh.getV_model() + 
                               " | Type: " + veh.getV_type() + 
                               " | Seats: " + veh.getV_seat() + 
                               " | Price: " + veh.getV_price() + 
                               " | Driver: " + veh.getD_name() + 
                               " | Phone: " + veh.getD_phone());
        }

        request.setAttribute("vehList", vehList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer_booking.jsp");
        dispatcher.forward(request, response);
    }
}