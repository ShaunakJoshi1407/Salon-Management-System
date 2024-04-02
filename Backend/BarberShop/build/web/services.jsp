<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>
<!DOCTYPE html>
<html>
    <style>
            .sal_name{
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
            
            a:hover img.imagedropshadow {
                border: solid 1px #CCC;
                -moz-box-shadow: 1px 1px 5px black;
                -webkit-box-shadow: 1px 1px 5px black;
                    box-shadow: 1px 1px 5px black;
            }
        </style>
    <body>
        <br><br><br><br>
        <div class="container text-center">    
         <h2><b>Services</b></h2> <br><br>
          
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Haircut">
                <img src="images/sal14.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Haircut</h2></a>
            </div>
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Beard Trimming">
                <img src="images/sal77.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Beard Trimming</h2></a>             
           </div>
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Hair Color">
                <img src="images/sal12.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Hair Color</h2></a>             
           </div>
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Facial">
                <img src="images/sal19.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Facial</h2></a>             
           </div>
     
             
            
             <div class="col-sm-4" style="height: 400px;">
                 <a href="apptService.jsp?pid=Manicure">
                <img src="images/sal10.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Manicure</h2></a>             
           </div> 
            
            
                     
           <div class="col-sm-4" style="height: 400px;">
               <a href="apptService.jsp?pid=Bridal Makeup">
                <img src="images/sal15.png" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Bridal Makeup</h2></a>             
           </div>           
           
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Foot Massage">
                <img src="images/sal13.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Foot Massage</h2></a>             
           </div>    
           
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Shaving">
                <img src="images/sal21.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Shaving</h2></a>             
           </div>    
           
            <div class="col-sm-4" style="height: 400px;">
                <a href="apptService.jsp?pid=Hair Wash and Dry">
                <img src="images/sal22.jpg" class="img-responsive imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                <h2>Hair Wash and Dry</h2></a>           
           </div>    
                     
      </div> 

    </body>
</html>
