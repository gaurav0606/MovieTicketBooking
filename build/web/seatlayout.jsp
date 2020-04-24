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
            var count=1;
            $(document).ready(function() {
          var sno='<%=Integer.parseInt(session.getAttribute("sno").toString())%>'
             alert(sno)
             $("#dd").load("SeatLayout?sno="+sno);
               
					
          
         });
         
        $(document).ready(function(){
            $('body').on('click','.label1',function(e){
                
                var t='<%=Integer.parseInt(session.getAttribute("tickets").toString())%>'
               // alert(t);
              var c= $(this).text()
          
          var c1=$('#'+c).is(":checked");
          var c2=$('#'+c).attr("disabled")
         
          if(c1==false && c2!='disabled')
          {
              if(count<=t)
              {
                $(this).css('background-color','green');
                
                count++
               
               
              }
              else
              {
                  
                
                    alert('Count of ticket exceeds')  
                   
                    e.preventDefault();
                   
              }
          }
       else if($(this).css("background-color") == "rgb(0, 128, 0)")
           {
           $(this).css('background-color','#F42536');
           count--;
          
           }  
           if((count-1)==t)
               {
                $('#b1').attr("disabled",false);
               }
               else
                   {
                        $('#b1').attr("disabled",true);
                   }
          
            });
        });
        
        $(document).ready(function(){
            $('body').on('click','b1',function(){
             
        
           //$(this).css('background-color','green');
                
            });
        });

        

    
        </script>
    </head>
    <body>
     

        <div class="container" style="padding-top: 50px">
            <div class="row">
                <div class="col-md-offset-2 col-md-7" style="padding-bottom:30px">
                    <label style='width:40px;border-radius: 2px;background:gray;color:gray;font-size: 18px;margin-left:100px;font-weight: bold;'>AA</label> Reserved Seats
                    <label style='width:40px;border-radius: 2px;background:red;color:red;font-size: 18px;margin-left:100px;font-weight: bold;'>AA</label> Available Seats
                </div>
                <div class="col-md-offset-2 col-md-7">
                    
                   <div id="dd" style="padding-left: 100px">
                       
                    </div>
                </div>
            </div>
        </div>
       
    </body>
</html>
