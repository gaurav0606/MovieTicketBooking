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
        var enddate=$("#txtenddate").val();
        var sno=$("#txtsno").val();
        
       
     
            $.get("CheckMovieDate?start="+startdate+"&sno="+sno+"&end="+enddate,function(data, status){
                 
               if(data.trim()=="error")
               {
                   $('#datetimepicker1').addClass("input-group has-error has-feedback");
                   $('#s1').addClass("glyphicon glyphicon-remove form-control-feedback");
                   $("#err1").text("Movie already assigned to the screen on selected date");
               }
               
            
        
    });
       
        
    });
    
    $("#datetimepicker2").on("dp.hide",function (e) {
       
        var startdate=$("#txtstartdate").val();
        var enddate=$("#txtenddate").val();
        var sno=$("#txtsno").val();
        
       
     
            $.get("CheckMovieDate?start="+startdate+"&sno="+sno+"&end="+enddate,function(data, status){
                 
               if(data.trim()=="error")
               {
                   $('#datetimepicker2').addClass("input-group has-error has-feedback");
                   $('#s2').addClass("glyphicon glyphicon-remove form-control-feedback");
                   $("#err2").text("Movie already assigned to the screen on selected date");
               }
               
            
        
    });
       
        
    });
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
             
                $('#datetimepicker2').datetimepicker({
                    format: 'DD/MM/YYYY',
                    minDate : new Date()
                }).on('dp.change', function(e) {
            $('#frmassignmovie').formValidation('revalidateField', 'txtenddate');
           
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
    
    if($('#time').val()!='')
    {
        var current=$('#time').val().split(":");
        var currentmin=(60*current[0]) + (1*current[1]);
        
        var t= $('#hslots').val().split(",");
        var t1=t[t.length-1].split(":");
        var t1min=(60*t1[0]) + (1*t1[1]);
        alert(currentmin-t1min);
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
                            max: 'txtenddate',
                            message: 'The start date is not a valid date'
                        }
		    
                 }
            }, 
            txtenddate: {
                validators: {
                    notEmpty: {
                        message: 'Value is required'
                        
                    },
                    date: {
                            format: 'DD/MM/YYYY',
                            min: 'txtstartdate',
                            message: 'The end date is not a valid date'
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
         
            if (!$.trim( $("#slots").html() ) == true)
                {
                    
                    $('#hslots').val("");
                     $('#frmassignmovie').formValidation('revalidateField', 'hslots');
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
          <div class="form-group">  
                          <label class="control-label col-md-4" for="date">Start Date:</label>
                        <div class="col-md-6">
                        <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" name="txtstartdate" id="txtstartdate" />
                    <span class="input-group-addon" id="s1">
                        <span class="glyphicon glyphicon-calendar" ></span>
                    </span>
                </div>
                       <div id="err1" style="color: #a94442;"></div>   
                        </div>
          </div>
          
           <div class="form-group">  
                          <label class="control-label col-md-4" for="date">End Date:</label>
                        <div class="col-md-6">
                        <div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" name="txtenddate" id="txtenddate"/>
                    <span class="input-group-addon" id="s2">
                        <span class="glyphicon glyphicon-calendar" ></span>
                    </span>
                </div>
                         <div id="err2" style="color: #a94442;"></div>   
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
    </body>
    <div id="div1">
        
    </div>
</html>
