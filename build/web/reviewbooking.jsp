<%-- 
    Document   : displaytrucks
    Created on : Mar 11, 2017, 6:15:17 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="head.jsp" %>
        <style>
            
        </style>
        <script>
            
        
        </script>
    </head>
    <body>
      


        <div class="container" id="dp" >
           <div style="font-size: 20px" class="text-primary">Review Booking Details.</div>
        <br/>
           ${msg}
                
          
        </div>
       <a class="btn btn-danger" href="selectmovie.jsp?mcode=${mcode}"><i class="fa fa-angle-double-left"></i> Replan</a>
        
      
        
    </body>
</html>
