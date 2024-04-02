<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page import="java.util.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>  
    <head>  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.google.com/?selection.family=Noto+Sans|Pangolin&category=Handwriting" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css" rel="stylesheet">
        <style>
            .sal_name{
                color: black;
            }
            
            a:hover{
                text-decoration: none;
                text-shadow: 4px 4px 4px #aaa;
            }
            
            .imagedropshadow {
                padding: 5px;
                border: solid 1px #EFEFEF;
            }
            
            a:hover img.imagedropshadow {
                border: solid 1px #CCC;
                -moz-box-shadow: 1px 1px 5px #999;
                -webkit-box-shadow: 1px 1px 5px #999;
                    box-shadow: 1px 1px 5px #999;
            }
            
            body {
                background-image: url("images/bg.jpg");
                background-size: cover;
            }
            
            #navbar1{
                    list-style-type: none;
                    overflow: hidden;
                    position: -webkit-sticky;
                    position: sticky;
                    top: 0;
            }
            
            .dropdown:hover .dropdown-menu {
                display: block;
                margin-top: 0;
            }
            
            .dropdown-menu li a:hover {
                    background-color: black !important;
                    color: white;
            }
             
            a:hover{
                text-decoration: none;
                text-shadow: 4px 4px 4px #aaa;
            }  
        </style>
    </head>  
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="admin.jsp" style="color: red;">
                    <b>Barberly</b></a>
            </div>
            <ul class="nav navbar-nav">
              <li class="active">
                  <a href="manageSalons.jsp">
                      <span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; Manage Salons  
                  </a>
              </li>
              <li class="active">
                  <a href="manageUsers.jsp">
                      <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; Manage Users
                  </a>
              </li>
              <li class="active">
                  <a href="adminReport.jsp">
                      <span class="glyphicon glyphicon-th" aria-hidden="true"></span>&nbsp; Report
                  </a>
              </li>
            </ul>
              <ul class="nav navbar-nav navbar-right">  
                <li class="active"><a href="#">
                         <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp; <%= session.getAttribute("username") %>
                    </a>
                </li>
                <li class="active">
                    <a href="Logout">
                         <span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp; Logout
                    </a>
                </li>
            </ul>
          </div>
        </nav>
        <br><br><br><br>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
        <div class="container text-center">    
            <h1 class="text-center">Report</h1><br><br>
            <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
            <div style="margin-left: 20%; margin-right: 20%;">
            <sql:query dataSource="${db}" var="info">
                select * from appointment where completed = "YES"
            </sql:query>

            <c:if test="${info.rowCount != 0}">    
                <h3>Total Appointments&nbsp;:&nbsp;${info.rowCount}</h3>    
            </c:if>    
            <br>    
            <% int total_amount = 0; %>
            <c:forEach items="${info.rows}" var="rs">
                <c:set var="cost" value="${rs.total_cost}"/>    
                <% total_amount += Integer.parseInt(pageContext.getAttribute("cost").toString()); %>    
            </c:forEach>

            <h3>Total Earnings&nbsp;:&nbsp;<i class="fas fa-rupee-sign"></i>&nbsp;<%= total_amount %></h3>

            <c:if test="${info.rowCount == 0}">
                 <h2 class="text-center round2">No Appointments Yet !!!</h2>
            </c:if> 
            <br>     
            <sql:query dataSource="${db}" var="info">
                select sal_name,max(rating / noOfRatings) as c from salon where sal_name = (select sal_name having max(rating / noOfRatings))
            </sql:query>

            <c:forEach items="${info.rows}" var="rs">    
                <c:set var="name" value="${rs.sal_name}"/>
                <c:set var="rating" value="${rs.c}"/>
            </c:forEach>

                <h3>Popular Salon&nbsp;:&nbsp;${name} </h3>   
                <h3>Rating&nbsp;:&nbsp;<fmt:formatNumber type="number" maxFractionDigits="1" value="${rating}"/> </h3> 
            </div>     
        </div>
    </body>  
    </html>  