package com.account;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {
    String sql = "update customer set fname=?,lname=?,gender=?,city=? where cust_email = ?";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        String cust_email = (String)session.getAttribute("username");  
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String city = request.getParameter("city");
        String gender = request.getParameter("gender");
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, fname);
           st.setString(2, lname);
           st.setString(3, gender);
           st.setString(4, city);
           st.setString(5, cust_email);
           st.executeUpdate();
           con.close();
           request.setAttribute("message","Profile has been updated Successfully!!!");
           request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
