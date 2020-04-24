<%-- 
    Document   : head
    Created on : Jan 9, 2017, 4:35:41 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Movie Ticket</title>
       
        
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/formValidation.css"/> <%--used for validation--%>
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.css"/> 
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/breadcrumbs.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.css"/>
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap-magnify.css">
        <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/magnify.css">
        
         <script src="bootstrap-3.3.7-dist/js/jquery-3.1.1.js"></script>
         <script src="bootstrap-3.3.7-dist/js/jquery-1.12.0.js"></script>
         <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
         <script src="bootstrap-3.3.7-dist/js/moment.js"></script>
         <script src="bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js"></script>
         <script src="bootstrap-3.3.7-dist/js/formValidation.js"></script> <%--used for validation--%>
         <script src="bootstrap-3.3.7-dist/js/bootstrap_1.js"></script>  <%--used for validation--%>
         <script src="bootstrap-3.3.7-dist/js/bootstrap-magnify.js"></script>

      
         <script>
             
             $(document).ready(function(){
                
                 
                  var m=window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
                 
                 
                  if(m=='payment.jsp')
                  {
                         
                     $('#check_booking').attr('value','booking');
                   
                  }
                  
           });


$(document).ready(function(){
    $('[data-toggle="popover"]').popover({
        
        container:'body',
         title: '<h4>Login</h4>',
         html: true, 
    content: function() {
          return $('#popover-content').html();
    }
    });   
});



             $(document).ready(function() {
                 $(document).on("submit", "#frmlogin", function(e) {
  
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if($('.popover-content').find('#txtuserid').val()=="")
        {
             $('.popover-content').find('#m1').text("Value is required")
             $('.popover-content').find('#d1').removeClass("form-group").addClass("form-group has-error has-feedback");
             $('.popover-content').find('#s1').addClass("glyphicon glyphicon-remove form-control-feedback");
             e.preventDefault();
              
        }
        else if(filter.test($('.popover-content').find('#txtuserid').val())==false)
        {
            $('.popover-content').find('#m1').text("Invalid emailid format")
            $('.popover-content').find('#d1').removeClass("form-group").addClass("form-group has-error has-feedback");
             $('.popover-content').find('#s1').addClass("glyphicon glyphicon-remove form-control-feedback");
                e.preventDefault();
        }
        else
        {
           
            $('.popover-content').find('#d1').removeClass("form-group has-error has-feedback").addClass("form-group has-success has-feedback");
             $('.popover-content').find('#s1').removeClass("glyphicon glyphicon-remove form-control-feedback").addClass("glyphicon glyphicon-ok form-control-feedback");
            $('.popover-content').find('#m1').text("")
        }
        
        if($('.popover-content').find('#txtpassword').val()=="")
        {
            $('.popover-content').find('#m2').text("Value is required")
             $('.popover-content').find('#d2').removeClass("form-group").addClass("form-group has-error has-feedback");
             $('.popover-content').find('#s2').addClass("glyphicon glyphicon-remove form-control-feedback");
             e.preventDefault();
               
        }
        else
         {
            $('.popover-content').find('#d2').removeClass("form-group has-error has-feedback").addClass("form-group has-success has-feedback");
             $('.popover-content').find('#s2').removeClass("glyphicon glyphicon-remove form-control-feedback").addClass("glyphicon glyphicon-ok form-control-feedback");
            $('.popover-content').find('#m2').text("")
            
         }
     
    
});
             });
            $(document).ready(function() {
               
            
    $($('.popover-content').find('#frmlogin')).formValidation({
        
        framework: 'bootstrap',
        container:'tooltip',
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


             
         </script>
         
        
       
    </head>
    
    <body>
        
       <nav class="navbar navbar-inverse" style=";padding-top: 10px;background-color:#CA3C3C;  " >
  <div class="container-fluid" >
      <div class="navbar-header"  >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" >
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
        <div style="padding-right: 150px; "><img src="images/logo.png" class="img-rounded" alt="logo" style="height:45px;width:150px">

</div>
    </div>
      <div class="collapse navbar-collapse" id="myNavbar"   >
      <ul class="nav navbar-nav" style="margin-left: -5%;color:white">
        <li ><a id="a1" href="home.jsp">Home</a></li>
        <li><a href="aboutus.jsp" style="color: white">About us</a></li>
        <li><a href="contactus.jsp" style="color: white">Contact us</a></li> 
        <li><a href="feedback.jsp" style="color: white">Suggestions</a></li>
        <li><a href="workwithus.jsp" style="color: white">Careers</a></li>
        <li><a href="displaymovies.jsp" style="color: white">Current Movies</a></li>
        
      </ul>
          
          
       <%
                if(session.getAttribute("A1")!=null && ((String)session.getAttribute("A1")).equalsIgnoreCase("admin@movie.com"))
                {
              %>

              <div class="col-md-2 col-md-offset-2" id="d2">
                  
            <a class="dropdown-toggle" style="color:whitesmoke" data-toggle="dropdown" href="#"><p style="text-align: center;cursor: pointer;"><i class="fa fa-2x fa-user-secret" ></i></p>
                <p style="text-align: center;font-size: 15px;font-weight: bolder;cursor: pointer">Hello,<%=session.getAttribute("A2") %> <i class="fa fa-angle-down"></i></p></a>
              <ul class="dropdown-menu" style="margin-left: 50px">
                  <li><a href="assignmovie.jsp">Assign Movie</a></li>
                  <li><a href="addmovies.jsp">Add Movie</a></li>
                  <li><a href="viewmovies.jsp">View Movie</a></li>
                  <li><a href="editmovies.jsp">Edit Movie</a></li>
                  <li><a href="addscreen.jsp">Add Screen</a></li>
                  <li><a href="viewbookings.jsp">View Bookings</a></li>
                  <li><a href="viewcustomer.jsp">View Customers</a></li>
                  <li><a href="viewfeedback.jsp">View Feedback</a></li>
                  
                   <li><hr></hr></li>
                   <li><a href="changepassword.jsp" style="margin-top:-10px">Change Password</a></li>
                   <li><a href="editprofile.jsp">Edit Profile</a></li>
                   <li ><a href="signout.jsp" >Sign out</a></li>
            </ul>  
              </div> 
              <%
                }
                else if(session.getAttribute("A1")!=null)
                {
                    
              %>
              <div class="col-md-2 col-md-offset-4" id="d2">
                 
            <a class="dropdown-toggle" style="display:inline-block;color:whitesmoke" data-toggle="dropdown" href="#"><p style="text-align: center;cursor: pointer;"><i class="fa fa-2x fa-user-circle-o"></i></p>
                <p style="text-align: center;font-size: 15px;font-weight: bolder;cursor: pointer">Hello,<%=session.getAttribute("A2") %> <i class="fa fa-angle-down"></i></p></a>
              <ul class="dropdown-menu">
                  <li><a href="viewbookings.jsp">View Bookings</a></li>
                  <li><a href="viewfeedback.jsp">View Feedback</a></li>
                  
                   <li><hr></hr></li>
                   <li><a href="changepassword.jsp" style="margin-top:-10px">Change Password</a></li>
                   <li><a href="editprofile.jsp">Edit Profile</a></li>
                   <li ><a href="signout.jsp" >Sign out</a></li>
            </ul>  
              </div> 
             <% 
                }
                else
                {    
               %>
     
      <ul class="nav navbar-nav navbar-right">
          <li><a href="#" style="color:white;font-weight: bold" data-toggle="popover"  data-placement="bottom" ><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="forgotpassword.jsp" style="color:white;font-weight: bold"><i class="fa fa-unlock"></i> Forgot Password</a></li>
      
    </ul>
               <%
           }
      %>

         
    </div>
  </div>
</nav>
        
      <div id="popover-content" class="hide">
      <form  role="form" action="Login" id="frmlogin" method="Post" >
        <div class="form-group" id="d1">
          <input type="text" placeholder="Emailid" class="form-control" id="txtuserid" name="txtuserid"  >
          <span id="s1" ></span>
        </div>
          <div id="m1" style="color: #a94442;padding-bottom: 10px"></div>
        
        <div class="form-group" id="d2" >
          <input type="password" placeholder="Password" class="form-control" id="txtpassword" name="txtpassword">
          <span id="s2"></span>
        </div>
          
               <input type="hidden" id="check_booking" name="check_booking" ></input>

          <div id="m2" style="color: #a94442;padding-bottom: 10px "></div>
         <div class="form-group">
          <button type="submit" class="btn btn-primary" >Login »</button>                                  
        </div>
      </form>
    </div>  
        
       
        
          
        
    </body>
</html>
