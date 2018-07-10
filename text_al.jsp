<%-- 
    Document   : text_al
    Created on : Jul 4, 2018, 3:07:09 PM
    Author     : zeynep atlı
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>
         <h1>Login Forms</h1>
         <%
             request.setCharacterEncoding("utf-8");
             String isim=request.getParameter("isim");
             String soyisim=request.getParameter("soyisim");
             String cinsiyet=request.getParameter("cinsiyet");
             String bolum=request.getParameter("bolum");
             String il=request.getParameter("il");
             
    

             Cookie cookie_isim=new Cookie("ad",isim);
             cookie_isim.setMaxAge(60*60*24);
             Cookie cookie_soyisim=new Cookie("soyad",soyisim);
             cookie_soyisim.setMaxAge(60*60*24);
             Cookie cookie_cinsiyet=new Cookie("cinsiyet",cinsiyet);
             cookie_cinsiyet.setMaxAge(60*60*24);
             Cookie cookie_bolum=new Cookie("bolum",bolum);
             cookie_bolum.setMaxAge(60*60*24);
             Cookie cookie_il=new Cookie("il",il);
             cookie_il.setMaxAge(60*60*24);
           
             response.addCookie(cookie_isim);
             response.addCookie(cookie_soyisim);
             response.addCookie(cookie_cinsiyet);
             response.addCookie(cookie_il);
             response.addCookie(cookie_bolum);
            
             
         %><form name="Data" action="Cookie.jsp" method="POST">
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
                    <td>İl</td>
                    <td> <%=il %> </td>
                </tr>
            </tbody>
             </table><input type="submit" value="bilgi_gor" name="Bilgileri Gör" />
</form>

    </body>
</html>
