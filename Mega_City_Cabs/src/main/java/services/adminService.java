package services;

import java.sql.ResultSet;
import java.sql.Statement;

import controller.DBConnect;
import model.admin;


public class adminService {
	
	public boolean validate(admin adm) {
		try {
			
			String query = "select * from admin where a_username = '"+adm.getA_username()+"' and a_password='"+adm.getA_password()+"'";
		    
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				return true;
			}
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
	}
	

}