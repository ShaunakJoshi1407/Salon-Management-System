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

        <fmt:formatDate type = "date" var="date" pattern = "yyyy-MM-dd" value = "${now}" />

        <h1 class="text-center">Today's Appointments</h1><br><br>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        
        <sql:query dataSource="${db}" var="info">
            select * from appointment where sal_email = ? and status = "Confirm" and appt_date = ? and completed = "NO" order by appt_time
            <sql:param value="${sessionScope.username}"/>
            <sql:param value="<%= sdf.format(new Date()) %>"/>
        </sql:query>
        
            <c:if test="${info.rowCount != 0}">    
                <table class="table table-condensed table-hover">
                    <thead>
                        <th class="text-center">
                            Appointment ID
                        </th>
                        <th class="text-center">
                            Customer Email
                        </th>
                        <th class="text-center">
                            Appointment Date
                        </th>    
                        <th class="text-center">
                            Appointment Time
                        </th>
                        <th class="text-center">
                            Total Amount
                        </th>
                        <th class="text-center">
                            Completed
                        </th>  
                    </thead>
                    <c:forEach items="${info.rows}" var="inf">
                        <tr>
                            <td class="text-center">${inf.appointment_id}</td>
                            <td class="text-center">${inf.cust_email}</td>
                            <td class="text-center">${inf.appt_date}</td>
                            <td class="text-center">${inf.appt_time}</td>
                            <td class="text-center"><i class="fas fa-rupee-sign"></i>&nbsp;${inf.total_cost}</td>
                            <td class="center-block">
                                <button class="btn btn-success center-block complete" id="${inf.appointment_id}" value="${inf.appointment_id}">Yes</button>
                            </td>
                        </tr>
                    </c:forEach>    
                </table>
            </c:if>    
            <c:if test="${info.rowCount == 0}">
                <h2 class="text-center round2">No Appointments for Today !!!</h2>
            </c:if>
            <br><br>
        <h1 class="text-center">Future Appointments</h1> 
        
        <sql:query dataSource="${db}" var="info">
            select * from appointment where sal_email = ? and status = "Confirm" and appt_date > ? order by appt_date,appt_time
            <sql:param value="${sessionScope.username}"/>
            <sql:param value="<%= sdf.format(new Date()) %>"/>
        </sql:query>
            
            <c:if test="${info.rowCount != 0}">    
                <br><br>
                <table class="table table-condensed table-hover">
                    <thead>
                        <th class="text-center">
                            Appointment ID
                        </th>
                        <th class="text-center">
                            Customer Email
                        </th>
                        <th class="text-center">
                            Appointment Date
                        </th>    
                        <th class="text-center">
                            Appointment Time
                        </th>
                        <th class="text-center">
                            Total Amount
                        </th>
                    </thead>
                    <c:forEach items="${info.rows}" var="inf">
                        <tr>
                            <td class="text-center">${inf.appointment_id}</td>
                            <td class="text-center">${inf.cust_email}</td>
                            <td class="text-center">${inf.appt_date}</td>
                            <td class="text-center">${inf.appt_time}</td>
                            <td class="text-center"><i class="fas fa-rupee-sign"></i>&nbsp;${inf.total_cost}</td>
                        </tr>
                    </c:forEach>    
                </table>
            </c:if>    
            
            <c:if test="${info.rowCount == 0}">
                <h2 class="text-center round2">No Appointments Yet !!!</h2>
            </c:if>
            <br><br>   
            <h1 class="text-center">Past Appointments</h1>
            <sql:query dataSource="${db}" var="info">
            select * from appointment where sal_email = ? and status = "Confirm" and appt_date <= ? and completed = "YES" order by appt_time 
            <sql:param value="${sessionScope.username}"/>
            <sql:param value="<%= sdf.format(new Date()) %>"/>
            </sql:query>
        
            <c:if test="${info.rowCount != 0}">    
                <table class="table table-condensed table-hover">
                    <thead>
                        <th class="text-center">
                            Appointment ID
                        </th>
                        <th class="text-center">
                            Customer Email
                        </th>
                        <th class="text-center">
                            Appointment Date
                        </th>    
                        <th class="text-center">
                            Appointment Time
                        </th>
                        <th class="text-center">
                            Total Amount
                        </th>  
                    </thead>
                    <c:forEach items="${info.rows}" var="inf">
                        <tr>
                            <td class="text-center">${inf.appointment_id}</td>
                            <td class="text-center">${inf.cust_email}</td>
                            <td class="text-center">${inf.appt_date}</td>
                            <td class="text-center">${inf.appt_time}</td>
                            <td class="text-center"><i class="fas fa-rupee-sign"></i>&nbsp;${inf.total_cost}</td>
                        </tr>
                    </c:forEach>    
                </table>
            </c:if>    
            <c:if test="${info.rowCount == 0}">
                <h2 class="text-center round2">No Appointments Completed Yet !!!</h2>
            </c:if>    
        </body>  
        
        <script type="text/javascript">
            $(document).on('click', '.complete',function(e){
                var local = '#' + e.target.id;
                var res = confirm('Are you sure?');
                if(res){
                    $.ajax({
                    data: {appt_id: $(this).val()}, 
                    url: 'apptComplete.jsp',
                    type: 'post',

                    success: function (responseData) {
                        $(local).html(responseData);
                    }
                });
                }
            });
        </script> 
    </html>  