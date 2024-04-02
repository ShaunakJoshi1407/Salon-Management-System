<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body><br><br><br><br>
        <% String pid = request.getParameter("time"); %>
        <% if(pid == null){
            response.setHeader("failure_message","Please select the date and time");
            response.sendRedirect("dateInput.jsp?pid="+ session.getAttribute("sal_email"));
        }%>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         
         <% session.setAttribute("appt_time", request.getParameter("time")); %> 
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <sql:query var="rs" dataSource="${db}">Select * from services where sal_email = ? order by service_cost
            <sql:param value="${sessionScope.sal_email}"/>
        </sql:query>
         
        <div class="container text-center">    
            <h2>Select Services</h2>
            <div class="row">
                <form action="billDisplay.jsp" method="post">
                  <table class="table table-condensed table-hover table-bordered text-center">
                      <thead>
                        <th class="text-center">Service</th>
                        <th class="text-center">Cost</th>
                        <th class="text-center">Select</th>
                      </thead>
                    <c:forEach items="${rs.rows}" var="act">
                        <tr>
                            <td>
                                <b><c:out value="${act.service_name}"></c:out></b>
                            </td>
                            <td>
                                <i class="fas fa-rupee-sign"></i>
                                <c:out value="${act.service_cost}"></c:out>
                            </td>
                            <td>
                                <input type="checkbox" name="services" value="${act.service_name}">
                            </td>
                        </tr><br>
                    </c:forEach>
                  </table>    
                    <input type="submit" class="btn btn-primary" value="Next" name="Next">    
                </form>    
            </div>
          </div>
            <br>
            
            <% if(request.getAttribute("msg") != null){
            %>  
            <h3 class="text-center"><%= request.getAttribute("msg") %></h3>
            <%
            }%>  
    </body>
</html>
