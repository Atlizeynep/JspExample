<%-- 
    Document   : Cookie
    Created on : Jul 5, 2018, 10:06:09 AM
    Author     : zeynep atlı
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form Page</title>
    </head>
    <body>
        <h1>Welcome </h1>
        <%
          Cookie cookie=null;
          Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
          //  out.println("<h2> Found Cookies Name and Value</h2>");
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               out.print("Name : " + cookie.getName( ) + ",  ");
               out.print("Value: " + cookie.getValue( )+" <br/>");
        
                       
            }
         } else {
            out.println("<h2>No cookies founds</h2>");
         }
            
            %>
    </body>
</html>
