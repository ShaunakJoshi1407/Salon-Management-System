function validateForm() {
              var fname = document.forms["myForm"]["sal_name"].value; 
              var email = document.forms["myForm"]["sal_email"].value;  
              var city = document.forms["myForm"]["sal_city"].value;
              var city = document.forms["myForm"]["sal_address"].value;
              var mobno = document.forms["myForm"]["sal_contact"].value;
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
          
