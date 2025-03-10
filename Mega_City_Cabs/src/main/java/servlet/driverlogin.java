package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.driver;
import services.driverService;

@WebServlet("/driverlogin")
public class driverlogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public driverlogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");  // Get email from form
        String password = request.getParameter("password");  // Get password from form

        System.out.println("🔍 Attempting Login: Email=" + email + ", Password=" + password); // Debugging

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            System.out.println("❌ Login Failed: Missing email or password.");
            response.sendRedirect("driver_login.jsp");
            return;
        }

        driverService service = new driverService();
        driver loggedInDriver = service.validateDriver(email, password);

        if (loggedInDriver != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInDriver", loggedInDriver);
            System.out.println("✅ Login Successful: Redirecting to dashboard.");
            response.sendRedirect("driver_dashboard.jsp");
        } else {
            System.out.println("❌ Driver Login Failed: No matching credentials found.");
            response.sendRedirect("driver_login.jsp");
        }
    }

}