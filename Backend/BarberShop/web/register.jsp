<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="newjsp.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            
           function validateForm() {
              var fname = document.forms["myForm"]["fname"].value;
              var lname = document.forms["myForm"]["lname"].value;     
              var email = document.forms["myForm"]["email"].value;  
              var city = document.forms["myForm"]["city"].value;
              var password = document.forms["myForm"]["password"].value; 
              var cpassword = document.forms["myForm"]["cpassword"].value; 
              var letters = /^[A-Za-z]+$/;  
              var mail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

              if (fname == "")                 
              { 
                window.alert("Please enter your first name.");
                return false; 
              }

             if(!fname.match(letters)){
                 window.alert("Please enter valid format for first name.");
                return false;             
              }

              if (lname == "")                 
              { 
                alert("Please enter your last name."); 
                return false; 
              }

              if(!lname.match(letters)){
                 window.alert("Please enter valid format for last name.");
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
              
              if (city == ""){
                 alert("Enter the city."); 
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
<body>
    <div class="login-box1">
      <h1>Sign Up</h1>
      <% if(request.getAttribute("failure_message") != null){ %>
      <br><br><br><br><br><br><br><h3 style="color: red"><%= request.getAttribute("failure_message") %> </h3>
      <%}%>
      <form name="myForm" onsubmit="return validateForm()" method="post" action="Register">
            <div class="textbox">
              <i class="fas fa-user"></i>
              <input type="text" name="fname" placeholder="First name" autocomplete="off">
            </div>
            <br> 
            <div class="textbox">
              <i class="fas fa-user"></i>
              <input type="text" name="lname" placeholder="Last name" autocomplete="off">
            </div>
            <br>
            <div class="textbox">
              <i class="fas fa-envelope"></i>
              <input type="text" name="email" placeholder="Email" autocomplete="off">
            </div>
            <br>
            <div class="radiobox">
              <i class="fas fa-venus-mars"></i>&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="gender" value="male" id="male" checked><span id="male">&nbsp;Male</span>&nbsp;&nbsp;
              <input type="radio" name="gender" value="female" id="female"><span id="male">&nbsp;Female</span>&nbsp;&nbsp;
              <input type="radio" name="gender" value="other" id="other"><span id="male">&nbsp;Others</span>&nbsp;&nbsp;
            </div> 
            <br>
            <div class="textbox">
              <i class="fas fa-city"></i>
              <input type="text" name="city"  placeholder="City">
            </div>
            <br>
            <div class="textbox">
              <i class="fas fa-lock"></i>
              <input type="password" name="password" placeholder="Set Password">
            </div>
            <br>
            <div class="textbox">
              <i class="fas fa-lock"></i>
              <input type="password" name="cpassword" placeholder="Confirm Password">
            </div>
            <input type="submit" class="btn1" value="Sign Up">
      </form>
    </div>
  </body>

</html>
