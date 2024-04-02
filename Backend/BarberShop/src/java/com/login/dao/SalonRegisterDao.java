package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SalonRegisterDao {
    String sql = "insert into salon(sal_name,sal_email,sal_type,sal_city,sal_contact,sal_address,sal_password,sal_img,img_path,noOfSeats)values(?,?,?,?,?,?,sha1(?),?,?,?)";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
   public boolean checkCon(String name, String email, String type, String contact, String city, String address, String password, String image, String fileName, int seats){
       try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, name);
           st.setString(2, email);
           st.setString(3, type);
           st.setString(4, city);
           st.setString(5, contact);
           st.setString(6, address);
           st.setString(7, password);
           st.setString(8,image);  
           st.setString(9,fileName);
           st.setInt(10, seats);
           st.executeUpdate();
           con.close();
           return true;
       } catch (Exception e) {
       }
       
       return false;
   }    
}
