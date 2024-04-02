package com.login;

import java.lang.*;
import com.login.dao.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if(email.equals("admin@gmail.com") && password.equals("admin")){
            HttpSession session = request.getSession();
            session.setAttribute("username", email);
            
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
        
        LoginDao dao = new LoginDao();
        
        if(dao.checkCon(email, password)){
            HttpSession session = request.getSession();
            session.setAttribute("username", email);
            
            response.sendRedirect("index.jsp");
        }
        else{
            request.setAttribute("message","Invalid Credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //response.sendRedirect("login.jsp");
        }    
    }
}
