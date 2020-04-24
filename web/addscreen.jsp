<%-- 
    Document   : addproduct
    Created on : Feb 22, 2017, 11:57:37 AM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Movie Ticket</title>
        <%@include file="head.jsp" %>
        
    <script>
        
        $(document).ready(function(){
   
        $.get("GetScreenNo",function(data, status){
       
        $("#txtsno").val(data);
    });
        
   
});

        



        $(document).ready(function() {
    $('#frmaddscreen').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtnosofa: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1'
                    }
                 }
            },
            txtnopremium: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1'
                    }
                 }
            },
            txtnoexec: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
		    digits:{},
		    greaterThan: {
                        value: 1,
                        message: 'The value must be greater than or equal to 1'
                    }
                 }
            }
            
           
        }
          
    });
});
        $(document).ready(function() {
            ${msg}
        });
        
        
        
      
    </script>
    </head>
    <body>
        
       

        <div class="container-fluid">
        <div class="row">
            <div class="col-md-offset-4 col-md-4">
       <div class="panel panel-danger">
  <div class="panel-heading" ><i class="fa fa-plus-square"></i>&nbsp Add Screen details</div>
  <div class="panel-body">
      <form id="frmaddscreen" class="form-horizontal" action="AddScreen" method="post" >
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtsno">Screen no:</label>
                 <div class="col-md-6">
                     
                     <input type="text" class="form-control" id="txtsno" name="txtsno" readonly="true"  >
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtnosofa">No. of Sofa Seats:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtnosofa" name="txtnosofa">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtnopremium">No. of Premium Seats:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtnopremium" name="txtnopremium">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtnoexec">No. of Executive Seats:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtnoexec" name="txtnoexec">
                    
                    </div>
                
          </div>
          
          

          <div class="form-group"> 
            <div class="col-md-offset-4 col-md-6">
              <button type="submit" class="btn btn-danger btn-block" ><i class="fa fa-plus-circle"></i> Add</button>
            </div>
          </div>
          
      </form>
  </div>
</div>
            </div>
        </div>
        </div>

<div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-success" >Success</h4>
      </div>
      <div class="modal-body">
        <p>Screen details added successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
    <div id="div1">
        
    </div>
</html>
