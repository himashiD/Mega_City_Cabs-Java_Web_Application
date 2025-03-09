package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.driver;
import services.driverService;


@WebServlet("/driverlogin")
public class driverlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public driverlogin() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		driver drv = new driver();
		drv.setD_email(request.getParameter("email"));
		drv.setD_password(request.getParameter("password"));
		
		driverService service = new driverService();
		boolean status = service.validate(drv);
		
		if(status) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("driver_dashboard.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("driver_login.jsp");
			dispatcher.forward(request, response);
		}
		
		doGet(request, response);
	}

}