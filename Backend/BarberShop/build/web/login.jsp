<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="newjsp.jsp" %>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <div class="login-box">
      <h1>Login</h1>
      <form action="Login" method="post">
      <div class="textbox">
        <i class="fas fa-envelope"></i>
        <input type="text" name="email" placeholder="Email">
      </div>

      <div class="textbox">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" placeholder="Password">
      </div>
      <input type="submit" class="btn1" value="Login">
      </form>

            <% if(request.getAttribute("message") != null){ %>
            <h3 style="color: red"><%= request.getAttribute("message") %> </h3>
            <%}%>

            <% if(request.getAttribute("sucess_message") != null){ %>
            <h3> <%= request.getAttribute("sucess_message") %> </h3>
            <%}%>
    </div> 
  </body>
</html>