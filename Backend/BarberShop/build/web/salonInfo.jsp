<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <%
            String s = request.getParameter("pid");
            pageContext.setAttribute("sal_email", s);
        %>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <sql:query var="rs" dataSource="${db}">Select * from salon where sal_email = ?
            <sql:param value="${sal_email}"/>
        </sql:query>
         
        <div class="container text-center">
              <c:forEach items="${rs.rows}" var="act">
                  <h1 class="text-center">${act.sal_name}</h1><br>
                  <div style="height: 400px;">               
                  <img src="images/${act.img_path}" class="imagedropshadow center-block" style="width:40%; height: 250px; " alt="Image"><br>
                  <h2 class="sal_name"><c:out value="${act.sal_name}"></c:out></h2>
                  <div style="margin-left: 25%; margin-right: 25%; padding: 10px;">
                      <h3 style="">Address&nbsp;&nbsp;:&nbsp;<c:out value="${act.sal_address}"></c:out></h3>
                      <h3 style="">Contact No&nbsp;:&nbsp;<c:out value="${act.sal_contact}"></c:out></h3>
                      <h3 style="">E-mail ID&nbsp;:&nbsp;<c:out value="${act.sal_email}"></c:out></h3>
                      <h3 style="">Type&nbsp;&nbsp;:&nbsp;<c:out value="${act.sal_type}"></c:out></h3>
                      <h3 style="">Ratings&nbsp;&nbsp;:&nbsp;<fmt:formatNumber type="number" maxFractionDigits="1" value="${act.rating/act.noOfRatings}"/></h3>
                  </div>
                  </div>
              </c:forEach>  
          </div>
          <br>    
    </body>
</html>

