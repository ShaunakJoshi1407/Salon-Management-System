<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page import="java.util.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
         
         <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/barbershop?autoReconnect=true&useSSL=false" user="root" password=""/>
        <sql:query var="rs" dataSource="${db}">Select * from customer where cust_email != "admin@gmail.com"</sql:query>
         
        <div class="container text-center">    
            <h2>Manage Users</h2> <br>
            
            
            <table class="table table-condensed table-hover">
                    <thead>
                        <th class="text-center">
                            Name
                        </th>
                        <th class="text-center">
                            Email
                        </th>
                        <th class="text-center">
                            City
                        </th>    
                        <th class="text-center">
                            Action
                        </th>
                    </thead>
                    <c:forEach items="${rs.rows}" var="inf">
                        <tr>
                            <td class="text-center">${inf.fname}&nbsp;${inf.lname}</td>
                            <td class="text-center">${inf.cust_email}</td>
                            <td class="text-center">${inf.city}</td>
                            <td class="text-center">
                                <button class="btn btn-danger approveSalon" value="${inf.cust_email}">
                                    Remove
                                </button>
                            </td>
                        </tr>
                    </c:forEach>    
                </table>
            
            <h3 style="color: red; text-align: center;" id="remove"></h3>
          </div>
          <br>   
            
          <script src="jquery.min.js"></script>
          <script>
            $('table').on('click', '.btn',function(){
                var res = confirm('All data of user will be removed permanently.\nDo you want to remove user?');
                if(res){
                    $.ajax({
                        data: {cust_email: $(this).val()}, 
                        url: 'removeUser.jsp',
                        type: 'post',

                        success: function (responseData) {
                            $('#remove').html(responseData);
                        }
                    });

                    $(this).closest('tr').remove();
                }
                
            });
        </script>    
    </body>  
    </html>  