package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.driver;

import services.driverService;


@WebServlet("/manageDriver")
public class manageDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public manageDriver() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		driverService service = new driverService();
		ArrayList<driver> driver = service.getAllDriver();
		request.setAttribute("driver", driver);
		
		//All count of Drivers
		int totalDrivers = driver.size();
		request.setAttribute("totalDrivers", totalDrivers);
		
		RequestDispatcher dispatcher= request.getRequestDispatcher("drivers.jsp");
		
		dispatcher.forward(request, response);
	}

}
