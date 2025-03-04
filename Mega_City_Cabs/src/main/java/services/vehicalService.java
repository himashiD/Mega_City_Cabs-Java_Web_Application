package services;

import java.sql.Connection;
import java.sql.PreparedStatement;


import controller.DBConnect;
import model.vehical;

public class vehicalService {

	public boolean registerCar(vehical veh) {
        String insertCarQuery = "INSERT INTO vehicle (v_id,v_number, v_type, v_model, v_seat, v_image) VALUES (?,?, ?, ?, ?, ?)";
        
        
        try (Connection connection = DBConnect.getConnection()) {
            // Start transaction
            connection.setAutoCommit(false);

            // Insert the car
            try (PreparedStatement insertCarStmt = connection.prepareStatement(insertCarQuery)) {
                insertCarStmt.setInt(1, veh.getV_id());
                insertCarStmt.setString(2, veh.getV_number());
                insertCarStmt.setString(3, veh.getV_type());
                insertCarStmt.setString(4, veh.getV_model());
                insertCarStmt.setString(5, veh.getV_seat());
                insertCarStmt.setBytes(6, veh.getV_image());
                insertCarStmt.executeUpdate();
            }

            // Commit transaction
            connection.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	}