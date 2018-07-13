
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>

<%
String id=request.getParameter("id");
out.println(id);
try
{

 			Connection connection;
            Statement stmt;
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String password = "zeynep544";
          //  DriverManager.registerDriver(new org.postgresql.Driver());
            //Class.forName("org.postgresql.Driver");
             DriverManager.registerDriver(new org.postgresql.Driver());
             connection = DriverManager.getConnection(url, user, password);
             stmt = connection.createStatement();
              if (connection != null) {
          //   out.println("Connected to the database postgres");
         String sql2="DELETE FROM public.deneme WHERE id="+id;
         stmt.executeUpdate(sql2);
    
         stmt.close();
         connection .close();
         out.println("Kayıt Silindi :)");
       
         }

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>