<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Set" %>
<%@page import="java.util.HashSet" %>
<%@page import="java.util.Random" %>
<%@include file="newjsp.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/salonreg.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            function validateForm() {
              var fname = document.forms["myForm"]["sal_name"].value; 
              var email = document.forms["myForm"]["sal_email"].value;  
              var city = document.forms["myForm"]["sal_city"].value;
              var city = document.forms["myForm"]["sal_address"].value;
              var mobno = document.forms["myForm"]["sal_contact"].value;
              var img = document.forms["myForm"]["sal_img"].value;
              var seats = document.forms["myForm"]["sal_seats"].value;
              var password = document.forms["myForm"]["sal_password"].value; 
              var cpassword = document.forms["myForm"]["cpassword"].value; 
              var letters = /^[A-Za-z]+$/;  
              var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
              var mob = /^\d{10}$/;
              if (fname == "")                 
              { 
                window.alert("Please enter salon name.");
                return false; 
              }
              
              if (email == "")                 
              { 
                window.alert("You cannot keep the Email empty! Please enter your Email-id.");  
                return false; 
              } 
              
              if (!email.match(mail))                 
              { 
                window.alert("Please enter a valid e-mail address."); 
                return false; 
              }
             
             if (mobno == ""){
                 alert("Enter the contact number."); 
                 return false;
             }
             
             if (!mobno.match(mob)){
                 alert("Enter the valid format for contact number."); 
                 return false;
             }
              
              if (city == ""){
                 alert("Enter the city."); 
                 return false;
             }
             
             if (address == ""){
                 alert("Enter the address."); 
                 return false;
             }
             
             if (img == ""){
                 alert("Enter the image of the salon."); 
                 return false;
             }
             if (seats == ""){
                 alert("Enter the number of seats available in the salon."); 
                 return false;
             }
              
              if(password==""){
               window.alert("Please enter password");  
                return false; 
              }
              
              if(password.length<4){
               window.alert("Password must contain atleast 4 characters");  
                return false; 
              }
              
              if(cpassword==""){
               window.alert("Please confirm the password");  
                return false; 
              }
              
              if (password != cpassword){
                alert("Password not matching!!!");
                return false;
              }
              return true;
          }
          

        </script>
    </head>
  <body bgcolor="black">
    <div class="login-box1">
        <br><br><br><br><br><br><br>
        <b><h2>Salon Registration</h2></b>
        <% if(request.getAttribute("failure_message") != null){ %>
        <br><br><br><br><br><br><br><h3 style="color: red"><%= request.getAttribute("failure_message") %> </h3>
        <%}%>
      <form name="myForm" onsubmit="return validateForm();" method="post" enctype="multipart/form-data" action="SalonRegister">
      <div class="textbox">
        <i class="fas fa-cut"></i>
        <input type="text" name="sal_name" placeholder="Salon Name" autocomplete="off">
      </div>
      <br>
       <div class="textbox">
        <i class="fas fa-envelope"></i>
        <input type="text" name="sal_email" placeholder="Email" autocomplete="off">
      </div>    
      <br>
      <div class="radiobox">
        <i class="fas fa-venus-mars"></i>
        <label style="font-size: 20px;">Salon-type :</label>
        <br><br>
       <input type="radio" name="sal_type" value="male" checked><span id="male">&nbsp;Male</span>&nbsp;&nbsp;
       <input type="radio" name="sal_type" value="female"><span id="male">&nbsp;Female</span>&nbsp;&nbsp;
       <input type="radio" name="sal_type" value="unisex"><span id="male">&nbsp;Unisex</span>&nbsp;&nbsp;
     </div> 
      <br>
      <div class="textbox">
        <i class="fas fa-address-book"></i>
        <input type="text" name="sal_contact"  placeholder="Salon Contact No." autocomplete="off">
      </div>
     <br>
      <div class="textbox">
        <i class="fas fa-city"></i>
        <input type="text" name="sal_city" placeholder="City">
      </div>
      <br>
       <div class="textbox">
        <i class="fas fa-map-marked-alt"></i>
       <input type="text" name="sal_address" placeholder="Salon Address" id="address" autocomplete="off">
       </div>
     <br>
      <div class="radiobox">
        <i class="fas fa-camera"></i>
        <label style="font-size: 20px;">Salon Photo:</label><br><br>
        <input type="file" name="sal_img">
       </div>
     <br>
     <div class="textbox">
        <i class="fas fa-boxes"></i>
        <input type="number" name="sal_seats"  placeholder="No Of Seats" autocomplete="off">
      </div>
     <br>  
      <div class="textbox">
        <i class="fas fa-lock"></i>
        <input type="password"name="sal_password" placeholder="Set Password">
      </div>
    <br> 
       <div class="textbox">
        <i class="fas fa-lock"></i>
        <input type="password"  name="cpassword"  placeholder="Confirm Password">
      </div>   
      <input type="submit" class="btn1" value="Register">
      </form>
    </div>
    </body>
</html>
