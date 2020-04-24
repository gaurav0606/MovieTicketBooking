<%-- 
    Document   : home
    Created on : Jan 1, 2017, 12:19:18 AM
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
       
       $('a[href="home.jsp"]').parent().addClass('active');

});
  $(document).ready(function() {
            ${msg}
        });

 $(document).ready(function() {
   $('#frmlogin').formValidation({
       
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
                         message: 'Userid is required'
                    },
                    emailAddress: {
                        message:'Invalid format'
                    }
                }
            },
            txtpassword: {
                validators: {
                    notEmpty:{
                         message: 'Password is required'
                    }
                    
                }
            }
        }
       
        });
    });
    
      $(document).ready(function() {
    $('#frmsignup').formValidation({
       
        framework: 'bootstrap',
        
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        live:'disabled',
        fields: {
             txtfname: {
                validators: {
                    notEmpty: {
                        message: 'The first name is required'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The first name can only consist of alphabetical, number and underscore'
                    }
                }
            },
            txtlname: {
                validators: {
                    notEmpty: {
                        message: 'The last name is required'
                        
                    },
                    
                    
                    regexp: {
                        regexp: /^[a-zA-Z]+$/,
                        message: 'The last name can only consist of alphabetical, number and underscore'
                    }
                }
            },
            txtemailid: {
                validators: {
                    notEmpty:{
                         message: 'The emailid is required'
                    },
                    emailAddress: {message: 'Invalid emailid format'}
                }
            },
             txtmobile: {
                validators: {
                    notEmpty: {},
                    digits: {},
                    phone: {
                        country: 'IN'
                    }
                }
            },
            txtpassword: {
                validators: {
                    notEmpty: {
                        message: 'The password value is required'
                        
                    },
                    identical: {
                        field: 'txtconfirmpassword',
                        message: 'The password and confirm password do not match'

                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must be less than 8 characters'
                    }

                 }
            },
            txtconfirmpassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password value is required'
                        
                    },
                    identical: {
                        field: 'txtpassword',
                        message: 'The password and confirm password do not match'

                    },
                    stringLength: {
                        min: 8,
                        message: 'The password must be less than 8 characters'
                    }

                }
            },
            txtsecretquestion: {
                validators: {
                    notEmpty: {
                        message: 'A secret question is required'
                        
                    }
                    
                }
            },
            txtanswer: {
                validators: {
                    notEmpty: {
                        message: 'The answer value is required'
                        
                    }
                    
                }
            }
            
        }
          
    });
});
  


    
        </script>
        
    </head>
    <body>
      
     <%
        
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        
       
        %>

        <%
           session=request.getSession(true);
          
         %>

        
        <div class="row" >
            <div class="col-md-2">
                <div class="container-fluid">
                <div class="well" style="height: 180px">
                   <img src="images/ad9.png" class="img-rounded" alt="Adverisement" style="height:150px;">
                </div>
                
                <div class="well" style="height: 180px">
                    <img src="images/ad7.jpg" class="img-rounded" alt="Adverisement" style="height:150px;width: 170px; display:block; float: right ">
                </div>
                <div class="well" style="height: 180px">
                    <img src="images/ad8.jpg" class="img-rounded" alt="Adverisement" style="height:150px;width: 170px; display:block; float: right ">
                </div>
            </div>
            </div>
             <div class="col-md-6">
                 <div class="container-fluid">
                    <h1>Welcome</h1>
                        <p>Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.Welcome to Book my Ticket where ticket booking feels can be done at the comfort of home.   </p>
                    <hr></hr> 
            </div>
             </div>
            
            <%
                if(session.getAttribute("A1")==null)
                {
             %>
                
               <div class="col-md-4">
                   <div class="container-fluid">
                        ${errormsg}
                 <div class="panel panel-info">
                     <div class="panel-heading" style="font-weight: bolder; background-color:#CA3C3C;color:white  "><i class="fa fa-user-plus"></i> Sign up</div>
                     <div class="panel-body">
                <form role="form" name="frmsignup" id="frmsignup" action="Signup" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtfname" placeholder="Enter first name" value="${fname}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtlname" placeholder="Enter last name"  value="${lname}">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="txtemailid"  placeholder="Enter emailid" ${autofocus}>
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="txtmobile" placeholder="Enter mobile no" maxlength="10"  value="${mobile}">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="txtpassword" placeholder="Enter password" onCopy="return false" onPaste="return false">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="txtconfirmpassword" placeholder="Enter confirm password" onCopy="return false" onPaste="return false">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="txtsecretquestion" placeholder="Enter secret question" >
                    </div>
                     <div class="form-group">
                        <input type="text" class="form-control" name="txtanswer" placeholder="Enter answer" >
                    </div>                   
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-default" id="register" style="width:100%;background-color: #CA3C3C;color:white"><i class="fa fa-sign-in"></i> Register</button>
                    </div>
              </form>                            
          
            </div>
                 </div>
</div>
               </div>
                        <%
                                               }
           %>
        </div>
       
     <div id="modal-msg" class="modal fade" role="dialog" style="padding-top: 200px">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-danger" >Failure</h4>
      </div>
      <div class="modal-body">
        <p class="text-warning">Invalid Credentials.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    </body>
  

    </body>
</html>
