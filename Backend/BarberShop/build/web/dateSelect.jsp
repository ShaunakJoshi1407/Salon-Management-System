<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page import="java.text.SimpleDateFormat" %>     
<%  
    String s = request.getParameter("date");
    session.setAttribute("date", s);
    if(s==null || s.trim().equals("")){  
        out.print("Please enter the date");  
    }else{  
        try{  
%>
<% 
    String[] times = {"10:00:00","11:00:00","12:00:00","13:00:00","14:00:00","15:00:00","16:00:00","17:00:00"};
    request.setAttribute("times", times);
%>
    
         <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
         <% SimpleDateFormat sd = new SimpleDateFormat("HH:mm:ss");%>

    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
    <sql:query var="check" dataSource="${db}">select * from schedule where appt_date = ? and salon_email = ?
    <sql:param value="${sessionScope.date}"/>
    <sql:param value="${sessionScope.sal_email}"/>
    </sql:query>
    
    <c:if test="${check.rowCount == 0}">
        <c:forEach var="time" items="${times}">
            <sql:query var="seats" dataSource="${db}">select noOfSeats from salon where sal_email = ?
                <sql:param value="${sessionScope.sal_email}"/>
            </sql:query>
                <c:forEach items="${seats.rows}" var="st">
                    <c:set var="noOfseats" value="${st.noOfSeats}"/>
                </c:forEach>
            <sql:update var="ins" dataSource="${db}"> insert into schedule(salon_email,appt_date,appt_time,noOfSeats) values (?,?,?,?)
                <sql:param value="${sessionScope.sal_email}"/>
                <sql:param value="${sessionScope.date}"/>
                <sql:param value="${time}"/>
                <sql:param value="${noOfseats}"/>
            </sql:update>
        </c:forEach>
    </c:if>
    <% String d = sdf.format(new Date());
        session.setAttribute("checkDate", d);
        String t = sd.format(new Date());
        session.setAttribute("time", t);
    %>
    <c:if test="${sessionScope.date == sessionScope.checkDate}">
        <sql:query var="rs" dataSource="${db}">select * from schedule where appt_date = ? and noOfSeats > 0 and salon_email = ? and appt_time > ?
        <sql:param value="${sessionScope.date}"/>
        <sql:param value="${sessionScope.sal_email}"/>
        <sql:param value="${sessionScope.time}"/>
        </sql:query>
            <c:forEach items="${rs.rows}" var="act">
            <tr>
                <td>
                    ${act.appt_time}
                </td>
                <td>
                    <input type="radio" name="time" value="${act.appt_time}" ><br>
                </td>
            </tr>
        </c:forEach>
    </c:if>
   
    <c:if test="${sessionScope.date != sessionScope.checkDate}">
        <sql:query var="rs" dataSource="${db}">select * from schedule where appt_date = ? and noOfSeats > 0 and salon_email = ?
        <sql:param value="${sessionScope.date}"/>
        <sql:param value="${sessionScope.sal_email}"/>
        </sql:query>
            <c:forEach items="${rs.rows}" var="act">
                <tr>
                    <td>
                        ${act.appt_time}
                    </td>
                    <td>
                        <input type="radio" name="time" value="${act.appt_time}" ><br>
                    </td>
                </tr>
            </c:forEach>
        </c:if>        
<%        
        }catch(Exception e){e.printStackTrace();}  
    }  
%>  

 