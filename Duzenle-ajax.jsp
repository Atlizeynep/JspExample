<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>
        <h1>Login Forms</h1>
         <% 
            request.setCharacterEncoding("utf-8");
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
        %>
        <table border="1">
      
             <tr>
        <!--        <td>ID</td>-->
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
                <!--   <td> <%= rs.getString(2) %> </td> -->
                    <td> <%= rs.getString(1) %> </td>
                    <td> <%= rs.getString(3) %> </td>
                    <td> <%= rs.getString(4) %> </td>
                    <td> <%= rs.getString(5) %> </td>
                    <td> <%= rs.getString(6) %> </td>
                    <td><button type="button" id="<%=rs.getString("id")%>" class="delete">Delete</button></td>
          			<td><button type="button" id="<%=rs.getString("id") %>" class="update">Update</button></td> 
               </tr> 
              <% 
                } 
            }
               %> 
 
 <script>
$(document).ready(function() {
$(".delete").click(function() {
var id = +this.id; 
$.ajax({
url: "delete-ajax.jsp",
type: "post",
data: {
id : id,
},
success : function(data){
alert(data); 
location.reload(); 
}
});
});
$(".update").click(function() {
var id = +this.id; 
$.ajax({
url: "update-ajax.jsp",
type: "post",
data: {
id : id,
},
success : function(data){
alert(data); // alerts the response from jsp
location.reload(); 
}
});
});

});
</script>


    </body>
    </html>
