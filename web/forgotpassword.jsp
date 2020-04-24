<%-- 
    Document   : forgotpassword
    Created on : Jan 12, 2017, 1:01:57 PM
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
             
             $(document).ready(function() {
    $('#frmforgotpassword').formValidation({
       
        framework: 'bootstrap',
       
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtuserid: {
                validators: {
                    notEmpty:{
                         message: 'The userid is required'
                    },
                    emailAddress: {message: 'Invalid emailid format'}
                }
            },
            r1: {
                validators: {
                    notEmpty:{
                         message: 'Please select an option'
                    }
                }
            }
        }
    });
}); 
         </script>
         <style>
             
         </style>     
        
    </head>
    <body>
      
      
       <div class="container-fluid" >
        <div class="row">
         <div class="col-md-4 col-md-offset-4" >
              ${errormsg}
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:418px;" >  
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder; ">Basic Details</a>
            <a href="#" class="btn btn-default notcompleted" style="font-weight:  bolder;">OTP/Hint answer</a>
            <a href="#" class="btn btn-default" style="font-weight:  bolder">New Password</a>
        </div>
	   
          
               <div class="container-fluid">   
           <form role="form" name="frmforgotpassword" id="frmforgotpassword" action="ForgotPassword" style="padding-top: 10px"  >
               
               <div class="form-group"  >
                       <label for="txtuserid">Enter Userid:</label>
                        <input type="text" class="form-control col-md-2" id="txtuserid" name="txtuserid" placeholder="Enter UserID" ${autofocus}>
                </div>
                <div class="form-group"  >
                <label for="" style="text-align:center">Choose how do you want to set new password?</label>
                    <div class="radio">
                        <label><input type="radio" name="r1" value="secret">Answer secret question</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" name="r1" value="otp">Generate OTP</label>
                    </div>    
                </div>      
                    <ul class="pager ">
                        <button type="submit"  class="btn btn-danger pull-right">  Next >></button>
                    </ul>
                 
              </form> 
               </div>
              </div>
            </div>
    </div>
       </div>
    </body>
    
</html>
