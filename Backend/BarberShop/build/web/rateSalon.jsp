<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="newjsp.jsp" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%  
    String s = request.getParameter("pid");
    session.setAttribute("sal_rate", s);
%>
    
    
    <html>
        <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet" type="text/css">
        <style>
            h2.round2 {
            border: 2px solid red;
            border-radius: 8px;
            width: 500px;
            margin-left: 430px;
            padding: 10px;
          }
          
            .rating {
              display: inline-block;
              position: relative;
              height: 50px;
              line-height: 50px;
              font-size: 50px;
            }

            .rating label {
              position: absolute;
              top: 0;
              left: 0;
              height: 100%;
              cursor: pointer;
            }

            .rating label:last-child {
              position: static;
            }

            .rating label:nth-child(1) {
              z-index: 5;
            }

            .rating label:nth-child(2) {
              z-index: 4;
            }

            .rating label:nth-child(3) {
              z-index: 3;
            }

            .rating label:nth-child(4) {
              z-index: 2;
            }

            .rating label:nth-child(5) {
              z-index: 1;
            }

            .rating label input {
              position: absolute;
              top: 0;
              left: 0;
              opacity: 0;
            }

            .rating label .icon {
              float: left;
              color: transparent;
            }

            .rating label:last-child .icon {
              color: #000;
            }

            .rating:not(:hover) label input:checked ~ .icon,
            .rating:hover label:hover input ~ .icon {
              color: #ffcc00;
            }

            .rating label input:focus:not(:checked) ~ .icon:last-child {
              color: #000;
              text-shadow: 0 0 5px #09f;
            }          
        </style><br><br><br><br>
      <h2 class="text-center">Rate Salon</h2>
      <h2 class="text-center"><%= session.getAttribute("sal_rate") %></h2><br><br>
      <div class="center-block" style="margin-left: 42%;">
      <form class="rating center-block">
            <label>
              <input type="radio" name="stars" value="1" />
              <span class="icon">★</span>
            </label>
            <label>
              <input type="radio" name="stars" value="2" />
              <span class="icon">★</span>
              <span class="icon">★</span>
            </label>
            <label>
              <input type="radio" name="stars" value="3" />
              <span class="icon">★</span>
              <span class="icon">★</span>
              <span class="icon">★</span>   
            </label>
            <label>
              <input type="radio" name="stars" value="4" />
              <span class="icon">★</span>
              <span class="icon">★</span>
              <span class="icon">★</span>
              <span class="icon">★</span>
            </label>
            <label>
              <input type="radio" name="stars" value="5"/>
              <span class="icon">★</span>
              <span class="icon">★</span>
              <span class="icon">★</span>
              <span class="icon">★</span>
              <span class="icon">★</span>
            </label>
          </form><br><br>
          <a href="myAppointments.jsp">
              <button class="btn btn-primary" style="margin-left: 80px;">Back</button>
          </a>
          </div>
          <h1 class="ans text-center" style="color: brown;"></h1>
         <script>
            $(':radio').change(function() {
                        $.ajax({
                        data: {rating: $(this).val()
                        }, 
                        url: 'addRating.jsp',
                        type: 'post',

                        success: function (responseData) {
                            $(".ans").html(responseData);
                        }
                    });
              });
        </script>     
              
        </html>        

            
<%           
%>  

 