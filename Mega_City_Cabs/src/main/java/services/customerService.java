package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	public customer validateCustomer(String email, String password) {
        String query = "SELECT * FROM customer WHERE c_email = ? AND c_password = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Create a Customer object
                customer cus = new customer();
                cus.setC_id(rs.getInt("c_id"));
                cus.setC_name(rs.getString("c_name"));
                cus.setC_address(rs.getString("c_address"));
                cus.setC_nic(rs.getString("c_nic"));
                cus.setC_phone(rs.getInt("c_phone"));
                cus.setC_email(rs.getString("c_email"));

                return cus;  //  Return the customer object
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; //Return null if login fails
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
	
	
/* ---  Update Customer   ---      */
	
	public void updateCustomer(customer customer) {
		try {
			
			String query = "update customer SET c_name='"+customer.getC_name()+"',c_nic= '"+customer.getC_nic()+"',c_phone= '"+customer.getC_phone()+"',c_address= '"+customer.getC_address()+"',c_email='"+customer.getC_email()+"',c_password= '"+customer.getC_password()+"',c_cpassword = '"+customer.getC_cpassword()+"' where c_email='"+customer.getC_email()+"' ";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
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
