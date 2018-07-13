<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <head>
     <!--   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <title>Form</title>
    </head>
    <body>
        <h1>Login Forms</h1> 
        <form name="update" action="update-ajax.jsp">
         <table border="1">
             <tr>
                <td>GÜNCELLENECEK ALAN İSMİ</td>
                <td><input type="text" name="alan_ismi" value="" size="30"></td>
            </tr>
             <tr>
                 <td>GÜNCEL BİLGİ</td>
                 <td><input type="text" name="yeni_bilgi" value="" size="30"></td>
             </tr>
             <tr>
                <td><input type="button" name="update_button" value="GÜNCELLE"></td>
             </tr>
         </table>
       </form> 
  
<%
String id=request.getParameter("id");
String alan_ismi=request.getParameter("alan_ismi");
String  guncel_bilgi=request.getParameter("yeni_bilgi");
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
       String sql="UPDATE public.deneme SET "+alan_ismi+" = '"+guncel_bilgi+"' WHERE id = "+id;
       stmt.executeUpdate(sql);

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
 </body>
</html>