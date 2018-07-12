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
<!--  <form name="islem" action="islem.jsp"  method="POST"> -->
        <% 

            Connection connection;
            Statement stmt;
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String password = "zeynep544";
            DriverManager.registerDriver(new org.postgresql.Driver());
            //Class.forName("org.postgresql.Driver");
             connection = DriverManager.getConnection(url, user, password);
          

            if (connection != null) {
          //   out.println("Connected to the database postgres");
             stmt = connection.createStatement();
         ResultSet rs = stmt.executeQuery( "SELECT * FROM public.deneme;" );
      /*  while ( rs.next() ) {
            int id = rs.getInt("Id");
            String  name = rs.getString("name");
            String surname  = rs.getString("surname");
            String  gender = rs.getString("gender");
            String job = rs.getString("job");
            String city=rs.getString("city");
            }
            */
           // }
       
        %>
        <table border="1">
      
             <tr>
                <td>ID</td>
                <td>isim</td>
                <td>soyisim </td>
                <td>cinsiyet</td>
                <td>meslek</td>
                <td>sehir</td>
             </tr>
             <%
               while(rs.next()){ 
                %>
             <tr> 
                    <td> <%= rs.getString(2) %> </td>
                    <td> <%= rs.getString(1) %> </td>
                    <td> <%= rs.getString(3) %> </td>
                    <td> <%= rs.getString(4) %> </td>
                    <td> <%= rs.getString(5) %> </td>
                    <td> <%= rs.getString(6) %> </td>
               </tr> 
              <% 
                } 
            }
               %> 
                <br>     
               <form name=delete action="delete.jsp" method="POST" >
                    >  
               <table border="2"><br> <br>
                   <tr>
                     <td>ID GİRİNİZ</td>
                    <td><input type="text" name="delete_id" value="" size="30"></td></tr> 

                   <tr> <td><input type="submit" name="delete" value="DELETE"></td> </tr>
               </table>
              </form>

               <br><br>  
             <form name=delete action="update.jsp" method="POST">
               <table border="2">
                  
                  <tr> 
                   <td> ID GİRİNİZ</td>
                   <td><input type="text"  name="update_id" value="" size="30"></td>
                   </tr>
                  <tr>  
                    <td> GUNCELLENECEK ALAN İSMİ</td>
                    <td><input type="text"  name="update_alan" value=""  size="30"><td>
                    </tr>
                  <tr>
                   <td> GUNCEL BİLGİYİ GİRİNİZ</td>
                    <td><input type="text"name="update_yeni"  value="" size="30" ><td>
                    </tr>
                  <tr> 
                    <td><input type="submit" name="update" value="UPDATE"></td>
                 </tr> 
                   
               </table>
              </form>

          </table>
      </form> 
    
    </body>
</html>