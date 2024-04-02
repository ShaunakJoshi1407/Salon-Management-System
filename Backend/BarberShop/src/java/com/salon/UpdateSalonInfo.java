package com.salon;

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

@WebServlet(name = "UpdateSalonInfo", urlPatterns = {"/UpdateSalonInfo"})
public class UpdateSalonInfo extends HttpServlet {

    String sql = "update salon set sal_name=?,sal_contact=?,sal_city=?,sal_address=?,noOfSeats = ? where sal_email = ?";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        String sal_email = (String)session.getAttribute("username");  
        String sal_name = request.getParameter("sal_name");
        String sal_contact = request.getParameter("sal_contact");
        String sal_city = request.getParameter("sal_city");
        String sal_address = request.getParameter("sal_address");
        int seats = Integer.parseInt(request.getParameter("sal_seats").toString());
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, sal_name);
           st.setString(2, sal_contact);
           st.setString(3, sal_city);
           st.setString(4, sal_address);
           st.setInt(5, seats);
           st.setString(6, sal_email);
           st.executeUpdate();
           con.close();
           request.setAttribute("message","Salon Information has been updated Successfully!!!");
           request.getRequestDispatcher("updateSalonInfo.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
