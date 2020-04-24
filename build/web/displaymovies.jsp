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
        <script>
            
          
            $(document).ready(function() {
             
               
            
                   
                 $("#dp").load("DisplayMovies");
            
               
					
          
         });
         
          
                    
                    
                     
               


      
        </script>
    </head>
    <body>
        <%
       
       
         session.setAttribute("guest", "guest");
               
       
        %>
        
        

        <div class="container" style="padding-top: 80px;" >
            <div class="row">
                
                
               
                <div class="col-md-offset-1" id="dp" >         
                        
              
            </div>
        </div>
        </div>
        
        
    </body>
</html>
