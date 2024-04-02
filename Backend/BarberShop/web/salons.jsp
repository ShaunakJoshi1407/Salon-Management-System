<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>

<!DOCTYPE html>
<html>
    <head>
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
    </head>
    <body>
        <br><br><br><br>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
        %>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <sql:query var="rs" dataSource="${db}">Select * from salon </sql:query>
         
        <div class="container text-center">    
            <h2><b>Our Salons</b></h2> <br>
            <div class="row">
              <c:forEach items="${rs.rows}" var="act">
                  <div class="col-sm-4" style="height: 400px;">
                  <a href="salonInfo.jsp?pid=${act.sal_email}">  
                  <img src="images/${act.img_path}" class="imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                  <h2 class="sal_name"><c:out value="${act.sal_name}"></c:out></h2>
                  </a>
                </div>
              </c:forEach>  
            </div>
          </div>
            <br>    
    </body>
</html>

