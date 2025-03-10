package model;

import java.sql.Timestamp;

public class booking {
    private int b_id;
    private int c_id;
    private String c_name;
    private String c_email;
    private int c_phone;
    private String v_number;
    private String pickup_location;
    private String drop_location;
    private Timestamp pickup_date;
    private String booking_status; 

    public booking() {}

    public booking(int b_id, int c_id, String c_name, String c_email, int c_phone, 
                   String v_number, String pickup_location, String drop_location, Timestamp pickup_date, String booking_status) {
        this.b_id = b_id;
        this.c_id = c_id;
        this.c_name = c_name;
        this.c_email = c_email;
        this.c_phone = c_phone;
        this.v_number = v_number;
        this.pickup_location = pickup_location;
        this.drop_location = drop_location;
        this.pickup_date = pickup_date;
        this.booking_status = booking_status;
    }

    // ✅ Getters and Setters
    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public int getC_phone() {
        return c_phone;
    }

    public void setC_phone(int c_phone) {
        this.c_phone = c_phone;
    }

    public String getV_number() {
        return v_number;
    }

    public void setV_number(String v_number) {
        this.v_number = v_number;
    }

    public String getPickup_location() {
        return pickup_location;
    }

    public void setPickup_location(String pickup_location) {
        this.pickup_location = pickup_location;
    }

    public String getDrop_location() {
        return drop_location;
    }

    public void setDrop_location(String drop_location) {
        this.drop_location = drop_location;
    }

    public Timestamp getPickup_date() {
        return pickup_date;
    }

    public void setPickup_date(Timestamp pickup_date) {
        this.pickup_date = pickup_date;
    }

    public String getBooking_status() {  
        return booking_status;
    }

    public void setBooking_status(String booking_status) {  
        this.booking_status = booking_status;
    }
}