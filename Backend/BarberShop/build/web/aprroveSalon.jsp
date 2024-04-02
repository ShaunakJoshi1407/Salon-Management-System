<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%  
    String s = request.getParameter("sal_app");
    session.setAttribute("sal_app", s);
        try{  
%>

    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
    <sql:update dataSource="${db}">update salon set approved = "YES" where sal_email = ?
    <sql:param value="${sessionScope.sal_app}"/>
    </sql:update>
    
    Approved 
<%        
        }catch(Exception e){e.printStackTrace();}    
%>  

 