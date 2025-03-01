package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import controller.DBConnect;

import model.driver;

public class driverService {

/* ---  Register Driver   ---      */
	
	public void regDriver(driver dri) {
		try {
			String query = "insert into driver values('"+dri.getD_id()+"','"
		                                                  +dri.getD_name()+"','"
					                                      +dri.getD_nic()+"','"
		                                                  +dri.getD_phone()+"','"
					                                      +dri.getD_address()+"','"
		                                                  +dri.getD_email()+"','"	                                                
					                                      +dri.getD_password()+"')";
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
			
			String query = "update driver set name='"+driver.getD_name()+"',nic= '"+driver.getD_nic()+"',phone= '"+driver.getD_phone()+"',address= '"+driver.getD_address()+"',email='"+driver.getD_email()+"',password = '"+driver.getD_password()+"' where email='"+driver.getD_email()+"' ";
			
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
	
}
