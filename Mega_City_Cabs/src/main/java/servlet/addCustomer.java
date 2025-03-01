package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService;


@WebServlet("/addCustomer")
public class addCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addCustomer() {
        super();
  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		customer cus = new customer();

		cus.setC_name(request.getParameter("name"));
		cus.setC_nic(request.getParameter("nic"));
		cus.setC_phone(Integer.parseInt(request.getParameter("phone")));
		cus.setC_address(request.getParameter("address"));
		cus.setC_email(request.getParameter("email"));
		cus.setC_password(request.getParameter("password"));
		cus.setC_cpassword(request.getParameter("cpassword"));
		
		customerService service = new customerService();
		service.regCustomer(cus);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		

		dispatcher.forward(request, response);
	}

}
