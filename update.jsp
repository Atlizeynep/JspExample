
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>

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
              String id=request.getParameter("update_id");
            // out.prinln(String.valueOf(id));

           request.setCharacterEncoding("utf-8");
         //   String id=request.getParameter("update_id");
            String alan_ismi=request.getParameter("update_alan");
            String guncel_bilgi=request.getParameter("update_yeni");
   //         out.println(id);
    //        out.println(alan_ismi);
     //       out.println(guncel_bilgi);
    //      try {

            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String password = "zeynep544";
            DriverManager.registerDriver(new org.postgresql.Driver());
            //Class.forName("org.postgresql.Driver");
             connection = DriverManager.getConnection(url, user, password);
           
            if (connection != null) {
        //     out.println("Connected to the database postgres");
             stmt = connection.createStatement();
  
             String sql="UPDATE public.deneme SET "+alan_ismi+" = '"+guncel_bilgi+"' WHERE id = "+id;
        //     out.println(sql);
            stmt.executeUpdate(sql);
             stmt.close();
             connection .close();
             out.println("Kayıt Güncellendi :)");
           
         }

  /*          }
            
         catch (SQLException ex) {
            System.out.println("An error occurred. Maybe user/password is invalid");
            ex.printStackTrace();
        }

*/

        %>

    </body>
</html>
