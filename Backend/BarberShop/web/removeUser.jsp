<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%  
    String s = request.getParameter("cust_email");
    session.setAttribute("cust_email", s);
        try{  
%>

    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
    <sql:update dataSource="${db}">delete from customer where cust_email = ?
    <sql:param value="${sessionScope.cust_email}"/>
    </sql:update>
    
    Removed Successfully ! 
<%        
        }catch(Exception e){e.printStackTrace();}    
%>  

 