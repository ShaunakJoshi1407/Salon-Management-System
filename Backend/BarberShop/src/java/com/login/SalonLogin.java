/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login;

import com.login.dao.SalonLoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SalonLogin", urlPatterns = {"/SalonLogin"})
public class SalonLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        SalonLoginDao dao = new SalonLoginDao();
        
        if(dao.checkCon(email, password)){
            HttpSession session = request.getSession();
            session.setAttribute("username", email);
            
            response.sendRedirect("salonHome.jsp");
        }
        else{
            request.setAttribute("message","Invalid Credentials");
            request.getRequestDispatcher("salonLogin.jsp").forward(request, response);
            //response.sendRedirect("login.jsp");
        }
            
    }
}
