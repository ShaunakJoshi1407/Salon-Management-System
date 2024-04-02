<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.Date" %>
 
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
          
            .rating {
              display: inline-block;
              position: relative;
              height: 50px;
              line-height: 50px;
              font-size: 50px;
            }

            .rating label {
              position: absolute;
              top: 0;
              left: 0;
              height: 100%;
              cursor: pointer;
            }

            .rating label:last-child {
              position: static;
            }

            .rating label:nth-child(1) {
              z-index: 5;
            }

            .rating label:nth-child(2) {
              z-index: 4;
            }

            .rating label:nth-child(3) {
              z-index: 3;
            }

            .rating label:nth-child(4) {
              z-index: 2;
            }

            .rating label:nth-child(5) {
              z-index: 1;
            }

            .rating label input {
              position: absolute;
              top: 0;
              left: 0;
              opacity: 0;
            }

            .rating label .icon {
              float: left;
              color: transparent;
            }

            .rating label:last-child .icon {
              color: #000;
            }

            .rating:not(:hover) label input:checked ~ .icon,
            .rating:hover label:hover input ~ .icon {
              color: #ffcc00;
            }

            .rating label input:focus:not(:checked) ~ .icon:last-child {
              color: #000;
              text-shadow: 0 0 5px #09f;
            }          
        </style>  
    </head>  
    <body>
        <br><br><br><br>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");%>
         <% SimpleDateFormat sd = new SimpleDateFormat("HH:mm:ss");%>
         
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <h1 class="text-center">Today's Appointments</h1><br>
        <sql:query dataSource="${db}" var="info">
            select * from appointment where cust_email = ? and status = "Confirm" and appt_date = ? and appt_time >= ? and completed = "NO"
            <sql:param value="${sessionScope.username}"/>
            <sql:param value="<%= sdf.format(new Date()) %>"/>
            <sql:param value="<%= sd.format(new Date()) %>"/>
        </sql:query>
            
            <c:if test="${info.rowCount != 0}">    
                <table class="table table-condensed table-hover">
                    <thead>
                        <th class="text-center">
                            Appointment ID
                        </th>
                        <th class="text-center">
                            Salon Name
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
                            <td class="text-center">${inf.sal_email}</td>
                            <td class="text-center">${inf.appt_date}</td>
                            <td class="text-center">${inf.appt_time}</td>
                            <td class="text-center"><i class="fas fa-rupee-sign"></i>&nbsp;${inf.total_cost}</td>
                        </tr>
                    </c:forEach>    
                </table>
            </c:if>    
            
            <c:if test="${info.rowCount == 0}">
                <h2 class="text-center round2">No Appointments for today !!!</h2>
            </c:if><br><br>
        
        <h1 class="text-center">Future Appointments</h1><br>   
        <sql:query dataSource="${db}" var="info">
            select * from appointment where cust_email = ? and status = "Confirm" and appt_date > ?
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
                            Salon Name
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
                            Cancel
                        </th>
                    </thead>
                    <c:forEach items="${info.rows}" var="inf">
                        <tr>
                            <td class="text-center">${inf.appointment_id}</td>
                            <td class="text-center">${inf.sal_email}</td>
                            <td class="text-center">${inf.appt_date}</td>
                            <td class="text-center">${inf.appt_time}</td>
                            <td class="text-center"><i class="fas fa-rupee-sign"></i>&nbsp;${inf.total_cost}</td>
                            <td class="center-block">
                                <button class="btn btn-danger center-block cancel" id="${inf.appointment_id}" value="${inf.appointment_id}">Cancel</button>
                            </td>
                        </tr>
                    </c:forEach>    
                </table>
            </c:if>    
            
            <c:if test="${info.rowCount == 0}">
                <h2 class="text-center round2">No Appointments Yet !!!</h2>
            </c:if><br><br>
                
                <h1 class="text-center">Past Appointments</h1><br> 
            <sql:query dataSource="${db}" var="info">
            select * from appointment where cust_email = ? and completed = "YES" and appt_date <= ? 
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
                            Salon Name
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
                            Rate Salon
                        </th>
                    </thead>
                    <c:forEach items="${info.rows}" var="inf">
                        <tr>
                            <td class="text-center">${inf.appointment_id}</td>
                            <td class="text-center">${inf.sal_email}</td>
                            <td class="text-center">${inf.appt_date}</td>
                            <td class="text-center">${inf.appt_time}</td>
                            <td class="text-center"><i class="fas fa-rupee-sign"></i>&nbsp;${inf.total_cost}</td>
                            <td class="center-block">
                                <a href="rateSalon.jsp?pid=${inf.sal_email}" class="btn btn-primary center-block">Rate Salon</a>
                            </td>
                        </tr>
                    </c:forEach>    
                </table>
            </c:if>    
            
            <c:if test="${info.rowCount == 0}">
                <h2 class="text-center round2">No Appointments Yet !!!</h2>
            </c:if><br><br><br>
        </body>
        
        <script type="text/javascript">
            $(document).on('click', '.cancel',function(e){
                var local = '#' + e.target.id;
                var res = confirm('Are you sure?');
                    if(res){
                        $.ajax({
                        data: {appt_id: $(this).val()}, 
                        url: 'apptCancel.jsp',
                        type: 'post',

                        success: function (responseData) {
                            $(local).html(responseData);
                        }
                    });
                }
            });
        </script> 
        
    
</html>  
