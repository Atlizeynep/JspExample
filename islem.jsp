<%-- 
    Document   : index
    Created on : 04.Tem.2018, 10:26:51
    Author     : zeynep atlı
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>
        <h1>Login Forms</h1>
        <label></label>  
        <input type="text" name="text" value="ID GİRİNİZ"/>

   <%
            Connection connection;
            Statement stmt;
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String password = "zeynep544";
            DriverManager.registerDriver(new org.postgresql.Driver());
            //Class.forName("org.postgresql.Driver");
             connection = DriverManager.getConnection(url, user, password);
           
            if (connection != null) { //parantezi kapatmayı unutma
             out.println("Connected to the database postgres");
             stmt = connection.createStatement();
    
%>



        
   <%  if (request.getParameter("update")!=null) { %>
             
        <% } %>

  <%  if (request.getParameter("delete")!=null) {
// Integer.valueOf() 
     String sql="DELETE FROM public.customer WHERE ID=Integer.valueOf(request.getParameter("text"))";
     stmt.executeUpdate(sql);
     ;
         out.println("Data Silindi :)");
        }
   %>
            
<% stmt.close();
      connection .close()
  } 
  %>
            
       
     
    </body>
</html>
