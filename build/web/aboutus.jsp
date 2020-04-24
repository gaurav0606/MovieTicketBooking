<%-- 
    Document   : aboutus
    Created on : Apr 17, 2016, 10:23:41 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Ticket</title>
        <%@ include file="head.jsp" %>
        <script>
           
         $(document).ready(function(){
       
       $('a[href="aboutus.jsp"]').parent().addClass('active');

});
</script>
    </head>
    <body>
        <body>
        
        
   <div class="row" ">
      <div class="col-md-6 col-md-offset-3" style="margin-top: -40px" >
        <div class="page-header text-danger"><h1>About us</h1></div>
       <div class="well">
         Company description
       </div>
      </div>
    </div>
    </body>
</html>
