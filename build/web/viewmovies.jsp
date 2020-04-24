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
          
              
               $("#movies_table").load("ViewMovies");
               
					
          
         });
         
         $(document).ready(function(){
  $("#txtsearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});



        $(document).ready(function(){
            $('body').on('click','#btn_delete',function(){
               
            $('#modal-msg').modal('show');
            currentRow=$(this).closest("tr");
            pid=currentRow.find("td:eq(0)").text();  
           
                
            });
        });
        
$(document).ready(function(){
    $( "#btn_del" ).click(function() {
        $("#movies_table").load("DeleteMovie?mcode="+pid);
    });
});

        </script>


        
        </script>
    </head>
    <body>
      
       <%
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        if((String)session.getAttribute("A1")==null)
               {
            response.sendRedirect("home.jsp");
            return;
               }
       
        %>



        <div class="container" style="padding-top: 80px">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                     <div class="input-group">
    
          <input type="text" class="form-control" placeholder="Search" id="txtsearch">
          <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                     </div>
                    
                    <table  class='table table-striped'><thead><tr><th>Movie Code</th><th>Name</th><th>Description</th><th>Cast</th><th>Director</th><th>Producer</th><th>Language</th><th>Duration</th><th>Pic</th><th>Delete</th></tr></thead>
                        <tbody id='movies_table'>
                            
                        </tbody>
                    </table>
                    
                   
                       
        </div>
            </div>
        </div>
        
        <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header  bg-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Delete movie</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete the selected movie?</p>
      </div>
      <div class="modal-footer" style="text-align: center">
        <button type="button" id="btn_del" class="btn btn-danger " data-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" >No</button>
      
      </div>
    </div>

  </div>
</div>

       
    </body>
</html>
