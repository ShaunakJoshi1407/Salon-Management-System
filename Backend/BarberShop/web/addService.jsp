<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="salonNav.jsp" %>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <div class="login-box">
      <h1>Add Service</h1>
      <form action="AddService" method="post">
      <div class="textbox">
        <i class="fa fa-edit"></i>
        <input type="text" name="name" placeholder="Service Name">
      </div>

      <div class="textbox">
        <i class="fas fa-rupee-sign"></i>
        <input type="number" name="cost" placeholder="Cost">
      </div>
      
      <div class="textbox">
        <i class="far fa-clock"></i>
        <input type="number" name="duration" placeholder="Duration">
        <span style="font-size: 18px;margin-left: 20%;">&nbsp;&nbsp;(In minutes) </span>
      </div>    
      <input type="submit" class="btn1" value="Save">
      </form>

            <% if(request.getAttribute("message") != null){ %>
            <h3 style="color: red"><%= request.getAttribute("message") %> </h3>
            <%}%>
    </div> 
  </body>
</html>