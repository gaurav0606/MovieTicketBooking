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
            
         $(document).ready(function(){
             
             //$(".panel-danger").css('background-color','blue');
             $(".panel-danger").css('background-image','url(images/l2.png)');
             $(".panel-danger").css('background-repeat','no-repeat');
             $(".panel-danger").css('background-size','560px 200px');
         
        
   });
        </script>
    </head>
    <body>
      


        <div class="container" id="dp" >
           <div style="font-size: 20px;padding-bottom: 20px;" class=" col-md-6 col-md-offset-3 text-primary">Thank you for booking with us. An email regarding the same has been sent to your emailid.<br/> <br/> Ticket for your show. Show the same at the counter.</div>
        <br/><br/>
           ${msg}
                
          
        </div>
       
        
      
        
    </body>
</html>
