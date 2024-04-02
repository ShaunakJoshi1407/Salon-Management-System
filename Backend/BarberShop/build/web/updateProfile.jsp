<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="javaSript/register.js"></script>
    </head>
<body>
    <div class="login-box1">
      <h1>Update Profile</h1>
      <% if(request.getAttribute("failure_message") != null){ %>
      <br><br><br><br><br><br><br><h3 style="color: red"><%= request.getAttribute("failure_message") %> </h3>
      <%}%>
      <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
      <sql:query dataSource="${db}" var="reg">
          select * from customer where cust_email = ?
          <sql:param value="${sessionScope.username}"/>
      </sql:query>
          
      <c:forEach items="${reg.rows}" var="rg">    
      <form name="myForm" onsubmit="return validateForm()" method="post" action="UpdateProfile">
            <div class="textbox">
              <i class="fas fa-user"></i>
              <input type="text" name="fname" value="${rg.fname}" autocomplete="off">
            </div>
            <br> 
            <div class="textbox">
              <i class="fas fa-user"></i>
              <input type="text" name="lname" value="${rg.lname}" autocomplete="off">
            </div>
            <br>
            <div class="radiobox">
              <i class="fas fa-venus-mars"></i>&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="gender" value="male" id="male" checked><span id="male">&nbsp;Male</span>&nbsp;&nbsp;
              <input type="radio" name="gender" value="female" id="female"><span id="male">&nbsp;Female</span>&nbsp;&nbsp;
              <input type="radio" name="gender" value="other" id="other"><span id="male">&nbsp;Others</span>&nbsp;&nbsp;
            </div> 
            <br>
            <div class="textbox">
              <i class="fas fa-city"></i>
              <input type="text" name="city" value="${rg.city}" placeholder="City">
            </div>
            <br>
            <input type="submit" class="btn1" value="Update">
      </form>
      </c:forEach>
          
      <% if(request.getAttribute("message") != null){ %>
          <h3 style="color: red"><%= request.getAttribute("message") %> </h3>
      <%}%>
    </div>
  </body>

</html>
