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


@WebServlet("/addDriver")
public class addDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addDriver() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		driver dri = new driver();

		dri.setD_name(request.getParameter("name"));
		dri.setD_nic(request.getParameter("nic"));
		dri.setD_phone(Integer.parseInt(request.getParameter("phone")));
		dri.setD_address(request.getParameter("address"));
		dri.setD_email(request.getParameter("email"));
		dri.setD_password(request.getParameter("password"));
		
		
		driverService service = new driverService();
		service.regDriver(dri);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("drivers.jsp");
		

		dispatcher.forward(request, response);
	}

}
