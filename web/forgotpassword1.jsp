<%-- 
    Document   : forgotpassword1
    Created on : Jan 12, 2017, 4:21:29 PM
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
    $('#frmforgotpassword1').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtsecret_ans: {
                validators: {
                    notEmpty: {
                        message: 'Please enter secret answer to continue'
                        
                    }
                    
                    
                   
                }
            
            }
            
        }
          
    });
});

$(document).ready(function() {
    $('#frmforgotpassword2').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtotp1: {
                validators: {
                    notEmpty: {
                        message: 'Please enter OTP sent to your emailid to continue'
                        
                    }
                    
                    
                   
                }
            
            }
            
        }
          
    });
});
         </script>
     
    </head>
    <body>
      
        <div class="container-fluid" >    
       <div class="row"  >
         <div class="col-md-4 col-md-offset-4" >
             ${errormsg}
           <div class="well" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;width:418px;" >    
        <div class="btn-group btn-breadcrumb">
            <a href="#" class="btn btn-default" style="font-weight:  bolder">Basic details</a>
            <a href="#" class="btn btn-default completed" style="font-weight:  bolder;" >OTP/Hint answer</a>
            <a href="#" class="btn btn-default " style="font-weight:  bolder">New Password</a>
        </div>
	
       
      <div class="container-fluid">
           <div  ${div1} style="padding-top: 10px">
              <div class="text-primary">${m}</div>
                  <form role="form"  id="frmforgotpassword2" action="ForgotPassword1" method="post"  >
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtotp1" placeholder="Enter OTP value" maxlength="4" ${autofocus} >
                        <input type="hidden" name="otp" value="${otp}">
                        <input type="hidden" name="userid" value="${userid}">
                         <input type="hidden" name="option" value="${option}">
                    </div>
                     <ul class="pager">
                      <a class="btn btn-danger pull-left" href="forgotpassword.jsp"> << Previous</a>
                      <button type="submit" class="btn btn-danger pull-right" >Next >></button>
                    </ul>
              </form>                            
           </div>
      
             <div  ${div2} style="padding-top: 10px">
                 
                  <form role="form"  id="frmforgotpassword1" action="ForgotPassword1" method="post"  >
                    <div class="form-group">
                        <label for="txtsecret_ans" > ${question} </label>
                        <input type="text" class="form-control" name="txtsecret_ans" id="txtsecret_ans" placeholder="Enter answer"  >
                        <input type="hidden" name="userid" value="${userid}">
                         <input type="hidden" name="option" value="${option}">
                    </div>
                    <ul class="pager">
                      <a class="btn btn-danger pull-left" href="forgotpassword.jsp"> << Previous</a>
                      <button type="submit" class="btn btn-danger pull-right" >Next >></button>
                    </ul>
                         
              </form>   
             </div>
            </div>
    </div>
        </div>
    </body>
</html>
