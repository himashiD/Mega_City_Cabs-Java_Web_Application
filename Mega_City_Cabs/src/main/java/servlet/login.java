package servlet; 

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.customer; 
import services.customerService;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate customer login
        customerService service = new customerService();
        customer cus = service.validateCustomer(email, password);

        if (cus != null) {
            // ✅ Store customer details in session for auto-filling
            HttpSession session = request.getSession();
            session.setAttribute("loggedInCustomer", cus);

            // ✅ Redirect to customer home
            response.sendRedirect("customer_dashboard.jsp");
        } else {
            // ❌ If login fails, show an error message
            request.setAttribute("errorMessage", "Invalid Email or Password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}