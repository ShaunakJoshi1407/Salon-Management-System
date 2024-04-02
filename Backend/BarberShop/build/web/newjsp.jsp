<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.google.com/?selection.family=Noto+Sans|Pangolin&category=Handwriting" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="{% static 'music/style.css' %}">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Barbers</title>
        <script type="text/javascript" src="js/bootstrap/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
        <script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
        <script>
             $(document).ready(function(){
                $('.dropdown-toggle').dropdown()
            });
        </script>
        <style>
            body {
                background-image: url("images/bg.jpg");
                background-size: cover;
            }
            
            #navbar1{
                    list-style-type: none;
                    overflow: hidden;
                    position: -webkit-sticky;
                    position: sticky;
                    top: 0;
            }
            
            .dropdown:hover .dropdown-menu {
                display: block;
                margin-top: 0;
            }
            
            .dropdown-menu li a:hover {
                    background-color: black !important;
                    color: white;
            }
             
            a:hover{
                text-decoration: none;
                text-shadow: 4px 4px 4px #aaa;
            }  
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp" style="color: red;">
                    <b>Barberly</b></a>
            </div>
            <ul class="nav navbar-nav">
              <li class="active">
                  <a href="salons.jsp">
                      <span class="glyphicon glyphicon-scissors" aria-hidden="true"></span>&nbsp; Salons
                  </a>
              </li>
              <li class="active">
                  <a href="services.jsp">
                      <span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; Services
                  </a>
              </li>
              <li class="active">
                  <a href="appointment.jsp">
                      <span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; Book Appointment
                  </a>
              </li>
            </ul>
              <ul class="nav navbar-nav navbar-right">
                 
              <% if(session.getAttribute("username")!=null)
                 {
              %>
              <li class="dropdown active">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>&nbsp; More
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="myAppointments.jsp">My Appointments</a></li>
                      <li><a href="updateProfile.jsp">Update Profile</a></li>
                      <li><a href="DeleteAccount" onclick="return confirm('Your account will be deleted permanently?')">Delete Account</a></li>
                    </ul>
                 </li>
              <li class="active"><a href="#">
                       <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; <%= session.getAttribute("username") %>
                  </a>
              </li>
              <li class="active">
                  <a href="Logout">
                       <span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp; Logout
                  </a>
              </li>
              <%
                 }else {
              %>
              <li class="dropdown active">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>&nbsp; More
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="salonRegister.jsp">Salon Registration</a></li>
                      <li><a href="salonLogin.jsp">Salon Login</a></li>
                      <li><a href="#">About</a></li>
                    </ul>
              </li>
              <li class="active"> 
                  <a href="register.jsp">
                      <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp; Sign Up
                  </a>
              </li>
              <li class="active">
                  <a href="login.jsp">
                      <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp; Login
                  </a>
              </li>
              <%
                 }
              %>
            </ul>
          </div>
        </nav>
    </body>
</html>
            
 