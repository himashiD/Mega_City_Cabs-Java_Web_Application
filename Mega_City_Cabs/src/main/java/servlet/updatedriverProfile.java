package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.driver;
import services.driverService;

@WebServlet("/updatedriverProfile")
public class updatedriverProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updatedriverProfile() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        driver loggedInDriver = (driver) session.getAttribute("loggedInDriver");

        if (loggedInDriver == null) {
            response.sendRedirect("driver_login.jsp");  // Redirect if session is invalid
            return;
        }

        // Retrieve updated values from form
        String newPhone = request.getParameter("d_phone");
        String newPassword = request.getParameter("d_password");

        System.out.println(" Profile Update Request: " + loggedInDriver.getD_email());
        System.out.println(" New Phone: " + newPhone);
        System.out.println(" New Password: [HIDDEN]"); // Don't print passwords in production

        driverService service = new driverService();
        boolean isUpdated = service.updateDriverProfile(loggedInDriver.getD_email(), newPhone, newPassword);

        if (isUpdated) {
            //  Fetch updated driver details & update session
            driver updatedDriver = service.getDriverByEmail(loggedInDriver.getD_email());
            session.setAttribute("loggedInDriver", updatedDriver);
            
            response.sendRedirect("driverupdateProfile.jsp?success=true");
        } else {
            response.sendRedirect("driverupdateProfile.jsp?error=true");
        }
    }
}