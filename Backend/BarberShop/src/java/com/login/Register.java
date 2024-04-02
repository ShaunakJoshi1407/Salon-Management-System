package com.login;

import com.login.dao.RegisterDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        
        RegisterDao dao = new RegisterDao();
        
        if(dao.checkCon(fname, lname, email, gender, city, password)){
            request.setAttribute("message","Registered Successfully, Please Log In");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else{
            request.setAttribute("failure_message","Email Already Exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
