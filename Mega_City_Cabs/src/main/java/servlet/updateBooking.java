package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.bookingService;

@WebServlet("/updateBooking")
public class updateBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateBooking() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String newStatus = request.getParameter("status");

        bookingService service = new bookingService();
        boolean updated = service.updateBookingStatus(bookingId, newStatus);

        if (updated) {
            response.sendRedirect("driver_booking.jsp?success=true");
        } else {
            response.sendRedirect("driver_booking.jsp?error=true");
        }
    }
}