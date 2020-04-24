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
   $("#datetimepicker1").on("dp.hide",function (e) {
       
        var startdate=$("#txtstartdate").val();
        
        var sno=$("#txtsno").val();
        var mcode=$("#txtmcode").val();
      
            $.get("CheckMovieDate?start="+startdate+"&sno="+sno+"&mcode="+mcode,function(data, status){
              
               if(data.trim()=="error")
               {
                  
                   $('#dtt1').removeClass("form-group has-success has-feedback").addClass("form-group has-error has-feedback");
                   $('#stt1').removeClass("glyphicon glyphicon-ok form-control-feedback").addClass("glyphicon glyphicon-remove form-control-feedback");
                   $("#err1").text("This movie is already assigned to this screen on selected date");
               }
               
               else if(data.trim()=="success")
               {
                   $("#err1").text(""); 
                   $('#dtt1').removeClass("form-group has-error has-feedback").addClass("form-group has-success has-feedback");
                   $('#stt1').removeClass("glyphicon glyphicon-remove form-control-feedback").addClass("glyphicon glyphicon-ok   form-control-feedback");
               }
               else if(data.trim()=="assigned")
               {
                    //$('#assigned').val("assigned");
                    $('#modal-msg1').modal('show');
               }
               
            
        
   
       
        
    });
    
   
       
        
    });
});

