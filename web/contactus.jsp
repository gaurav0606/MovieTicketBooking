<%-- 
    Document   : contactus
    Created on : Mar 19, 2016, 7:49:49 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>movie ticket</title>
         <%@include file="head.jsp" %>
           <script>
              $(document).ready(function(){
   
             $('a[href="contactus.jsp"]').parent().addClass('active');
        
});
         </script>
    </head>
    <body >
        
        
    <div class="row" >
        <div class="col-md-4 col-md-offset-3" style="margin-top: -40px">
        <div class="page-header text-danger"><h1>Customer support</h1></div>
       <div class="well">
           <i class="fa fa-envelope"></i> <b>Email</b><br/><br/>
           Please feel free to write to us on <a href="">abc@gmail.com</a>
       </div>
        
        <div class="well">
           <i class="fa fa-phone"></i> <b>Phone</b><br/><br/>
           Talk to us on our 24hrs help line <b> 1800-1234-123 </b><br/>
           For complains call <b> 1800-1234-122 </b><br/>
       </div>
        
        <div class="well">
           <i class="fa fa-home"></i> <b>Post</b><br/><br/>
           A wing, Raj Enclave, Ambadi road,<br/>
           Vasai (west), Thane -401100
       </div>
        </div>
        <div class="col-md-4" style="padding-top:80px;">
        <div class="card" style="height:200px">
  <img src="images/avatar1.png" alt="Avatar" style="width:80%;height:300px">
  <div  style="background-color:white">
    <h4><b>John Doe</b></h4> 
    <p>Architect & Engineer</p> 
  </div>
</div>
        </div>
        
    </div>
    </body>
</html>
