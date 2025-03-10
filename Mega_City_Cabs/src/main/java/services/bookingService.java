package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.booking;
import controller.DBConnect;

public class bookingService {

    // ✅ Method to Insert a Booking
    public boolean createBooking(booking newBooking) {
        boolean success = false;
        String query = "INSERT INTO bookings (c_id, c_name, c_email, c_phone, v_number, pickup_location, drop_location, pickup_date, booking_status) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, newBooking.getC_id());
            stmt.setString(2, newBooking.getC_name());
            stmt.setString(3, newBooking.getC_email());
            stmt.setInt(4, newBooking.getC_phone());
            stmt.setString(5, newBooking.getV_number());
            stmt.setString(6, newBooking.getPickup_location());
            stmt.setString(7, newBooking.getDrop_location());
            stmt.setTimestamp(8, newBooking.getPickup_date());  
            stmt.setString(9, "Pending"); // Default status

            int rowsInserted = stmt.executeUpdate();
            success = rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

 // Retrieve Bookings for a Customer
    public List<booking> getCustomerBookings(int customerId) {
        List<booking> bookingList = new ArrayList<>();
        String query = "SELECT * FROM bookings WHERE c_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                booking bk = new booking();
                bk.setB_id(rs.getInt("b_id"));  // ✅ Ensure method name is correct
                bk.setC_id(rs.getInt("c_id"));
                bk.setC_name(rs.getString("c_name"));
                bk.setC_email(rs.getString("c_email"));
                bk.setC_phone(rs.getInt("c_phone"));
                bk.setV_number(rs.getString("v_number"));
                bk.setPickup_location(rs.getString("pickup_location"));
                bk.setDrop_location(rs.getString("drop_location"));
                bk.setPickup_date(rs.getTimestamp("pickup_date")); 
                bk.setBooking_status(rs.getString("booking_status"));

                bookingList.add(bk);
            }

            // 🔹 Debugging: Check if bookings exist
            if (bookingList.isEmpty()) {
                System.out.println("⚠ No bookings found for customer ID: " + customerId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    

    //Update Booking Status (Driver)
    public boolean updateBookingStatus(int bookingId, String newStatus) {
        boolean updated = false;
        String query = "UPDATE bookings SET booking_status = ? WHERE b_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, newStatus);
            stmt.setInt(2, bookingId);

            int rowsUpdated = stmt.executeUpdate();
            updated = rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }
    
    

    //  Retrieve All Bookings ( Admin)
    public List<booking> getAllBookings() {
        List<booking> bookingList = new ArrayList<>();
        String query = "SELECT * FROM bookings ORDER BY created_at DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                booking bk = new booking();
                bk.setB_id(rs.getInt("b_id"));
                bk.setC_id(rs.getInt("c_id"));
                bk.setC_name(rs.getString("c_name"));
                bk.setC_email(rs.getString("c_email"));
                bk.setC_phone(rs.getInt("c_phone"));
                bk.setV_number(rs.getString("v_number"));
                bk.setPickup_location(rs.getString("pickup_location"));
                bk.setDrop_location(rs.getString("drop_location"));
                bk.setPickup_date(rs.getTimestamp("pickup_date")); // ✅ Using getTimestamp()
                bk.setBooking_status(rs.getString("booking_status"));

                bookingList.add(bk);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }
    
    
    
    public List<booking> getDriverBookings(String driverEmail) {
        List<booking> bookings = new ArrayList<>();
        String query = "SELECT b.* FROM bookings b "
                     + "JOIN vehical v ON b.v_number = v.v_number "  // Corrected table name
                     + "JOIN driver d ON v.d_id = d.d_id "
                     + "WHERE d.d_email = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, driverEmail);
            ResultSet rs = stmt.executeQuery();

            System.out.println("🔍 Executing SQL Query for Driver Email: " + driverEmail);

            while (rs.next()) {
                booking bk = new booking();
                bk.setB_id(rs.getInt("b_id"));
                bk.setC_name(rs.getString("c_name"));
                bk.setC_phone(rs.getInt("c_phone"));
                bk.setV_number(rs.getString("v_number"));
                bk.setPickup_location(rs.getString("pickup_location"));
                bk.setDrop_location(rs.getString("drop_location"));
                bk.setPickup_date(rs.getTimestamp("pickup_date"));
                bk.setBooking_status(rs.getString("booking_status"));

                bookings.add(bk);
            }

            System.out.println("✅ Total Bookings Retrieved: " + bookings.size());

            if (bookings.isEmpty()) {
                System.out.println("⚠ No bookings found for this driver.");
            } else {
                for (booking b : bookings) {
                    System.out.println("🟢 Booking ID: " + b.getB_id() + " | Vehicle: " + b.getV_number());
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Error retrieving bookings: " + e.getMessage());
        }

        return bookings;
    }
           


}