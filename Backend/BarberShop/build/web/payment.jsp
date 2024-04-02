<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="newjsp.jsp" %>
 
<html>  
    <head>  
    </head>  
    <body>
        <br><br><br><br>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         
        <h1 class="text-center">Thank you for using our platform !!!</h1>
        <p class="text-center">(We have sent an e-mail to <%= session.getAttribute("username") %>)</p>
        <h1 class="text-center">Booking Details</h1>
        <br>  
        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                        <div class="invoice-title">
                            <h2><b>Invoice</b></h2><h3 class="pull-right">Appointment ID: <%= session.getAttribute("appt_id") %></h3>
                        </div>
                        <hr>
                        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
                        <sql:query var="cust_details" dataSource="${db}">select * from customer where cust_email = ?
                            <sql:param value="${sessionScope.username}"/>
                        </sql:query>
                        <sql:query var="sal_details" dataSource="${db}">select * from salon where sal_email = ?
                            <sql:param value="${sessionScope.sal_email}"/>
                        </sql:query>
                        <div class="row">
                                <div class="col-xs-6">
                                        <address>
                                        <strong>Customer Details:</strong><br>
                                        <c:forEach items="${cust_details.rows}" var="cd">
                                            ${cd.fname}&nbsp;&nbsp;${cd.lname}<br>
                                            ${cd.city}
                                        </c:forEach>    
                                        </address>
                                </div>
                                <div class="col-xs-6 text-right">
                                        <address>
                                        <strong>Salon Details:</strong><br>
                                        <c:forEach items="${sal_details.rows}" var="sd">
                                                ${sd.sal_name}<br>
                                                ${sd.sal_contact}<br>
                                                ${sd.sal_address}
                                        </c:forEach>        
                                        </address>
                                </div>
                        </div>
                        <div class="row">
                                <div class="col-xs-6">
                                        <address>
                                                <strong>Payment Method:</strong><br>
                                                COD
                                        </address>
                                </div>
                                <div class="col-xs-6 text-right">
                                        <address>
                                                <strong>Appointment Date:</strong><br>
                                                ${sessionScope.date}<br>
                                                <strong>Appointment Time:</strong><br>
                                                ${sessionScope.appt_time}<br>
                                        </address>
                                </div>
                        </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Booking Summary</strong></h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <td><strong>Service</strong></td>
                                            <td class="text-center"><strong>Cost</strong></td>
                                            <td class="text-center"><strong>Duration</strong></td>
                                            <td class="text-right"><strong>Total</strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query var="service_details" dataSource="${db}">
                                            select * from contains where appt_id = ?
                                            <sql:param value="${sessionScope.appt_id}"/>
                                        </sql:query>
                                            
                                        <c:forEach items="${service_details.rows}" var="serd">     
                                            <tr>
                                                <td>${serd.service}</td>
                                                <td class="text-center">
                                                    <i class="fas fa-rupee-sign"></i>
                                                    ${serd.cost}
                                                </td>
                                                <td class="text-center">${serd.duration}&nbsp;Minutes</td>
                                                <td class="text-right">
                                                    <i class="fas fa-rupee-sign"></i>
                                                    ${serd.cost}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <sql:query var="app" dataSource="${db}">
                                            select * from appointment where appointment_id = ?
                                            <sql:param value="${sessionScope.appt_id}"/>
                                        </sql:query>
                                        <c:forEach items="${app.rows}" var="inf">
                                            <c:set var="total" value="${inf.total_cost}"/>
                                        </c:forEach>
                                        <tr>
                                            <td class="thick-line"></td>
                                            <td class="thick-line"></td>
                                            <td class="thick-line text-center"><strong>Subtotal</strong></td>
                                            <td class="thick-line text-right">
                                                <i class="fas fa-rupee-sign"></i>
                                                ${total - total*0.12}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>GST</strong></td>
                                            <td class="no-line text-right">
                                                <i class="fas fa-rupee-sign"></i>&nbsp; ${total*0.12}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>Total</strong></td>
                                            <td class="no-line text-right">
                                                <i class="fas fa-rupee-sign"></i>
                                                ${total}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><br>
        <a href="index.jsp">
            <button class="btn btn-primary center-block">Go to home page</button>
        </a><br><br><br><br><br><br>                                        
    </body>  
    </html>  