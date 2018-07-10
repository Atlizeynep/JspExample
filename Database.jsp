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


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>
         <h1>Login Forms</h1>
         <%

   
              int i=1;
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
             out.println("Connected to the database postgres");
             stmt = connection.createStatement();
             if(stmt != null){
            

     /*    String sql = "INSERT INTO User_Information ( id, isim, soyisim, meslek, sehir)"
            + "VALUES (1, 'ddd', 'kkdkf','dcş','dss' );";
           // out.print(sql);
       // int count=stmt.executeUpdate(sql);
           stmt.close();

        stmt.executeUpdate("INSERT INTO User_Information " + 
                "VALUES (1, 'ddd', 'kkdkf','dcş','dss')");

        
         

         
         */
             PreparedStatement statement = connection.prepareStatement("INSERT INTO User_Information (id, isim, soyisim,meslek,sehir) VALUES (?, ?, ? , ? , ?)");
                    statement.setString(1, String.valueOf(1));
                    statement.setString(2, isim);
                    statement.setString(3, soyisim);
                    statement.setString(4, bolum);
                    statement.setString(3, sehir);
                    out.print("Statment" +statement);
                    statement.execute();
                    out.println("Data Kayıt edildi :)");
         }
                
             /*  
              
                 PreparedStatement pst = connection.prepareStatement("INSERT into User_Information VALUES(?,?,?,?,?)");
                     pst.setString(1,String.valueOf(i));
                     pst.setString(2,isim);
                     pst.setString(3,soyisim);
                     pst.setString(4,bolum );
                     pst.setString(5,sehir);
                     i++;
                out.println("Data başarıyla eklendi!=")
  
int numRowsChanged = pst.executeUpdate();
if(numRowsChanged!=0){
out.println("<br>Record has been inserted");
           */
              
            //}
            }
            }
         catch (SQLException ex) {
            System.out.println("An error occurred. Maybe user/password is invalid");
            ex.printStackTrace();
        }

     /*   Connection c = null;
      Statement stmt = null;
      try {
       //  Class.forName("org.postgresql.Driver");
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/User_Information",
            "postgres", "zeynep544");
         c.setAutoCommit(false);
         System.out.println("Opened database successfully");

         stmt = c.createStatement();
         String sql = "INSERT INTO User_Information ( id, isim, soyisim, meslek, sehir)"
            + "VALUES (1, isim, soyisim, bolum, sehir );";
         stmt.executeUpdate(sql);


         stmt.close();
         c.commit();
         c.close();
      } catch (Exception e) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
      }
      System.out.println("Records created successfully");
        */
         %>


         <form name="Data" action="Cookie.jsp" method="POST">
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
             </table><input type="submit" value="bilgi_gor" name="Bilgileri Gör" />
</form>

    </body>
</html>
