package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.booking;
import model.customer;
import services.bookingService;

@WebServlet("/bookVehicle")
public class bookVehicle extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public bookVehicle() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve Logged-In Customer from Session
        HttpSession session = request.getSession();
        customer loggedInCustomer = (customer) session.getAttribute("loggedInCustomer");

        if (loggedInCustomer == null) {
            //Redirect to login if user is not authenticated
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve Form Data from Request
        String vehicleNumber = request.getParameter("vehicleNumber");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        String pickupDateStr = request.getParameter("pickupDate");

        try {
            // Convert String to Timestamp
            Timestamp pickupDate = Timestamp.valueOf(pickupDateStr.replace("T", " ") + ":00");

            // ✅ Create Booking Object
            booking newBooking = new booking();
            newBooking.setC_id(loggedInCustomer.getC_id());
            newBooking.setC_name(loggedInCustomer.getC_name());
            newBooking.setC_email(loggedInCustomer.getC_email());
            newBooking.setC_phone(loggedInCustomer.getC_phone());
            newBooking.setV_number(vehicleNumber);
            newBooking.setPickup_location(pickupLocation);
            newBooking.setDrop_location(dropLocation);
            newBooking.setPickup_date(pickupDate);
            newBooking.setBooking_status("Pending"); // Default status

            // Call Service to Save Booking
            bookingService bookingService = new bookingService();
            boolean success = bookingService.createBooking(newBooking);

            if (success) {
                // Redirect to booking confirmation page
                response.sendRedirect("viewbooking.jsp");
            } else {
                // Show error message if booking fails
                request.setAttribute("errorMessage", "Booking failed. Please try again.");
                request.getRequestDispatcher("booking_form.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing booking: " + e.getMessage());
            request.getRequestDispatcher("booking_form.jsp").forward(request, response);
        }
    }
}