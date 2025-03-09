package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.vehicalService;

@WebServlet("/deleteVehicals")
public class deleteVehicals extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteVehicals() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vNumber = request.getParameter("vnumber");

        if (vNumber == null || vNumber.isEmpty()) {
            request.setAttribute("errorMessage", "Invalid vehicle number.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageVehicals");
            dispatcher.forward(request, response);
            return;
        }

        vehicalService service = new vehicalService();
        boolean success = service.deleteVehical(vNumber);

        if (success) {
            response.sendRedirect("manageVehicals");
        } else {
            request.setAttribute("errorMessage", "Failed to delete vehicle. Vehicle may not exist.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageVehicals");
            dispatcher.forward(request, response);
        }
    }
}