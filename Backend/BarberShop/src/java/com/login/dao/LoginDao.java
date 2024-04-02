package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
    String sql = "select cust_email,cust_password from customer where cust_email=? and cust_password=sha1(?)";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
   public boolean checkCon(String email, String password){
       
       try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, email);
           st.setString(2, password);
           ResultSet rs = st.executeQuery();
           if(rs.next()){
               return true;
           }
       } catch (Exception e) {
       }
       
       return false;
   }    
}
