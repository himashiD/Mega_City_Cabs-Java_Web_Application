package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vehical;
import services.vehicalService;


@WebServlet("/manageVehicals")
public class manageVehicals extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public manageVehicals() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		vehicalService vehService = new vehicalService();
        ArrayList<vehical> vehList = vehService.getAllVehical(); // Fetch all vehicles
        
        System.out.println("Total Vehicles Retrieved: " + vehList.size()); // DEBUGGING


        // Store the list in request scope
        request.setAttribute("vehList", vehList);

        // Forward to the JSP page for displaying the data
        request.getRequestDispatcher("managevehicals.jsp").forward(request, response);
    }
}