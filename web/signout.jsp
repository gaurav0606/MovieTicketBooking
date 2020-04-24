<%-- 
    Document   : signout
    Created on : Feb 24, 2018, 1:14:59 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("A1");
            session.removeAttribute("A2");
          
            response.sendRedirect("home.jsp");
        %>
    </body>
</html>
