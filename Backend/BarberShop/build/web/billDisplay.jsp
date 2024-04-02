<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="newjsp.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css">
        <style>
            .invoice-title h2, .invoice-title h3 {
                display: inline-block;
            }

            .table > tbody > tr > .no-line {
                border-top: none;
            }

            .table > thead > tr > .no-line {
                border-bottom: none;
            }

            .table > tbody > tr > .thick-line {
                border-top: 2px solid;
            }
        </style>
    </head>
    <body><br><br><br><br>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         
        <%
            if(request.getParameterValues("services") == null){
                String msg = "Please select the services";
                request.setAttribute("msg", msg);
                response.sendRedirect("selectServices.jsp");
            }
            String[] services = request.getParameterValues("services");
            request.setAttribute("service", services);
        %>
        
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <sql:query dataSource="${db}" var="max_id">select max(appointment_id) from appointment</sql:query>
        <c:set var="id" value="${max_id.rowsByIndex}"/>
        <c:set var="id" value="${id[0][0] + 1}"/>
        <% session.setAttribute("appt_id", pageContext.findAttribute("id")); %>
        
        <sql:update dataSource="${db}">
            insert into appointment(appointment_id,cust_email,sal_email,appt_date,appt_time) values(?,?,?,?,?)
            <sql:param value="${id}"/>
            <sql:param value="${sessionScope.username}"/>
            <sql:param value="${sessionScope.sal_email}"/>
            <sql:param value="${sessionScope.date}"/>
            <sql:param value="${sessionScope.appt_time}"/>
        </sql:update>
        
        <% int total_amount = 0; %>
        <c:forEach items="${service}" var="s">
            <sql:query var="check" dataSource="${db}">select * from services where sal_email = ? and service_name = ?
            <sql:param value="${sessionScope.sal_email}"/>
            <sql:param value="${s}"/>
            </sql:query>
            <c:forEach items="${check.rows}" var="rs">
                <sql:update dataSource="${db}"> 
                    insert into contains (appt_id, service, cost, duration) values (?,?,?,?)
                    <sql:param value="${id}"/>
                    <sql:param value="${s}"/>
                    <sql:param value="${rs.service_cost}"/>
                    <sql:param value="${rs.service_duration}"/>
                </sql:update>  
                <c:set var="cost" value="${rs.service_cost}"/>    
                <% total_amount += Integer.parseInt(pageContext.getAttribute("cost").toString()); %>    
            </c:forEach>    
        </c:forEach>
                    
        <% pageContext.setAttribute("total", total_amount); %>        
        <sql:update dataSource="${db}">call setTotal_cost(?,?)
            <sql:param value="${total}"/>
            <sql:param value="${id}"/>
        </sql:update>            
        
        <br>  
        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                        <div class="invoice-title">
                            <h2><b>Invoice</b></h2><h3 class="pull-right">Appointment ID: <%= pageContext.findAttribute("id") %></h3>
                        </div>
                        <hr>
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
                                                <strong>Appointment Time</strong><br>
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
                                        <tr>
                                            <td class="thick-line"></td>
                                            <td class="thick-line"></td>
                                            <td class="thick-line text-center"><strong>Subtotal</strong></td>
                                            <td class="thick-line text-right">
                                                <i class="fas fa-rupee-sign"></i>
                                                ${total}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>GST(12%)</strong></td>
                                            <td class="no-line text-right">
                                                <i class="fas fa-rupee-sign"></i>&nbsp; <%= total_amount*0.12 %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>Total</strong></td>
                                            <td class="no-line text-right">
                                                <c:set var="total_amt" value="${total * 1.12}"/>
                                                <i class="fas fa-rupee-sign"></i>
                                                <fmt:formatNumber type="number" maxFractionDigits="2" value="${total_amt}"/>    
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>            
        <div style="float: left; width: 50%;">                                    
            <a href="UpdateSchedule">                                    
                <button type="button" class="btn btn-primary btn-md center-block" style="float: right;">Confirm Booking</button>
            </a>
        </div>
        <div style="float: right; width: 49%;"> 
            <a href="index.jsp">
                <button type="button" class="btn btn-danger btn-md center-block" style="float: left;">Cancel</button>
            </a>              
        <div>    
        <br><br><br><br>  
    </body>
</html>

