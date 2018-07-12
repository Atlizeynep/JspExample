
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@ page import="java.util.*"%>
<%@page import="javax.servlet.ServletConfig"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>

        <% 
         Connection connection;
         Statement stmt;
         request.setCharacterEncoding("utf-8");
        String id=request.getParameter("delete_id");
            out.println(id);

         
      //   try {
             request.setCharacterEncoding("utf-8");
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String password = "zeynep544";
            DriverManager.registerDriver(new org.postgresql.Driver());
            //Class.forName("org.postgresql.Driver");
             connection = DriverManager.getConnection(url, user, password);
           
            if (connection != null) {
             out.println("Connected to the database postgres");
             stmt = connection.createStatement();

      
         String sql2="DELETE FROM public.deneme WHERE id="+id;
         stmt.executeUpdate(sql2);
    
         stmt.close();
         connection .close();
         out.println("Kayıt Silindi :)");
       
         }

       
   /*        }
            
         catch (SQLException ex) {
            System.out.println("An error occurred. Maybe user/password is invalid");
            ex.printStackTrace();
        }
*/

        %>

    </body>
</html>
