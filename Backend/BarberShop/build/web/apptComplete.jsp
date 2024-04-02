<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%  
    int s = Integer.parseInt(request.getParameter("appt_id"));
    session.setAttribute("appt_id", s);
        try{  
%>

    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
    <sql:update dataSource="${db}">update appointment set completed = "YES" where appointment_id = ? 
    <sql:param value="${sessionScope.appt_id}"/>
    </sql:update>
    
    Completed 
<%        
        }catch(Exception e){e.printStackTrace();%>
            Can't update future appointment
        <%
        }    
%>  

 