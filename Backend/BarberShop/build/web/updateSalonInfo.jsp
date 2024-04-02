<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="salonNav.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="javaSript/register.js"></script>
    </head>
<body>
    <div class="login-box1">
      <h1>Update Salon Info</h1>
      <% if(request.getAttribute("failure_message") != null){ %>
      <h3 style="color: red"><%= request.getAttribute("failure_message") %> </h3>
      <%}%>
      <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
      <sql:query dataSource="${db}" var="reg">
          select * from salon where sal_email = ?
          <sql:param value="${sessionScope.username}"/>
      </sql:query>
          
      <c:forEach items="${reg.rows}" var="rg">    
        <form name="myForm" onsubmit="return validateForm();" method="post" action="UpdateSalonInfo">
            <div class="textbox">
              <i class="fas fa-cut"></i>
              <input type="text" name="sal_name" value="${rg.sal_name}" autocomplete="off">
            </div>
            <br>
            <div class="textbox">
              <i class="fas fa-address-book"></i>
              <input type="text" name="sal_contact"  value="${rg.sal_contact}" autocomplete="off">
            </div>
           <br>
            <div class="textbox">
              <i class="fas fa-city"></i>
              <input type="text" name="sal_city" value="${rg.sal_city}">
            </div>
            <br>
             <div class="textbox">
              <i class="fas fa-map-marked-alt"></i>
             <input type="text" name="sal_address" value="${rg.sal_address}" id="address" autocomplete="off">
             </div>
           <br>
           <div class="textbox">
              <i class="fas fa-boxes"></i>
              <input type="number" name="sal_seats"  value="${rg.noOfSeats}" autocomplete="off">
            </div>
            <input type="submit" class="btn1" value="Update">
        </form>
      </c:forEach>
          
      <% if(request.getAttribute("message") != null){ %>
          <h3 style="color: red"><%= request.getAttribute("message") %> </h3>
      <%}%>
    </div>
  </body>

</html>
