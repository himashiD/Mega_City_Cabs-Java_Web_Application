package services;

import java.sql.Statement;
import controller.DBConnect;
import model.vehicle;

public class vehicleService {
	
	
	/* ---  Add Vehicles   ---      */
	
	public void addVehicle(vehicle veh) {
        try {
        	String query = "insert into vehicle values('"+veh.getV_id()+"','"
                    +veh.getV_number()+"','"
                    +veh.getV_type()+"','"
                    +veh.getV_model()+"','"
                    +veh.getV_image()+"','"
                    +veh.getV_seat()+"','"
                    +veh.getV_driver()+"')";	     
            
         Statement statement = DBConnect.getConnection().createStatement();
         statement.executeUpdate(query);
         
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	



}
