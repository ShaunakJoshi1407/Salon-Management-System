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
          
