package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import controller.DBConnect;
import model.customer;

public class customerService {
	
	/* ---  Register Customer   ---      */
	
	public void regCustomer(customer cus) {
		try {
			String query = "insert into customer values('"+cus.getC_id()+"','"
		                                                  +cus.getC_name()+"','"
					                                      +cus.getC_nic()+"','"
		                                                  +cus.getC_phone()+"','"
					                                      +cus.getC_address()+"','"
		                                                  +cus.getC_email()+"','"
		                                                  +cus.getC_password()+"','"
					                                      +cus.getC_cpassword()+"')";
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/* ---  login Customer   ---      */
	
	public boolean validate(customer cus) {
		try {
			
			String query = "select * from customer where c_email = '"+cus.getC_email()+"' and c_password='"+cus.getC_password()+"'";
		    
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				return true;
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	
	public customer getOne(customer cus) {
		try {
			
			String query = "select * from customer where c_email = '"+cus.getC_email()+"' and c_password='"+cus.getC_password()+"'";
		    
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				cus.setC_name(rs.getString("c_name"));
				cus.setC_nic(rs.getString("c_nic"));
				cus.setC_phone(rs.getInt("c_phone"));
				cus.setC_address(rs.getString("c_address"));
				cus.setC_email(rs.getString("c_email"));
				cus.setC_password(rs.getString("c_password"));
				cus.setC_cpassword(rs.getString("c_cpassword"));
				
				return cus;
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	/* ---  Manage Customer   ---      */
	public ArrayList<customer> getAllCustomer(){
		try {
			ArrayList<customer> listCus = new ArrayList<customer>();
			
			String query = "select * from customer";
			
			Statement statement = DBConnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()) {
				customer cus = new customer();
				cus.setC_id(rs.getInt("c_id"));
				cus.setC_name(rs.getString("c_name"));
				cus.setC_nic(rs.getString("c_nic"));
				cus.setC_phone(rs.getInt("c_phone"));
				cus.setC_address(rs.getString("c_address"));
				cus.setC_email(rs.getString("c_email"));
				
				listCus.add(cus);
			}
			return listCus;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* ---  Delete Customer   ---  */
	
	public void deleteCustomer(customer cus) {
		
		try {
			String query= "delete from customer where c_email = '"+ cus.getC_email() + "'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
