package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.booking;
import services.bookingService;

@WebServlet("/adminBooking")
public class adminBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminBooking() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        bookingService service = new bookingService();
        List<booking> bookingList = service.getAllBookings();

        if (bookingList.isEmpty()) {
            System.out.println("No bookings found in the database.");
        } else {
            System.out.println("Total Bookings Retrieved: " + bookingList.size());
        }

        request.setAttribute("bookings", bookingList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookings.jsp");
        dispatcher.forward(request, response);
    }
}