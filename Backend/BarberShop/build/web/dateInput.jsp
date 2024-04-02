<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="newjsp.jsp" %>    
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>   
<%! final static String DATE_FORMAT_NOW = "dd/MM/yy"; %>
<html>  
    <head>  
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://fonts.google.com/?selection.family=Noto+Sans|Pangolin&category=Handwriting" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="{% static 'music/style.css' %}">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css" rel="stylesheet">
        <style>
/*            table.table-bordered{
                border:1px solid black;
                margin-top:20px;
              }
            table.table-bordered > thead > tr > th{
                border:1px solid black;
            }
            table.table-bordered > tbody > tr > td{
                border:1px solid black;
            }*/

            div .dateIn { display: inline-block; }    
        </style>
        <script>
            function getDate(){
                var date = document.forms["vinform"]["date"].value;
                var Date = document.getElementsByName("date").value;
                document.getElementById('getDateForm').action = 'selectServices.jsp?date=' + date;
            }
            
            
            $(document).ready(function () {
                var todaysDate = new Date(); // Gets today's date
                
                $("#inspectDate").datepicker({
                    showAnim: 'drop',
                    numberOfMonth: 1,
                    dateFormat: 'yy-mm-dd',
                    minDate: todaysDate,
                    maxDate: "+7D"
                });
            });
        </script>
    </head>  
    <body>
        <br><br><br><br>
        <% if(session.getAttribute("username")==null){
            response.sendRedirect("login.jsp");
         } %>
         
         <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");%>
         <% SimpleDateFormat sd = new SimpleDateFormat("HH:mm:ss");%>
         
        <div class="container text-center">    
            <h1>Select Date</h1> <br>
        </div>
        <% String pid = request.getParameter("pid"); %>
        <% session.setAttribute("sal_email",pid); %>
        <%  %>
        <div style="width:300px; margin-left: 500px; float: left;" class="dateIn">
            <form name="vinform" id="dateSelect">  
                <span style="font-size: 20px;">Enter date:&nbsp;&nbsp;</span><input type="text" name="date" id="inspectDate" readonly="true" placeholder="Select Date"> <br>
            </form>
        </div>
            <button id="displayTime" class="btn btn-danger">Select</button>
        <br><br><br>
        
        <form id="getDateForm" method="post" onsubmit="getDate();">
        <table class="table table-condensed table-hover table-bordered text-center table-inverse">

            <thead>
            <th class="text-center">Time</th>
            <th class="text-center">Select</th>
            </thead>

                <tbody id="response">
                </tbody>
        </table>   
            <input type="submit" class="btn btn-success center-block" name="Next" value="Next">
        </form>   
        <%
            Calendar now = Calendar.getInstance();
            int dayOfMonth = now.get(Calendar.DAY_OF_MONTH);
            int month = now.get(Calendar.MONTH) + 1;
            String dayOfMonthStr = ((dayOfMonth < 10) ? "0" : "") + month;
            String monthStr = ((month < 10) ? "0" : "") + month;
            
        %>
        
        <% if(request.getHeader("failure_message") != null){ %>
        <h3> <%= request.getHeader("failure_message") %> </h3>
        <%}%>
    <script type="text/javascript">
        $('#displayTime').click(function(){
            $.ajax({
                data: $("#dateSelect").serialize(), 
                url: 'dateSelect.jsp',
                type: 'post',
                
                success: function (responseData) {
                    $('#response').html(responseData);
                }
            });
        });
    </script>
    </body>  
    </html>  