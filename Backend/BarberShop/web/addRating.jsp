<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%  
    int s = Integer.parseInt(request.getParameter("rating"));
    session.setAttribute("rate", s);
        try{  
%>

    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
    <sql:query dataSource="${db}" var="rs">select * from salon where sal_email = ?
    <sql:param value="${sessionScope.sal_rate}"/>
    </sql:query>
    
    <c:forEach items="${rs.rows}" var="s">
        <c:set var="rating" value="${s.rating}"/>
        <c:set var="people" value="${s.noOfRatings}"/>
    </c:forEach>
    
    <sql:update dataSource="${db}">
        UPDATE salon SET rating = ? , noOfRatings = ? WHERE sal_email = ?
        <sql:param value="${(rating + sessionScope.rate)}"/>
        <sql:param value="${people+1}"/>
        <sql:param value="${sessionScope.sal_rate}"/>
    </sql:update>
    
    Successfully Rated for this salon!!! 
<%        
        }catch(Exception e){e.printStackTrace();}    
%>  

 