package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import controller.DBConnect;

import model.driver;

public class driverService {

/* ---  Register Driver   ---      */
	
	public boolean regDriver(driver drv) {
        String checkQuery = "SELECT d_email FROM driver WHERE d_email = ?";
        String insertQuery = "INSERT INTO driver (d_name, d_nic, d_phone, d_address, d_email, d_password, d_status) VALUES (?, ?, ?, ?, ?, ?, 'Not Assigned')";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement checkStmt = connection.prepareStatement(checkQuery);
             PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {

            // Check if email already exists
            checkStmt.setString(1, drv.getD_email());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                System.out.println(" Driver email already exists!");
                return false; // Prevent duplicate emails
            }

            // Insert driver
            insertStmt.setString(1, drv.getD_name());
            insertStmt.setString(2, drv.getD_nic());
            insertStmt.setInt(3, drv.getD_phone());
            insertStmt.setString(4, drv.getD_address());
            insertStmt.setString(5, drv.getD_email());
            insertStmt.setString(6, drv.getD_password());

            int rowsInserted = insertStmt.executeUpdate();
            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	
	public driver validateDriver(String demail, String dpassword) {
	    String query = "SELECT * FROM driver WHERE d_email = ? AND d_password = ?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {

	        stmt.setString(1, demail);
	        stmt.setString(2, dpassword);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            driver drv = new driver();
	            drv.setD_id(rs.getInt("d_id"));
	            drv.setD_name(rs.getString("d_name"));
	            drv.setD_nic(rs.getString("d_nic"));
	            drv.setD_phone(rs.getInt("d_phone"));
	            drv.setD_address(rs.getString("d_address"));
	            drv.setD_email(rs.getString("d_email"));
	            drv.setD_status(rs.getString("d_status"));

	            System.out.println(" Driver Login Successful: " + drv.getD_name()); // Debugging log
	            return drv; // ✅ Successful Login
	        } else {
	            System.out.println(" Driver Login Failed: No matching credentials found.");
	        }

	    } catch (Exception e) {
	        System.out.println(" Database Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return null; // ❌ Login Failed
	}
	
	
	
	
	/* ---  Manage Driver   ---      */
	public ArrayList<driver> getAllDriver(){
		try {
			ArrayList<driver> listDri = new ArrayList<driver>();
			
			String query = "select * from driver";
			
			Statement statement = DBConnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()) {
				driver dri = new driver();
				dri.setD_id(rs.getInt("d_id"));
				dri.setD_name(rs.getString("d_name"));
				dri.setD_nic(rs.getString("d_nic"));
				dri.setD_phone(rs.getInt("d_phone"));
				dri.setD_address(rs.getString("d_address"));
				dri.setD_email(rs.getString("d_email"));
				dri.setD_password(rs.getString("d_password"));
				
				listDri.add(dri);
			}
			return listDri;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	

	/* ---  Update Driver   ---      */
	
	public void updateDriver(driver driver) {
		try {
			
			String query = "update driver SET d_name='"+driver.getD_name()+"',d_nic= '"+driver.getD_nic()+"',d_phone= '"+driver.getD_phone()+"',d_address= '"+driver.getD_address()+"',d_email='"+driver.getD_email()+"',d_password = '"+driver.getD_password()+"' where d_email='"+driver.getD_email()+"' ";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
/* ---  Delete Driver   ---      */
	
	public void deleteDriver(driver dri) {
		
		try {
			String query= "delete from driver where d_email = '"+ dri.getD_email() + "'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	
	// Update driver details (phone & password)
    public boolean updateDriverProfile(String email, String phone, String password) {
        boolean isUpdated = false;
        String query = "UPDATE driver SET d_phone = ?, d_password = ? WHERE d_email = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, phone);
            stmt.setString(2, password);
            stmt.setString(3, email);

            int rowsUpdated = stmt.executeUpdate();
            isUpdated = rowsUpdated > 0;

            System.out.println(" Updating Driver Profile for: " + email);
            System.out.println(" Rows Updated: " + rowsUpdated);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error updating profile: " + e.getMessage());
        }
        return isUpdated;
    }
    
    public driver getDriverByEmail(String email) {
        driver d = null;
        String query = "SELECT * FROM driver WHERE d_email = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            var rs = stmt.executeQuery();

            if (rs.next()) {
                d = new driver();
                d.setD_id(rs.getInt("d_id"));
                d.setD_name(rs.getString("d_name"));
                d.setD_phone(rs.getInt("d_phone"));
                d.setD_address(rs.getString("d_address"));
                d.setD_email(rs.getString("d_email"));
                d.setD_password(rs.getString("d_password"));  // Retrieve encrypted password if needed
                d.setD_status(rs.getString("d_status"));
            }

            System.out.println(" Driver Data Retrieved for: " + email);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error retrieving driver details: " + e.getMessage());
        }
        return d;
    }
	
}
