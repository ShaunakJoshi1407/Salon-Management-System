/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salon;

import java.io.IOException;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddService", urlPatterns = {"/AddService"})
public class AddService extends HttpServlet {
    String sql = "insert into services(sal_email,service_name,service_cost,service_duration) values (?,?,?,?)";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        int cost = parseInt(request.getParameter("cost").toString());
        int duration = parseInt(request.getParameter("duration").toString());
        HttpSession session = request.getSession(false);  
        String sal_email = (String)session.getAttribute("username");  
        
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, sal_email);
           st.setString(2, name);
           st.setInt(3, cost);
           st.setInt(4, duration);
           st.executeUpdate();
           con.close();
           request.setAttribute("message","Saved Successfully");
           request.getRequestDispatcher("addService.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
       }
        
           request.setAttribute("message","Service Already Present");
           request.getRequestDispatcher("addService.jsp").forward(request, response); 
    }
}
