<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="salonNav.jsp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.Date" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%! final static String DATE_FORMAT_NOW = "dd/MM/yy"; %>
 
<html>  
    <head>  
        <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet" type="text/css">
        <style>
            h2.round2 {
            border: 2px solid red;
            border-radius: 8px;
            width: 500px;
            margin-left: 430px;
            padding: 10px;
          }

        </style>
    </head>  
    <body>
        <br><br><br><br>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         
        <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");%>
        <div class="container text-center">    
        <fmt:formatDate type = "date" var="date" pattern = "yyyy-MM-dd" value = "${now}" />

        <h1 class="text-center">Salon Report</h1><br><br>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <div style="margin-left: 20%; margin-right: 20%;">
        <sql:query dataSource="${db}" var="info">
            select * from appointment where sal_email = ? and completed = "YES"
            <sql:param value="${sessionScope.username}"/>
        </sql:query>
        
        <c:if test="${info.rowCount != 0}">    
            <h3>Total Appointments&nbsp;:&nbsp;${info.rowCount}</h3>    
        </c:if>    
        <br>    
        <% int total_amount = 0; %>
        <c:forEach items="${info.rows}" var="rs">
            <c:set var="cost" value="${rs.total_cost}"/>    
            <% total_amount += Integer.parseInt(pageContext.getAttribute("cost").toString()); %>    
        </c:forEach>
        
        <h3>Total Earnings&nbsp;:&nbsp;<i class="fas fa-rupee-sign"></i>&nbsp;<%= total_amount %></h3>
        
        <c:if test="${info.rowCount == 0}">
             <h2 class="text-center round2">No Appointments Yet !!!</h2>
        </c:if> 
        <br>     
        <sql:query dataSource="${db}" var="info">
            select * from salon where sal_email = ?
            <sql:param value="${sessionScope.username}"/>
        </sql:query>
        
        <c:forEach items="${info.rows}" var="rs">    
            <c:set var="rating" value="${rs.rating}"/>
            <c:set var="people" value="${rs.noOfRatings}"/>
        </c:forEach>
             
            <h3>Salon Rating&nbsp;:&nbsp;<fmt:formatNumber type="number" maxFractionDigits="1" value="${rating/people}"/> </h3>
            
        <sql:query dataSource="${db}" var="info">
            select service,count(*) as c from contains group by service
        </sql:query>   
           
        </div>   
        </div>
    </body>  
</html>  