$(document).ready(function(){
    $( "#btn_del" ).click(function() {
       $('#dtt1').removeClass("form-group has-success has-feedback").addClass("form-group has-error has-feedback");
       $('#stt1').removeClass("glyphicon glyphicon-ok form-control-feedback").addClass("glyphicon glyphicon-remove form-control-feedback");
       $("#err1").text("Another movie is already assigned to this screen on selected date");
    });
    
    $( "#btn_del1" ).click(function() {
        $("#assigned").val("assigned"); 
       $("#err1").text(""); 
       $('#dtt1').removeClass("form-group has-error has-feedback").addClass("form-group has-success has-feedback");
       $('#stt1').removeClass("glyphicon glyphicon-remove form-control-feedback").addClass("glyphicon glyphicon-ok   form-control-feedback");
    });
});



 $(document).ready(function(){
 $('#hslots').val("");
 $('#assigned').val("");
 });

        $(document).ready(function(){
    $("#txtmcode").keyup(function(){
       
        var l=$("#txtmcode").val().length;
        var mcode=$("#txtmcode").val()
        if( l == 10)
        {
            $.get("GetMovie?mcode="+mcode,function(data, status){
               if(data!="")
               {
                    var res = data.split("-");
                    $("#txtmname").val(res[0]);
                    $("#txtduration").val(res[6]);
                   
                    $("#msg").text("");
               }
               else
               {
                       $("#msg").text("Invalid movie id.");
                       $("#txtmname").val("");
                    $("#txtduration").val("");
               }
            
        
    });
        }
        else
            {
                 $("#txtmname").val("");
                    $("#txtduration").val("");
            }
        
    });
});
 $(document).ready(function(){
    $("#txtmcode").focusout(function(){
       
        var l=$("#txtmcode").val().length;
        var mcode=$("#txtmcode").val()
        if( l == 10)
        {
            $.get("GetMovie?mcode="+mcode,function(data, status){
               if(data!="")
               {
                    var res = data.split("-");
                    $("#txtmname").val(res[0]);
                    $("#txtduration").val(res[6]);
                   
                    $("#msg").text("");
               }
               else
               {
                       $("#msg").text("Invalid movie id.");
                       $("#txtmname").val("");
                    $("#txtduration").val("");
               }
            
        
    });
        }
        else
            {
                 $("#txtmname").val("");
                    $("#txtduration").val("");
            }
        
    });
});

            //used to display date time picker
            $(function () {
             
                $('#datetimepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    minDate : new Date()
                }).on('dp.change', function(e) {
            $('#frmassignmovie').formValidation('revalidateField', 'txtstartdate');
           
        });
         });
            
            
            
            
            $(function () {
             
                $('#datetimepicker3').datetimepicker({
                    format: 'HH:mm',
                      //format: 'LT',
                      showClose:true
                     
                   
                });
            });


        $(document).ready(function(){
   
        $.get("GetScreen",function(data, status){
       
        var res = data.split("-");
        
        
        for (var i in res) 
        {
                if(res[i].trim()!='')
                {
                    var option = new Option(res[i].trim(), res[i].trim())
                    $("#txtsno").append(option);
                }
            
           
        }
        
    });
        
   
});


 $(document).ready(function() {
$("#datetimepicker3").on("dp.hide",function (e) {
    if (!$.trim( $("#slots").html() ) == true  )
    {
        $('#hslots').val("");
       
    }
    
    if($('#time').val()!='')
    {
        var current=$('#time').val().split(":");
        var currentmin=(60*current[0]) + (1*current[1]);
        
        var t= $('#hslots').val().split(",");
        var t1=t[t.length-1].split(":");
        var t1min=(60*t1[0]) + (1*t1[1]);
       
        if(((currentmin-t1min)>$('#txtduration').val()) || $('#hslots').val()=='')
        {
            $('#slots').append("<div style=';width:120px;font-size:14px;height:50px;display:inline-block' class='alert alert-success alert-dismissible'><a  href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+$('#time').val()+"</div>\t");
        
             var v="",s=""; 
               $('.alert-success').each(function () {
                   v=$(this).text();

                  s=s+v.substring(1,v.length)+",";


                });

               s=s.substring(0,s.length-1)
                $('#hslots').val(s);
                 $('#frmassignmovie').formValidation('revalidateField', 'hslots');
        }
        else
        {
                $('#err').text("Invalid time value")
        }
    
    }
    
});

$("#datetimepicker3").on("dp.show",function (e) {
 $('#err').text("")
});

});

     
       



        $(document).ready(function() {
    $('#frmassignmovie').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
            
            txtmcode: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    }
		    
                 }
            },
            txtmname: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    }
                 }
            },
            txtcostsofa: {
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
            txtcostpremium: {
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
            txtcostexec: {
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
            txtstartdate: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
                    date: {
                            format: 'DD/MM/YYYY',
                           
                            message: 'Invalid Date format'
                        }
		    
                 }
            }, 
            
             hslots: {
                 excluded: false,    
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    }
		    
                 }

            
           
            
        }
        }
          
    }).on('success.form.fv', function(e) {
         
            if (!$.trim( $("#slots").html() ) == true  )
                {
                    
                    $('#hslots').val("");
                     $('#frmassignmovie').formValidation('revalidateField', 'hslots');
                     $('#frmassignmovie').preventDefault();
                }
                else if($("#err1").text()!='')
                    {
                        $('#frmassignmovie').preventDefault();
                    }
                  
                else
                    {
                        $('#frmassignmovie').bootstrapValidator('defaultSubmit');

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
            <div class="col-md-offset-3 col-md-6">
       <div class="panel panel-danger">
  <div class="panel-heading" ><i class="fa fa-plus-square"></i>&nbsp Add Screen details</div>
  <div class="panel-body">
      <form id="frmassignmovie" class="form-horizontal" action="AssignMovie" method="get" >
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtsno">Screen no:</label>
                 <div class="col-md-6">
                     
                     <select class="form-control" id="txtsno" name="txtsno">
                         
                        
                     </select>

                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtmcode">Movie Code:</label>
                 <div class="col-md-6">
                     
                     <input type="text" class="form-control" id="txtmcode" name="txtmcode"  >
                    <p id="msg" style="color:#a94442"></p>
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtmname">Movie Name:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtmname" name="txtmname" readonly="true" >
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtduration">Duration:</label>
                 <div class="col-md-6">
                     <div class="input-group">
                        
                        <input type="text" class="form-control" id="txtduration" name="txtduration" readonly="true" >
                         <span class="input-group-addon">mins</span>
                    
                    </div>
                 </div>
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtcostsofa">Cost of Sofa Seats:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtcostsofa" name="txtcostsofa">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtcostpremium">Cost of Premium Seats:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtcostpremium" name="txtcostpremium">
                    
                    </div>
                
          </div>
          
          <div class="form-group">
                <label class="control-label col-md-4" for="txtcostexec">Cost of Executive Seats:</label>
                 <div class="col-md-6">
                     
                        <input type="text" class="form-control" id="txtcostexec" name="txtcostexec">
                    
                    </div>
                
          </div>
          <div class="form-group" id="dtt1">  
                          <label class="control-label col-md-4" for="date">Start Date:</label>
                        <div class="col-md-6">
                        <div class='input-group date' id='datetimepicker1' >
                    <input type='text' class="form-control" name="txtstartdate" id="txtstartdate" >
                    <span id="stt1"></span>
                    <span class="input-group-addon"  >
                        <span class="glyphicon glyphicon-calendar"  ></span>
                    </span>
                </div>
                       <div id="err1" style="color: #a94442;"></div>   
                        </div>
          </div>
          
           
          
           <div class="form-group">  
                          <label class="control-label col-md-4" for="date">Time Slots:</label>
                        <div class="col-md-6">
                        <div class='input-group date' id='datetimepicker3'>
                    <input type='text' class="form-control" name="txttimeslots" id="time"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                   
                </div>
                     <div id="err" style="color: #a94442;"></div>   
                      <input type="hidden" class="form-control" id="hslots" name="hslots" ></input>
                        </div>
                         
                          
          </div>
         
          <div id="slots"></div>

          <input type="hidden" id="assigned" name="assigned" ></input>
          
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
        <p>Movie assigned successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
        
        <div id="modal-msg1" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header  bg-danger">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Warning</h4>
      </div>
      <div class="modal-body">
        <p>Another movie is already assigned on the selected date.<br/>Do you want to reassign the selected movie?</p>
      </div>
      <div class="modal-footer" style="text-align: center">
        <button type="button" id="btn_del1"  class="btn btn-danger " data-dismiss="modal">Yes</button>
        <button type="button" id="btn_del" class="btn btn-danger" data-dismiss="modal" >No</button>
      
      </div>
    </div>

  </div>
</div>

    </body>
    
</html>
