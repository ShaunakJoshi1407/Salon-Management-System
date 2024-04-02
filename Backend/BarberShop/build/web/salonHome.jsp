<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="salonNav.jsp" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 
                h1{
                    color: black;
                    margin-left: 50px;
                    font-family: Montserrat;
                    font-weight: 600;
                    
                }
                
                h2{
                    color: black;
                    margin-left: 50px;
                    font-family: Montserrat;
                    font-weight: 300;
                }
                .container {
                    position: relative;
                    text-align: center;
                    color: white;
                    background-color: white;
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
                      float: right;
                  }
                  div1{
                      margin-left: 50px;
                  }

                  p{
                       margin-left: 50px;
                       font-size: 20px;
                      color: black;
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
        </style>
    </head>
    <body><br><br>
        <div id="myCarousel" class="carousel slide" style="height: 400px;" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
              <div class="item active">
                  <img src="images/sal1.jpg" style="height: 400px;" alt="Image">
              </div>

              <div class="item">
                <img src="images/sal2.jpg" style="height: 400px;" alt="Image">
              </div>
                
              <div class="item">
                <img src="images/sal10_1.jpg" style="height: 400px;" alt="Image">
              </div>  
            </div>
      <br><br><br>
      <h1>Why Barberly?</h1><br>
      <h2>Start your journey with BARBERLY</h2>
      <br>
      
<p><img src="images/salhome.jpg" alt="Pineapple" style="width:400px;height:200px;margin-right:200px">
Over 20 years of hairdressing excellence has helped us <br>
streamline salon operations down to a science.You can <br>
leverage our proven franchise system to create successful<br>
salons.Furthermore Barberly offers a package  with consistent<br>
guidelines, marketing material and access to a system of <br>
education that allows your staff to constantly grow and improve.<br>
Take a moment to discover Barberly™s model which promises to <br>
keep the art of hairdressing fresh and alive.<br></p>
   <br>
   <h1>Criteria</h1>
   <p><img src="images/salhome1.jpg" alt="Pineapple" style="width:400px;height:200px;margin-right:200px">
       Barberly is one of the trust salon chain with<br> 
      offering salon across metros and mini-metros catering to <br>
      the beauty needs of ardent fashion followers, trend setters<br>
      and celebrities. We are looking for people who have a <br>
      passion for the industry and are keen on taking a legacy<br> 
      forward. Our Business Development team will individually<br>
      assess and evaluate the applicants before advising on the<br> 
      way ahead.</p>
   
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
        </a>
         </body>
</html>
