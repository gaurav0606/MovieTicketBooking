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
                $('body').on('click','.label-danger',function(){

            $(this).removeClass('label label-danger');
            $(this).addClass('label label-success');
            $('#show').val($(this).text());
             $('#timingerr').text('')
            $(this).nextAll().removeClass('label label-success');
            $(this).nextAll().addClass('label label-danger');
            $(this).prevAll().removeClass('label label-success');
            $(this).prevAll().addClass('label label-danger');
          //  alert(($(this).next().next()    ).text())//.css({"color": "red", "border": "2px solid red"});
            //alert(a);
    });
    
     $('body').on('click','.btn-danger',function(e){

           if( $('#show').val()=='')
               {
                $('#timingerr').text('Select a show timing');
               e.preventDefault();
               }
    });
    
    
});




            $(document).ready(function() {
       
           var mcode='<%=request.getParameter("mcode") %>' 
         
               $("#dp").load("SelectMovie?mcode="+mcode);
                
               
					
          
         });
     
      
    
    

     
         $(document).ready(function(){
      $('body').on('change','#date',function(e){
            
           //location.reload();
           var mcode=$('#mcode').val();
           var d=$('#date').val();
           
           // alert($(".container").length);
            $(".container").load("SelectMovie?mcode="+mcode+"&sdate="+d);
             // alert(mcode);
    });
  });

     
    
         
         
       
        </script>
    </head>
    <body>
      


        <div class="container" id="dp" style="padding-top: 80px">
           
           
                
           
        </div>
      
        
       
        
    </body>
</html>
