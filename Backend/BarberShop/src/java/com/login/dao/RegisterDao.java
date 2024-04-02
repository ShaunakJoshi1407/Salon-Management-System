package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterDao {
    String sql = "insert into customer(fname,lname,cust_email,gender,city,cust_password)values(?,?,?,?,?,sha1(?))";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
   public boolean checkCon(String fname, String lname, String email, String gender, String city, String password){
       try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, fname);
           st.setString(2, lname);
           st.setString(3, email);
           st.setString(4, gender);
           st.setString(5, city);
           st.setString(6, password);
           st.executeUpdate();
           con.close();
           return true;
       } catch (Exception e) {
       }
       
       return false;
   }    
}
