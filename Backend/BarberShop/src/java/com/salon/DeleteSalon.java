/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.salon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteSalon", urlPatterns = {"/DeleteSalon"})
public class DeleteSalon extends HttpServlet {
    String sql = "delete from salon where sal_email = ?";
    String url = "jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false";
    String user = "root";
    String pass = "";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        String sal_email = (String)session.getAttribute("username");  
    
        try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(url, user, pass);
           PreparedStatement st = con.prepareStatement(sql);
           st.setString(1, sal_email);
           st.executeUpdate();
           con.close();
           request.setAttribute("message","Account has been Deleted Successfully!!!");
           session.removeAttribute("username");
           session.invalidate();
           response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } 

    }

}
