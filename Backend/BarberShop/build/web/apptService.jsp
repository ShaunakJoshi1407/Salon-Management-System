<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>
<%@page import="java.text.SimpleDateFormat" %> 
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
        
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         <% String service = request.getParameter("pid"); %>
         
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <sql:query var="rs" dataSource="${db}">Select * from services where service_name = ?
            <sql:param value="<%= service %>"/>
        </sql:query>
         
        <div class="container text-center">    
            <h2>Select Salon</h2> <br>
            <div class="row">   
              <c:forEach items="${rs.rows}" var="act">
                  <sql:query var="sal" dataSource="${db}">Select * from salon where sal_email = ?
                      <sql:param value="${act.sal_email}"/>
                  </sql:query>
                  
                  <c:forEach items="${sal.rows}" var="salon">
                    <div class="col-sm-4" style="height: 400px;">
                      <a href="dateInput.jsp?pid=${act.sal_email}">  
                          <img src="images/${salon.img_path}" class="imagedropshadow" style="width:100%; height: 250px;" alt="Image">
                          <h2 class="sal_name"><c:out value="${salon.sal_name}"></c:out></h2>
                          <h4 class="sal_name"><c:out value="${salon.sal_city}"></c:out></h4>
                      </a>
                    </div>
                  </c:forEach>    
              </c:forEach> 
            </div>
          </div>
          <br>    
    </body>
</html>

