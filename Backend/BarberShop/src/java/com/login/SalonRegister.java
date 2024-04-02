package com.login;

import com.login.dao.SalonRegisterDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "SalonRegister", urlPatterns = {"/SalonRegister"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class SalonRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html/charset=UTF-8");
        String name = request.getParameter("sal_name");
        String email = request.getParameter("sal_email");
        String type = request.getParameter("sal_type");
        String mobno = request.getParameter("sal_contact");
        String city = request.getParameter("sal_city");
        String address = request.getParameter("sal_address");
        String password = request.getParameter("sal_password");
        int seats = Integer.parseInt(request.getParameter("sal_seats").toString());
        Part image = request.getPart("sal_img");
        String fileName = extractFileName(image);
        String savePath = "C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\" + File.separator + fileName;
        
        File fileSaveDir = new File(savePath);
        image.write(savePath + File.separator);
        
        SalonRegisterDao dao = new SalonRegisterDao();
        
        if(dao.checkCon(name, email, type, mobno, city, address, password, savePath, fileName, seats)){
            request.setAttribute("message","Registered Successfully, Please Log In");
            request.getRequestDispatcher("salonLogin.jsp").forward(request, response);
        }
        else{
            request.setAttribute("failure_message","Salon Email Already Exists");
            request.getRequestDispatcher("salonRegister.jsp").forward(request, response);
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
