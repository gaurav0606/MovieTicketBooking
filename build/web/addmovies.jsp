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
   
        $.get("GetMovieid",function(data, status){
       
        $("#txtmcode").val(data);
    });
        
   
});

        

function call()
        {
            if(parseInt($("#txtpic").get(0).files.length)==0)
            {
                
                return false;
            }
            else
                {
                    return true;
                }
        }



        $(document).ready(function() {
    $('#frmaddproduct').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtmname: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            
            txtdesc: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            txtcast: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            txtdirector: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
            txtproducer: {
                validators: {
                    notEmpty:{
                         message: 'Value is required'
                    }
                }
            },
	   
	     txtduration: {
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
            
            txtpic: {
                validators: {
                    callback: {
                  
                        callback: function(value, validator, $field) {
                                                
                            
                                return {
                                    valid: call(),
                                    message:'Please select atleast 1 file'
                                }
                            
                           
                   
                    
                    
                }
            }
                 }

            
           
            
        }
        }
          
    });
});
        $(document).ready(function() {
            ${msg}
        });
        
        
        $(document).ready(function(){
            $("#txtpic").change(function(event){
                  
               
                    var tmppath1 = URL.createObjectURL($(this).get(0).files[0]);
                   // var tmppath2 = URL.createObjectURL($(this).get(0).files[1]);
                    //var tmppath3 = URL.createObjectURL($(this).get(0).files[2]);
                    
                    $("#img1").fadeIn("fast").attr('src',tmppath1 )
                    //$("#img2").fadeIn("fast").attr('src',tmppath2 )
                    //$("#img3").fadeIn("fast").attr('src',tmppath3 )
               
                  //alert($(this).val());
            });
        });
      
    </script>
    </head>
    <body>
        
       

        <div class="container-fluid">
        <div class="row">
            <div class="col-md-offset-4 col-md-4">
       <div class="panel panel-danger">
  <div class="panel-heading" ><i class="fa fa-plus-square"></i>&nbsp Add Movie details</div>
  <div class="panel-body">
      <form id="frmaddproduct" class="form-horizontal" action="AddMovie" method="post" enctype="multipart/form-data">
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtmcode">Movie Code:</label>
                 <div class="col-md-6">
                     
                     <input type="text" class="form-control" id="txtmcode" name="txtmcode" readonly="true"  >
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtmname">Movie Name:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtmname" name="txtmname">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtdesc">Movie Description:</label>
                 <div class="col-md-6">
                   <textarea class="form-control" rows="3" id="txtdesc" name="txtdesc" style="resize:none "></textarea>
                 </div>
          </div>
          <div class="form-group">
                <label class="control-label col-md-4" for="txtcast">Cast:</label>
                 <div class="col-md-6">
                   <textarea class="form-control" rows="3" id="txtcast" name="txtcast" style="resize:none"></textarea>
                 </div>
          </div>
          <div class="form-group">
                <label class="control-label col-md-4" for="txtdirector">Director:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtdirector" name="txtdirector">
                    
                    </div>
                
          </div>
          <div class="form-group">
                <label class="control-label col-md-4" for="txtproducer">Producer:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtproducer" name="txtproducer">
                    
                    </div>
                
          </div>
          
                   
          <div class="form-group">
                <label class="control-label col-md-4" for="language">Language:</label>
                 <div class="col-md-4">
                     <select class="form-control" id="type" name="language">
                         <option value="hindi">Hindi</option>
                         <option value="english">English</option>
                         
                        
                     </select>
                 </div>
          </div>
          
                
          <div class="form-group">
                <label class="control-label col-md-4" for="txtduration">Duration:</label>
                 <div class="col-md-6">
                     <div class="input-group">
                        
                        <input type="text" class="form-control" id="txtduration" name="txtduration">
                         <span class="input-group-addon">mins</span>
                    
                    </div>
                 </div>
          </div>
          <div class="form-group">
                <label class="control-label col-md-4" for="txtpic">Select pic:</label>
                 <div class="col-md-6">
                       <label class="btn btn-default" style="width:100%;height:35px">
                           Browse <input type="file" style="opacity:0;"  id="txtpic" name="txtpic"></input>
                        </label>
                     <img id="img1" class="zoom" style="width:75px;height: 75px;display:none">
                    
                       
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
        <p>Movie details added successfully.</p>
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
