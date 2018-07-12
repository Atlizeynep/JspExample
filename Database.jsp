<%-- 
    Document   : text_al
    Created on : Jul 4, 2018, 3:07:09 PM
    Author     : zeynep atlı
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletConfig"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
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
         <%

   
              int i=5;
             request.setCharacterEncoding("utf-8");
             String isim=request.getParameter("isim");
             String soyisim=request.getParameter("soyisim");
             String cinsiyet=request.getParameter("cinsiyet");
             String bolum=request.getParameter("bolum");
             String sehir=request.getParameter("sehir");
   
             Connection connection;
             Statement stmt;
         //    Connection.CConnectiononnect conn = new Connection.Connect;

        try {
            
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String password = "zeynep544";
            DriverManager.registerDriver(new org.postgresql.Driver());
            //Class.forName("org.postgresql.Driver");
             connection = DriverManager.getConnection(url, user, password);
           
            if (connection != null) {
         //    out.println("Connected to the database postgres");
             stmt = connection.createStatement();
    
 
/*
       String sql = "CREATE TABLE deneme " +
            "(ID INT PRIMARY KEY     NOT NULL," +
            " NAME           TEXT    NOT NULL, " +
            " SURNAME        TEXT    NOT NULL, " +
            " GENDER         TEXT    , " +
            " ADDRESS        CHAR(50), " +
            " JOB         CHAR(50))";
         stmt.executeUpdate(sql);
       */ 
      
    
         String sql2="INSERT INTO public.deneme(isim,soyisim, cinsiyet, meslek, sehir) VALUES ( '"+isim+"','"+soyisim+"', '"+cinsiyet+"', '"+bolum+"', '"+sehir+"');";
         stmt.executeUpdate(sql2);
     

       /*  ResultSet rs = stmt.executeQuery( "SELECT * FROM deneme;" );
         while ( rs.next() ) {
            int id = rs.getInt("id");
            String  name = rs.getString("name");
            int age  = rs.getInt("age");
            String  address = rs.getString("address");
            float salary = rs.getFloat("salary");
            out.println( "ID = " + id );
            out.println( "NAME = " + name );
            out.println( "AGE = " + age );
            out.println( "ADDRESS = " + address );
            out.println( "SALARY = " + salary );
            out.println();
*/
         stmt.close();
         connection .close();
         out.println("Data Kayıt edildi :)");
       
         }
       // }
       
            }
            
         catch (SQLException ex) {
            System.out.println("An error occurred. Maybe user/password is invalid");
            ex.printStackTrace();
        }
         %>


         <form name="Data" action="Duzenle.jsp" method="POST">
             <table border="1">
            <tbody>
                <tr>
                    <td>İsim</td>
                    <td> <%= isim%> </td>
                </tr>
                <tr>
                    <td>Soyisim</td>
                    <td> <%= soyisim %> </td>
                </tr>
                <tr>
                    <td>Cinsiyet</td>
                    <td> <%= cinsiyet %> </td>
                </tr>
                <tr>
                    <td>Bölüm</td>
                    <td> <%= bolum %> </td>
                </tr>
                <tr>
                    <td>Şehir</td>
                    <td> <%=sehir %> </td>
                </tr>
            </tbody>
             </table><input type="submit" value="Kayit_listele" name="Kayıtları Listele" />
</form>

    </body>
</html>
