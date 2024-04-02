/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salon;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateSchedule", urlPatterns = {"/UpdateSchedule"})
public class UpdateSchedule extends HttpServlet {

    String sql = "{CALL setStatus()}";
    String query = "{CALL updateSeats(?,?,?)}";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        String appt_time = session.getAttribute("appt_time").toString();
        String appt_date = session.getAttribute("date").toString();
        String sal_email = session.getAttribute("sal_email").toString();
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           CallableStatement stmt = con.prepareCall(query);
           stmt.setString(1, appt_time);
           stmt.setString(2, appt_date);
           stmt.setString(3, sal_email);
           stmt.executeQuery();
           
           CallableStatement st = con.prepareCall(sql);
           st.executeQuery();
           con.close();
           
           String to = session.getAttribute("username").toString();
           String sub = "Appointment Info";
           String msg = "Thank you for booking an appointment from Barberly.\n\n\n" + "Appointment date:- " + appt_date + "\n\nAppointment time:- "+ appt_time + "\n\n" + "Salon Email - "+ sal_email + "\n";
           SendMail.send(to, sub, msg);
           
           response.sendRedirect("payment.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
