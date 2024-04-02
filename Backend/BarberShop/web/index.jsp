<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="newjsp.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <style>
              .carousel-inner img {
                    width: 100%; /* Set width to 100% */
                    margin: auto;
                    min-height:400px;
                }
                h3{
                    font-size: 40px;
                    margin-top: -280px;
                    margin-left: -700px;
                }
                h2{
                    font-size: 30px;
                    margin-left: -700px;
                }
 
                #right h2{
                    font-size: 30px;
                    margin-right: -1400px;
                }
                
                #right h3{
                    font-size: 40px;
                    margin-top: -280px;
                    margin-right: -1400px;
                }
                /* Hide the carousel text when the screen is less than 600 pixels wide */
                @media (max-width: 600px) {
                  .carousel-caption {
                    display: none; 
                  }
                }
                
                h1{
                    text-align: center;
                    color: black;
                }
                .container {
                    position: relative;
                    text-align: center;
                    color: white;
                    background-color: transparent;
                  }

                  .top-center {
                    position: absolute;
                    top: 8px;
                    left:0%;
                  }
                  * {
                    box-sizing: border-box;
                  }

                  .column {
                    float: left;
                    width: 25%;
                    padding: 20px;

                  }

                  /* Clearfix (clear floats) */
                  .row::after {
                    content: "";
                    clear: both;
                    display: table;
                  }
                  img{
                      height: 290px;
                  margin: 0;
                  width: 234px;
                  }
                  p{
                      text-align: center;
                      font-size: 20px;
                      color: black;
                  }
                  
                  a:hover{
                        text-decoration: none;
                        text-shadow: 4px 4px 4px #aaa;
                    }

                    .imagedropshadow {
                        padding: 5px;
                        border: solid 1px #EFEFEF;
                    }

                    a:hover img {
                        border: solid 1px #CCC;
                        -moz-box-shadow: 1px 1px 5px black;
                        -webkit-box-shadow: 1px 1px 5px black;
                            box-shadow: 1px 1px 5px black;
                    }
                    footer {
                        background-color: #d3d3d3;
                        color: white;
                        padding: 15px;
                        margin-top: 90%;
                      }
        </style>
    </head>
    
    <body>
        <br><br>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
        %>   
        
        <div id="myCarousel" class="carousel slide" style="height: 400px;" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                  <img src="images/sal1.jpg" style="height: 400px;" alt="Image">
                  <div class="carousel-caption" id="right">
                      <h3>Barberly</h3>
                    <h2>Salon Bookings</h2>
                    <h2>with the best salons</h2> 
                    <h2>and spas around you</h2>
                </div>      
              </div>

              <div class="item">
                <img src="images/sal2.jpg" style="height: 400px;" alt="Image">
                <div class="carousel-caption" >
                    <h3>Instant Beauty Bookings</h3>
                    <h2>Find & book appointment </h2>
                    <h2>with the best salons</h2> 
                    <h2>and spas around you</h2>
                </div>      
              </div>
                
              <div class="item">
                <img src="images/sal10_1.jpg" style="height: 400px;" alt="Image">
                <div class="carousel-caption">
                    <h3>Instant Beauty Bookings</h3>
                    <h2>Find & book appointment </h2>
                    <h2>with the best salons</h2> 
                    <h2>and spas around you</h2>
                </div>      
              </div>  
            </div>
            <br><br><br><br><br><br><br><br><br><br><br>
            <div class="container">    
            <div class="top-center">
                <h1>Trending Style</h1>
            </div> 
        <br><br><br>
    <div class="row">
        <div class="column">
            <img src="images/style1.jpg" alt="Snow" style="width:100%">
            <p>Artiste Salon</p>
        </div>
        <div class="column">
            <img src="images/style2.jpg" alt="Forest" style="width:100%">
            <p>Do Or Dye</p>
        </div>
        <div class="column">
            <img src="images/style3.jpg" alt="Mountains" style="width:100%">
            <p>Beautique Salon</p>
        </div>
        <div class="column">
            <img src="images/style4.jpg" alt="Mountains" style="width:100%">
            <p>D'vine Nail </p>
          </div>
    </div>
    </div>
            <div class="container">    
            <div class="top-center">
                <h1>Popular Services</h1>
            </div> 
        <br><br><br>
    <div class="row">
        <div class="column">
            <a href="appointment.jsp">
            <img src="images/haircut1.jpg" alt="Snow" style="width:100%">
             
                 <p>Hair Cut</p>
            </a> 
        </div>
        <div class="column">
            <a href="appointment.jsp">
            <img src="images/haircolor.jpg" alt="Forest" style="width:100%">
            
                 <p>Hair Color</p>
            </a>
        </div>
        <div class="column">
            <a href="appointment.jsp">
            <img src="images/hairwash1.jpg" alt="Mountains" style="width:100%">
            
                 <p>Hair Wash</p>
            </a>
        </div>
        <div class="column">
            <a href="appointment.jsp">
            <img src="images/hairsmoothing1.jpg" alt="Mountains" style="width:100%">
            
                 <p>Hair Smoothing</p>
            </a>
          </div>

    </div>
    </div>
   
        
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
        </div>  
        <footer class="container-fluid text-center">
            <p>Credits</p><br>
            <p>Ishwar Shinde&nbsp;&nbsp;|&nbsp;&nbsp;Shaunak Joshi&nbsp;&nbsp;|&nbsp;&nbsp;Saif Shaikh&nbsp;&nbsp;|&nbsp;&nbsp;Atharv Sutar</p><br>
            <p>Email&nbsp;&nbsp;:&nbsp;&nbsp;barberlysalon@gmail.com</p>
        </footer>
    </body>
</html>

